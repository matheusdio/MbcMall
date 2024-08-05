//
//  StoreCollectionViewCell.swift
//  MbcMallApp
//
//  Created by Matheus Dionísio on 12/09/23.
//

import UIKit

class StoreCollectionViewCell: UICollectionViewCell {
    
    lazy var container: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "90.0"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textColor = #colorLiteral(red: 0.7098041177, green: 0.7098038793, blue: 0.7011842132, alpha: 1)
        
        return label
    }()
    
    lazy var categoryImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "mbcLogo")
        
        return imageView
    }()
    
    func setupLayout() {
        setHierarchy()
        setConstraints()
    }
    
    
    func setHierarchy() {
        
        self.contentView.addSubview(container)
        self.container.addSubview(titleLabel)
        self.container.addSubview(categoryImageView)
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            container.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
            categoryImageView.topAnchor.constraint(equalTo: self.container.topAnchor),
            categoryImageView.leadingAnchor.constraint(equalTo: self.container.leadingAnchor),
            categoryImageView.trailingAnchor.constraint(equalTo: self.container.trailingAnchor),
            categoryImageView.bottomAnchor.constraint(equalTo: self.container.bottomAnchor)
        ])
    }
    
}
