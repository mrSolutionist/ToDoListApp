//
//  CustomCell.swift
//  ToDoApp_X12
//
//  Created by Robin George on 09/10/21.
//

import UIKit

class CustomCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(cell:CustomCell , todo:TodoData , status:Bool)  {
        cell.textLabel?.text =  todo.tiile
//        tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        if status{
            cell.accessoryType = AccessoryType.checkmark
        }
        else {
            cell.accessoryType = AccessoryType.none
        }
        
       
        
        
        
    }

}
