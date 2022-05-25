
import UIKit

class OnboardingViewController: UIViewController {
    
    
    // MARK: - Outlet
    
    @IBOutlet weak var personagemView: UIView!
    @IBOutlet weak var DadoJogadorView: UIView!
    @IBOutlet weak var entrarButton: UIButton!
    @IBOutlet weak var personagemImage: UIImageView?
    @IBOutlet weak var nomeJogadoTextField: UITextField?
    
    
    // MARK: - Variáveis
    
    var viewModel: OnboardingViewModel! // modificar Depois 
    var imgPersonagemSelecionado: String?
    
    
    // MARK: - life cycle e configuração
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configuraLayoutView()
    }
    
    
    init(viewModel: OnboardingViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        self.imgPersonagemSelecionado = viewModel.personagemDefault
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    

    func configuraLayoutView(){
        Shadow.shadowView(view: personagemView)
        Shadow.shadowView(view: DadoJogadorView)
        Shadow.shadowButton(button: entrarButton)
        
        viewModel.viewAlertaDelegate = self
    }
    
    
    
    // MARK: - IBActions
    

    @IBAction func SelecaoPersonagemButton(_ sender: UIButton) {
        let imagePersonagem = viewModel.selecaoPersonagem(sender.tag)
        personagemImage?.image = UIImage(named: imagePersonagem)
        imgPersonagemSelecionado = imagePersonagem
    }
    
    
    @IBAction func EntrarButton(_ sender: UIButton) {
        guard nomeJogadoTextField?.text != "", let nomeJogador = nomeJogadoTextField?.text else {
            self.present(Alerta.Alert(Title: "Preencher campo", messageAlert: "O campo nome precisa está preenchido"), animated: true)
            return
        }

        guard viewModel.eJogadorExistente(nomeJogador) else {
            criarJogador(nomeJogador)
            return
        }
    }
    
    
    
    // MARK: - Métodos
    func criarJogador(_ nomeJogador: String){
        guard let personagemImage = imgPersonagemSelecionado else { return }
        viewModel.criarNovoJogador(img: personagemImage, nomeJogador)
    }
    
    
    
}

extension OnboardingViewController: OnboardingViewModelAlertasDelegate {
    func FailureCriarJogador(_ error: Error?) {
        self.present(Alerta.Alert(Title: "Error", messageAlert: "Ocorreu um problema ao cria novo jogador \(String(describing: error?.localizedDescription))"), animated: true)
    }
    
    func FailureExisteJogador(_ error: Error){
        self.present(Alerta.Alert(Title: "Error", messageAlert: "O jogador não existe criar um Jogador"), animated: true)
    }
}
