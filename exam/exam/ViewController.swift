//
//  ViewController.swift
//  exam
//
//  Created by Sysprobs on 1/7/22.
//

import UIKit

final class MainViewController: UIViewController {

    private lazy var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Books"
        setUpTableView()
    }
}

private extension MainViewController {
    func setUpTableView() {
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            fatalError("opa")
        }
        cell.textLabel?.text = "Proba \(indexPath.row)"
        return cell
    }
}
