//
//  SongTableViewCell.swift
//  xh244_P4
//
//  Created by 胡雪枫 on 2020/6/12.
//  Copyright © 2020 胡雪枫. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {

    var songLabel: UILabel!
    var artistLabel: UILabel!
    var albumLabel: UILabel!
    var cover: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        songLabel = UILabel()
        songLabel.translatesAutoresizingMaskIntoConstraints = false
        songLabel.font = UIFont.boldSystemFont(ofSize: 16)
        contentView.addSubview(songLabel)
        
        artistLabel = UILabel()
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.font = UIFont.systemFont(ofSize: 12)
        artistLabel.textColor = UIColor.gray
        contentView.addSubview(artistLabel)
        
        albumLabel = UILabel()
        albumLabel.translatesAutoresizingMaskIntoConstraints = false
        albumLabel.font = UIFont.systemFont(ofSize: 12)
        albumLabel.textColor = UIColor.gray
        contentView.addSubview(albumLabel)
        
        cover = UIImageView()
        cover.translatesAutoresizingMaskIntoConstraints = false
        cover.contentMode = .scaleAspectFit
        contentView.addSubview(cover)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            songLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            songLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            songLabel.heightAnchor.constraint(equalToConstant: 16)
        ])
        
        NSLayoutConstraint.activate([
            artistLabel.topAnchor.constraint(equalTo: songLabel.bottomAnchor, constant: 5),
            artistLabel.leadingAnchor.constraint(equalTo: songLabel.leadingAnchor),
            artistLabel.heightAnchor.constraint(equalToConstant: 12)
        ])
        
        NSLayoutConstraint.activate([
            albumLabel.topAnchor.constraint(equalTo: artistLabel.topAnchor),
            albumLabel.leadingAnchor.constraint(equalTo: artistLabel.trailingAnchor, constant: 5),
            albumLabel.heightAnchor.constraint(equalToConstant: 12)
        ])
        
        NSLayoutConstraint.activate([
            cover.heightAnchor.constraint(equalToConstant: 50),
            cover.widthAnchor.constraint(equalToConstant: 50),
            cover.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            cover.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(for song: Song) {
        songLabel.text = song.songName
        artistLabel.text = song.artistName
        albumLabel.text = song.albumName
        cover.image = song.cover
    }
    

}
