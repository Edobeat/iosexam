//
//  ViewController.swift
//  exam
//
//  Created by Sysprobs on 1/7/22.
//

import UIKit

final class MainViewController: UIViewController {

    private lazy var tableView = UITableView()
    private let books = Model.books
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Books"
        setUpTableView()
    }
}

private extension MainViewController {
    func setUpTableView() {
        tableView.dataSource = self
        tableView.delegate = self
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
    
    func showDetailView(for book: Book) {
        let detailViewController = BookBuilder.build(bookModel: book)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell"),
              indexPath.row < books.count else {
            fatalError("opa")
        }
        let book = books[indexPath.row]
        cell.imageView?.image = UIImage(named: book.photo)
        cell.textLabel?.text = book.title
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row < books.count else {
            fatalError("greshka")
        }
        
        let book = books[indexPath.row]
        showDetailView(for: book)
    }
}
