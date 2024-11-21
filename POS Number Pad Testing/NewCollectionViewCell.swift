//
//  NewCollectionViewCell.swift
//  POS Number Pad Testing
//
//  Created by Gokul Gopalakrishnan on 11/11/24.
//

import UIKit

class NewCollectionViewCell: UICollectionViewCell {
    
    var numberTappedValue: String = ""
    var delegate: buttonTapping?

    @IBOutlet weak var numberPadAction: UIButton!
   
    @IBAction func numberPadAction(_ sender: Any) {
        
        if let textValue = numberPadAction.titleLabel?.text {
            delegate?.whichButton(name: textValue)
        }
        
    }
}

protocol buttonTapping {
    func whichButton(name: String)
}
