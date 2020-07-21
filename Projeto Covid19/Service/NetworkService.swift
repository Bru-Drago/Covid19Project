//
//  NetworkService.swift
//  Projeto Covid19
//
//  Created by Bruna Fernanda Drago on 21/07/20.
//  Copyright © 2020 Bruna Fernanda Drago. All rights reserved.
//

import UIKit

class NetworkService{
    
    static let instance = NetworkService()
    private init (){}
    
    var countries = [Countries]()
    var states = [States]()
    
    let urlAPICountries = URL(string: "https://covid19-brazil-api.now.sh/api/report/v1/countries")
    
    let urlAPIBrasil = URL(string: "https://covid19-brazil-api.now.sh/api/report/v1")
    
    func getCovidData(completion: @escaping ([Countries]) -> ()) {
        
        guard let url = urlAPICountries else { return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription,"An error was found")
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                print(error?.localizedDescription ?? "Server error")
                return
            }
            guard let data = data else {
                print(error?.localizedDescription ?? "Erro ao carregar data")
                return
            }
            do {
                if let jsonCountries = try? JSONDecoder().decode(CountryInfo.self, from: data){
                    self.countries = jsonCountries.data!
                    print(self.countries)
                    DispatchQueue.main.async {
                        completion(self.countries)
                    }
                }
                
            }catch{
                print(error.localizedDescription,"Erro no PARSE json")
            }
            
        }.resume()
        
    }
    func getBrasilCovidData(completion: @escaping ([States])->()){
        
        guard let url = urlAPIBrasil else { return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil{
                print(error?.localizedDescription ?? "Erro encontrado")
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                print(error?.localizedDescription ?? "Erro na resposta da API")
                return
            }
            guard let data = data else {
                print(error?.localizedDescription ?? "Erro ao carregar data")
                return
            }
            do {
                if let jsonStates = try? JSONDecoder().decode(StateInfo.self, from: data){
                    self.states = jsonStates.data!
                    print(self.states)
                }
               
            }
            catch{
                print(error.localizedDescription,"Erro no PARSE json")
            }
            DispatchQueue.main.async {
                completion(self.states)
            }
        }.resume()
       
    }
}
