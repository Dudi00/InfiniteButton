//
//  InfiniteButtonDelegate.swift
//  Button
//
//  Created by Błażej Wdowikowski on 07/06/2016.
//  Copyright © 2016 blazej. All rights reserved.
//

import UIKit

protocol InfiniteButtonDelegate:class {
    func button(button:InfiniteButton, willChangeAction action:InfiniteButtonAction)
    func button(button:InfiniteButton, didChangeAction action:InfiniteButtonAction)
}
