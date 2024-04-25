//
//  HomeViewModel.swift
//  DesafioPremierSoft
//
//  Created by Evandro Rodrigo Minamoto on 23/04/24.
//

import Foundation

protocol HomeViewModelProtocol {
    func calculatePercentages(completion: @escaping (String, String, String) -> Void)
}

class HomeViewModel {
    
    private var modelCandidates: [Candidate] = []
    
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    private func fetchData() {
        self.modelCandidates = networkService.getCandidates()
    }
    
    func calculatePercentages(completion: @escaping (String, String, String) -> Void) {
        let total = Double(modelCandidates.count)
        let (iosCount, apiCount, qaCount) = vacancyCounts(from: modelCandidates)
        
        let calculatedIosPercentage = String(format: "Candidatos iOS: %.2f%%", iosCount/total*100)
        let calculatedApiPercentage = String(format: "Candidatos API .NET: %.2f%%", apiCount/total*100)
        let calculatedQAPercentage = String(format: "Candidatos QA: %.2f%%", qaCount/total*100)
        
        completion(calculatedIosPercentage, calculatedApiPercentage, calculatedQAPercentage)
    }
    
    func findIosInstructor(from candidates: [Candidate]) -> Candidate? {
        var iOSIntructor: Candidate?
        for candidate in candidates {
            if candidate.vacancy != "iOS" && candidate.state == "SC"{
                if makeFirstWordAndInteger(candidate.age) > 20 {
                    if isPrime(makeFirstWordAndInteger(candidate.age)) {
                        if lastName(candidate.name).first == "V" {
                            iOSIntructor = candidate
                            break
                        }
                    }
                }
            }
        }
        return iOSIntructor
    }
    
    func findAPIInstructor(from candidates: [Candidate]) -> Candidate? {
        var apiInstructor: Candidate?
        for candidate in candidates {
            if candidate.vacancy != "API.NET" && candidate.state == "SC" {
                if makeFirstWordAndInteger(candidate.age) < 31 && makeFirstWordAndInteger(candidate.age) > 21 {
                    if isPrime(makeFirstWordAndInteger(candidate.age)) {
                        if lastName(candidate.name).last == "k" {
                            if countVolwels(input: firstName(candidate.name)) == 3 {
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
            switch candidate.vacancy {
            case "API.NET":
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
