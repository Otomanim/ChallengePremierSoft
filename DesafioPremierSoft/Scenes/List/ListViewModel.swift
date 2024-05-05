//
//  ListViewModel.swift
//  DesafioPremierSoft
//
//  Created by Evandro Rodrigo Minamoto on 03/05/24.
//

import Foundation

protocol ListViewModelProtocol: AnyObject {
    func organizeAlphabetically()
}

class ListViewModel: ListViewModelProtocol {
    
    private var modelCandidates: [Candidate] = []
    
    func organizeAlphabetically() {
        modelCandidates.sort { $0.Nome.localizedCaseInsensitiveCompare($1.Nome) == .orderedAscending }
       
    }
    
    
}
