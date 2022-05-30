
import UIKit


class CelebracaoCoordinator {
    
    
    
    var window: UIWindow
    var viewModel: DesafioViewModel?
    var controller: DesafioViewController?
    var jogadorManager: JogadorManager
    
    
    required init(window: UIWindow) {
        self.window = window
        self.jogadorManager = JogadorManager()
    }
    
    
    
    
    func start(){
        
        print("Hello")
    }
    
    
}
