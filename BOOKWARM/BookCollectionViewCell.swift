//
//  BookCollectionViewCell.swift
//  BOOKWARM
//
//  Created by ChaewonMac on 2023/07/31.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var rateLabel: UILabel!
    @IBOutlet var posterImageView: UIImageView!
    
    
    func configureCell(row: Movie) {
        nameLabel.text = row.title
        posterImageView.image =  UIImage(named: "\(row.title)")
        rateLabel.text = "\(row.rate)"
        
        // nameLabel
        nameLabel.numberOfLines = 0
        nameLabel.textColor = .white
        nameLabel.font = .boldSystemFont(ofSize: 20)
        
        //posterImageView
        posterImageView.contentMode = .scaleAspectFill
        
        //rateLabel
        rateLabel.textColor = .white
        rateLabel.font = .systemFont(ofSize: 15)
        
        //cell
        
        let color = getRandomColor()

        self.layer.cornerRadius = 10
        self.backgroundColor = color
        
        
    }
    
    func getRandomColor() -> UIColor {
        
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
                
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
                
    }
}
