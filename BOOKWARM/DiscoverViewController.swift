//
//  DiscoverViewController.swift
//  BOOKWARM
//
//  Created by ChaewonMac on 2023/08/02.
//

import UIKit

class DiscoverViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var movie = MovieInfo()
   
    @IBOutlet var popularTableView: UITableView!
    @IBOutlet var recentCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popularTableView.delegate = self
        popularTableView.dataSource = self
        
        recentCollectionView.delegate = self
        recentCollectionView.dataSource = self
        
        let tableNib = UINib(nibName: PopularMovieTableViewCell.identifier, bundle: nil)
        popularTableView.register(tableNib, forCellReuseIdentifier: PopularMovieTableViewCell.identifier)
        
        let collectionNib = UINib(nibName: RecentMovieCollectionViewCell.identifier, bundle: nil)
        recentCollectionView.register(collectionNib, forCellWithReuseIdentifier: RecentMovieCollectionViewCell.identifier)
        
        popularTableView.rowHeight = 150
        
        setCollectionViewLayout()
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "요즘 인기 작품"
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movie.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PopularMovieTableViewCell.identifier) as? PopularMovieTableViewCell else {
            return UITableViewCell()
        }
        let row = movie.list[indexPath.row]
        cell.configureCell(row: row)
        
        return cell
    }
    
    func setCollectionViewLayout() {
        
        let layout = UICollectionViewFlowLayout()
        
        let spacing:CGFloat = 12
        let width = UIScreen.main.bounds.width - (spacing * 4)
        let height = recentCollectionView.bounds.height
        
        
        layout.itemSize = CGSize(width: width / 3, height: height)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        
        
        recentCollectionView.collectionViewLayout = layout
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentMovieCollectionViewCell.identifier, for: indexPath) as? RecentMovieCollectionViewCell else {
            return UICollectionViewCell()
        }

        let item = movie.list[indexPath.item]
        
        cell.posterImageView.image = UIImage(named: item.title)
        
        
        return cell
    }
    
    
    

}
