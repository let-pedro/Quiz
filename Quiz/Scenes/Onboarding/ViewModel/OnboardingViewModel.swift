
import Foundation

class  OnboardingViewModel {
    
    
    // MARK: - Variáveis
    
    
    var viewModelDelegate: OnboardingViewModelDelegate?
    var viewNagivationsDelegate: OnboardingViewModelCoordinatorDelegate?
    var service: OnboardingService
    var personagemDefault = "personagem_3"
    weak var eJogador: Jogador? = nil
    
    
    
    // MARK: - init
    
    
    init(service: OnboardingService = .init()) {
        self.service = service
    }
    
    
    
    // MARK: - Métodos
    
    func criarNovoJogador(img imgJogador: String, _ nomeJogador: String){
        let jogador = Jogador(imagePersonagem: imgJogador, nome: nomeJogador)
        eJogadorExistente(nomeJogador)
        
        guard eJogador != nil  else {
            service.criar(jogador) { result in
                guard result != nil else {
                    self.viewNagivationsDelegate?.OnboardingViewModelGoToHome(self, jogador: jogador)
                    return
                }
                self.viewAlertaDelegate?.FailureCriarJogador(result)
            }
            return
        }
        self.viewAlertaDelegate?.FailureExisteJogador()
    }
    
    
    
    func irParaHome(_ nomeJogador: String){
        eJogadorExistente(nomeJogador)
        
        guard let jogador = eJogador else {
            self.viewAlertaDelegate?.FailureNaoExisteJogador()
            return
            
        }
        self.viewNagivationsDelegate?.OnboardingViewModelGoToHome(self, jogador: jogador)
    }
    
    
    func eJogadorExistente(_ nomejogador: String){
        service.ExisteJogador(nomejogador) { Result in
            guard Result == nil else {
                if let jogador = Result {
                    self.eJogador = jogador
                }
                return
            }
        }
    }
    
    
    func selecaoPersonagem(_ tagPersonagem: Int) -> String{
        switch tagPersonagem {
        case 1:
            return "personagem_1"
        case 2:
            return "personagem_2"
            
        case 3:
            return "personagem_3"
            
        case 4:
            return "personagem_4"
        case 5:
            return "personagem_5"
        default:
            return ""
        }
    }
}
