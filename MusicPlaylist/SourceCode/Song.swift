//
//  Song.swift
//  xh244_P4
//
//  Created by 胡雪枫 on 2020/6/12.
//  Copyright © 2020 胡雪枫. All rights reserved.
//

import Foundation

import UIKit

class Song {
    
    var songName: String!
    var artistName: String!
    var albumName: String!
    var cover: UIImage!
    
    init(songName: String, artistName: String, albumName: String, cover: UIImage){
        self.songName = songName
        self.artistName = artistName
        self.albumName = albumName
        self.cover = cover
    }
}
