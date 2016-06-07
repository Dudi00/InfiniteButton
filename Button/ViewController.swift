//
//  ViewController.swift
//  Button
//
//  Created by Błażej Wdowikowski on 06/06/2016.
//  Copyright © 2016 blazej. All rights reserved.
//

import UIKit

class ViewController: UIViewController,InfiniteButtonDelegate {

    
    let colors:[UIColor] = [
        UIColor(red:0.47, green:0.79, blue:0.90, alpha:1.00),
        UIColor(red:0.00, green:0.43, blue:0.94, alpha:1.00),
        UIColor(red:0.94, green:0.94, blue:0.96, alpha:1.00),
        UIColor(red:0.78, green:0.78, blue:0.81, alpha:1.00),
        UIColor(red:0.38, green:0.25, blue:0.40, alpha:1.00),
        UIColor(red:0.81, green:0.14, blue:0.17, alpha:1.00),
        UIColor(red:0.96, green:0.52, blue:0.14, alpha:1.00),
        UIColor(red:0.16, green:0.67, blue:0.44, alpha:1.00)
    ]
    let labels:[String] = [
        "Robert Downey",
        "Sherlock Holmes",
        "Alexander Armstrong",
        "Ben Syder",
        "David Mitchell",
        "Nicholas Briggs",
        "Roger Llewellyn",
        "Paul Singleton"
    ]
    
    @IBOutlet weak var button3: InfiniteButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupButtons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Private methods
    
    private func setupButtons() {
        let button = InfiniteButton(frame: CGRectMake(0,0,200,55))
        button.center = CGPointMake(self.view.frame.size.width/2,64)
        button.delegate = self
        button.actions = [InfiniteButtonAction]()
        for i in 0..<3 {
            let color = colors[i]
            let label = labels[i]
            let action = InfiniteButtonAction(title: label, backgroundColor: color, action: {
                print("You, my friend, just presed \(label)'s button!")
            })
            button.actions?.append(action)
        }
        self.view.addSubview(button)
        
        button3.delegate = self
        button3.actions = [InfiniteButtonAction]()
        for i in 4..<8 {
            let color = colors[i]
            let label = labels[i]
            let action = InfiniteButtonAction(title: label, backgroundColor: color, action: {
                print("You, my friend, just presed \(label)'s button!")
            })
            button3.actions?.append(action)
        }
        
    }
    
    // MARK: InfiniteButton Delegate
    
    func button(button: InfiniteButton, willChangeAction action: InfiniteButtonAction) {
        print("button \(action.title) will change")
    }
    
    func button(button: InfiniteButton, didChangeAction action: InfiniteButtonAction) {
        print("button \(action.title) did change")
    
    }

}

