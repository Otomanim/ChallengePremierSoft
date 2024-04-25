//
//  NetworkService.swift
//  DesafioPremierSoft
//
//  Created by Evandro Rodrigo Minamoto on 24/04/24.
//

import Foundation

protocol NetworkServiceProtocol: AnyObject {
    func getCandidates() -> [Candidate]
}

class NetworkService: NetworkServiceProtocol {
    
    func getCandidates() -> [Candidate] {
            var candidates: [Candidate] = []
            if let url = URL(string: "https://raw.githubusercontent.com/premiersoft/AppAcademyChallenge2/main/AppAcademy_Candidates.csv") {
                do {
                    let contents = try String(contentsOf: url)
                    let candidatesData = contents.split(whereSeparator: \.isNewline)
                    var i = 0
                    for candidateData in candidatesData {  // Separando cada candidato por linha
                        let attributes = candidateData.split(separator: ";")  // Para cada candidato, separando seus atributos
                        if i != 0 {  // Ignorando o cabeçalho
                            let name = String(attributes[1])
                            let vacancy = String(attributes[2])
                            let age = String(attributes[3])
                            let state = String(attributes[4])
                            let candidate = Candidate(name: name, vacancy: vacancy, age: age, state: state)
                            candidates.append(candidate)
                        }
                        i += 1
                    }
                } catch {
                    print("Erro ao carregar dados: \(error)")
                }
            } else {
                print("URL inválida!")
            }
            return candidates
        }
}
