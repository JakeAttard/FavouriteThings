//
//  SceneDelegate.swift
//  FavouriteThings
//
//  Created by Jake Attard on 17/4/20.
//  Copyright © 2020 Jake Attard. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var viewModel = ViewModel()
    
    /// Formula One Drivers Data
    
    /// Lewis Hamilton
    var driver1 = FormulaOneDriver(formulaOneDriverImage: "lewishH", formulaOneDriverName: "Lewis Hamilton", formulaOneDriverTeam: "Mercedes", formulaOneDriverChampionships: 6, formulaOneDriverNote: "")
    
    /// Valtteri Bottas
    var driver2 = FormulaOneDriver(formulaOneDriverImage: "valtteriB", formulaOneDriverName: "Valtteri Bottas", formulaOneDriverTeam: "Mercedes", formulaOneDriverChampionships: 0, formulaOneDriverNote: "")
    
    /// Sebastian Vettel
    var driver3 = FormulaOneDriver(formulaOneDriverImage: "sebastianV", formulaOneDriverName: "Sebastian Vettel", formulaOneDriverTeam: "Ferrari", formulaOneDriverChampionships: 4, formulaOneDriverNote: "")
    
    /// Charles Leclerc
    var driver4 = FormulaOneDriver(formulaOneDriverImage: "charlesL", formulaOneDriverName: "Charles Leclerc", formulaOneDriverTeam: "Ferrari", formulaOneDriverChampionships: 0, formulaOneDriverNote: "")
            
    /// Max Verstappen
    var driver5 = FormulaOneDriver(formulaOneDriverImage: "maxV", formulaOneDriverName: "Max Vertsappen", formulaOneDriverTeam: "Redbull", formulaOneDriverChampionships: 0, formulaOneDriverNote: "")

    /// Alexander Albon
    var driver6 = FormulaOneDriver(formulaOneDriverImage: "alexanderA", formulaOneDriverName: "Alexander Albon", formulaOneDriverTeam: "Redbull", formulaOneDriverChampionships: 0, formulaOneDriverNote: "")
            
    /// Carlos Sainz Jr
    var driver7 = FormulaOneDriver(formulaOneDriverImage: "carlosS", formulaOneDriverName: "Carlos Sainz Jr", formulaOneDriverTeam: "McLaren", formulaOneDriverChampionships: 0, formulaOneDriverNote: "")

    /// Lando Norris
    var driver8 = FormulaOneDriver(formulaOneDriverImage: "landoN", formulaOneDriverName: "Lando Norris", formulaOneDriverTeam: "McLaren", formulaOneDriverChampionships: 0, formulaOneDriverNote: "")
            
    /// Daniel Ricciardo
    var driver9 = FormulaOneDriver(formulaOneDriverImage: "danielR", formulaOneDriverName: "Daniel Ricciardo", formulaOneDriverTeam: "Renault", formulaOneDriverChampionships: 0, formulaOneDriverNote: "")
            
    /// Esteban Ocon
    var driver10 = FormulaOneDriver(formulaOneDriverImage: "estebanO", formulaOneDriverName: "Esteban Ocon", formulaOneDriverTeam: "Renault", formulaOneDriverChampionships: 0, formulaOneDriverNote: "")
            
    /// Pierre Gasly
    var driver11 = FormulaOneDriver(formulaOneDriverImage: "pierreG", formulaOneDriverName: "Pierre Gasly", formulaOneDriverTeam: "Alpha Tauri", formulaOneDriverChampionships: 0, formulaOneDriverNote: "")
            
    /// Daniil Kvyat
    var driver12 = FormulaOneDriver(formulaOneDriverImage: "daniilK", formulaOneDriverName: "Daniil Kyvat", formulaOneDriverTeam: "Alpha Tauri", formulaOneDriverChampionships: 0, formulaOneDriverNote: "")
            
    /// Sergio Pérez
    var driver13 = FormulaOneDriver(formulaOneDriverImage: "sergioP", formulaOneDriverName: "Sergio Pérez", formulaOneDriverTeam: "Racing Point", formulaOneDriverChampionships: 0, formulaOneDriverNote: "")
            
    /// Lance Stroll
    var driver14 = FormulaOneDriver(formulaOneDriverImage: "lanceS", formulaOneDriverName: "Lance Stroll", formulaOneDriverTeam: "Racing Point", formulaOneDriverChampionships: 0, formulaOneDriverNote: "")
            
    /// Kimi Räikkönen
    var driver15 = FormulaOneDriver(formulaOneDriverImage: "kimiR", formulaOneDriverName: "Kimi Räikkönen", formulaOneDriverTeam: "Alfa Romeo", formulaOneDriverChampionships: 1, formulaOneDriverNote: "")

    /// Antonio Giovinazzi
    var driver16 = FormulaOneDriver(formulaOneDriverImage: "antonioG", formulaOneDriverName: "Antonio Giovinazzi", formulaOneDriverTeam: "Alfa Romeo", formulaOneDriverChampionships: 0, formulaOneDriverNote: "")
        
    /// Romain Grojsean
    var driver17 = FormulaOneDriver(formulaOneDriverImage: "romainG", formulaOneDriverName: "Romain Grosjean", formulaOneDriverTeam: "Haas", formulaOneDriverChampionships: 0, formulaOneDriverNote: "")
            
    /// Kevin Magnussen
    var driver18 = FormulaOneDriver(formulaOneDriverImage: "kevinM", formulaOneDriverName: "Kevin Magnussen", formulaOneDriverTeam: "Haas", formulaOneDriverChampionships: 0, formulaOneDriverNote: "")
            
    /// George Russell
    var driver19 = FormulaOneDriver(formulaOneDriverImage: "georgeR", formulaOneDriverName: "George Russell", formulaOneDriverTeam: "Williams", formulaOneDriverChampionships: 0, formulaOneDriverNote: "")
            
    /// Nicholas Latifi
    var driver20 = FormulaOneDriver(formulaOneDriverImage: "nicholasL", formulaOneDriverName: "Nicholas Latifi", formulaOneDriverTeam: "Williams", formulaOneDriverChampionships: 0, formulaOneDriverNote: "")
    
    /// Creating the JSON file and locating it
    private let fileName = "drivers.json"
    private let fileManager = FileManager.default
    lazy private var documentsDir: URL = {
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }()
    lazy private var fileURL = documentsDir.appendingPathComponent(fileName)

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        /// Decoding the JSON Data
        do {
            let t = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let decodedViewModel = try decoder.decode(ViewModel.self, from: t)
            viewModel = decodedViewModel
        } catch {
            print("Could not load \(fileURL.path): \(error)")
        }
        
        /// Adding the drivers to the viewModel if there is less than one driver
        
        if viewModel.formulaOneDrivers.count < 1 {
            viewModel.addFormulaOneDriver(formulaOneDriver: driver20)
            viewModel.addFormulaOneDriver(formulaOneDriver: driver19)
            viewModel.addFormulaOneDriver(formulaOneDriver: driver18)
            viewModel.addFormulaOneDriver(formulaOneDriver: driver17)
            viewModel.addFormulaOneDriver(formulaOneDriver: driver16)
            viewModel.addFormulaOneDriver(formulaOneDriver: driver15)
            viewModel.addFormulaOneDriver(formulaOneDriver: driver14)
            viewModel.addFormulaOneDriver(formulaOneDriver: driver13)
            viewModel.addFormulaOneDriver(formulaOneDriver: driver12)
            viewModel.addFormulaOneDriver(formulaOneDriver: driver11)
            viewModel.addFormulaOneDriver(formulaOneDriver: driver10)
            viewModel.addFormulaOneDriver(formulaOneDriver: driver9)
            viewModel.addFormulaOneDriver(formulaOneDriver: driver8)
            viewModel.addFormulaOneDriver(formulaOneDriver: driver7)
            viewModel.addFormulaOneDriver(formulaOneDriver: driver6)
            viewModel.addFormulaOneDriver(formulaOneDriver: driver5)
            viewModel.addFormulaOneDriver(formulaOneDriver: driver4)
            viewModel.addFormulaOneDriver(formulaOneDriver: driver3)
            viewModel.addFormulaOneDriver(formulaOneDriver: driver2)
            viewModel.addFormulaOneDriver(formulaOneDriver: driver1)
        }
        
        let contentView = ContentView(viewModel: viewModel)

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
        /// Encoding the JSON Data
        do {
            let json = JSONEncoder()
            let data = try json.encode(viewModel)
            try data.write(to: fileURL)
        } catch {
            print("Could not write file \(fileURL.path): \(error)")
        }
    }
}

