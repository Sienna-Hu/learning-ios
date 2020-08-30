//
//  ViewController.swift
//  xh244_P2
//
//  Created by 胡雪枫 on 2020/5/29.
//  Copyright © 2020 胡雪枫. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var groceryLabel: UILabel!
    var quantityLabel: UILabel!
    var groceryInput: UITextField!
    var quantityInput: UITextField!
    var addButtom: UIButton!
    var listLabel: UILabel!
    var list: UITextView!
    var lock: UISwitch!
    var control: UISegmentedControl!
    var groDic: [String : String] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        groceryLabel = UILabel()
        groceryLabel.text = "Grocery Item:"
        groceryLabel.textColor = .black
        groceryLabel.font = .boldSystemFont(ofSize: 20)
        groceryLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(groceryLabel)
        
        quantityLabel = UILabel()
        quantityLabel.text = "Quantity:"
        quantityLabel.textColor = .black
        quantityLabel.font = .boldSystemFont(ofSize: 20)
        quantityLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(quantityLabel)
        
        groceryInput = UITextField()
        groceryInput.placeholder = "Enter Grocery"
        groceryInput.backgroundColor = .gray
        groceryInput.textColor = .white
        groceryInput.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(groceryInput)
        
        quantityInput = UITextField()
        quantityInput.placeholder = "Enter Quantity"
        quantityInput.backgroundColor = .gray
        quantityInput.textColor = .white
        quantityInput.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(quantityInput)
        
        addButtom = UIButton()
        addButtom.setTitle("Add Item", for: .normal)
        addButtom.setTitleColor(.blue, for: .normal)
        addButtom.addTarget(self, action: #selector(addButtomTapped), for: .touchUpInside)
        addButtom.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addButtom)
        
        listLabel = UILabel()
        listLabel.text = "Grocery List"
        listLabel.textColor = .black
        listLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        listLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(listLabel)
        
        list = UITextView()
        list.text = ""
        list.textColor = .black
        list.textAlignment = .center
        list.font = .systemFont(ofSize: 12)
        list.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(list)
        
        lock = UISwitch()
        lock.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lock)
        
        control = UISegmentedControl(items: ["Ascending","Descending"])
        control.addTarget(addButtom, action: #selector(changeSequence), for: .touchUpInside)
        control.addTarget(self, action: #selector(changeSequence), for: .valueChanged)
        control.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(control)
        
        setupConstraints()
    }


@objc func changeSequence() {
    list.text = ""
    if control.selectedSegmentIndex == 0 {
        let sortedGro = groDic.sorted(by: {$0.0 < $1.0})
        for (item, quantity) in sortedGro {
            list.text += "Item: " + item + ", Quantity: " + quantity + "\n"
        }
    }
    else{
        let sortedGro = groDic.sorted(by: {$0.0 > $1.0})
        for (item, quantity) in sortedGro {
            list.text += "Item: " + item + ", Quantity: " + quantity + "\n"
        }
    }
}
    
    
@objc func addButtomTapped(){
    if let item = groceryInput.text, let quantity = quantityInput.text {
        if lock.isOn == true || item == "" || list.text.contains(item) || quantity == ""{
            groceryInput.text = ""
            quantityInput.text = ""
        }
        else {
            groDic[item] = quantity
            list.text += "Item: " + item + ", Quantity: " + quantity + "\n"
            groceryInput.text = ""
            quantityInput.text = ""
        }
    }
}
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            groceryLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            groceryLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            quantityLabel.topAnchor.constraint(equalTo: groceryLabel.bottomAnchor, constant: 20),
            quantityLabel.trailingAnchor.constraint(equalTo: groceryLabel.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            groceryInput.topAnchor.constraint(equalTo: groceryLabel.topAnchor),
            groceryInput.leadingAnchor.constraint(equalTo: groceryLabel.trailingAnchor, constant: 5),
            groceryInput.centerYAnchor.constraint(equalTo: groceryLabel.centerYAnchor),
            groceryInput.widthAnchor.constraint(equalToConstant: 150),
            groceryInput.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            quantityInput.topAnchor.constraint(equalTo: quantityLabel.topAnchor),
            quantityInput.leadingAnchor.constraint(equalTo: groceryInput.leadingAnchor),
            quantityInput.centerYAnchor.constraint(equalTo: quantityLabel.centerYAnchor),
            quantityInput.widthAnchor.constraint(equalToConstant: 150),
            quantityInput.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            lock.topAnchor.constraint(equalTo: quantityInput.bottomAnchor, constant: 30),
            lock.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            addButtom.topAnchor.constraint(equalTo: lock.bottomAnchor, constant: 20),
            addButtom.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            listLabel.topAnchor.constraint(equalTo: addButtom.bottomAnchor, constant: 50),
            listLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            control.topAnchor.constraint(equalTo: listLabel.bottomAnchor, constant: 5),
            control.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            list.topAnchor.constraint(equalTo: control.bottomAnchor, constant: 5),
            list.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            list.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            list.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            list.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5)
        ])
        
    }

}

