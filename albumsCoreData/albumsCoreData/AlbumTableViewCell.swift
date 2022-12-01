//
//  AlbumTableViewCell.swift
//  albumsCoreData
//
//  Created by Kirk Abbott on 11/28/22.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {
    
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
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI(){
        let stack = UIStackView(frame: .zero)
//        self.nameLabel.layer.cornerRadius = 20
        self.contentView.contentMode = .scaleToFill
        self.contentView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        self.contentView.addSubview(albumImageView)
        self.contentView.addSubview(artist)
        self.contentView.addSubview(favoriteBtn)
        self.contentView.addSubview(stack)

        self.contentView.backgroundColor = .systemGray5
        
        self.artist.leadingAnchor.constraint(equalTo: self.albumImageView.trailingAnchor, constant: 8).isActive = true
        self.artist.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
        self.artist.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
        self.albumImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8).isActive = true
        self.albumImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        self.albumImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
        self.favoriteBtn.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -4).isActive = true
        self.favoriteBtn.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -4).isActive = true

        stack.translatesAutoresizingMaskIntoConstraints = false

        stack.leadingAnchor.constraint(equalTo: self.albumImageView.trailingAnchor, constant: 8).isActive = true
        stack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8).isActive = true
        stack.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        stack.bottomAnchor.constraint(equalTo: self.favoriteBtn.topAnchor, constant: -8).isActive = true
        
//        stack.heightAnchor.constraint(equalToConstant: 150).isActive = true
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 3
        stack.addArrangedSubview(nameLabel)
//        stack.addArrangedSubview(artist)
//        stack.addArrangedSubview(favoriteBtn)
        

    }
    
    @objc
    func clickFavoriteBtn() {
        if buttonActive {
            DispatchQueue.main.async {
                self.favoriteBtn.setImage(UIImage(systemName: "heart"), for: .normal)
                self.buttonActive = false
            }

        } else {
            DispatchQueue.main.async {
                self.favoriteBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                self.buttonActive = true
            }

        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}



