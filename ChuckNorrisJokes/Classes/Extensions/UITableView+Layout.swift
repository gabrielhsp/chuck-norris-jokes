//
//  UITableView+Layout.swift
//  ChuckNorrisJokes
//
//  Created by Gabriel Henrique on 23/08/19.
//  Copyright © 2019 Gabriel Henrique. All rights reserved.
//

import UIKit

extension UITableView {
    func removeSpacing() {
        layoutMargins = .zero
        separatorInset = .zero
    }
}
