//
//  ViewController.swift
//  xh244_P3_C
//
//  Created by 胡雪枫 on 2020/6/2.
//  Copyright © 2020 胡雪枫. All rights reserved.
//

import UIKit

protocol SaveNameProtocol: class {
    
    func saveNameb(newName: String)
    func saveNamer(newName: String)
    
}



class ViewController: UIViewController {
    
    var redSquareArena: UIButton!
    var blueCircleArena: UIButton!
    var magicalArena: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Drawing Arena"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        
        redSquareArena = UIButton()
        redSquareArena.translatesAutoresizingMaskIntoConstraints = false
        redSquareArena.setTitle("Red Square Arena", for: .normal)
        redSquareArena.setTitleColor(.magenta, for: .normal)
        redSquareArena.addTarget(self, action: #selector(pushRedSquareArena), for: .touchUpInside)
        view.addSubview(redSquareArena)
        
        blueCircleArena = UIButton()
        blueCircleArena.translatesAutoresizingMaskIntoConstraints = false
        blueCircleArena.setTitle("Blue Circle Arena", for: .normal)
        blueCircleArena.setTitleColor(.blue, for: .normal)
        blueCircleArena.addTarget(self, action: #selector(presentBlueCircleArena), for: .touchUpInside)
        view.addSubview(blueCircleArena)
        
        magicalArena = UIButton()
        magicalArena.translatesAutoresizingMaskIntoConstraints = false
        magicalArena.setTitle("Magic Arena", for: .normal)
        magicalArena.setTitleColor(.orange, for: .normal)
        magicalArena.addTarget(self, action: #selector(pushMagicArena), for: .touchUpInside)
        view.addSubview(magicalArena)

        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            redSquareArena.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            redSquareArena.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -10),
            redSquareArena.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            blueCircleArena.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            blueCircleArena.topAnchor.constraint(equalTo: redSquareArena.bottomAnchor, constant: 10),
            blueCircleArena.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            magicalArena.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            magicalArena.topAnchor.constraint(equalTo: blueCircleArena.bottomAnchor, constant: 10),
            magicalArena.heightAnchor.constraint(equalToConstant: 24)
        ])
    }

    @objc func pushRedSquareArena() {
        let vc = ArenaViewController.RedViewController(delegate: self, titleString: redSquareArena.titleLabel?.text)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func presentBlueCircleArena() {
        let vc = ArenaViewController.BlueViewController(delegate: self, titleString: blueCircleArena.titleLabel?.text)
        self.present(vc, animated: true, completion: nil)
    }
    
                
    @objc func pushMagicArena() {
        let vc = ArenaViewController.MagicViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: SaveNameProtocol {
    
    func saveNameb(newName: String) {
        blueCircleArena.setTitle(newName, for: .normal)
    }
    
    func saveNamer(newName: String) {
        redSquareArena.setTitle(newName, for: .normal)
    }
    
}

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}


    

