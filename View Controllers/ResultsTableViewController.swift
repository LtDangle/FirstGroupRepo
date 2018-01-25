//
//  ResultsTableViewController.swift
//  Unit5FirstGroupProject
//
//  Created by C4Q on 1/25/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class ResultsTableViewController: UIViewController {
    
    let resultsView = ResultsView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        view.addSubview(resultsView)
    }
    
}
