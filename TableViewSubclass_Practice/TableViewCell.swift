//
//  TableViewCell.swift
//  TableViewSubclass_Practice
//
//  Created by 伊藤走 on 12/9/20.
//

import Foundation
import UIKit


class CustomCell: UITableViewCell {
    
    @IBOutlet var itemLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
    func config(item:Article){
        itemLabel.text = item.item1
        timeLabel.text = item.item2
    }

}
