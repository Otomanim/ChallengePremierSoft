//
//  ViewController.swift
//  DesafioPremierSoft
//
//  Created by Evandro Rodrigo Minamoto on 23/04/24.
//

import UIKit

class ViewController: UIViewController {
    
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
        stackView.spacing = 10
        stackView.backgroundColor = .cyan
        stackView.clipsToBounds = true
        stackView.layer.cornerRadius = 10
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @objc func botaoClicado() {
        print("Botão Clicado!")

//        let novaViewController = OutraViewController()
//        navigationController?.pushViewController(novaViewController, animated: true)
       }
    
    private func configureButton(_ button: UIButton, text: String, color: UIColor, action: Selector){
        button.setTitle(text, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = color
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
        
        NSLayoutConstraint.activate([
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            topStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topStackView.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 20)
        ])
                
    }

}

