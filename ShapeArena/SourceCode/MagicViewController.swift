//
//  MagicViewController.swift
//  xh244_P3
//
//  Created by 胡雪枫 on 2020/6/2.
//  Copyright © 2020 胡雪枫. All rights reserved.
//

import UIKit

class MagicViewController: UIViewController {
    
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
    
//func generateRandomColor() -> UIColor {
//    let redValue = CGFloat.random(in: 0...1)
//    let greenValue = CGFloat.random(in: 0...1)
//    let blueValue = CGFloat.random(in: 0...1)
//
//    let randomColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
//
//    return randomColor
//}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

