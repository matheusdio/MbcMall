//
//  ViewController.swift
//  MbcMallApp
//
//  Created by Matheus Dionísio on 19/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    var mbcInitialPosts: [Posts] = []
    var selectedMbcInitialPosts: Posts?
    var buttonTapped: Bool = false

    lazy var container: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9254903197, green: 0.9254902005, blue: 0.9254903197, alpha: 1)
        
        return view
    }()
    
    lazy var topView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.3357018828, green: 0.2433313429, blue: 0.2278861403, alpha: 1)
        
        return view
    }()
    
    lazy var mbcLogoImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "mbcLogo")
        
        return imageView
    }()
    
    lazy var mbcMajorPostImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "majorPost")
        
        return imageView
    }()
    
    lazy var welcomeToMbcMallImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "welcomeToMbcMallBackground")
        
        return imageView
    }()
    
    lazy var topWelcomeToMbcMallLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome to"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.textColor = #colorLiteral(red: 0.3634748459, green: 0.3240889311, blue: 0.3205174208, alpha: 1)
        
        return label
    }()
    
    lazy var middleWelcomeToMbcMallLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "MBC MALL PARK"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 48, weight: .light)
        label.textColor = #colorLiteral(red: 0.2166727185, green: 0.187173605, blue: 0.1790819764, alpha: 1)
        
        return label
    }()
    
    lazy var bottomWelcomeToMbcMallLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "MBC Mall, which consists of a variety of restaurants and convenience facilities, is located in the new Sangam MBC building and can be found at PARK and PLAZA."
        label.textAlignment = .left
        label.numberOfLines = 5
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.textColor = #colorLiteral(red: 0.2370184958, green: 0.2271140516, blue: 0.2229796052, alpha: 1)
        
        return label
    }()
    
    lazy var mbcSignatureImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "lastView")
        
        return imageView
    }()
    
    lazy var mbcSignatureLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ilsan MBC Dream Center"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 22, weight: .light)
        label.textColor = #colorLiteral(red: 0.2119813859, green: 0.1873605251, blue: 0.1791734099, alpha: 1)
        
        return label
    }()
    
    lazy var mbcCollectionView: UICollectionView = {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none
        collectionView.collectionViewLayout = layout
        //collectionView.register(RadioStationCollectionViewCell.self, forCellWithReuseIdentifier: "RadioStationCollectionViewCell")
        
        return collectionView
    }()
    
    lazy var postsCollectionView: UICollectionView = {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none
        collectionView.collectionViewLayout = layout
        collectionView.register(mbcOptionsCollectionViewCell.self, forCellWithReuseIdentifier: "mbcOptionsCollectionViewCell")
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(container)
        self.view.backgroundColor = .white
        self.postsCollectionView.delegate = self
        self.postsCollectionView.dataSource = self
        self.setHierarchy()
        self.setConstraints()
        self.createMbcPosts()
        
    }
    
    func createMbcPosts() {
        
        let mbcPosts1: Posts = Posts(postsTitle: "Shop", postsImage: UIImage(named: "firstPost"), postsImageSelected: UIImage(named: "firstPostSelected"))
        let mbcPosts2: Posts = Posts(postsTitle: "News", postsImage: UIImage(named: "secondPost"), postsImageSelected: UIImage(named: "secondPostSelected"))
        let mbcPosts3: Posts = Posts(postsTitle: "Support", postsImage: UIImage(named: "thirdPost"), postsImageSelected: UIImage(named: "thirdPostSelected"))
        
        mbcInitialPosts.append(mbcPosts1)
        mbcInitialPosts.append(mbcPosts2)
        mbcInitialPosts.append(mbcPosts3)
        
        print(mbcInitialPosts)
    
    }
    
    func setHierarchy() {
        
        container.addSubview(topView)
        topView.addSubview(mbcLogoImageView)
        container.addSubview(mbcMajorPostImageView)
        container.addSubview(postsCollectionView)
        container.addSubview(welcomeToMbcMallImageView)
        container.addSubview(mbcSignatureImageView)
        welcomeToMbcMallImageView.addSubview(topWelcomeToMbcMallLabel)
        welcomeToMbcMallImageView.addSubview(middleWelcomeToMbcMallLabel)
        welcomeToMbcMallImageView.addSubview(bottomWelcomeToMbcMallLabel)
        mbcSignatureImageView.addSubview(mbcSignatureLabel)
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
        
            container.topAnchor.constraint(equalTo: self.view.topAnchor),
            container.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            topView.topAnchor.constraint(equalTo: self.container.topAnchor),
            topView.leadingAnchor.constraint(equalTo: self.container.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: self.container.trailingAnchor),
            
            mbcLogoImageView.topAnchor.constraint(equalTo: self.topView.topAnchor, constant: 50),
            mbcLogoImageView.leadingAnchor.constraint(equalTo: self.topView.leadingAnchor, constant: 100),
            mbcLogoImageView.trailingAnchor.constraint(equalTo: self.topView.trailingAnchor, constant: -100),
            mbcLogoImageView.bottomAnchor.constraint(equalTo: self.topView.bottomAnchor, constant: -25),
            
            mbcMajorPostImageView.topAnchor.constraint(equalTo: self.topView.bottomAnchor),
            mbcMajorPostImageView.leadingAnchor.constraint(equalTo: self.container.leadingAnchor),
            mbcMajorPostImageView.trailingAnchor.constraint(equalTo: self.container.trailingAnchor),
            mbcMajorPostImageView.heightAnchor.constraint(equalToConstant: 300),
            
            postsCollectionView.topAnchor.constraint(equalTo: self.mbcMajorPostImageView.bottomAnchor),
            postsCollectionView.leadingAnchor.constraint(equalTo: self.container.leadingAnchor),
            postsCollectionView.trailingAnchor.constraint(equalTo: self.container.trailingAnchor),
            postsCollectionView.heightAnchor.constraint(equalToConstant: 100),
            
            welcomeToMbcMallImageView.topAnchor.constraint(equalTo: self.mbcSignatureImageView.bottomAnchor),
            welcomeToMbcMallImageView.leadingAnchor.constraint(equalTo: self.container.leadingAnchor),
            welcomeToMbcMallImageView.trailingAnchor.constraint(equalTo: self.container.trailingAnchor),
            welcomeToMbcMallImageView.heightAnchor.constraint(equalToConstant: 230),
            
            topWelcomeToMbcMallLabel.topAnchor.constraint(equalTo: self.welcomeToMbcMallImageView.topAnchor, constant: 32),
            topWelcomeToMbcMallLabel.leadingAnchor.constraint(equalTo: self.welcomeToMbcMallImageView.leadingAnchor, constant: 30),
            
            middleWelcomeToMbcMallLabel.topAnchor.constraint(equalTo: self.topWelcomeToMbcMallLabel.bottomAnchor, constant: 3),
            middleWelcomeToMbcMallLabel.leadingAnchor.constraint(equalTo: self.container.leadingAnchor, constant: 30),
            
            bottomWelcomeToMbcMallLabel.topAnchor.constraint(equalTo: self.middleWelcomeToMbcMallLabel.bottomAnchor, constant: 15),
            bottomWelcomeToMbcMallLabel.leadingAnchor.constraint(equalTo: self.container.leadingAnchor, constant: 30),
            bottomWelcomeToMbcMallLabel.trailingAnchor.constraint(equalTo: self.container.trailingAnchor, constant: -30),
            
            mbcSignatureImageView.topAnchor.constraint(equalTo: self.postsCollectionView.bottomAnchor),
            mbcSignatureImageView.leadingAnchor.constraint(equalTo: self.container.leadingAnchor),
            mbcSignatureImageView.trailingAnchor.constraint(equalTo: self.container.trailingAnchor),
            mbcSignatureImageView.heightAnchor.constraint(equalToConstant: 130),
            
            mbcSignatureLabel.topAnchor.constraint(equalTo: self.mbcSignatureImageView.topAnchor, constant: 50),
            mbcSignatureLabel.leadingAnchor.constraint(equalTo: self.mbcSignatureImageView.leadingAnchor, constant: 35),
            //mbcSignatureLabel.trailingAnchor.constraint(equalTo: self.mbcSignatureImageView.trailingAnchor, constant: -50)
        ])
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mbcInitialPosts.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mbcOptionsCollectionViewCell", for: indexPath) as? mbcOptionsCollectionViewCell
        
        cell?.setupLayout()
        cell?.optionsImageView.image = mbcInitialPosts[indexPath.item].postsImage
        cell?.titleLabel.text = self.mbcInitialPosts[indexPath.item].postsTitle
        cell?.titleLabel.textColor = #colorLiteral(red: 0.1311131418, green: 0.1212278083, blue: 0.1257154346, alpha: 1)
        
        if (mbcInitialPosts[indexPath.item].postsTitle == "Shop") {
            cell?.container.backgroundColor = #colorLiteral(red: 0.7040259242, green: 0.6694004536, blue: 0.6570855975, alpha: 1)
        }
        
        else if (mbcInitialPosts[indexPath.item].postsTitle == "News") {
            cell?.container.backgroundColor = #colorLiteral(red: 0.8051708341, green: 0.7754595876, blue: 0.7716878057, alpha: 1)
        } else {
            cell?.container.backgroundColor = #colorLiteral(red: 0.8771284223, green: 0.8622452617, blue: 0.858202517, alpha: 1)
        }
        
        
        if let selected = selectedMbcInitialPosts {
            if selected == mbcInitialPosts[indexPath.item] {
                
                cell?.container.backgroundColor = #colorLiteral(red: 0.1926227212, green: 0.1390570104, blue: 0.1271147728, alpha: 1)
                cell?.optionsImageView.image = mbcInitialPosts[indexPath.item].postsImageSelected
                cell?.titleLabel.textColor = #colorLiteral(red: 0.9272429347, green: 0.9173150659, blue: 0.9217987657, alpha: 1)
            }
            
            //else {
                //cell?.titleLabel.textColor = #colorLiteral(red: 0.1311131418, green: 0.1212278083, blue: 0.1257154346, alpha: 1)
           }
            return cell ?? UICollectionViewCell()
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.postsCollectionView.frame.width / 3, height: self.postsCollectionView.frame.height)
    }
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath)!
        selectedMbcInitialPosts = mbcInitialPosts[indexPath.item]
        cell.backgroundColor = .none
        collectionView.reloadData()
        
        if mbcInitialPosts[indexPath.item].postsTitle == "Shop" {
            let shopViewController = ShopViewController()
            navigationController?.pushViewController(shopViewController, animated: true)
        } else if mbcInitialPosts[indexPath.item].postsTitle == "News" {
            let newsViewController = NewsViewController()
            navigationController?.pushViewController(newsViewController, animated: true)
        } else if mbcInitialPosts[indexPath.item].postsTitle == "Support" {
            let supportViewController = SupportViewController()
            navigationController?.pushViewController(supportViewController, animated: true)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)!
        if selectedMbcInitialPosts != nil {
            selectedMbcInitialPosts = nil
            cell.contentView.backgroundColor = .none
        }
    }
        
}
    
    


