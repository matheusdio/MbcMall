//
//  ShopViewController.swift
//  MbcMallApp
//
//  Created by Matheus Dionísio on 12/09/23.
//

import UIKit

class ShopViewController: UIViewController {
    
    var mbcCategoryList: [Store] = []
    
    var itemsByCategoryList: [ItemsByCategory] = []

    lazy var container: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.2213473916, green: 0.1869826019, blue: 0.1833259761, alpha: 1)
        
        return view
    }()
    
    lazy var storeCollectionView: UICollectionView = {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none
        collectionView.collectionViewLayout = layout
        collectionView.register(StoreCollectionViewCell.self, forCellWithReuseIdentifier: "StoreCollectionViewCell")
        
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setHierarchy()
        setConstraints()
        createCategory()
        self.storeCollectionView.delegate = self
        self.storeCollectionView.dataSource = self
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))


        backButton.tintColor = .white
            navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func backButtonTapped() {
        
        navigationController?.popViewController(animated: true)
    }
    
    func createCategory() {
        
        let mbcCategory1: Store = Store(title: "Asian Dining", categoryImage: UIImage(named: "asiandiningcell"))
        let mbcCategory2: Store = Store(title: "Western Dining", categoryImage: UIImage(named: "westerndiningcell"))
        let mbcCategory3: Store = Store(title: "Coffee & Dessert", categoryImage: UIImage(named: "coffeeanddessertcell"))
        let mbcCategory4: Store = Store(title: "Health & Beauty", categoryImage: UIImage(named: "healthandbeautycell"))
        let mbcCategory5: Store = Store(title: "Convenience", categoryImage: UIImage(named: "conveniencecell"))
                                        
        mbcCategoryList.append(mbcCategory1)
        mbcCategoryList.append(mbcCategory2)
        mbcCategoryList.append(mbcCategory3)
        mbcCategoryList.append(mbcCategory4)
        mbcCategoryList.append(mbcCategory5)
    }
    
    func setHierarchy() {
        
        self.view.addSubview(container)
        self.container.addSubview(storeCollectionView)
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            self.container.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.container.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.container.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.container.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            self.storeCollectionView.topAnchor.constraint(equalTo: self.container.topAnchor, constant: 150),
            self.storeCollectionView.leadingAnchor.constraint(equalTo: self.container.leadingAnchor),
            self.storeCollectionView.trailingAnchor.constraint(equalTo: self.container.trailingAnchor),
            self.storeCollectionView.bottomAnchor.constraint(equalTo: self.container.bottomAnchor, constant: -150),
            
            
            
        ])
        
    }

}

extension ShopViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mbcCategoryList.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoreCollectionViewCell", for: indexPath) as? StoreCollectionViewCell

        cell?.setupLayout()
        cell?.categoryImageView.image = mbcCategoryList[indexPath.item].categoryImage
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenWidth = UIScreen.main.bounds.width
        let cellWidth = screenWidth
        
        return CGSize(width: cellWidth, height: 100)
    }
    
    
}
