
import UIKit


struct cell {
    let titulo: String
    let image: String
    let corCell: CGColor
}

class InfoCollectionViewCell: UICollectionViewCell {
    
    // UIColor(red: 0.89, green: 0.21, blue: 0.86, alpha: 1).cgColor)
    //corCell: UIColor(red: 0.57, green: 0.26, blue: 1.00, alpha: 1).cgColor)
    //UIColor(red: 0.00, green: 0.82, blue: 0.57, alpha: 1).cgColor)
    
    
    //UIColor(red: 0.57, green: 0.26, blue: 1.00, alpha: 1).cgColor
    
    let layoutCell = [cell(titulo: "Pontuação", image: "trophy", corCell: UIColor(red: 0.89, green: 0.21, blue: 0.86, alpha: 1).cgColor),
                      cell(titulo: "Acertos", image: "sucesso", corCell: UIColor(red: 0.57, green: 0.26, blue: 1.00, alpha: 1).cgColor),
                      cell(titulo: "Error", image: "erro_2", corCell: UIColor(red: 0.00, green: 0.82, blue: 0.57, alpha: 1).cgColor),
                      cell(titulo: "Acertos", image: "sucesso", corCell: UIColor(red: 0.02, green: 0.02, blue: 0.02, alpha: 1).cgColor),
    ]
    
    
    // MARK: - Elementos do Layout

    private lazy var nomeJogadorLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.text = "10"
        label.font =  UIFont.boldSystemFont(ofSize: 32)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var tituloCardLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.text = "Pontuação"
        label.font =  UIFont.boldSystemFont(ofSize: 13)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var personagemImage: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.image = UIImage(named: "personagem_5")
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.heightAnchor.constraint(equalToConstant: -10).isActive = true
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = UIColor(red: 0.89, green: 0.21, blue: 0.86, alpha: 1)


        //iniciarButton.layer.shadowOffset = CGSize(width: 8, height: 8)
        
        
        //configuraLayoutCell()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configuraLayoutCell(_ index: Int){
        contentView.layer.backgroundColor = layoutCell[index].corCell
        personagemImage.image = UIImage(named: layoutCell[index].image)
        tituloCardLabel.text = layoutCell[index].titulo
    }
    
    
    
}


extension InfoCollectionViewCell: ViewCode {
    
    func builHierarchy() {
        addSubview(nomeJogadorLabel)
        addSubview(personagemImage)
        addSubview(tituloCardLabel)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            nomeJogadorLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nomeJogadorLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            personagemImage.heightAnchor.constraint(equalToConstant: 24),
            personagemImage.widthAnchor.constraint(equalToConstant: 24),
            personagemImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            personagemImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            tituloCardLabel.leadingAnchor.constraint(equalTo: personagemImage.leadingAnchor,constant: 35 ),
            tituloCardLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20 ),
            tituloCardLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
    
    func applyAdditionalChanges() {
        contentView.layer.cornerRadius = 24
        contentView.layer.shadowColor = UIColor(red: 0.02, green: 0.02, blue: 0.02, alpha: 1).cgColor
        contentView.layer.shadowRadius = 13
        contentView.layer.shadowOffset = CGSize(width: 0, height: 0)
        contentView.layer.shadowOpacity = 1
    }
}