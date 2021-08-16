//
//  TipsyButtons.swift
//  PoundsConverter
//
//  Created by Bryan Gomez on 8/16/21.
//

import UIKit

class TipsyButtons: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {
        self.addCornerRadius(radius: self.frame.height / 2)
        self.layer.masksToBounds = true
        self.backgroundColor = .purple
        self.setTitleColor(.white, for: .normal)
    }
}
