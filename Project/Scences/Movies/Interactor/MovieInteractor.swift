//
//  MovieInteractor.swift
//  Project
//
//  Created by Ahmed Elmemy on 12/07/2022.
//

import Foundation

 class MovieInteractor {
    
     func getData(page:Int,completionHandler: @escaping (MoviesModel?, Error?) -> ()) {

         var itemResponse: CallResponse<MoviesModel> {
             return {(response) in
                 switch response {
                 case .failure(let error):
                     completionHandler(nil, error)
                 case .success(let movies):
                     completionHandler(movies, nil)
                 }
             }
         }
       
             // creating request with the builder enum
    
         APIRouter.Movies(page:page).send(MoviesModel.self, then: itemResponse)
     }
 }
