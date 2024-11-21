//
//  ViewController.swift
//  POS Number Pad Testing
//
//  Created by Gokul Gopalakrishnan on 08/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var labelNumberPad: UILabel!
    var numberTapped: String = ""
    var numberPad = ["1","2","3","4","5","6","7","8","9","0"]
    var additionalButtons = ["Back" , "Done"]
    
    var newNumberPad: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        randomGeneratorWorking()
        collectionView.reloadData()
        
    }


}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberPad.count + additionalButtons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NewCollectionViewCell
        cell.delegate = self
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10

        cell.numberPadAction.setTitle(newNumberPad[indexPath.row], for: .normal)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width-10)/3
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           return 3
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                           minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 3
       }
    
}

extension ViewController {
    func randomGeneratorWorking() {
       
        while(newNumberPad.count != 10) {
            let randomInt = Int.random(in: 0..<10)
            
            if !(newNumberPad.contains(numberPad[randomInt])) {
                newNumberPad.append(numberPad[randomInt])
            }
            
        }
        newNumberPad = newNumberPad + additionalButtons
        print(newNumberPad)
    }
}

extension ViewController: buttonTapping {
    func whichButton(name: String) {
        self.numberTapped = self.numberTapped + name
        labelNumberPad.text = self.numberTapped
    }
    
    
}
