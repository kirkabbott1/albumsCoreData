//
//  DetailVC.swift
//  albumsCoreData
//
//  Created by Kirk Abbott on 11/30/22.
//

import Foundation
import UIKit
class DetailVC: UIViewController {
    
    
    lazy var albumImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemGray4
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.image = UIImage(named: "huh")
//        imageView.sizeToFit()
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.backgroundColor = .systemGray
        label.textColor = .white
        label.text = "Title"
        label.textAlignment = .center
        label.layer.cornerRadius = 20
        return label
    }()
    
    lazy var artist: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.backgroundColor = .systemGray
        label.textColor = .white
        label.text = "Artist"
        label.textAlignment = .center
        label.layer.cornerRadius = 20
        
        return label
    }()
    
    lazy var favoriteBtn: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.addTarget(self, action: #selector(self.clickFavoriteBtn), for: .touchUpInside)
//        button.backgroundColor = .t
        button.tintColor = .systemPink
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        return button
    }()
    
    var buttonActive: Bool = false
    override func viewDidLoad() {
        print("something")
        super.viewDidLoad()
        
        self.view.addSubview(albumImageView)
        self.view.addSubview(nameLabel)
        self.view.addSubview(artist)
//        self.view.addSubview(genres)
//        self.view.addSubview(releaseDate)
        self.view.addSubview(favoriteBtn)
        self.view.backgroundColor = .white
        
        self.albumImageView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: -30).isActive = true
        self.albumImageView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        self.albumImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        self.albumImageView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        self.nameLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        self.nameLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        
        self.nameLabel.bottomAnchor.constraint(equalTo: self.albumImageView.topAnchor, constant: -8).isActive = true
        
        
//        self.releaseDate.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
//        self.releaseDate.topAnchor.constraint(equalTo: self.artistName.bottomAnchor, constant: 8).isActive = true
//        self.releaseDate.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 8).isActive = true
        
        
        self.artist.topAnchor.constraint(equalTo: self.albumImageView.bottomAnchor, constant: 8).isActive = true
        
        self.artist.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.artist.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 8).isActive = true
        
        
//        self.genres.topAnchor.constraint(equalTo: self.releaseDate.bottomAnchor, constant: 8).isActive = true
        
//        self.genres.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
//        self.genres.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 8).isActive = true
        
        
        self.favoriteBtn.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 8).isActive = true
        self.favoriteBtn.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
    }
    @objc
    func clickFavoriteBtn() {
        //Deselected button
        if buttonActive {
            DispatchQueue.main.async {
                self.favoriteBtn.setImage(UIImage(systemName: "heart"), for: .normal)
                self.buttonActive = false
            }

        //Selected button
        } else {
            DispatchQueue.main.async {
                self.favoriteBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                self.buttonActive = true
            }

        }
    }
    
    
}
