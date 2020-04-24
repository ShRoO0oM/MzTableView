//
//  MzTableViewCell.swift
//  MzTableView
//
//  Created by Mohammad Zakizadeh on 4/23/20.
//

import Foundation


public protocol MzTableViewCell: UITableViewCell {
    
    associatedtype CellViewModel
    
    func configureCellWith(_ item: CellViewModel)
    
}
