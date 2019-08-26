//
//  UIViewController+Layout.swift
//  ChuckNorrisJokes
//
//  Created by Gabriel Henrique on 26/08/19.
//  Copyright © 2019 Gabriel Henrique. All rights reserved.
//

import UIKit

extension UIViewController {
    func setNavigationBarLayout(withTitle title: String) {
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = Constants.Colors.yellow
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = title
    }
}
