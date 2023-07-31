//
//  BookWARMCollectionViewController.swift
//  BOOKWARM
//
//  Created by ChaewonMac on 2023/07/31.
//

import UIKit


class BookWARMCollectionViewController: UICollectionViewController {

    
    let movie = MovieInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "BookCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "BookCollectionViewCell")

        setCollectionViewLayout()
    }
    
    func setCollectionViewLayout() {
        
        let layout = UICollectionViewFlowLayout()
        
        let spacing:CGFloat = 16
        let width = UIScreen.main.bounds.width - (spacing * 3)
        
        layout.itemSize = CGSize(width: width / 2, height: width / 2)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        
        
        collectionView.collectionViewLayout = layout
        
        
        
    }
    
    
    @IBAction func searchButtonClicked(_ sender: UIBarButtonItem) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.contents = movie.list[indexPath.row].title
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movie.list.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as? BookCollectionViewCell else {
            return UICollectionViewCell()
        }
        let row = movie.list[indexPath.row]
        
        cell.configureCell(row: row)
        
        
        
        return cell
    }

    

}
