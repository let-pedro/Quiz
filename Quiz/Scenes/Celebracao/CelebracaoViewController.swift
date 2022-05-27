
import UIKit

class CelebracaoViewController: UIViewController {
    
    
    // MARK: - Outlet
    
    @IBOutlet weak var ImageCelebracao: UIImageView!
    @IBOutlet weak var FeedbackLabel: UIButton!
    @IBOutlet weak var VoltarHomeButton: UIButton!
    
    // MARK: - Variáveis
    
    
    
    
    
    // MARK: - life cycle e configuração
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func configuraLayout(){
        Shadow.shadowButton(button: VoltarHomeButton)
        VoltarHomeButton.layer.shadowColor = Shadow.corVerde.cgColor
    }
    
    
    // MARK: - IBActions
    
    @IBAction func irParaHomeButton(_ sender: UIButton) {
        
        
    }
    
    
    
    // MARK: - Métodos


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


    // MARK: - Extension
