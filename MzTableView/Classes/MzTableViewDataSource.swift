//
//  MzTableViewDataSource.swift
//  MzTableView
//
//  Created by Mohammad Zakizadeh on 4/23/20.
//  Copyright © 2020 Mz. All rights reserved.
//

import UIKit


public class MzTableViewDataSource<T: MzTableViewCell>: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    /// return nil  or 0 for automaticDimension
    var cellHeight: CGFloat?
    
    var items: [T.CellViewModel]
    
    var tableView: UITableView
    /// for doing anything with cell about to display
    public var willDisplayCell: ((Int,T) -> Void)?
    /// forGetting selected row
    public var didSelectRowAt: ((Int) -> Void)?
    
    private var cellAnimation: AnimationType
    
    public init(cellHeight: CGFloat?, tableView: UITableView, items: [T.CellViewModel] = [], animationType: AnimationType = .none) {
        self.cellHeight = cellHeight
        self.items = items
        self.tableView = tableView
        self.cellAnimation = animationType
        if cellHeight == 0 || cellHeight == nil {
            self.tableView.estimatedRowHeight = UITableView.automaticDimension
            self.tableView.rowHeight = UITableView.automaticDimension
        }
        
        // Register cell to TableView
        self.tableView.register(UINib(nibName: String.init(describing: T.self), bundle: nil), forCellReuseIdentifier: String.init(describing: T.self))
        
        
    }
    
    // UITableViewDataSource and UITableViewDelegate
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String.init(describing: T.self), for: indexPath) as! T
        cell.configureCellWith(items[indexPath.row])
        return cell
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // Config Cell
        let cell = cell as! T
        
        // Animate Cell
        CellAnimator.animateCellUsing(type: cellAnimation, cell: cell)
        // Delegate
        willDisplayCell?(indexPath.row,cell)
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectRowAt?(indexPath.row)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cellheight = cellHeight, cellHeight != 0 else { return UITableView.automaticDimension }
        return cellheight
    }
    public func appendItemsToTableView(_ newItems: [T.CellViewModel]) {
        guard newItems.count != 0 else {
            print("WARNING: YOU ARE ADDING EMPTY LIST TO TABLE VIEW")
            return
        }
        // append to last of list
        self.items.append(contentsOf: newItems)
        // Now performing insert
        // Get the last row index (numberOfRows - 1)
        var lastRowIndex = tableView.numberOfRows(inSection: 0) - 1
        if lastRowIndex < 0 {
            lastRowIndex = 0
            self.tableView.reloadData()
        } else {
            // TODO: This NEEDS TO be more safer
            let indexPaths = newItems.enumerated().map { (index, element) -> IndexPath in
                IndexPath(item: items.count - 1 - index, section: 0)
            }
            if #available(iOS 11.0, *) {
                self.tableView.performBatchUpdates({
                    self.tableView.insertRows(at: indexPaths, with: .none)
                }, completion: nil)
            } else {
                self.tableView.insertRows(at: indexPaths, with: .none)
            }
        }
    }
    
}

