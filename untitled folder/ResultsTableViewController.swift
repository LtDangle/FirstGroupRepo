//
//  ResultsTableViewController.swift
//  Unit5FirstGroupProject
//
//  Created by C4Q on 1/25/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class ResultsTableViewController: UIViewController {
    
    let resultsView = ResultsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        view.addSubview(resultsView)
        
        resultsView.resultsTableView.dataSource = self
        resultsView.resultsTableView.delegate = self
        
        resultsView.snp.makeConstraints { (make) in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
            
//        navigationItem.backBarButtonItem = UIBarButtonItem(barButtonSystemItem: <#T##UIBarButtonSystemItem#>, target: <#T##Any?#>, action: <#T##Selector?#>)
            
        }
        
    }
    
}


extension ResultsTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultsTVCell", for: indexPath) as! ResultsTableViewCell
        cell.resultsLabel.text  = "KFC"
        cell.resultsImageView.image = #imageLiteral(resourceName: "hangryLogo")
        return cell
    }
    
    //        func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    //            tableView.estimatedRowHeight = 70
    //            tableView.rowHeight = UITableViewAutomaticDimension
    //            return 100
    //        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(DetailViewController(), animated: true)
    }
}

