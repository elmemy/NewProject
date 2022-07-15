//
//  MovieRouter.swift
//  Project
//
//  Created by Ahmed Elmemy on 12/07/2022.
//

import UIKit


protocol MovieRouter {
  
}

class MovieRouterImplementation: MovieRouter {
    fileprivate weak var MovieViewController: MovieViewController?
    
    init(MovieViewController: MovieViewController) {
        self.MovieViewController = MovieViewController
    }
    
    
}
