
import UIKit

class AlternativaCollectionViewCell: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = UIColor(red: 0.89, green: 0.21, blue: 0.86, alpha: 1)

        //iniciarButton.layer.shadowOffset = CGSize(width: 8, height: 8)
        
        
        //configuraLayoutCell()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
