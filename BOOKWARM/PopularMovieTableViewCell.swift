//
//  PopularMovieTableViewCell.swift
//  BOOKWARM
//
//  Created by ChaewonMac on 2023/08/02.
//

import UIKit

class PopularMovieTableViewCell: UITableViewCell {
    
    static let identifier = "PopularMovieTableViewCell"

    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var infoLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        designCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func designCell() {
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.textColor = .black
        
        infoLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        infoLabel.textColor = .systemGray3
    }
    
    func configureCell(row: Movie) {
        let releaseYear = row.releaseDate.components(separatedBy: ".")[0]
        
        posterImageView.image = UIImage(named: row.title)
        titleLabel.text = row.title
        infoLabel.text = "\(releaseYear) ・ ★ \(row.rate)점"
    }
    
}
