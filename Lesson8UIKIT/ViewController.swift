//
//  ViewController.swift
//  Lesson8UIKIT
//
//  Created by Авазбек Надырбек уулу on 22.05.25.
//

import UIKit



class ViewController: UIViewController {
    // 1. First we are creating a DataModel and inserting in View
    private let dataModel = CardModel.mocData
    
    private let colors: [UIColor] = [.red, .blue, .green, .yellow, .red, .blue, .green, .yellow]
    
    // 3. Creating a CollectionViewCell / настройки коллекции
    private lazy var layout: UICollectionViewFlowLayout = {
        $0.scrollDirection = .vertical
        $0.itemSize = CGSize(width: view.frame.width / 2 - 20, height: 170) // giving size of cell
        // если горизонтал minimumLineSpacing это по горизонтали отступ
        // если scrolldirection = .vertical то minimumLineSpacing  - это по вертикали
        $0.minimumLineSpacing = 15
        // если горизонтал minimumInteritemSpacing это по вертикали отступ
        // если minimumInteritemSpacing = .horizontal то minimumInteritemSpacing  - это по вертикали
        $0.minimumInteritemSpacing = 0
        return $0
    }(UICollectionViewFlowLayout())
     
    // 2. Creating UICollection View
    private lazy var collectionView: UICollectionView = {
        $0.dataSource = self //
//        $0.isPagingEnabled = true
        $0.showsHorizontalScrollIndicator = false
        $0.backgroundColor = .lightGray
        // we are inserting a padding to the cell
        $0.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        $0.register(CardCell.self, forCellWithReuseIdentifier: CardCell.reuseIdentifier)
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: layout))
    
    // UICollectionViewLayout is a protocol that defines the layout of the collection view's cells.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(collectionView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
}

// setting up a UICollection
extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.reuseIdentifier, for: indexPath) as! CardCell
        
        cell.cardItem = dataModel[indexPath.item]
        
        return cell
    }
    
    // Table - indexPath.row, Collection = indexPath.item
    
}

class CardCell: UICollectionViewCell {
    
    static let reuseIdentifier = "CardCell"
    
    var cardItem: CardModel? {
        willSet {
            guard let newValue else { return }
            imgView.image = UIImage(named: newValue.image)
            nameLabel.text = newValue.name
            priceName.text = newValue.price.description
        }
    }
    
    lazy var imgView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.frame.origin = .zero
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var nameLabel = SomeLabel()
    lazy var priceName = SomeLabel()
    
    lazy var hStack: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fillProportionally
        $0.spacing = 20
        $0.alignment = .center
        $0.addArrangedSubview(nameLabel)
        $0.addArrangedSubview(priceName)
        return $0
    }(UIStackView())
    
    
    
    override init(frame: CGRect) {
        // frame this is a cell that we created in oben
        super.init(frame: frame)
        clipsToBounds = true
        layer.cornerRadius = 10
        backgroundColor = .white
        contentView.addSubview(imgView)
        contentView.addSubview(hStack)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        hStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imgView.heightAnchor.constraint(equalToConstant: 120),
            
            hStack.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 5),
            hStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            hStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 15),
            
        ])
        
        contentView.addSubview(hStack)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SomeLabel: UILabel {
    init(font: UIFont = .systemFont(ofSize: 12, weight: .bold), textColor: UIColor = .black) {
        super.init(frame: .zero)
        self.font = font
        self.numberOfLines = 0
        self.textColor = textColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    ViewController()
}
