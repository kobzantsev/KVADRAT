//
//  ViewController.swift
//  KVADRAT
//
//  Created by maxxx on 02.02.2020.
//  Copyright © 2020 maxxx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        drawCircleOrCube(NumOfCircles: 7)
    }

    func drawCircleOrCube(NumOfCircles:Int) {
        var NextCoordY = Int(screenHeight)/2
        var NextCoord = 0
        var NextSize = Int(screenWidth)
        for _ in 1...NumOfCircles {
        let cube = UIView()
        // Comment next string for Square
        cube.layer.cornerRadius = CGFloat(Int(NextSize) / 2)
        let prirost = Int(screenWidth)/NumOfCircles
        cube.frame = CGRect(x: NextCoord/2, y: NextCoordY/2, width: NextSize, height: NextSize)
        cube.backgroundColor = generateRandomColor()
        cube.layer.borderWidth = 1
        cube.layer.borderColor = UIColor.black.cgColor
        view.addSubview(cube)
        NextCoord = NextCoord + prirost
        NextCoordY = NextCoordY + prirost
        NextSize = NextSize - prirost
        }
     }
    
    func generateRandomColor() -> UIColor {
    let hue : CGFloat = CGFloat(arc4random() % 256) / 256 // use 256 to get full range from 0.0 to 1.0
      let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from white
      let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from black
            
    return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
}

