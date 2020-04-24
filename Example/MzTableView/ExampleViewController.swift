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
    
    var items: [String] = [String]()
    
    lazy var mZdataSource: MzTableViewDataSource<ExampleTableViewCell> = {
        let mzDataSource = MzTableViewDataSource<ExampleTableViewCell>(cellHeight: 0, tableView: exampleTableView, animationType: .type1(0.3))
        self.exampleTableView.dataSource = mzDataSource
        self.exampleTableView.delegate = mzDataSource
        return mzDataSource
    }()
    override func viewDidLoad() {
        
        mZdataSource.didSelectRowAt = { [weak self] index in
            print(index)
        }
    }
    
    @IBAction func addNewItem(_ sender: Any) {
        
        let string = randomString(length: Int.random(in: 0...200))
        self.items.append(string)
        mZdataSource.appendItemsToTableView([string])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshTableView()
    }
    
    @IBAction func removeLastCell(_ sender: Any) {
        mZdataSource.removeItemFromTableView(row: items.count - 1)
        self.items.removeLast()
    }
    
    @IBAction func refreshTableView(_ sender: Any) {
        refreshTableView()
    }
    
    func refreshTableView() {
        let randomNum = Int.random(in: 2...9)
        var strings = [String]()
        for _ in 0...randomNum {
            strings.append(randomString(length: Int.random(in: 0...200)))
        }
        self.items = strings
        mZdataSource.refreshWithNewItems(items)
    }
    func randomString(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
}
