//
//  ToDoContentVC.swift
//  ToDoApp_X12
//
//  Created by Robin George on 08/10/21.
//

import UIKit


class ToDoContentVC: UITableViewController {
    
    
    var toDoList : [TodoData]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoOnLoad()
        // Uncomment the following line to preserve selection between presentations
        //         self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        toDoList = CoreDataManager.shared.userTodoFetch()
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
            cell.config(cell:cell, todo:todoArray[indexPath.row])
        }
        else if indexPath.section == 1{
            cell.config(cell:cell, todo:completedArray[indexPath.row])
        }
        
        return cell
    }
    
    
    //deleting swipe
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let swipe = UIContextualAction(style: .destructive, title: "delete"){ [weak self]
            (action,view,completionHandler) in
            
            //which item to remove
            guard let itemToRemove = self?.toDoList?[indexPath.row] else {return}//indexPath is the current row swipped
            CoreDataManager.shared.delete(itemToRemove)
            
            //refresh
            //           CoreDataManager.shared.userTodoFetch()
            tableView.reloadData()
        }
        return UISwipeActionsConfiguration (actions: [swipe])
    }
    
    
    // select action
    // for checkMark
    
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //checking for checkmark
        if  tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark{
            
            //removing checkmark
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
            
            //changing the state
            toDoList?[indexPath.row].status = false
            
            tableView.reloadRows(at: [indexPath], with: .top)
            
        }
        else
        {
            //adding checkMArk
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
            
     
            //changing the state
            toDoList?[indexPath.row].status = true
            
            tableView.reloadRows(at: [indexPath], with: .bottom)
         
            
        }
    }
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
