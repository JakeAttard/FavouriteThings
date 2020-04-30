//
//  SceneDelegate.swift
//  FavouriteThings
//
//  Created by Jake Attard on 17/4/20.
//  Copyright © 2020 Jake Attard. All rights reserved.
//

import CoreData
import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        /// Gets the app delegate from the application, ensuring it is the App Delegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("No app delegate")
        }
        
        /// Getting the context from the persistentContainer
        
        let context = appDelegate.persistentContainer.viewContext
        
        /// Storing default data
        
        let formulaOneDriversArray: [FormulaOneDrivers] = [FormulaOneDrivers]()
        
        /// Fetching the Formula One Drivers Array
        
        let formulaOneDriversFetch: NSFetchRequest<FormulaOneDrivers> = FormulaOneDrivers.fetchRequest()
        
        /// Sorting the Formula One Drivers Array
        
        let formulaOneDriversSort: NSSortDescriptor = NSSortDescriptor(keyPath: \FormulaOneDrivers.listTitle, ascending: true)
        
        /// Fetching the Sorted Array
        formulaOneDriversFetch.sortDescriptors = [formulaOneDriversSort]
        
        do {
            var formulaOneDriversArray = try context.fetch(formulaOneDriversFetch)
            
            /// Checking the count of the array
            let count = formulaOneDriversArray.count
            
            /// If the count of the Array is 0 then add the the following
            if(count == 0) {
                
                /// Adding in new Formula One Driver
                if let formulaOneDrivers = NSEntityDescription.insertNewObject(forEntityName: "FormulaOneDrivers", into: context) as? FormulaOneDrivers {
                    formulaOneDrivers.listTitle = "Formula One Drivers"
                    formulaOneDriversArray.append(formulaOneDrivers)
                    appDelegate.saveContext()
                    
                    /// Sample Data Driver 1
                    var formulaOneDriver = FormulaOneDriver(context: context)
                    formulaOneDriver.name = "Lewish Hamilton"
                    formulaOneDriver.imageURL = "https://www.formula1.com/content/fom-website/en/drivers/lewis-hamilton/_jcr_content/image.img.640.medium.jpg/1584013371803.jpg"
                    formulaOneDriver.team = "Mercedes"
                    formulaOneDriver.nation = "United Kingdom"
                    formulaOneDriver.sponsor = "Petronas"
                    formulaOneDriver.notes = "7 Time World Champion"
                    formulaOneDrivers.addToFormulaOneDrivers(formulaOneDriver)
                    
                    /// Sample Data Driver 2
                    formulaOneDriver = FormulaOneDriver(context: context)
                    formulaOneDriver.name = "Sebstain Vettel"
                    formulaOneDriver.imageURL = "https://www.formula1.com/content/fom-website/en/drivers/sebastian-vettel/_jcr_content/image.img.640.medium.jpg/1584013014200.jpg"
                    formulaOneDriver.team = "Ferrari"
                    formulaOneDriver.nation = "Germany"
                    formulaOneDriver.sponsor = "Shell"
                    formulaOneDriver.notes = "4 Time World Champion"
                    formulaOneDrivers.addToFormulaOneDrivers(formulaOneDriver)
                    
                    /// Sample Data Driver 3
                    formulaOneDriver = FormulaOneDriver(context: context)
                    formulaOneDriver.name = "Max Verstappen"
                    formulaOneDriver.imageURL = "https://www.formula1.com/content/fom-website/en/drivers/max-verstappen/_jcr_content/image.img.640.medium.jpg/1584012927837.jpg"
                    formulaOneDriver.team = "Red Bull Racing"
                    formulaOneDriver.nation = "Dutch"
                    formulaOneDriver.sponsor = "Red Bull"
                    formulaOneDriver.notes = "Multiple Race Winner"
                    formulaOneDrivers.addToFormulaOneDrivers(formulaOneDriver)
                    
                    /// Saving the Sample Data
                    appDelegate.saveContext()
                }
                
            }
            
        } catch {
            /// Error message if the fetch fails
            print("Fetch failed")
        }
        
        /// contentView is now equal to the ContentView
        let contentView = ContentView().environment(\.managedObjectContext, context)
        
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
       
        /// Save changes in the application's managed object context when the application is closed to the background.
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        delegate.saveContext()
    }
}

