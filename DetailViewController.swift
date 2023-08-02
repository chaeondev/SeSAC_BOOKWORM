//
//  DetailViewController.swift
//  BOOKWARM
//
//  Created by ChaewonMac on 2023/07/31.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var releaseDateLabel: UILabel!
    @IBOutlet var rateLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    
    
    var contents: String = ""
    var movieData: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overviewLabel.numberOfLines = 0
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let movieData else { return }
        setMovieData(movieData: movieData)
        
    }
    
    func setMovieData(movieData: Movie) {
        
        contents = movieData.title
        posterImageView.image = UIImage(named: movieData.title)
        titleLabel.text = movieData.title
        releaseDateLabel.text = movieData.releaseDate
        rateLabel.text = "평점 ⭐️ \(movieData.rate)점"
        overviewLabel.text = movieData.overview
    }
    
}
