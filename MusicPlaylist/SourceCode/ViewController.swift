//
//  ViewController.swift
//  xh244_P4
//
//  Created by 胡雪枫 on 2020/6/12.
//  Copyright © 2020 胡雪枫. All rights reserved.
//

import UIKit

protocol modifySong: class {

    func changeSong(newSongName: String?, newArtistName: String?, newAlbumName: String?, cover: UIImage?, song: Song)
    func addSong(newSongName: String, newArtistName: String, newAlbumName: String, newCover: UIImage)
}


class ViewController: UIViewController {
    
    var tableView: UITableView!
//    var audioPlayer: AVAudioPlayer?
    
    let reuseIdentifier = "playlistCellReuse"
    let cellHeight: CGFloat = 80
    var songs: [Song]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        title = "Playlist🎶"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addSongView))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Reorder", style: .plain, target: self, action: #selector(reorderSongs))
        
        let beautifulgirl = Song(songName: "Beautiful Girl", artistName: "HAHA", albumName: "Beautiful Girl", cover: UIImage(named: "beautifulgirl")!)
        let artist = Song(songName: "Artist", artistName: "Lil Ghost", albumName: "Produce 101", cover: UIImage(named: "oxlxs")!)
        let parties = Song(songName: "Parties", artistName: "Jake Miller", albumName: "2:00 AM in LA", cover: UIImage(named: "parties")!)
        let windcolor = Song(songName: "Color Of Wind", artistName: "Nineone", albumName: "Dear X", cover: UIImage(named: "windcolor")!)
        let young = Song(songName: "Young", artistName: "The Chainsmokers", albumName: "Memories", cover: UIImage(named: "young")!)
        let goodday = Song(songName: "Good Day", artistName: "Lucky Stroke", albumName: "Good Day", cover: UIImage(named: "goodday")!)
        let heykong = Song(songName: "Hey Kong", artistName: "Key.L", albumName: "Rap 2019", cover: UIImage(named: "heykong")!)
        let uhoh = Song(songName: "Uh-Oh", artistName: "Gidle", albumName: "Uh-Oh", cover: UIImage(named: "uhoh")!)
        let diamonds = Song(songName: "Diamonds", artistName: "Rihanna", albumName: "Diamonds", cover: UIImage(named: "diamond")!)
        let goodlife = Song(songName: "Good Life", artistName: "G-Eazy", albumName: "The Fate of the Furious", cover: UIImage(named: "goodlife")!)
        songs = [beautifulgirl, artist, parties, windcolor, young, goodday, heykong, uhoh, diamonds, goodlife]
        
        
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(SongTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        setupConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        tableView.reloadData()
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc func addSongView() {
        let nvc = DetailViewController2(delegate: self)
        navigationController?.pushViewController(nvc, animated: true)
    }
    
    @objc func reorderSongs() {
        if tableView.isEditing{
            tableView.isEditing = false
        }
        else {
            tableView.isEditing = true
        }
    }

}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SongTableViewCell
        
        let song = songs[indexPath.row]
        cell.selectionStyle = .none
        cell.configure(for: song)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            songs.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
     func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = songs[sourceIndexPath.row]
        songs.remove(at: sourceIndexPath.row)
        songs.insert(movedObject, at: destinationIndexPath.row)
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let song = songs[indexPath.row]
        let dvc = DetailViewController1(delegate: self, currentSong: song)
        navigationController?.pushViewController(dvc, animated: true)
    }
    
}

extension ViewController: modifySong {
    func changeSong(newSongName: String?, newArtistName: String?, newAlbumName: String?, cover: UIImage?, song: Song) {
        song.songName = newSongName
        song.artistName = newArtistName
        song.albumName = newAlbumName
        song.cover = cover
    }
    
    func addSong(newSongName: String, newArtistName: String, newAlbumName: String, newCover: UIImage) {
        let song = Song(songName: newSongName, artistName: newArtistName, albumName: newAlbumName, cover: newCover)
        songs.append(song)
    }
}




