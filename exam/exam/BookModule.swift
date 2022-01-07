//
//  BookModule.swift
//  exam
//
//  Created by Sysprobs on 1/7/22.
//

import UIKit

final class BookBuilder {
    // principno e dobre da conform-va kum protokol za da moje da se inject-ne, but for the sake of time polzwame statichno
    static func build(bookModel: Book) -> UIViewController {
        let viewController = BookViewController()
        let presenter = BookPresenter(view: viewController,
                                      bookModel: bookModel)
        
        viewController.output = presenter
        return viewController
    }
}

final class BookViewController: UIViewController {
    var output: BookPresenter?
    
    private lazy var imageView = UIImageView()
    private lazy var titleLabel = UILabel()
    private lazy var authorLabel = UILabel()
    private lazy var descriptionLabel = UILabel()
    private lazy var ratingLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewIsReady()
        view.backgroundColor = .white
    }
    
    func configureView(model: Book) {
        title = model.title
        setUpView()
        
        imageView.image = UIImage(named: model.photo)
        imageView.contentMode = .scaleAspectFit
        
        authorLabel.text = model.author
        authorLabel.numberOfLines = 2
        
        descriptionLabel.text = model.description
        descriptionLabel.numberOfLines = 0
    }
    
    private func setUpView() {
        let views = [imageView, titleLabel, authorLabel, descriptionLabel, ratingLabel]
        for element in views {
            view.addSubview(element)
            element.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
            imageView.heightAnchor.constraint(equalToConstant: 	250),
            
            authorLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            authorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            authorLabel.heightAnchor.constraint(equalToConstant: 50),
            
            descriptionLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 150)
            
        ])
    }
}

final class BookPresenter {
    unowned var view: BookViewController
    private let book: Book
    
    init(view: BookViewController,
         bookModel: Book) {
        self.view = view
        book = bookModel
    }
    
    func viewIsReady() {
        view.configureView(model: book)
    }
}
