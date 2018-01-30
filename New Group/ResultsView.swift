//
//  ResultsView.swift
//  Unit5FirstGroupProject
//
//  Created by C4Q on 1/20/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class ResultsView: UIView {
    
    lazy var resultsTableView: UITableView = {
        let tv = UITableView()
        tv.register(ResultsTableViewCell.self, forCellReuseIdentifier: "ResultsTVCell")
        tv.estimatedRowHeight = 200
        tv.rowHeight = UITableViewAutomaticDimension
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        addSubview(resultsTableView)
        resultsTableView.snp.makeConstraints { (make) in
            make.edges.equalTo(snp.edges)
        }
        //constraints for tableView can be set up in VC
    }
    
}
