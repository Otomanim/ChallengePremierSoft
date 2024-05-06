//
//  ListViewModel.swift
//  DesafioPremierSoft
//
//  Created by Evandro Rodrigo Minamoto on 03/05/24.
//

import Foundation

protocol ListViewModelProtocol: AnyObject {
    func organizeAlphabetically()
    func fetchData()
}

class ListViewModel: ListViewModelProtocol {
    
    var modelCandidates: [Candidate] = []
    
    private let service: NetworkService
    
    init(service: NetworkService) {
        self.service = service
    }
    
    func organizeAlphabetically() {
        modelCandidates.sort { $0.Nome.localizedCaseInsensitiveCompare($1.Nome) == .orderedAscending }
       
    }
    
    func fetchData() {
        self.modelCandidates = service.getCandidates()
    }
    
    
}
