//
//  DetailViewController.swift
//  xh244_P4
//
//  Created by 胡雪枫 on 2020/6/12.
//  Copyright © 2020 胡雪枫. All rights reserved.
//

import UIKit

class DetailViewController1: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    weak var delegate: modifySong?
    var currentSong: Song?
    
    var songName: UILabel!
    var songNameField: UITextField!
    
    var artistName: UILabel!
    var artistNameField: UITextField!
    
    var albumName: UILabel!
    var albumNameField: UITextField!
    
    var coverLabel: UILabel!
    var addButton: UIButton!
    var currentImage: UIImage!
    
    init(delegate: modifySong?, currentSong: Song?) {
        self.currentSong = currentSong
        super.init(nibName: nil, bundle: nil)

        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Update", style: .plain, target: self, action: #selector(changeSong))

        // Do any additional setup after loading the view.
        
        songName = UILabel()
        songName.translatesAutoresizingMaskIntoConstraints = false
        songName.text = "Song Name: "
        songName.font = .boldSystemFont(ofSize: 16)
        songName.textColor = .black
        view.addSubview(songName)
        
        songNameField = UITextField()
        songNameField.translatesAutoresizingMaskIntoConstraints = false
        songNameField.borderStyle = .roundedRect
        songNameField.backgroundColor = .white
        songNameField.textAlignment = .center
        songNameField.clearsOnBeginEditing = true
        view.addSubview(songNameField)
        
        artistName = UILabel()
        artistName.translatesAutoresizingMaskIntoConstraints = false
        artistName.text = "Artist Name: "
        artistName.font = .boldSystemFont(ofSize: 16)
        artistName.textColor = .black
        view.addSubview(artistName)
        
        artistNameField = UITextField()
        artistNameField.translatesAutoresizingMaskIntoConstraints = false
        artistNameField.borderStyle = .roundedRect
        artistNameField.backgroundColor = .white
        artistNameField.textAlignment = .center
        artistNameField.clearsOnBeginEditing = true
        view.addSubview(artistNameField)
        
        albumName = UILabel()
        albumName.translatesAutoresizingMaskIntoConstraints = false
        albumName.text = "Album Name: "
        albumName.font = .boldSystemFont(ofSize: 16)
        albumName.textColor = .black
        view.addSubview(albumName)
        
        albumNameField = UITextField()
        albumNameField.translatesAutoresizingMaskIntoConstraints = false
        albumNameField.borderStyle = .roundedRect
        albumNameField.backgroundColor = .white
        albumNameField.textAlignment = .center
        albumNameField.clearsOnBeginEditing = true
        view.addSubview(albumNameField)
        
        coverLabel = UILabel()
        coverLabel.translatesAutoresizingMaskIntoConstraints = false
        coverLabel.text = "Cover: "
        coverLabel.font = .boldSystemFont(ofSize: 16)
        coverLabel.textColor = .black
        view.addSubview(coverLabel)
        
        addButton = UIButton()
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.addTarget(self, action: #selector(importImage), for: .touchUpInside)
        addButton.setTitle("Import Picture", for: .normal)
        addButton.setTitleColor(.blue, for: .normal)
        view.addSubview(addButton)
        
        setupConstraints()
    }
    
    @objc func importImage() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        dismiss(animated: true)
        currentImage = image
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            songName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            songName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100)
            
        ])
        
        NSLayoutConstraint.activate([
            songNameField.topAnchor.constraint(equalTo: songName.topAnchor),
            songNameField.leadingAnchor.constraint(equalTo: songName.trailingAnchor, constant: 10),
            songNameField.centerYAnchor.constraint(equalTo: songName.centerYAnchor),
            songNameField.widthAnchor.constraint(equalToConstant: 200),
            songNameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
        
        NSLayoutConstraint.activate([
            artistName.leadingAnchor.constraint(equalTo: songName.leadingAnchor),
            artistName.topAnchor.constraint(equalTo: songName.bottomAnchor, constant: 50)
            
        ])
        
        NSLayoutConstraint.activate([
            artistNameField.topAnchor.constraint(equalTo: artistName.topAnchor),
            artistNameField.leadingAnchor.constraint(equalTo: songNameField.leadingAnchor),
            artistNameField.centerYAnchor.constraint(equalTo: artistName.centerYAnchor),
            artistNameField.widthAnchor.constraint(equalToConstant: 200),
            artistNameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
        
        NSLayoutConstraint.activate([
            albumName.leadingAnchor.constraint(equalTo: songName.leadingAnchor),
            albumName.topAnchor.constraint(equalTo: artistName.bottomAnchor, constant: 50)
            
        ])
        
        NSLayoutConstraint.activate([
            albumNameField.topAnchor.constraint(equalTo: albumName.topAnchor),
            albumNameField.leadingAnchor.constraint(equalTo: songNameField.leadingAnchor),
            albumNameField.centerYAnchor.constraint(equalTo: albumName.centerYAnchor),
            albumNameField.widthAnchor.constraint(equalToConstant: 200),
            albumNameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
        
        NSLayoutConstraint.activate([
            coverLabel.leadingAnchor.constraint(equalTo: songName.leadingAnchor),
            coverLabel.topAnchor.constraint(equalTo: albumName.bottomAnchor, constant: 50)
        ])
        
        NSLayoutConstraint.activate([
            addButton.leadingAnchor.constraint(equalTo: songNameField.leadingAnchor),
            addButton.centerYAnchor.constraint(equalTo: coverLabel.centerYAnchor)
        ])
        
        
    }
    
    @objc func changeSong() {
        let newSongName = songNameField.text
        let newArtistName = artistNameField.text
        let newAlbumName = albumNameField.text
        delegate?.changeSong(newSongName: newSongName, newArtistName: newArtistName, newAlbumName: newAlbumName, cover: currentImage, song: self.currentSong!)
        navigationController?.popViewController(animated: true)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class DetailViewController2: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    weak var delegate: modifySong?
    
    var songName: UILabel!
    var songNameField: UITextField!
    
    var artistName: UILabel!
    var artistNameField: UITextField!
    
    var albumName: UILabel!
    var albumNameField: UITextField!
    
    var coverLabel: UILabel!
    var addButton: UIButton!
    var currentImage: UIImage!
    
    init(delegate: modifySong?) {
        super.init(nibName: nil, bundle: nil)

        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addSong))

        // Do any additional setup after loading the view.
        
        songName = UILabel()
        songName.translatesAutoresizingMaskIntoConstraints = false
        songName.text = "Song Name: "
        songName.font = .boldSystemFont(ofSize: 16)
        songName.textColor = .black
        view.addSubview(songName)
        
        songNameField = UITextField()
        songNameField.translatesAutoresizingMaskIntoConstraints = false
        songNameField.borderStyle = .roundedRect
        songNameField.backgroundColor = .white
        songNameField.textAlignment = .center
        songNameField.clearsOnBeginEditing = true
        view.addSubview(songNameField)
        
        artistName = UILabel()
        artistName.translatesAutoresizingMaskIntoConstraints = false
        artistName.text = "Artist Name: "
        artistName.font = .boldSystemFont(ofSize: 16)
        artistName.textColor = .black
        view.addSubview(artistName)
        
        artistNameField = UITextField()
        artistNameField.translatesAutoresizingMaskIntoConstraints = false
        artistNameField.borderStyle = .roundedRect
        artistNameField.backgroundColor = .white
        artistNameField.textAlignment = .center
        artistNameField.clearsOnBeginEditing = true
        view.addSubview(artistNameField)
        
        albumName = UILabel()
        albumName.translatesAutoresizingMaskIntoConstraints = false
        albumName.text = "Album Name: "
        albumName.font = .boldSystemFont(ofSize: 16)
        albumName.textColor = .black
        view.addSubview(albumName)
        
        albumNameField = UITextField()
        albumNameField.translatesAutoresizingMaskIntoConstraints = false
        albumNameField.borderStyle = .roundedRect
        albumNameField.backgroundColor = .white
        albumNameField.textAlignment = .center
        albumNameField.clearsOnBeginEditing = true
        view.addSubview(albumNameField)
        
        coverLabel = UILabel()
        coverLabel.translatesAutoresizingMaskIntoConstraints = false
        coverLabel.text = "Cover: "
        coverLabel.font = .boldSystemFont(ofSize: 16)
        coverLabel.textColor = .black
        view.addSubview(coverLabel)
        
        addButton = UIButton()
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.addTarget(self, action: #selector(importImage), for: .touchUpInside)
        addButton.setTitle("Import Picture", for: .normal)
        addButton.setTitleColor(.blue, for: .normal)
        view.addSubview(addButton)
        
        setupConstraints()
    }
    
    @objc func importImage() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        dismiss(animated: true)
        currentImage = image
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            songName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            songName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100)
            
        ])
        
        NSLayoutConstraint.activate([
            songNameField.topAnchor.constraint(equalTo: songName.topAnchor),
            songNameField.leadingAnchor.constraint(equalTo: songName.trailingAnchor, constant: 10),
            songNameField.centerYAnchor.constraint(equalTo: songName.centerYAnchor),
            songNameField.widthAnchor.constraint(equalToConstant: 200),
            songNameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
        
        NSLayoutConstraint.activate([
            artistName.leadingAnchor.constraint(equalTo: songName.leadingAnchor),
            artistName.topAnchor.constraint(equalTo: songName.bottomAnchor, constant: 50)
            
        ])
        
        NSLayoutConstraint.activate([
            artistNameField.topAnchor.constraint(equalTo: artistName.topAnchor),
            artistNameField.leadingAnchor.constraint(equalTo: songNameField.leadingAnchor),
            artistNameField.centerYAnchor.constraint(equalTo: artistName.centerYAnchor),
            artistNameField.widthAnchor.constraint(equalToConstant: 200),
            artistNameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
        
        NSLayoutConstraint.activate([
            albumName.leadingAnchor.constraint(equalTo: songName.leadingAnchor),
            albumName.topAnchor.constraint(equalTo: artistName.bottomAnchor, constant: 50)
            
        ])
        
        NSLayoutConstraint.activate([
            albumNameField.topAnchor.constraint(equalTo: albumName.topAnchor),
            albumNameField.leadingAnchor.constraint(equalTo: songNameField.leadingAnchor),
            albumNameField.centerYAnchor.constraint(equalTo: albumName.centerYAnchor),
            albumNameField.widthAnchor.constraint(equalToConstant: 200),
            albumNameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
        
        NSLayoutConstraint.activate([
            coverLabel.leadingAnchor.constraint(equalTo: songName.leadingAnchor),
            coverLabel.topAnchor.constraint(equalTo: albumName.bottomAnchor, constant: 50)
        ])
        
        NSLayoutConstraint.activate([
            addButton.leadingAnchor.constraint(equalTo: songNameField.leadingAnchor),
            addButton.centerYAnchor.constraint(equalTo: coverLabel.centerYAnchor)
        ])
        
        
    }
    
    @objc func addSong() {
        let newSongName = songNameField.text
        let newArtistName = artistNameField.text
        let newAlbumName = albumNameField.text
        delegate?.addSong(newSongName: newSongName!, newArtistName: newArtistName!, newAlbumName: newAlbumName!, newCover: currentImage)
        navigationController?.popViewController(animated: true)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

