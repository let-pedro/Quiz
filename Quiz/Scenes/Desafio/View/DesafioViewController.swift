
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
    var contQuestao: Int = 1
    var pontuacao: Int = 0
    var erros: Int = 0
    var acertos: Int = 0
    var AlternativaSelecionadaIndex: Int = 0
    
    
    
    // MARK: - life cycle e configuração

    override func viewDidLoad() {
        super.viewDidLoad()
        configuraLayout()
    }

    init(viewModel: DesafioViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    func configuraLayout(){
        barraDeProgresso.tintColor = Shadow.corVerde
        Shadow.shadowButton(button: finalizarbutton)
        finalizarbutton.layer.shadowColor = Shadow.corShadowButtonVermelho
        Shadow.shadowButton(button: proximoButton)

        for view in Views {
            view.layer.backgroundColor = Shadow.corBackgroundPreto
        }
        
        for buttonStyle in botoesAlternativas {
            Shadow.shadowButtonAlternativa(button: buttonStyle)
        }
        
        viewModel.viewModelDelegate = self
    }
    
    
    func configuracoesDeRodadas(){
        habilitarAlternativasButton()
        estadoDoBotaoProximo(estado: false)
        barraDeProgresso.progress = progresso
        contQuestaoLabel.text = "\(contQuestao) de 10"
    }
    
    // MARK: - IBActions
    
    @IBAction func botoesDeFluxosButton(_ sender: UIButton) {
        guard contQuestao <= 10 else {
            DadosJogadas()
            viewModel.irParaCelebracao()
            return
        }
        
        if sender.tag == 0 {
            viewModel.pegarQuestao()
            progresso += 0.1
            contQuestao += 1
        } else {
            viewModel.irParaHome()
        }
        
    }
    
    
    @IBAction func AlternativaAction(_ sender: UIButton) {
        desabilitarAlternativas(AlternativaSelecionada: sender.tag)
        AlternativaSelecionadaIndex = sender.tag
        
        guard let questao = Questao else { return }
        verificar(resposta: questao.options[sender.tag], idQuestao: questao.id)
    }
    
    
    
    // MARK: - Métodos
        
    
    func DadosJogadas(){
        viewModel.DadosJogada(pontos: pontuacao, erros: erros, acertos: acertos)
    }
    
    
    func verificar(resposta: String, idQuestao: String){
        viewModel.verificarResposta(altSelecionada: resposta, idQuestao: idQuestao)
    }
    
    func desabilitarAlternativas(AlternativaSelecionada: Int){
        for alternativa in botoesAlternativas {
            if alternativa.tag != AlternativaSelecionada {
                alternativa.isEnabled = false
            }
        }
    }
    
    
    func habilitarAlternativasButton(){
        for alternativa in botoesAlternativas {
            alternativa.isEnabled = true
            alternativa.layer.shadowColor = Shadow.corShadowView
        }
    }
    

    func estadoDoBotaoProximo(estado: Bool){
        guard estado else {
            proximoButton.isEnabled = false
            proximoButton.layer.shadowColor = Shadow.corShadowView
            return
        }
        proximoButton.isEnabled = true
        proximoButton.layer.shadowColor = Shadow.corShadowButtonVerde
    }
}

    // MARK: - Extension

extension DesafioViewController: DesafioViewModelDelegate{
    func Failure(_ error: Error?) {
        Alerta.Alert(Title: "Erro", messageAlert: "Occoreu um erro tenta novamente \(String(describing: error?.localizedDescription))")
    }
    
    func resultadoVerificacaoResposta(Resposta: RespostaRequest) {
        
        switch Resposta.result {
        case true:
            pontuacao += 10
            acertos += 1
            botoesAlternativas[AlternativaSelecionadaIndex].layer.shadowColor = Shadow.corShadowButtonVerde
            estadoDoBotaoProximo(estado: true)
        case false:
            erros += 1
            botoesAlternativas[AlternativaSelecionadaIndex].layer.shadowColor = Shadow.corShadowButtonVermelho
            estadoDoBotaoProximo(estado: true)
        }
    }
    
    
    func apresentarQuestao(questao: Question){
        configuracoesDeRodadas()
        
        Questao = questao
        EnunciadoQuestaoLabel.text = questao.statement
        
        for alternativa in botoesAlternativas {
            alternativa.setAttributedTitle(
                NSAttributedString(string: questao.options[alternativa.tag]),
                for: .normal)
        }
    }
}
