//
//  ViewController.swift
//  FunctionalTableView
//
//  Created by Egon Fiedler on 12/12/17.
//  Copyright © 2017 App Solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchFromCoreData()
        courseTableView.dataSource = datasource
        datasource.configureCell = { (tableview, indexpath) -> UITableViewCell in
            let cell = tableview.dequeuReusableCell(withIdentifier: "", for: indexpath)
            guard let allCourses = self.courses
                else {
                    return cell
            }
            let course = allCourses[indexpath.row]
            cell.textLabel?.text = course.name
            return cell
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    }
}
