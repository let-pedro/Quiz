//
//  DesafioViewController.swift
//  Quiz
//
//  Created by Development IOS on 23/05/22.
//

import UIKit

class DesafioViewController: UIViewController {
    
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var barraDeProgresso: UIProgressView!
    @IBOutlet weak var contQuestaoLabel: UILabel!
    @IBOutlet weak var EnunciadoQuestaoLabel: UILabel!
    @IBOutlet weak var AlternativasCollectionView: UICollectionView!
    
    
    @IBOutlet weak var finalizarbutton: UIButton!
    @IBOutlet weak var proximoButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configuraLayout()
    }
    
    
    
    
    func configuraLayout(){
        containerView.layer.backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1).cgColor
        barraDeProgresso.tintColor = UIColor(red: 0.00, green: 0.82, blue: 0.57, alpha: 1)
        
        AlternativasCollectionView.layer.backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1).cgColor
        
        finalizarbutton.layer.cornerRadius = 20
        finalizarbutton.layer.backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1).cgColor
        finalizarbutton.layer.shadowColor = UIColor(red: 1.00, green: 0.00, blue: 0.00, alpha: 1).cgColor
        finalizarbutton.layer.shadowRadius = 20
        finalizarbutton.layer.shadowOpacity = 1
        
        proximoButton.layer.cornerRadius = 20
        proximoButton.layer.backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1).cgColor
        proximoButton.layer.shadowColor = UIColor(red: 0.00, green: 0.82, blue: 0.57, alpha: 1).cgColor
        proximoButton.layer.shadowRadius = 20
        proximoButton.layer.shadowOpacity = 1
        
        
        
        AlternativasCollectionView.register(
            AlternativaCollectionViewCell.self,
            forCellWithReuseIdentifier: "AlternativaCollectionViewCell"
        )
        
        
    }


}


extension DesafioViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlternativaCollectionViewCell", for: indexPath) as? AlternativaCollectionViewCell
        return cell ?? UICollectionViewCell()
    }  
}
