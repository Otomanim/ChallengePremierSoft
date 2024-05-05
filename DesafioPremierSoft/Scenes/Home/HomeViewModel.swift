//
//  HomeViewModel.swift
//  DesafioPremierSoft
//
//  Created by Evandro Rodrigo Minamoto on 23/04/24.
//

import Foundation

protocol HomeViewModelProtocol: AnyObject {
    func calculatePercentages() -> (String, String, String)
    func findInstructors()-> (String, String)
    func youngerCandidateApi() -> String
    func olderIos() -> String
    func statesList() -> Int
    func middleAgesQA() -> Double
    func sumAgeApi() -> Int
    func fetchData()
}

class HomeViewModel: HomeViewModelProtocol {
    
    private var modelCandidates: [Candidate] = []
    
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchData() {
        self.modelCandidates = networkService.getCandidates()
    }
    
    func olderIos() -> String {
        var nameOlder = ""
        var olderAgeIos = 0
        for i in modelCandidates {
            if i.Vaga == "iOS" && olderAgeIos < makeFirstWordAndInteger(i.Idade) {
                olderAgeIos = makeFirstWordAndInteger(i.Idade)
                nameOlder = i.Nome
            }
        }
        return nameOlder
    }
    
    func sumAgeApi() -> Int {
        var sumAgeApi = 0
        for i in modelCandidates {
            if i.Vaga == "API .NET" {
                sumAgeApi = sumAgeApi + makeFirstWordAndInteger(i.Idade)
            }
        }
        return sumAgeApi
    }
    
    func youngerCandidateApi() -> String {
        var youngerCandidate = ""
        var youngerApi = 100
        for i in modelCandidates {
            if i.Vaga == "API .NET" {
                if youngerApi > makeFirstWordAndInteger(i.Idade) {
                    youngerApi = makeFirstWordAndInteger(i.Idade)
                    youngerCandidate = i.Nome
                }
            }
        }
        return youngerCandidate
    }
    
    func middleAgesQA() -> Double {
        var numbersOfQA = 0
        var sumAgeQA = 0
        
        for i in modelCandidates {
            if i.Vaga == "QA" {
                numbersOfQA += 1
                sumAgeQA += makeFirstWordAndInteger(i.Idade)
            }
        }
        let middleAges = Double(sumAgeQA/numbersOfQA)
        return middleAges
    }
    
    func statesList() -> Int {
        var numState = 0
        var stateList = Set<String>()
        for state in modelCandidates {
            if state.Vaga == "API .NET" || state.Vaga == "iOS" || state.Vaga == "QA"{
                stateList.insert(state.Estado)
            }
        }
        numState = stateList.count
        return numState
    }
    
    func calculatePercentages() -> (String, String, String) {
        let total = Double(modelCandidates.count)
        let (iosCount, apiCount, qaCount) = vacancyCounts(from: modelCandidates)
        
        let calculatedIosPercentage = String(format: "Candidatos iOS: %.2f%%", iosCount/total*100)
        let calculatedApiPercentage = String(format: "Candidatos API .NET: %.2f%%", apiCount/total*100)
        let calculatedQAPercentage = String(format: "Candidatos QA: %.2f%%", qaCount/total*100)
        
        return(calculatedIosPercentage, calculatedApiPercentage, calculatedQAPercentage)
    }
    
    func findInstructors() -> (String, String) {
        let iOSInstructor = findIosInstructor(from: modelCandidates)
        let apiInstructor = findAPIInstructor(from: modelCandidates)
        let iOS = iOSInstructor?.Nome ?? "Nenhum instrutor de iOS encontrado"
        let api = apiInstructor?.Nome ?? "Nenhum instrutor de API.NET encontrado"
        return(iOS, api)
    }
    
    private func findIosInstructor(from candidates: [Candidate]) -> Candidate? {
        var iOSIntructor: Candidate?
        for candidate in candidates {
            if candidate.Vaga != "iOS" && candidate.Estado == "SC"{
                if makeFirstWordAndInteger(candidate.Idade) > 20 {
                    if isPrime(makeFirstWordAndInteger(candidate.Idade)) {
                        if lastName(candidate.Nome).first == "V" {
                            iOSIntructor = candidate
                            break
                        }
                    }
                }
            }
        }
        return iOSIntructor
    }
    
    private func findAPIInstructor(from candidates: [Candidate]) -> Candidate? {
        var apiInstructor: Candidate?
        for candidate in candidates {
            if candidate.Vaga != "API .NET" && candidate.Estado == "SC" {
                if makeFirstWordAndInteger(candidate.Idade) < 31 && makeFirstWordAndInteger(candidate.Idade) > 21 {
                    if isPrime(makeFirstWordAndInteger(candidate.Idade)) {
                        if lastName(candidate.Nome).last == "k" {
                            if countVolwels(input: firstName(candidate.Nome)) == 3 {
                                apiInstructor = candidate
                                break
                            }
                        }
                    }
                }
            }
        }
        return apiInstructor
    }
    
    private func makeFirstWordAndInteger(_ myString: String) -> Int {
        if let firstWord = myString.components(separatedBy: " ").first {
            return Int(firstWord) ?? 0
        }
        return 0
    }
    
    private func isPrime(_ number: Int) -> Bool {
        return number > 1 && !(2..<number).contains { number % $0 == 0 }
    }
    
    private func firstName(_ myString: String) -> String {
        if let subString = myString.components(separatedBy: " ").first {
            return String(subString)
        } else {
            return myString
        }
    }
    
    private func lastName(_ myString: String) -> String {
        if let subString = myString.components(separatedBy: " ").last {
            return String(subString)
        } else {
            return myString
        }
    }
    
    private func countVolwels(input: String) -> Int {
        let vowels: [Character] = ["a", "e", "i", "o", "u"]
        var vowelCount: Int = 0
        
        for ch in input.lowercased() {
            if (vowels.contains(ch)) {
                vowelCount += 1
            }
        }
        return vowelCount
    }

    private func vacancyCounts(from candidates: [Candidate]) -> (iosCount: Double, apiCount: Double, qaCount: Double) {
        var iosCount: Double = 0
        var apiCount: Double = 0
        var qaCount: Double = 0
        
        for candidate in candidates {
            switch candidate.Vaga {
            case "API .NET":
                apiCount += 1
            case "iOS":
                iosCount += 1
            case "QA":
                qaCount += 1
            default:
                print("Unidentified trail: \(candidate)")
            }
        }
        return (iosCount, apiCount, qaCount)
    }
}
