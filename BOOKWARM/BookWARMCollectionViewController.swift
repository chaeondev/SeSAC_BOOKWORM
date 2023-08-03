//
//  BookWARMCollectionViewController.swift
//  BOOKWARM
//
//  Created by ChaewonMac on 2023/07/31.
//

import UIKit


class BookWARMCollectionViewController: UICollectionViewController {

    
    var movie = MovieInfo() {
        didSet {
            collectionView.reloadData()
        }
    }
    
//    let list = ["iOS", "iPad", "Android", "Apple", "Watch", "사과", "사자", "호랑이"]
//    var searchList: [String] = []
//
//    let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        searchBar.delegate = self
        
        let nib = UINib(nibName: "BookCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "BookCollectionViewCell")

        setCollectionViewLayout()
        
//        navigationItem.titleView = searchBar
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
        
        vc.movieData = movie.list[indexPath.item]

        
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
        
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
        
        return cell
    }
    
    @objc func likeButtonClicked(_ sender: UIButton) {
        movie.list[sender.tag].like.toggle()
    }


    
}

//extension BookWARMCollectionViewController: UISearchBarDelegate {
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        searchList.removeAll()
//
//        for item in list {
//            if item.contains(searchBar.text!) {
//                searchList.append(item)
//            }
//        }
//        collectionView.reloadData()
//    }
//
//
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        searchList.removeAll()
//        searchBar.text = ""
//        collectionView.reloadData()
//    }
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        searchList.removeAll()
//
//        for item in list {
//            if item.contains(searchBar.text!) {
//                searchList.append(item)
//            }
//        }
//        collectionView.reloadData()
//
//    }
//}
