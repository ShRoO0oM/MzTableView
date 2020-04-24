# MzTableView

[![CI Status](https://img.shields.io/travis/mohammadz74/MzTableView.svg?style=flat)](https://travis-ci.org/mohammadz74/MzTableView)
[![Version](https://img.shields.io/cocoapods/v/MzTableView.svg?style=flat)](https://cocoapods.org/pods/MzTableView)
[![License](https://img.shields.io/cocoapods/l/MzTableView.svg?style=flat)](https://cocoapods.org/pods/MzTableView)
[![Platform](https://img.shields.io/cocoapods/p/MzTableView.svg?style=flat)](https://cocoapods.org/pods/MzTableView)

# Introduction

Implement your TableView with only 2 line of code!
For feeding your UITableView you don't need cellForRowAt numberOfRowsInSections and other boilerplate code anymore!
**Please note that multiple sections, header and footer is not supported yet**

## Requirements
Your tableView should match the below requirements otherwise MzTableView is not going to work for you :(
- Your tableView contains one type of cell
- Your tableView contains one section
Which 90% of tableView designs meet the requirements!

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Installation

MzTableView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MzTableView'
```
# Demo
You can easily find and run the demo app in example folder.
## Usage

First, your cell should confirm to MzTableViewCell protocol:

```swift

public protocol MzTableViewCell: UITableViewCell {
    associatedtype CellViewModel
    func configureCellWith(_ item: CellViewModel)   
}

```
CellViewModel is the cell's ViewModel for assigning data to cell's subviews, then configure your cell using `configureCellWith` method. 
For Example we want to show list of stundets which each of our cells has one image and a title, so our CellViewModel looks like:

```swift
struct StudentCellViewModel {
    var image: UIImage
    var title: String
}
```
so your cell looks like:

```swift
extension ExampleTableViewCell: MzTableViewCell {
    
    typealias CellViewModel = StudentCellViewModel
    
    func configureCellWith(_ item: StudentCellViewModel) {
        cellTitle.text = item.title
        cellImage.image = item.image
    }
}
```
then in your UIViewController you should create MzTableViewDataSource object:

```swift
public init(cellHeight: CGFloat?, tableView: UITableView, items: [T.CellViewModel] = [], animationType: AnimationType = .none
```
which `cellHeight` is the tableView cell height ( return 0 or nil for self sizing cells)
`tableView` is the ViewController UITableView.
`items` is the initial items of your tableView ( you can put empty array then append to it later as shown below.)
`animationType` is an optional enum if you want animation for your cells (.none is default)

then assign the object to your tableView dataSource and delegate.

```swift
     self.exampleTableView.dataSource = mzDataSource
     self.exampleTableView.delegate = mzDataSource
```
for adding data to your tableView just use:
```swift
mZdataSource.appendItemsToTableView([items])
```
which items is the array of your cell's view model. ( CellViewModel )

No more reloadData, insertRows and ... . MzDataSource is handling all!

You can also remove items from your tableView using:
```swift
mZdataSource.removeItemFromTableView(row: rowToDelete)
```
Or you may refresh all of your tableView with new data:
```swift
mZdataSource.refreshWithNewItems(items)
```

If the usage guide wasn't useful,please run and look the example project.It will boost you 😇.

## Author

mohammadz74, mohammad_z74@icloud.com

## License

MzTableView is available under the MIT license. See the LICENSE file for more info.
