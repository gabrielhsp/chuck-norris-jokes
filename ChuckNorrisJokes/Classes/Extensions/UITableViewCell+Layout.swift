//
//  UITableViewCell+Layout.swift
//  ChuckNorrisJokes
//
//  Created by Gabriel Henrique on 27/08/19.
//  Copyright © 2019 Gabriel Henrique. All rights reserved.
//

import UIKit

extension UITableViewCell {
    func setupLayout(borderWidth: CGFloat, borderColor: CGColor, usingIndicator indicator: AccessoryType) {
        accessoryType = indicator
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor
        selectionStyle = .none
    }
}
