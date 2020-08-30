//
//  RedViewController.swift
//  xh244_P3
//
//  Created by 胡雪枫 on 2020/6/1.
//  Copyright © 2020 胡雪枫. All rights reserved.
//

import UIKit

class RedViewController: UIViewController {
    
    weak var delegate: SaveNameProtocol?
    var titleString: String?
    
    var redSquare: UIView!
    var textField: UITextField!
    var textLabel: UILabel!
    
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
        
        setupConstraints()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        redSquare = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        redSquare.center = touches.first!.location(in: view)
        redSquare.backgroundColor = .magenta
        view.addSubview(redSquare)
        
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
