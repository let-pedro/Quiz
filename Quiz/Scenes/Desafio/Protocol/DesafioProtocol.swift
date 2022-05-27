

import Foundation


//protocol DesafioViewModelCoordinatorDelegate: AnyObject {
//    func HomeViewModelGoToCelebracao(_ viewModel:  DesafioViewModel)
//}


protocol DesafioViewModelAlertasDelegate {
    //func FailureBuscarDesafio(_ error: Error?)
    func questaoViewController(questao: Question)
    //var RespostaDesafio: Bool { get }
    //var errorRespostaDesafio: Bool { get }
}
