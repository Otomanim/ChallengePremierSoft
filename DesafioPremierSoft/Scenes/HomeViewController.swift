//
//  ViewController.swift
//  DesafioPremierSoft
//
//  Created by Evandro Rodrigo Minamoto on 23/04/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var resultLabel: UILabel! = configureLabel(text: "Resultado:")
    lazy var percentageIosLabel: UILabel! = configureLabel(text: "Porcentagem iOS:")
    lazy var percentageApiLabel: UILabel! = configureLabel(text: "Porcentagem API.Net:")
    lazy var percentageQALabel: UILabel! = configureLabel(text: "Porcentagem QA:")
    
    lazy var ageQALabel: UILabel! = configureLabel(text: "Idade média candidatos QA:")
    lazy var olderIosLabel: UILabel! = configureLabel(text: "Candidato mais velho iOS:")
    lazy var youngerApiLabel: UILabel! = configureLabel(text: "Candidato mais novo API.Net:")
    lazy var sumAgeApiLabel: UILabel! = configureLabel(text: "Soma de idade API.Net:")
    lazy var statesOfnumberLabel: UILabel! = configureLabel(text: "Numero de estados diferentes:")
    lazy var instructorIosLabel: UILabel! = configureLabel(text: "Instrutor de iOS:")
    lazy var instructorApiLabel: UILabel! = configureLabel(text: "Instrutor de API.Net:")
    
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
        stackView.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        return stackView
    }()
    
    lazy var bottomStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [ageQALabel, olderIosLabel, youngerApiLabel, sumAgeApiLabel, statesOfnumberLabel, instructorIosLabel, instructorApiLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .opaqueSeparator
        stackView.clipsToBounds = true
        stackView.layer.cornerRadius = 10
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButton(listOfCandidates, text: "Lista de Candidatos", color: .lightGray, action: #selector(clickedButtom))
        setupUI()
    }
    
    @objc func clickedButtom() {
        print("Botão Clicado!")
        
        //        let novaViewController = OutraViewController()
        //        navigationController?.pushViewController(novaViewController, animated: true)
    }
    
    private func configureButton(_ button: UIButton, text: String, color: UIColor, action: Selector){
        button.setTitle(text, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addTarget(self, action: action, for: .touchUpInside)
    }
    
    private func configureLabel(text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
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
            topStackView.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 20),
            topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            topStackView.heightAnchor.constraint(equalToConstant: 200),
            bottomStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 20),
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            listOfCandidates.topAnchor.constraint(equalTo: bottomStackView.bottomAnchor, constant: 20),
            listOfCandidates.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            listOfCandidates.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            listOfCandidates.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            listOfCandidates.heightAnchor.constraint(equalToConstant: 50),
        ])
        
    }
    
}

