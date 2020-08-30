//
//  ArenaViewController.swift
//  xh244_P3_C
//
//  Created by 胡雪枫 on 2020/6/2.
//  Copyright © 2020 胡雪枫. All rights reserved.
//

import UIKit

class ArenaViewController: UIViewController {
    
    class MagicViewController: ArenaViewController {
        
        var randomSquare: UIView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .random
            // Do any additional setup after loading the view.

        }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            randomSquare = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            randomSquare.center = touches.first!.location(in: view)
            randomSquare.backgroundColor = .random
            view.addSubview(randomSquare)

        }
        
    }
    
    class RedViewController: ArenaViewController {
            
        weak var delegate: SaveNameProtocol?
        var titleString: String?
            
        var redSquare: UIView!
        var textField: UITextField!
        var textLabel: UILabel!
        var slider: UISlider!
        var hideOrShow: UISegmentedControl!
        var squareList = [UIView]()
        var eraser: UISwitch!
            
        init(delegate: SaveNameProtocol?, titleString: String?) {
            super.init(nibName: nil, bundle: nil)
                
            self.titleString = titleString
            self.delegate = delegate
        }
            
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
            
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveText))

                
            textLabel = UILabel()
            textLabel.translatesAutoresizingMaskIntoConstraints = false
            textLabel.text = "Arena Name: "
            textLabel.textColor = .black
            textLabel.font = .boldSystemFont(ofSize: 15)
            view.addSubview(textLabel)
                
            textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = titleString
            textField.borderStyle = .roundedRect
            textField.backgroundColor = .white
            textField.textAlignment = .center
            textField.clearsOnBeginEditing = true
            view.addSubview(textField)
            
            slider = UISlider(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
            slider.translatesAutoresizingMaskIntoConstraints = false
            slider.maximumValue = 100
            slider.minimumValue = 1
            slider.isContinuous = true
            view.addSubview(slider)
                
            hideOrShow = UISegmentedControl(items: ["Hide", "Show"])
            hideOrShow.translatesAutoresizingMaskIntoConstraints = false
            hideOrShow.addTarget(self, action: #selector(changeAlpha), for: .valueChanged)
            view.addSubview(hideOrShow)
            
            eraser = UISwitch()
            eraser.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(eraser)
                
            setupConstraints()
            // Do any additional setup after loading the view.
            }
            
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            if eraser.isOn {
                for square in squareList {
                    if square.frame.contains(touches.first!.location(in: view)) {
                        square.removeFromSuperview()
                    }
                }
            }
            else {
                redSquare = UIView(frame: CGRect(x: 0, y: 0, width: Int(slider.value), height: Int(slider.value)))
                squareList.append(redSquare)
                redSquare.center = touches.first!.location(in: view)
                redSquare.backgroundColor = .magenta
                view.addSubview(redSquare)
            }
        }
            
            
        func setupConstraints() {
                
            NSLayoutConstraint.activate([
                textLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
                textLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50)
            ])
                
            NSLayoutConstraint.activate([
                textField.topAnchor.constraint(equalTo: textLabel.topAnchor),
                textField.leadingAnchor.constraint(equalTo: textLabel.trailingAnchor, constant: 10),
                textField.centerYAnchor.constraint(equalTo: textLabel.centerYAnchor),
                textField.widthAnchor.constraint(equalToConstant: 200),
                textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
            ])
                
            NSLayoutConstraint.activate([
                slider.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
                slider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                slider.widthAnchor.constraint(equalToConstant: 200)
            ])
            
            NSLayoutConstraint.activate([
                hideOrShow.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 20),
                hideOrShow.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
            
            NSLayoutConstraint.activate([
                eraser.topAnchor.constraint(equalTo: hideOrShow.bottomAnchor, constant: 20),
                eraser.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        }
            
        @objc func saveText() {
            if let newName = textField.text {
                if newName == "" {
                    let alert = UIAlertController(title: "Alert", message: "You did not enter any arena name. Try again", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
                else {
                    delegate?.saveNamer(newName: newName)
                navigationController?.popViewController(animated: true)
                }
            }
        }
        
        @objc func changeAlpha() {
            for square in squareList {
                if hideOrShow.selectedSegmentIndex == 0 {
                    square.alpha = 0
                }
                else {
                    square.alpha = 1
                }
            }
        }
    
            
    }
    
    class BlueViewController: UIViewController {
        
        weak var delegate: SaveNameProtocol?
        var titleString: String?
        
        var blueCircle: UIView!
        var backButton: UIButton!
        var textField: UITextField!
        var textLabel: UILabel!
        var saveButton: UIButton!
        var eraser: UISwitch!
        
        init(delegate: SaveNameProtocol?, titleString: String?) {
            super.init(nibName: nil, bundle: nil)
            
            self.titleString = titleString
            self.delegate = delegate
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }


        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            
            textLabel = UILabel()
            textLabel.translatesAutoresizingMaskIntoConstraints = false
            textLabel.text = "Arena Name: "
            textLabel.textColor = .black
            textLabel.font = .boldSystemFont(ofSize: 15)
            view.addSubview(textLabel)
            
            textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = titleString
            textField.borderStyle = .roundedRect
            textField.backgroundColor = .white
            textField.textAlignment = .center
            textField.clearsOnBeginEditing = true
            view.addSubview(textField)
            
            backButton = UIButton()
            backButton.setTitle(" < Back", for: .normal)
            backButton.setTitleColor(.blue, for: .normal)
            backButton.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
            backButton.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(backButton)
            
            saveButton = UIButton()
            saveButton.setTitle("Save", for: .normal)
            saveButton.setTitleColor(.blue, for: .normal)
            saveButton.addTarget(self, action: #selector(saveText), for: .touchUpInside)
            saveButton.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(saveButton)
            
                    
            setupConstraints()

            // Do any additional setup after loading the view.
            
        }
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
                blueCircle = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
                blueCircle.layer.cornerRadius = 25
                blueCircle.center = touches.first!.location(in: view)
                blueCircle.backgroundColor = .cyan
                view.addSubview(blueCircle)
        }
        
        
        @objc func dismissViewController() {
            dismiss(animated: true, completion: nil)
        }
        
        @objc func saveText() {
            if let newName = textField.text {
                if newName == "" {
                    let alert = UIAlertController(title: "Alert", message: "You did not enter any arena name. Try again", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
                else {
                    delegate?.saveNameb(newName: newName)
                    dismiss(animated: true, completion: nil)
                }
            }
        }
        
        func setupConstraints() {
            
            NSLayoutConstraint.activate([
                backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
                backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
            ])
            
            NSLayoutConstraint.activate([
                saveButton.topAnchor.constraint(equalTo: backButton.topAnchor),
                saveButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
            ])
            
            NSLayoutConstraint.activate([
                textLabel.topAnchor.constraint(equalTo: backButton.topAnchor, constant: 50),
                textLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50)
            ])
            
            NSLayoutConstraint.activate([
                textField.topAnchor.constraint(equalTo: textLabel.topAnchor),
                textField.leadingAnchor.constraint(equalTo: textLabel.trailingAnchor, constant: 10),
                textField.centerYAnchor.constraint(equalTo: textLabel.centerYAnchor),
                textField.widthAnchor.constraint(equalToConstant: 200),
                textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
            ])
            
        }

    }



}

