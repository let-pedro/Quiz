//
//  HomeViewController.swift
//  Quiz
//
//  Created by Development IOS on 23/05/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var ContainerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var nomeJogadoLabel: UILabel!
    @IBOutlet weak var personagemImage: UIImageView!
    @IBOutlet weak var InfoCollectionView: UICollectionView!
    @IBOutlet weak var iniciarButton: UIButton!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configuraElementosLayout()
        configuraCollectionView()
    }


    
    func configuraElementosLayout(){
        
        // Header
        
        ContainerView.layer.backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1).cgColor
        
        headerView.layer.cornerRadius = 20
        headerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        headerView.layer.backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1).cgColor
        headerView.layer.shadowColor = UIColor(red: 0.02, green: 0.02, blue: 0.02, alpha: 1).cgColor
        //headerView.layer.shadowOffset = CGSize(width: 8, height: 8)
        headerView.layer.shadowRadius = 20
        headerView.layer.shadowOpacity = 1
        
        
        InfoCollectionView.layer.backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1).cgColor
        
        
        iniciarButton.layer.cornerRadius = 20
        iniciarButton.layer.backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1).cgColor
        iniciarButton.layer.shadowColor = UIColor(red: 0.00, green: 0.82, blue: 0.57, alpha: 1).cgColor
        //iniciarButton.layer.shadowOffset = CGSize(width: 8, height: 8)
        iniciarButton.layer.shadowRadius = 20
        iniciarButton.layer.shadowOpacity = 1
        
    }
    
    
    
    
    
    
    
    
    
    func configuraCollectionView(){
        collectionView.register(
            InfoCollectionViewCell.self,
            forCellWithReuseIdentifier: "InfoCollectionViewCell"
        )
    }

}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfoCollectionViewCell", for: indexPath) as? InfoCollectionViewCell
        print(indexPath.row)
        cell?.configuraLayoutCell(indexPath.row)
        return cell ?? UICollectionViewCell()
    }
}
