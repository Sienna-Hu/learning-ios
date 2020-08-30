//
//  FilterCollectionViewCell.swift
//  xh244_P5
//
//  Created by 胡雪枫 on 2020/6/15.
//  Copyright © 2020 胡雪枫. All rights reserved.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    
    var filterName: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        filterName = UILabel()
        filterName.translatesAutoresizingMaskIntoConstraints = false
        filterName.backgroundColor = .white
        filterName.textAlignment = .center
        filterName.textColor = UIColor(displayP3Red: 0.2, green: 0.3, blue: 0.8, alpha: 0.7)
        
        contentView.addSubview(filterName)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            filterName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            filterName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            filterName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            filterName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            filterName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 5)
        ])
        
    }
    
    func configure(filter: Filter) {
        filterName.text = filter.filterName
    }
    
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.filterName.backgroundColor = UIColor(displayP3Red: 0.2, green: 0.3, blue: 0.8, alpha: 0.7)
                self.filterName.textColor = .white
            }
            else {
                self.filterName.backgroundColor = .white
                self.filterName.textColor = UIColor(displayP3Red: 0.2, green: 0.3, blue: 0.8, alpha: 0.7)
            }
        }
    }
    
}
