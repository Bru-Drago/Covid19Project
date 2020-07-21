//
//  BrasilViewController.swift
//  Projeto Covid19
//
//  Created by Bruna Fernanda Drago on 20/07/20.
//  Copyright © 2020 Bruna Fernanda Drago. All rights reserved.
//

import UIKit

class BrasilViewController: UIViewController {

    //Outlets
    @IBOutlet weak var brasilTableView: UITableView!
    
    //Properties
    var states = [States]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        brasilTableView.delegate = self
        brasilTableView.dataSource = self
        
        getBrasilCovidData()
    }
    func getBrasilCovidData(){
        
        let urlAPIBrasil = URL(string: "https://covid19-brazil-api.now.sh/api/report/v1")
        guard let url = urlAPIBrasil else { return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil{
                DispatchQueue.main.async {
                    Alert.showNetworkingAlert(on: self)
                }
                print(error?.localizedDescription ?? "Erro encontrado")
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                DispatchQueue.main.async {
                    Alert.showNetworkingAlert(on: self)
                }
                print(error?.localizedDescription ?? "Erro na resposta da API")
                return
            }
            guard let data = data else {
                DispatchQueue.main.async {
                    Alert.showNetworkingAlert(on: self)
                }
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
                DispatchQueue.main.async {
                    Alert.showNetworkingAlert(on: self)
                }
                print(error.localizedDescription,"Erro no PARSE json")
            }
            DispatchQueue.main.async {
                print(self.states.count)
                self.brasilTableView.reloadData()
            }
        }.resume()
       
    }
}
extension BrasilViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(states.count)
        return states.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = brasilTableView.dequeueReusableCell(withIdentifier: "brasilCell", for: indexPath)as! BrasilTableViewCell
        cell.estateNameLbl.text = states[indexPath.row].state
        
        let caseConfirmed = states[indexPath.row].cases
        cell.casesConfirmedLbl.text = caseConfirmed?.numberFormat
        
        let deathConfirmed = states[indexPath.row].deaths
        cell.deathConfirmedLbl.text = deathConfirmed?.numberFormat
        return cell
    }
    
    
}
extension BrasilViewController:UITableViewDelegate{
    
}
