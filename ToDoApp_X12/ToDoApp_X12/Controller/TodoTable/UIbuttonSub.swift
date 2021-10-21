//
//  UIbuttonSub.swift
//  ToDoApp_X12
//
//  Created by Robin George on 20/10/21.
//

import UIKit

class UIbuttonSub: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .blue
//        URLSession.shared.dataTask(with: <#T##URLRequest#>) { <#Data?#>, <#URLResponse?#>, <#Error?#> in
//            <#code#>
//        }
    }
    
    let x = { (para:String) in
        let a = "s"
    }
    
}
