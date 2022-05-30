
import Foundation
import RealmSwift

class HomeViewModel {
    
    
    // MARK: - Variáveis
    
    
    var viewModelDelegate: HomeViewModelDelegate?
    var viewNagivationsDelegate: HomeViewModelCoordinatorDelegate?
    private var service: HomeService
    var jogadorManager: JogadorManager
    
        
    
    // MARK: - init
    
    init(service: HomeService = .init(), id idJogador: ObjectId) {
        self.service = service
        self.jogadorManager = JogadorManager()
        getUsuarioAtual(idJogador)
    }
    
    
    
    // MARK: - Métodos
    
    
    func getUsuarioAtual(_ idJogador: ObjectId ){
        service.getJogador(idJogador) { result in
            switch result {
            case .failure(let error):
                self.viewModelDelegate?.FailurePegarJogador(error)
            case .success(let Jogador):
                self.jogadorManager.jogadorAtual(Jogador)
                self.viewModelDelegate?.SucessPegarJogador(Jogador)
            }
        }
    }

        
    func irParaDesafio(){
        viewNagivationsDelegate?.HomeViewModelGoToDesafio(self)
    }
}

