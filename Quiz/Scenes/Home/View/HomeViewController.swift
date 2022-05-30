
import UIKit

class HomeViewController: UIViewController {
    
    
    
    // MARK: - Outlet
    
    @IBOutlet weak var ContainerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var nomeJogadoLabel: UILabel!
    @IBOutlet weak var personagemImage: UIImageView!
    @IBOutlet weak var InfoCollectionView: UICollectionView!
    @IBOutlet weak var iniciarButton: UIButton!
    
    // MARK: - Variáveis
    
    var viewModel: HomeViewModel!
    var jogadorAtual: Jogador!

    
    
    // MARK: - life cycle e configuração
    
    
    init(viewModel: HomeViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configuraElementosLayout()
        configuraCollectionView()
    }


    
    func configuraElementosLayout(){
        ContainerView.layer.backgroundColor = Shadow.corBackgroundPreto
        InfoCollectionView.layer.backgroundColor = Shadow.corBackgroundPreto
        
        Shadow.shadowView(view: headerView)
        headerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        Shadow.shadowButton(button: iniciarButton)
        
        viewModel.viewModelDelegate = self
    }
    
    func configuraCollectionView(){
        collectionView.register(
            InfoCollectionViewCell.self,
            forCellWithReuseIdentifier: "InfoCollectionViewCell"
        )
    }
    
    
    
    
    // MARK: - IBActions
    
    
    @IBAction func IniciarQuizButton(_ sender: Any) {
        viewModel.irParaDesafio()
    }
    
    
    
    
    // MARK: - Métodos
    
    


}


    // MARK: - extension

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfoCollectionViewCell", for: indexPath) as? InfoCollectionViewCell else { fatalError("error to create ViagemTableViewCell") }

        //cell.configuraCellData(cell: indexPath.row,jogador: jogadorAtual)
        return cell
    }
}


extension HomeViewController: HomeViewModelDelegate {
    func SucessPegarJogador(_ jogador: Jogador) {
        jogadorAtual = jogador
        
        print("Dentro View normal --\(jogador)")
        print("Dentro View --\(jogadorAtual)")

        nomeJogadoLabel.text = "olá \(jogador.nome)"
        personagemImage.image = UIImage(named: jogador.imagePersonagem)
    }
    
    func FailurePegarJogador(_ error: Error?) {
        self.present(Alerta.Alert(Title: "Error", messageAlert: "Ocorreu um Erro ao procura um Jogador"), animated: true)
    }
}
