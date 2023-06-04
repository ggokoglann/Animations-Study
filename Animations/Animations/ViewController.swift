//
//  ViewController.swift
//  Animations
//
//  Created by Gökhan Gökoğlan on 3.06.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var shrink: UIButton!
    @IBOutlet var colorChange: UIButton!
    @IBOutlet var shrinkSpring: UIButton!
    @IBOutlet var randomColors: UIButton!
    @IBOutlet var colorChangeLabel: UILabel!
    @IBOutlet var shrinkLabel: UILabel!
    @IBOutlet var shrinkSpringLabel: UILabel!
    @IBOutlet var randomColorsLabel: UILabel!
    
    let colors: [UIImage] = [
        UIImage(named: "randomColor1.png")!, 
        UIImage(named: "randomColor2.png")!,
        UIImage(named: "randomColor3.png")!,
        UIImage(named: "randomColor4.png")!,
        UIImage(named: "randomColor5.png")!,
        UIImage(named: "randomColor6.png")!
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorChangeLabel.text = "Tint color changes when button pressed."
        colorChangeLabel.font = UIFont(name: "HelveticaNeue-Light", size: 18)
        colorChangeLabel.numberOfLines = 0
        colorChangeLabel.sizeToFit()
        
        shrinkLabel.text = "Button shrinks in size then comes back to its original size when pressed"
        shrinkLabel.font = UIFont(name: "HelveticaNeue-Light", size: 18)
        shrinkLabel.numberOfLines = 0
        shrinkLabel.sizeToFit()
        
        shrinkSpringLabel.text = "Button shrinks in size then comes back to its original size using spring damping effect."
        shrinkSpringLabel.font = UIFont(name: "HelveticaNeue-Light", size: 18)
        shrinkSpringLabel.numberOfLines = 0
        shrinkSpringLabel.sizeToFit()
        
        randomColorsLabel.text = "Tint color changes to random colors each press."
        randomColorsLabel.font = UIFont(name: "HelveticaNeue-Light", size: 18)
        randomColorsLabel.numberOfLines = 0
        randomColorsLabel.sizeToFit()
                     
    }
   
        // Color Change
    @IBAction func colorChange(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            sender.setImage(UIImage(named: "colorChange2.png"), for: .normal)
        }
    }

        // Random Color
    @IBAction func randomColors(_ sender: UIButton) {
        if let randomColor = colors.randomElement() {
            // Set the color to a random color.
            UIView.animate(withDuration: 0.3) {
                sender.setImage(randomColor, for: .normal)
            }
        }
    }

        // Shrink Spring
    @IBAction func shrinkSpring(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
                // Shrink the button
                self.shrinkSpring.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }, completion: { (_) in
                UIView.animate(withDuration: 0.5) {
                    // Restore the button to its original size
                    self.shrinkSpring.transform = .identity
                }
            })
        }
    
        // Shrink
    @IBAction func animate(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2, animations: {
            // Shrink the button
            self.shrink.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }) { (_) in
            UIView.animate(withDuration: 0.2) {
                // Restore the button to its original size
                self.shrink.transform = .identity
            }
        }
    }
}
