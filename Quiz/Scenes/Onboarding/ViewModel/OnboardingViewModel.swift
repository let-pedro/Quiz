
import Foundation

struct  OnboardingViewModel {
    
    
    // MARK: - Variáveis
    
    
    var viewAlertaDelegate: OnboardingViewModelAlertasDelegate?
    var viewNagivationsDelegate: OnboardingViewModelCoordinatorDelegate?
    var service: OnboardingService
    var personagemDefault = "personagem_3"
    
    
    
    // MARK: - init
    
    
    init(service: OnboardingService = .init()) {
        self.service = service
    }
    
    
    
    // MARK: - Métodos
    
    func criarNovoJogador(img imgJogador: String, _ nomeJogador: String){
        let jogador = Jogador(imagePersonagem: imgJogador, nome: nomeJogador)
        
        service.criar(jogador) { result in
            guard result != nil else {
                viewAlertaDelegate?.FailureCriarJogador(result)
                return
            }
            viewNagivationsDelegate?.OnboardingViewModelGoToHome(self, jogador: jogador)
        }
    }
    
    
    
    
    func eJogadorExistente(_ jogador: String) -> Bool{
        return false
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
