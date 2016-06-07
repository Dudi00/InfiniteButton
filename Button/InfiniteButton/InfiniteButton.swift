//
//  InfiniteButton.swift
//  Button
//
//  Created by Błażej Wdowikowski on 06/06/2016.
//  Copyright © 2016 blazej. All rights reserved.
//

import UIKit

class InfiniteButton: UIView {
    
    var actions:[InfiniteButtonAction]? {
        didSet{
            currentActionIndex = 0
            if actions?.count > 0 {
                self.prepareButtonForActionAtIndex(currentActionIndex)
            }
        }
    }
    private var currentActionIndex = 0
    private var animationDuration = 0.2
    weak var delegate:InfiniteButtonDelegate?
    @IBOutlet weak private var contentView:UIView!
    @IBOutlet weak private var titleLabel:UILabel! {
        didSet{
            self.layoutIfNeeded()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Private Methods
    
    /**
     initial setup
     */
    private func setup(){
        NSBundle.mainBundle().loadNibNamed("InfiniteButton", owner: self, options: nil)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.FlexibleHeight,.FlexibleWidth]
        contentView.backgroundColor = UIColor.clearColor()
        self.addSubview(contentView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        self.addGestureRecognizer(tap)
    }
    
    @objc
    private func handleTap(sender:AnyObject?){
        guard actions?.count > 0 else {
            return
        }
        
        if let currentAction = actions?[currentActionIndex] {
            delegate?.button(self, willChangeAction: currentAction)
            
            currentAction.action()
            let nextAction = self.nextAction()
            titleLabel.text = nextAction.title
            self.backgroundColor = nextAction.backgroundColor
            
            delegate?.button(self, didChangeAction: currentAction)
        }
    }
    
    /**
     Prepare button for action at index
     
     - parameter i: index of action
     */
    private func prepareButtonForActionAtIndex(i:Int) {
        if let currentAction = actions?[i] {
            titleLabel.text = currentAction.title
            self.backgroundColor = currentAction.backgroundColor
        }
    }
    
    /**
     Increment index of action and if index is greater than the number of avalible actions, then it is seted to 0
     */
    
    private func incrementActionIndex(){
        guard currentActionIndex + 1 < actions?.count else {
            currentActionIndex = 0
            return
        }
        
        currentActionIndex += 1
    }
    
    /**
     method take next avalible action
     
     - returns: action
     */
    private func nextAction() -> InfiniteButtonAction {
        incrementActionIndex()
        return actions![currentActionIndex]
    }
}
