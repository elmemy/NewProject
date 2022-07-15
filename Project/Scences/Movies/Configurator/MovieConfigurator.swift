//
//  MovieConfigurator.swift
//  Project
//
//  Created by Ahmed Elmemy on 12/07/2022.
//

import Foundation


protocol MovieConfigurator {
    func configure(MovieViewController:MovieViewController)
}


class MovieConfiguratorImplementation {

    func configure(MovieViewController:MovieViewController) {
        let view = MovieViewController
        let router = MovieRouterImplementation(MovieViewController: view)
        
        let interactor = MovieInteractor()
        let presenter = MoviePresenterImplementation(view: view, router: router,interactor:interactor)
        
        
        MovieViewController.presenter = presenter
    }
    
}
