//
//  ViewController.swift
//  MzTableView
//
//  Created by mohammadz74 on 04/23/2020.
//  Copyright (c) 2020 mohammadz74. All rights reserved.
//

import UIKit
import MzTableView

class ExampleViewController: UIViewController {
    
    @IBOutlet var exampleTableView: UITableView!
    
    lazy var mZdataSource: MzTableViewDataSource<ExampleTableViewCell> = {
        let mzDataSource = MzTableViewDataSource<ExampleTableViewCell>(cellHeight: 0, tableView: exampleTableView, animationType: .type1(0.3))
        self.exampleTableView.dataSource = mzDataSource
        self.exampleTableView.delegate = mzDataSource
        return mzDataSource
    }()
    
    @IBAction func addNewItem(_ sender: Any) {
        
        let string = randomString(length: Int.random(in: 0...200))
        
        mZdataSource.appendItemsToTableView([string])
        
    }
    func randomString(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
}
