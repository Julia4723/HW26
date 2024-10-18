//
//  UIVIew.swift
//  HW26
//
//  Created by user on 18.10.2024.
//

import UIKit

extension UIView {
    func printName(_ views: UIView...) {
        for view in views {
            if let customView = view as? CustomView {
                print(customView.nameView ?? "Unowned")
            }
        }
    }
}
