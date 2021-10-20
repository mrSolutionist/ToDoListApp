
import UIKit

//class of displaying todoContent VC
class ToDoContentVC: UITableViewController {
    
    //two arrays are initilised to seperate completed and todo arrays into different arrays
    var todoArray : [TodoData] = []
    var completedArray : [TodoData] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoOnLoad()
        
        
    }
    
    //when using segue, this method is called
    //here its used for calling the delegate to reload the table once the adding VC is completed
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ToDoAddViewController
        vc.delegate = self
    }
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    
    //header for sections
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  title = UILabel()
        if section == 0 {
            title.text = "TO-DO"
        }
        else {
            title.text = "COMPLETED"
        }
        return title
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return todoArray.count
        }
        else {
            return completedArray.count
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! CustomCell
        
        
        //adding the content as per status of content to the respective sections
        if indexPath.section == 0{
            cell.config(cell:cell, todo:todoArray[indexPath.row],status: false)
        }
        else if indexPath.section == 1{
            cell.config(cell:cell, todo:completedArray[indexPath.row], status: true)
            
        }
        
        return cell
    }
    
    
  
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        //deleting swipe
        let swipe = UIContextualAction(style: .destructive, title: "delete"){ [weak self]
            (action,view,completionHandler) in
            
            //which item to remove
            if indexPath.section == 0 {
                let itemToRemove = self?.todoArray.remove(at: indexPath.row)//indexPath is the current row swipped
                CoreDataManager.shared.delete(itemToRemove!)
            }
            else {
                let itemToRemove = self?.completedArray.remove(at: indexPath.row)//indexPath is the current row swipped
                CoreDataManager.shared.delete(itemToRemove!)
            }
            
            
            //refresh
            tableView.reloadData()
        }
        
        //edit
       
            
     
        
        let edit = UIContextualAction(style: .normal, title: "Edit"){ [weak self]
            (action,view,completionHandler) in
            
            //which item to edit
            if indexPath.section == 0 {
                let itemToEdit = self?.todoArray[indexPath.row]
         
                let alert = UIAlertController(title: "Edit ToDo", message:nil, preferredStyle: .alert)
                alert.addTextField { x in
                    x.placeholder = "enter title"
                   
                }
                alert.addTextField { x in
                    x.placeholder = "enter description"
                   
                }
                let titleAndDescription = alert.textFields
                alert.addAction(UIAlertAction(title: NSLocalizedString("Done", comment: "Default action"), style: .default, handler: { _ in
                    itemToEdit?.tiile = titleAndDescription![0].text
                    itemToEdit?.discription = titleAndDescription![1].text
                    CoreDataManager.shared.saveContext()
                    tableView.reloadData()
                }))
                self?.present(alert, animated: true, completion: nil)
                
            }
            
           
      
            
            //refresh
            tableView.reloadData()
        }
       
        if indexPath.section == 1 {
            return  UISwipeActionsConfiguration (actions: [swipe])
        }
        
        return  UISwipeActionsConfiguration (actions: [swipe,edit])
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0{

            todoArray[indexPath.row].status = true
            
            let doneElement = todoArray.remove(at: indexPath.row)
            completedArray.append(doneElement)
            
            
        }
        else if indexPath.section == 1{
            //            toDoList![indexPath.row].status = false
            completedArray[indexPath.row].status = false
            let doneElement = completedArray.remove(at: indexPath.row)
            todoArray.append(doneElement)
            
        }
        CoreDataManager.shared.saveContext()
        tableView.reloadData()
        
        
    }
    
    
    
    
    func todoOnLoad(){
        let todoList = CoreDataManager.shared.userTodoFetch()
        
        completedArray.removeAll()
        todoArray.removeAll()
        
        
        todoList.forEach { todo  in
            if todo.status{
                completedArray.append(todo)
            }
            else if !todo.status {
                todoArray.append(todo)
            }
        }
    }
    
    
}

extension  ToDoContentVC:Reload{
    func reloadTable() {
        todoOnLoad()
        tableView.reloadData()
    }
    
    
}
