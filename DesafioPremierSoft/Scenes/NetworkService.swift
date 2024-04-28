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
        var separeteCandidates: [[String.SubSequence]] = [[]]
        var arrayCandidates: [[String]] = []
        var candidates: [Candidate] = []
        if let url = URL(string: "https://raw.githubusercontent.com/premiersoft/AppAcademyChallenge2/main/AppAcademy_Candidates.csv") {
            do {
                let contents = try String(contentsOf: url)
                let candidatesData = contents.split(whereSeparator: \.isNewline)
                for candidateData in candidatesData {  // Separando cada candidato por linha
                    let attributes = candidateData.split(separator: ";")  // Para cada candidato, separando seus atributos
                    separeteCandidates.append(attributes)
                }
                var i = 0
                for candidate in separeteCandidates {
                    arrayCandidates.append(["Candidate \(i)"])
                    for atribute in candidate {
                        arrayCandidates[i].append(String(atribute))
                    }
                    i = i + 1
                }
                arrayCandidates.remove(at: 0)
                for candidate in arrayCandidates {
                    let name = candidate[1]
                    let vacancy = candidate[2]
                    let age = candidate[3]
                    let state = candidate[4]
                    let model = Candidate(Nome: name, Vaga: vacancy, Idade: age, Estado: state)
                    candidates.append(model)
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
