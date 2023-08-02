//
//  RecentMovieCollectionViewCell.swift
//  BOOKWARM
//
//  Created by ChaewonMac on 2023/08/02.
//

import UIKit

class RecentMovieCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "RecentMovieCollectionViewCell"
    
    @IBOutlet var posterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        posterImageView.contentMode = .scaleAspectFill
    }

}
