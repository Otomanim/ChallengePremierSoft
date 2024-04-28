//
//  HomeViewController.swift
//  DesafioPremierSoft
//
//  Created by Evandro Rodrigo Minamoto on 23/04/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let homeView: HomeViewModelProtocol
    
    init(homeView: HomeViewModelProtocol) {
        self.homeView = homeView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var resultLabel: UILabel! = configureLabel()
    lazy var percentageIosLabel: UILabel! = configureLabel()
    lazy var percentageApiLabel: UILabel! = configureLabel()
    lazy var percentageQALabel: UILabel! = configureLabel()
    
    lazy var middleAgesQALabel: UILabel! = configureLabel()
    lazy var olderIosLabel: UILabel! = configureLabel()
    lazy var youngerApiLabel: UILabel! = configureLabel()
    lazy var sumAgeQALabel: UILabel! = configureLabel()
    lazy var statesOfnumberLabel: UILabel! = configureLabel()
    lazy var instructorIosLabel: UILabel! = configureLabel()
    lazy var instructorApiLabel: UILabel! = configureLabel()
    
    let listOfCandidates: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var topStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews:[percentageIosLabel, percentageApiLabel, percentageQALabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .cyan
        stackView.clipsToBounds = true
        stackView.layer.cornerRadius = 10
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        return stackView
    }()
    
    lazy var bottomStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [middleAgesQALabel, olderIosLabel, youngerApiLabel, sumAgeQALabel, statesOfnumberLabel, instructorIosLabel, instructorApiLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .opaqueSeparator
        stackView.clipsToBounds = true
        stackView.layer.cornerRadius = 10
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButton(listOfCandidates, text: "Lista de Candidatos", color: .lightGray, action: #selector(clickedButtom))
        resultLabel.text = "Resultado:"
        setupUI()
        homeView.fetchData()
        setupLabels()
    }
    
    @objc func clickedButtom() {
        print("Botão Clicado!")
        
        //        let novaViewController = OutraViewController()
        //        navigationController?.pushViewController(novaViewController, animated: true)
    }
    private func setupLabels() {
        let (iOSLabel, apiLabel, qaLabel) = homeView.calculatePercentages()
        let middleAge = homeView.middleAgesQA()
        let older = homeView.olderIos()
        let younger = homeView.youngerCandidateApi()
        let sumAge = homeView.sumAgeApi()
        let state = homeView.statesList()
        let (iOS, api) = homeView.findInstructors()
        percentageIosLabel.text = iOSLabel
        percentageApiLabel.text = apiLabel
        percentageQALabel.text = qaLabel
        middleAgesQALabel.text = "Idade média candidatos QA: \(middleAge)"
        olderIosLabel.text = "Candidato mais velho iOS: \(older)"
        youngerApiLabel.text = "Candidato API .NET mais novo: \(younger)"
        sumAgeQALabel.text = "Soma idade API .NET: \(sumAge)"
        statesOfnumberLabel.text = "Numero de estados diferentes: \(state)"
        instructorIosLabel.text = "Instrutor de iOS: \(iOS)"
        instructorApiLabel.text = "Instrutor de API .NET: \(api)"
    }
    
    private func configureButton(_ button: UIButton, text: String, color: UIColor, action: Selector){
        button.setTitle(text, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addTarget(self, action: action, for: .touchUpInside)
    }
    
    private func configureLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func setupUI(){
        view.addSubview(resultLabel)
        view.addSubview(topStackView)
        view.addSubview(bottomStackView)
        view.addSubview(listOfCandidates)
        
        NSLayoutConstraint.activate([
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            resultLabel.heightAnchor.constraint(equalToConstant: 50),
            topStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topStackView.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 10),
            topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            topStackView.heightAnchor.constraint(equalToConstant: 200),
            bottomStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 10),
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            listOfCandidates.topAnchor.constraint(equalTo: bottomStackView.bottomAnchor, constant: 20),
            listOfCandidates.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            listOfCandidates.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            listOfCandidates.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            listOfCandidates.heightAnchor.constraint(equalToConstant: 50),
        ])
        
    }
    
}

