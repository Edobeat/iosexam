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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewIsReady()
    }
    
    func configureView(model: Book) {
        
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
