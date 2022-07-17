//
//  MoviePresenter.swift
//  Project
//
//  Created by Ahmed Elmemy on 12/07/2022.
//

import Foundation


protocol MovieView: AnyObject{
    func fetchingDataSuccess()
    func showEror(error:String)
    func NoData()
}


protocol MovieCellView {
    func showTitle(text:String)
    func showImage(image:String)
}

protocol MoviePresenter {
    func viewDidLoad()
    func configure(cell: MovieCellView, forRow row: Int)
    func numberOfRow() -> Int
    func didSelect(index: Int)
    func isPagination() -> Bool
    func reloadDataFromRefreshControl()
}

class MoviePresenterImplementation: MoviePresenter {
    
    
    fileprivate weak var view: MovieView?
    internal let router: MovieRouter
    internal let interactor : MovieInteractor
    
    private var movieModel =  [Movie]()
    private var page: Int = 1
    private var isPaginate = true
    
    
    init(view: MovieView,router: MovieRouter,interactor:MovieInteractor) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    
    func viewDidLoad() {
        getData()
    }
    
    
    func getData(){
        self.interactor.getData(page: self.page){[weak self] data,error in
            guard let self = self else {return}
            if let error = error{
                self.view?.showEror(error: error.localizedDescription)
            }else{
                guard let data = data else {return}
                self.page += 1
                self.movieModel += data.data?.movies ?? []
                //check Pagination
                if (data.data?.movieCount)! == self.movieModel.count{
                    self.isPaginate = false
                }else{
                    self.isPaginate = true
                }
                
                
                if self.movieModel.count != 0{
                    self.view?.fetchingDataSuccess()
                }else{
                    self.view?.NoData()
                }
            }
        }
        
    }
    
    func reloadDataFromRefreshControl() {
        self.page = 1
        self.movieModel = []
        getData()
    }
    
    
    
    
    func numberOfRow() -> Int {
        self.movieModel.count
    }
    
    
    func isPagination() -> Bool {
        return  self.isPaginate
    }
    
    func didSelect(index: Int) {
        
    }
    
    func configure(cell: MovieCellView, forRow row: Int) {
        let movie = self.movieModel[row]
        cell.showImage(image: movie.largeCoverImage ?? "")
        cell.showTitle(text: movie.titleEnglish ?? "")
    }
    
    
    
    
}


