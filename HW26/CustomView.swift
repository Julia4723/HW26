//
//  CustomView.swift
//  HW26
//
//  Created by user on 18.10.2024.
//

import UIKit

protocol ICustomViewDelegate {
    func viewDidTapped(_ view: String)
}

class CustomView: UIView {
    
    var nameView: String?
    
    var delegate: ICustomViewDelegate?
    
    
    init(color: UIColor, name: String) {
        super.init(frame: .zero)
        self.nameView = name
        addView(color)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension CustomView {
    private func addView(_ color: UIColor) {
        backgroundColor = color
    }
}


extension CustomView {
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        
        if view == self {
            if let customView = view as? CustomView {
                let nameView = customView.nameView ?? "Unowned"
                delegate?.viewDidTapped(nameView)
            }
        }
        return view
    }
    
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let pointNew = super.point(inside: point, with: event)
        
        if !pointNew {
            for subview in subviews {
                let pointInSubview = subview.convert(point, from: self)
                if subview.point(inside: pointInSubview, with: event) {
                    return true
                }
            }
        }
        
        return pointNew
    }
}

