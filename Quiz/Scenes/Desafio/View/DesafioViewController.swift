
import UIKit

class DesafioViewController: UIViewController {
    
    
    // MARK: - Outlet
    
    
    @IBOutlet weak var barraDeProgresso: UIProgressView!
    @IBOutlet weak var contQuestaoLabel: UILabel!
    @IBOutlet weak var EnunciadoQuestaoLabel: UILabel!
    @IBOutlet var Views: [UIView]!
    @IBOutlet var botoesAlternativas: [UIButton]!
    @IBOutlet weak var finalizarbutton: UIButton!
    @IBOutlet weak var proximoButton: UIButton!
    
    
    // MARK: - Variáveis
    
    
    var viewModel: DesafioViewModel!
    var Questao: Question?
    var progresso: Float = 0.1
    
    
    
    // MARK: - life cycle e configuração

    override func viewDidLoad() {
        super.viewDidLoad()
        configuraLayout()
        viewModel.viewDelegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("viewDidAppear")
        print("aqui --- \(Questao)")
        //escolherQuestao()
        //apresentarrQuestao()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("viewWillAppear")
    }
    
    init(viewModel: DesafioViewModel, jogador: Jogador) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        print("Init")
        //self.viewModel.pegarQuestao()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    func configuraLayout(){
        barraDeProgresso.tintColor = Shadow.corVerde
        Shadow.shadowButton(button: finalizarbutton)
        Shadow.shadowButton(button: proximoButton)

        for view in Views {
            view.layer.backgroundColor = Shadow.corBackgroundPreto
        }
        
        for buttonStyle in botoesAlternativas {
            Shadow.shadowButtonAlternativa(button: buttonStyle)
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func botoesDeFluxosButton(_ sender: UIButton) {
        
        guard progresso <= 1 else {
            print("ACABOU")
            return
        }
        
        if sender.tag == 1 {
            viewModel.pegarQuestao()
            progresso += 0.1
        } else {
            viewModel.pegarQuestao()
            progresso += 0.1
        }
        
    }
    
    
    @IBAction func AlternativaAction(_ sender: UIButton) {
        
       
        
        switch sender.tag {
        case 1:
            desabilitarAlternativas(AlternativaSelecionada: sender.tag)
        case 2:
           desabilitarAlternativas(AlternativaSelecionada: sender.tag)
        case 3:
            desabilitarAlternativas(AlternativaSelecionada: sender.tag)
        case 4:
            desabilitarAlternativas(AlternativaSelecionada: sender.tag)
            
        default:
            return
        }
    }
    
    
    
    // MARK: - Métodos
    
    
    func desabilitarAlternativas(AlternativaSelecionada: Int){
        for alternativa in botoesAlternativas {
            if alternativa.tag != AlternativaSelecionada {
                alternativa.isEnabled = false
            }else {
                alternativa.layer.shadowColor = UIColor(red: 0.00, green: 0.82, blue: 0.57, alpha: 1).cgColor
            }
        }
    }
    
    
    func habilitarAlternativasButton(){
        for alternativa in botoesAlternativas {
            alternativa.isEnabled = true
        }
    }
}

    // MARK: - Extension

extension DesafioViewController: DesafioViewModelAlertasDelegate{
    func questaoViewController(questao: Question){
        
        habilitarAlternativasButton()
        guard questao != nil else { return }

        self.barraDeProgresso.progress = progresso
        self.EnunciadoQuestaoLabel.text = questao.statement
        
        for alternativa in botoesAlternativas {
            alternativa.setAttributedTitle(
                NSAttributedString(string: questao.options[alternativa.tag]),
                for: .normal)
        }
    }
}
