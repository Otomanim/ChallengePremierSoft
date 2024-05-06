//
//  CandidateCell.swift
//  DesafioPremierSoft
//
//  Created by Evandro Rodrigo Minamoto on 23/04/24.
//

import UIKit

class CandidateCell: UITableViewCell {
    static var indentifier: String {
        String(describing: self)
    }

    private let candidateIsNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let candidateIsAgeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let candidateAtStateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let candidatesTypeOfVacancyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var leftStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [candidateIsNameLabel, candidateAtStateLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 5
        return stack
    }()
    
    private lazy var rightStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [candidateIsAgeLabel, candidatesTypeOfVacancyLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 5
        return stack
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [leftStackView, rightStackView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        stack.spacing = 0
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clear()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func conigureLabels(with model: Candidate) {
        candidateIsNameLabel.text = model.Nome
        candidateIsAgeLabel.text = model.Idade
        candidateAtStateLabel.text = model.Estado
        candidatesTypeOfVacancyLabel.text = model.Vaga
    }
    
    private func clear() {
        candidateIsNameLabel.text = nil
        candidateIsAgeLabel.text = nil
        candidateAtStateLabel.text = nil
        candidatesTypeOfVacancyLabel.text = nil
    }
    
    private func setupUI() {
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 80),
            leftStackView.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.7),
            rightStackView.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.3),
            
        ])
    }
}
