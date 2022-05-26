

import Foundation


//protocol DesafioViewModelCoordinatorDelegate: AnyObject {
//    func HomeViewModelGoToCelebracao(_ viewModel:  DesafioViewModel)
//}


protocol DesafioViewModelAlertasDelegate {
    func FailureBuscarDesafio(_ error: Error?)
    var RespostaDesafio: Bool { get }
    var errorRespostaDesafio: Bool { get }
}
