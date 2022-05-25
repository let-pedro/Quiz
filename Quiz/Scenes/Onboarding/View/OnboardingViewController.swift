//
//  OnboardingViewController.swift
//  Quiz
//
//  Created by Development IOS on 24/05/22.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    
    @IBOutlet weak var personagemView: UIView!
    @IBOutlet weak var DadoJogadorView: UIView!
    
    @IBOutlet weak var entrarButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configuraLayoutView()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    
    func configuraLayoutView(){
        
        personagemView.layer.cornerRadius = 20
        personagemView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        personagemView.layer.backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1).cgColor
        personagemView.layer.shadowColor = UIColor(red: 0.02, green: 0.02, blue: 0.02, alpha: 1).cgColor
        //headerView.layer.shadowOffset = CGSize(width: 8, height: 8)
        personagemView.layer.shadowRadius = 20
        personagemView.layer.shadowOpacity = 1
        
        
        
        DadoJogadorView.layer.cornerRadius = 20
        DadoJogadorView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        DadoJogadorView.layer.backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1).cgColor
        DadoJogadorView.layer.shadowColor = UIColor(red: 0.02, green: 0.02, blue: 0.02, alpha: 1).cgColor
        //headerView.layer.shadowOffset = CGSize(width: 8, height: 8)
        DadoJogadorView.layer.shadowRadius = 20
        DadoJogadorView.layer.shadowOpacity = 1
     
        
        entrarButton.layer.cornerRadius = 20
        entrarButton.layer.backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1).cgColor
        entrarButton.layer.shadowColor = UIColor(red: 0.00, green: 0.82, blue: 0.57, alpha: 1).cgColor
        //iniciarButton.layer.shadowOffset = CGSize(width: 8, height: 8)
        entrarButton.layer.shadowRadius = 20
        entrarButton.layer.shadowOpacity = 1
        
        
        
  
    }
}
