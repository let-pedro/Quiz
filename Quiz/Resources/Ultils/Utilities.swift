
import Foundation
import UIKit

struct Shadow {
    
    
    static let corShadowView = UIColor(red: 0.02, green: 0.02, blue: 0.02, alpha: 1).cgColor
    static let corShadowButtonVerde = UIColor(red: 0.00, green: 0.82, blue: 0.57, alpha: 1).cgColor
    static let corShadowButtonVermelho = UIColor(red: 1.00, green: 0.00, blue: 0.00, alpha: 1).cgColor
    static let corShadowButtonBranco = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1).cgColor
    static let corBackgroundPreto = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1).cgColor
    static let corVerde = UIColor(red: 0.00, green: 0.82, blue: 0.57, alpha: 1)
    
    
    
    static func shadowView(view: UIView){
        view.layer.cornerRadius = 20
        view.layer.backgroundColor = corBackgroundPreto
        view.layer.shadowColor = corShadowView
        view.layer.shadowRadius = 20
        view.layer.shadowOpacity = 1
    }
    
    static func shadowButton(button: UIButton) {
        button.layer.cornerRadius = 20
        button.layer.backgroundColor = corBackgroundPreto
        button.layer.shadowColor = corShadowButtonVerde
        button.layer.shadowRadius = 20
        button.layer.shadowOpacity = 1
    }
    
    
    static func shadowButtonAlternativa(button: UIButton) {
        button.layer.cornerRadius = 10
        button.layer.backgroundColor = corBackgroundPreto
        button.layer.shadowColor = corShadowView
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 1
    }
}


struct Alerta {
    
    static func Alert(Title: String,messageAlert: String) -> UIAlertController{
        let alerta = UIAlertController(title: Title, message: messageAlert, preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alerta
    }
}



struct CustomCellCollectionView {
    static let corCellRosa = UIColor(red: 0.89, green: 0.21, blue: 0.86, alpha: 1).cgColor
    static let corCellRoxo = UIColor(red: 0.57, green: 0.26, blue: 1.00, alpha: 1).cgColor
    static let corCellVerde = UIColor(red: 0.00, green: 0.82, blue: 0.57, alpha: 1).cgColor
    static let corCellPreto = UIColor(red: 0.02, green: 0.02, blue: 0.02, alpha: 1).cgColor
}

