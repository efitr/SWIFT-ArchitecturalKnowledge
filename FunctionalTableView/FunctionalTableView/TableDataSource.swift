//
//  TableDataSource.swift
//  FunctionalTableView
//
//  Created by Egon Fiedler on 12/12/17.
//  Copyright © 2017 App Solutions. All rights reserved.
//

import Foundation
import UIKit

typealias TableCellCallBack = (UITableView, IndexPath) -> UITableViewCell

class TableViewDataSource<Item>: NSObject, UITableViewDataSource {
    
    var items : [Item]
    
    var configureCell: TableCellCallBack?
    
    init(items: [Item]) {
        self.items = items
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let configureCell = configureCell else {
            precondition(false, "You did not pass a configuration closure to configure cell, you must do so")
        }
        return configureCell(tableView, indexPath)
    }
}
