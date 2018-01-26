//
//  CollectionsTableView.swift
//  Unit5FirstGroupProject
//
//  Created by C4Q on 1/24/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class CollectionsTableView: UIView {
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(NetflixTableViewCell.self, forCellReuseIdentifier: "NetflixCell")
        return table
    }()
    
    lazy var collectionsNavButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: #imageLiteral(resourceName: "add"), style: .plain, target: nil, action: nil)
        return button
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        setupTableView()
    }
    
    private func setupTableView() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        [tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
         tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
         tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
         tableView.trailingAnchor.constraint(equalTo: trailingAnchor)].forEach{$0.isActive = true}
    }
    
    
}
