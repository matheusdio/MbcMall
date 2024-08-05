//
//  mbcOptionsCollectionViewCell.swift
//  MbcMallApp
//
//  Created by Matheus Dionísio on 24/07/23.
//

import UIKit

class mbcOptionsCollectionViewCell: UICollectionViewCell {
    
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
    
    lazy var optionsImageView: UIImageView = {
        
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
        
        contentView.addSubview(container)
        container.addSubview(titleLabel)
        container.addSubview(optionsImageView)
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
        
            container.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            container.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
            optionsImageView.topAnchor.constraint(equalTo: self.container.topAnchor, constant: 15),
            optionsImageView.leadingAnchor.constraint(equalTo: self.container.leadingAnchor, constant: 40),
            optionsImageView.trailingAnchor.constraint(equalTo: self.container.trailingAnchor, constant: -40),
            
            titleLabel.topAnchor.constraint(equalTo: self.optionsImageView.bottomAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: self.container.leadingAnchor, constant: 25),
            titleLabel.trailingAnchor.constraint(equalTo: self.container.trailingAnchor, constant: -25),
            
        ])
    }
    
}
