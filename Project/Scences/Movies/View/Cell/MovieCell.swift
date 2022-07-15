//
//  MovieCell.swift
//  Project
//
//  Created by Ahmed Elmemy on 12/07/2022.
//

import UIKit
import SkeletonView

class MovieCell: UITableViewCell,MovieCellView {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        showAnimatedSkeleton()
    }
    
    
    func hideViewSkeleton(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.hideSkeleton()
        }
    }
    
    
    
 
    
    func showImage(image: String) {
        showImageView.showImage(imageView: movieImage, url: image)
    }
    
    
    
    func showTitle(text: String) {
        titleLabel.text = text
    }
    
    
    
}
