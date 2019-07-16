//
//  RecordWireframe.swift
//  WannaBasket
//
//  Created Het Song on 14/07/2019.
//  Copyright © 2019 Het Song. All rights reserved.
//

import UIKit

class RecordWireframe: RecordWireframeProtocol {

    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "RecordScreen", bundle: Bundle.main)
    }
    
    static func createModule(with game: Game) -> UIViewController {
        let viewController = mainStoryboard.instantiateInitialViewController()
        if let view = viewController as? RecordView {
            let interactor  = RecordInteractor()
            let presenter = RecordPresenter()
            let wireframe = RecordWireframe()
            
            view.presenter = presenter
            interactor.presenter = presenter
            presenter.view = view
            presenter.interactor = interactor
            presenter.wireframe = wireframe
            
            presenter.game = game
            
            return view
        }
        return UIViewController()
    }
}
