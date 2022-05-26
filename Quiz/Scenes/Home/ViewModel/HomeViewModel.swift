
import Foundation
import RealmSwift

class HomeViewModel {
    
    
    // MARK: - Variáveis
    
    
    var viewAlertaDelegate: HomeViewModelAlertasDelegate?
    var viewNagivationsDelegate: HomeViewModelCoordinatorDelegate?
    var service: HomeService
    var JogadorAtual: Jogador?
    
    
    
    // MARK: - init
    
    init(service: HomeService = .init(), idJogador: ObjectId) {
        self.service = service
        getUsuarioAtual(idJogador)
    }
    
    
    
    // MARK: - Métodos
    
    
    private func getUsuarioAtual(_ idJogador: ObjectId ){
        service.getJogador(idJogador) { result in
            switch result {
            case .failure(let error):
                self.viewAlertaDelegate?.FailurePegarJogador(error)
            case .success(let Jogador):
                self.JogadorAtual = Jogador
            }
        }
    }
    
    
    func IrParaDesafio(Jogador: Jogador){
        viewNagivationsDelegate?.HomeViewModelGoToDesafio(self, jogador: Jogador)
    }
}
