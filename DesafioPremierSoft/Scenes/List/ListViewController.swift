//
//  ListViewController.swift
//  DesafioPremierSoft
//
//  Created by Evandro Rodrigo Minamoto on 24/04/24.
//

import UIKit

class ListViewController: UIViewController {
    
    private let viewModel: ListViewModel
    
    init(viewModel: ListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80
        tableView.register(CandidateCell.self, forCellReuseIdentifier: CandidateCell.indentifier)
        tableView.backgroundColor = .opaqueSeparator
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Lista de Candidatos"
        setupUi()
        viewModel.fetchData()
        viewModel.organizeAlphabetically()
    }
    
    private func setupUi() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = view.backgroundColor
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.modelCandidates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CandidateCell.indentifier) as? CandidateCell else {
            return UITableViewCell()
        }
        cell.conigureLabels(with: viewModel.modelCandidates[indexPath.row])
        return cell
    }
}
