//
//  Alert.swift
//  Projeto Covid19
//
//  Created by Bruna Fernanda Drago on 20/07/20.
//  Copyright © 2020 Bruna Fernanda Drago. All rights reserved.
//

import Foundation
import UIKit

struct Alert {
  
   static func showBasicAlert(on vc:UIViewController,title:String ,message:String){

    let alerta = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    vc.present(alerta,animated: true)}
        
     
    static func showNoCountryNameTyped(on vc:UIViewController){
           showBasicAlert(on: vc, title: "Digite o nome do país", message: "Nome não encontrado , tente novamente.")
       }
    
    static func showNetworkingAlert(on vc: UIViewController){
     showBasicAlert(on: vc, title: "Erro de conexão", message: "Não foi possível encontrar os dados , tente novamente! ")
    }
    
    }

