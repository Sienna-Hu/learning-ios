//
//  RestaurantCollectionViewCell.swift
//  xh244_P5
//
//  Created by 胡雪枫 on 2020/6/15.
//  Copyright © 2020 胡雪枫. All rights reserved.
//

import UIKit

class RestaurantCollectionViewCell: UICollectionViewCell {
    
    var imageView: UIImageView!
    var nameLabel: UILabel!
    var cuisine: UILabel!
    var time: UILabel!
    var priceLevel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        contentView.addSubview(imageView)
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.backgroundColor = .white
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        contentView.addSubview(nameLabel)
        
        cuisine = UILabel()
        cuisine.translatesAutoresizingMaskIntoConstraints = false
        cuisine.backgroundColor = .white
        cuisine.text = " "
        cuisine.font = UIFont.systemFont(ofSize: 12)
        contentView.addSubview(cuisine)
        
        time = UILabel()
        time.translatesAutoresizingMaskIntoConstraints = false
        time.backgroundColor = .white
        time.text = " "
        time.font = UIFont.systemFont(ofSize: 12)
        contentView.addSubview(time)
        
        priceLevel = UILabel()
        priceLevel.translatesAutoresizingMaskIntoConstraints = false
        priceLevel.backgroundColor = .white
        priceLevel.font = .boldSystemFont(ofSize: 16)
        contentView.addSubview(priceLevel)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            cuisine.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            cuisine.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            cuisine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            time.topAnchor.constraint(equalTo: cuisine.topAnchor),
            time.leadingAnchor.constraint(equalTo: cuisine.trailingAnchor),
            time.bottomAnchor.constraint(equalTo: cuisine.bottomAnchor),
            time.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            priceLevel.topAnchor.constraint(equalTo: nameLabel.topAnchor),
            priceLevel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            priceLevel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
    }
    
    func configure(restaurant: Restaurant) {
        
        imageView.image = UIImage(named: restaurant.imageName)
        nameLabel.text = " " + restaurant.restaurantName
        priceLevel.text = restaurant.priceLevel
        cuisine.text = ""
        time.text = ""
        for type in restaurant.cuisine {
            cuisine.text! += type + " "
        }
        for period in restaurant.time {
            time.text! += period + " "
        }
        
    }
    
}
