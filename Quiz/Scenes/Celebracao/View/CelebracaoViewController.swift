
import UIKit

class CelebracaoViewController: UIViewController {
    
    
    // MARK: - Outlet
    
    @IBOutlet weak var ImageCelebracao: UIImageView!
    @IBOutlet weak var FeedbackLabel: UILabel!
    @IBOutlet var BotoesButton: [UIButton]!
    
    
    
    
    // MARK: - Variáveis
    
    var viewModel: CelebracaoViewModel!
    
    
    // MARK: - life cycle e configuração
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configuraLayout()
        //viewModel.viewModelDelegate = self
        resultadoDesafio()
    }
    
    
    init(viewModel: CelebracaoViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    func configuraLayout(){
        for button in BotoesButton {
            Shadow.shadowButton(button: button)
        }
    }
    
    
    func resultadoDesafio(){
        let jogadorAtual = JogadorManager.jogadorAtual
        
        guard let jogador =  jogadorAtual else { return }
        
        if jogador.pontuacao >= 70 {
            ImageCelebracao.image = UIImage(named: "trophy")
            FeedbackLabel.text = " Parabéns você completou todas as pergutas sua pontuação é \(jogador.pontuacao)"
        } else {
            ImageCelebracao.image = UIImage(named: "cancel")
            FeedbackLabel.text = " Ooh pontuação foi \(jogador.pontuacao), você precisa obter no minimo 70 pontos"
        }
    }
    
    
    
    // MARK: - IBActions
   
    
    @IBAction func navigationButton(_ sender: UIButton) {
        viewModel.navigationDeScene(sender.tag)
    }
    
    
    

}


    // MARK: - Extension

//extension CelebracaoViewController: CelebracaoViewModelDelegate {
//    func resultadoDesafio(pontuacao: Int){
//        if pontuacao >= 7 {
//            ImageCelebracao.image = UIImage(named: "trophy")
//            FeedbackLabel.text = " Parabéns você completou todas as pergutas sua pontuação é \(pontuacao)"
//        } else {
//            ImageCelebracao.image = UIImage(named: "cancel")
//            FeedbackLabel.text = " Ooh pontuação foi \(pontuacao), você precisa obter no minimo 70 pontos \(pontuacao)"
//        }
//    }
//}
