//
//  CustomTextField.swift
//  Neobis_iOS_Authorization
//
//  Created by Yo on 1/3/24.
//

import Foundation
import UIKit
import SnapKit

class CustomTextField: UITextField {
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(frame: CGRect) {
          super.init(frame: frame)
          setupView()
      }

      required init?(coder aDecoder: NSCoder) {
          super.init(coder: aDecoder)
          setupView()
      }
    
       private func setupView() {
           layer.cornerRadius = 12
           autocorrectionType = .no
           autocapitalizationType = .none
           clearButtonMode = .whileEditing
           backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 248/255, alpha: 1.0)
           textColor = .black
           
           if let font = UIFont(name: "MPLUS1p-Medium", size: 16) {
               self.font = font
               attributedPlaceholder = NSAttributedString(string: placeholder ?? "" , attributes: [.font: font])
        }
    }
}
