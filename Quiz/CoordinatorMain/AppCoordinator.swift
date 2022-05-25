
import  UIKit

class AppCoordinator {
    
    
    var window: UIWindow
    var onboardingCoordinator: OnboardingCoordinator?
    
    
    required init(window: UIWindow) {
        self.window = window
        self.window.makeKeyAndVisible()
    }
    
    
    func start(){
       onboardingCoordinator = OnboardingCoordinator(window: window)
        onboardingCoordinator?.start()
    }
}
