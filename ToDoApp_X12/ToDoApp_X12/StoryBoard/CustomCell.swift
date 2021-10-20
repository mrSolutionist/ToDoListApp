//
//  CustomCell.swift
//  ToDoApp_X12
//
//  Created by Robin George on 09/10/21.
//

import UIKit

class CustomCell: UITableViewCell {


    @IBOutlet weak var toDoDescription: UILabel!
    @IBOutlet weak var toDoTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(cell:CustomCell , todo:TodoData , status:Bool)  {
        cell.toDoTitle.text =  todo.tiile
        cell.toDoDescription.text =  todo.discription

        if status{
            cell.accessoryType = AccessoryType.checkmark
        }
        else {
            cell.accessoryType = AccessoryType.none
        }
        
       
        
        
        
    }

}
