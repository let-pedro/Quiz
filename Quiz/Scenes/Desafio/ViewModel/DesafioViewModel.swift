
import Foundation



class DesafioViewModel {
    
    
    // MARK: - Variáveis
    
    var service: DesafioService
    var Jogador: Jogador!
    var viewDelegate: DesafioViewModelAlertasDelegate?
    
    var questaRetuno: Question? = nil
    
    
    
    // MARK: - init
    
    
    init(service: DesafioService = .init()) {
        self.service = service
    }
    
    
    // MARK: - Métodos
    
    func pegarQuestao() {
        service.getQuestao(){ result  in
            switch result {
            case .failure(let error):
                print("Hello \(error.localizedDescription)")
            case .success(let questao):
                print("fora ---\(questao)")
                //self.questaRetuno = questao
                self.viewDelegate?.questaoViewController(questao: questao)
            }
        }
    }
    
//    func questaoCorretar(){}
//
//    func questaoErrada(){}
//
//    func pontuacao(){}
}
