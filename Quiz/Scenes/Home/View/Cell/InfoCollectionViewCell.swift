
import UIKit

class InfoCollectionViewCell: UICollectionViewCell {
        
    
    // MARK: - Elementos do Layout

    private lazy var DaodJogadasLabel: UILabel = {
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
    
    // MARK: - init e configuração
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configuraCellData(cell cellPosicao: Int, jogador: Jogador){
        switch cellPosicao {
        case 0:
            //contentView.layer.backgroundColor = CustomCellCollectionView.corCellRosa
            personagemImage.image = UIImage(named: "trophy")
            tituloCardLabel.text = "Pontuação"
            DaodJogadasLabel.text = String(jogador.pontuacao)
        case 1:
            //contentView.layer.backgroundColor = CustomCellCollectionView.corCellRoxo
            personagemImage.image = UIImage(named: "sucesso")
            tituloCardLabel.text = "Acertos"
            DaodJogadasLabel.text = String(jogador.num_acerto)
        case 2:
            //contentView.layer.backgroundColor = CustomCellCollectionView.corCellVerde
            personagemImage.image = UIImage(named: "erro_2")
            tituloCardLabel.text = "Error"
            DaodJogadasLabel.text = String(jogador.num_error)
        case 3:
            //contentView.layer.backgroundColor = CustomCellCollectionView.corCellPreto
            personagemImage.image = UIImage(named: "Error")
            tituloCardLabel.text = "......."
            DaodJogadasLabel.text = String(jogador.pontuacao)
        default:
            return
        }
    }
}

    // MARK: - extension ViewCode

extension InfoCollectionViewCell: ViewCode {
    
    func builHierarchy() {
        addSubview(DaodJogadasLabel)
        addSubview(personagemImage)
        addSubview(tituloCardLabel)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            DaodJogadasLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            DaodJogadasLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            personagemImage.heightAnchor.constraint(equalToConstant: 24),
            personagemImage.widthAnchor.constraint(equalToConstant: 24),
            personagemImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            //personagemImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            tituloCardLabel.leadingAnchor.constraint(equalTo: personagemImage.leadingAnchor,constant: 35 ),
            tituloCardLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20 ),
            //tituloCardLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
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

