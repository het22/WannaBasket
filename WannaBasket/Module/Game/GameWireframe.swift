//
//  GameWireframe.swift
//  WannaBasket
//
//  Created Het Song on 27/06/2019.
//  Copyright © 2019 Het Song. All rights reserved.
//

import UIKit

class GameWireframe: GameWireframeProtocol {

    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "GameScreen", bundle: Bundle.main)
    }
    
    static func createModule(with game: Game) -> UIViewController {
        let viewController = mainStoryboard.instantiateInitialViewController()
        if let view = viewController as? GameView {
            let interactor  = GameInteractor()
            let presenter = GamePresenter()
            let wireframe = GameWireframe()
            
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
    
    func presentModule(source: GameViewProtocol, module: Module) {
        if let sourceView = source as? UIViewController {
            let destinationView = module.view
            sourceView.present(destinationView, animated: true, completion: nil)
        }
    }
}
