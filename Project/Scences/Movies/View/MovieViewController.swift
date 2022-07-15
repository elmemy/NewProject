//
//  MovieViewController.swift
//  Project
//
//  Created by Ahmed Elmemy on 12/07/2022.
//

import UIKit
import SkeletonView
final class MovieViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noDataImage: UIImageView!
    
    var presenter: MoviePresenter?
    
    // MARK: - UIViewController Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
        setupTableView()
        presenter?.viewDidLoad()
    }
    
}



extension MovieViewController: MovieView {
    
    func fetchingDataSuccess() {
        self.tableView.isHidden = false
        self.noDataImage.isHidden = true
        self.tableView.reloadData()
    }
    
    func showEror(error: String) {
        print(error)
    }
    
    func NoData() {
        self.tableView.isHidden = true
        self.noDataImage.isHidden = false
    }
    
}




extension MovieViewController:UITableViewDelegate,UITableViewDataSource{
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.presenter?.numberOfRow())!
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        if presenter?.numberOfRow() != 0{
            cell.hideViewSkeleton()
            self.presenter?.configure(cell: cell, forRow: indexPath.row)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.didSelect(index: indexPath.row)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
    
}


extension MovieViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        if indexPaths.contains(where: isLoadingCell) {
            self.presenter?.viewDidLoad()
        }
    }
    
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        if let count = self.presenter?.numberOfRow()   {
            return   indexPath.row >= count - 4 && self.presenter!.isPagination()
        }
        return false
    }
}
