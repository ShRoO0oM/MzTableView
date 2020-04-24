//
//  ExampleTableViewCell.swift
//  MzTableView_Example
//
//  Created by Mohammad Zakizadeh on 4/24/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import MzTableView

class ExampleTableViewCell: UITableViewCell {
    @IBOutlet var cellTitle: UILabel!
}

extension ExampleTableViewCell: MzTableViewCell {
    
    typealias CellViewModel = String
    
    func configureCellWith(_ item: String) {
        cellTitle.text = item
    }
}
