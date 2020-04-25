//
//  FavouriteThingsTests.swift
//  FavouriteThingsTests
//
//  Created by Jake Attard on 17/4/20.
//  Copyright © 2020 Jake Attard. All rights reserved.
//

/**
 Testing the application Class properties with XCTAssertNotNill, XCTAssert and XCTAssertEqual.
 Also testing the FormulaOneDriver Array making sure it isn't empty.
*/

import SwiftUI
import XCTest
@testable import FavouriteThings

class FavouriteThingsTests: XCTestCase {
    
    /// FormulaOneDriver Object
    var formulaOneDriver: FormulaOneDriver?
    
    /// FormulaOneDrivers Empty Array
    var formulaOneDrivers: [FormulaOneDriver] = []
    
    /// Object of the ViewModel
    var viewModel: ViewModel?
    
    /// JSON Data from SceneDeletage for Encoding and Decoding
    private let fileName = "drivers.json"
    private let fileManager = FileManager.default
    lazy private var documentsDir: URL = {
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }()
    lazy private var fileURL = documentsDir.appendingPathComponent(fileName)

    /// Setup function
    override func setUp() {
        
        formulaOneDriver = FormulaOneDriver(formulaOneDriverImage: "lewishH", formulaOneDriverName: "Lewis Hamilton", formulaOneDriverTeam: "Mercedes", formulaOneDriverChampionships: 6, formulaOneDriverNote: "")
        
        guard let formulaOneDriver = formulaOneDriver else {
            return
        }
        
        formulaOneDrivers = [formulaOneDriver]
           
        viewModel = ViewModel()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    /// Testing that the driver isnt nill
    func testFormulaOneDriverNotNill() {
        XCTAssertNotNil(formulaOneDriver)
    }
    
    /// Testing that the driver image is valid
    func testFormulaOneDriverImage() {
        let driverImage = "lewishH"
        XCTAssert(formulaOneDriver?.formulaOneDriverImage == driverImage)
        XCTAssertEqual(formulaOneDriver?.formulaOneDriverImage, driverImage)
    }
    
    /// Testing that the driver name is valid
    func testFormulaOneDriverName() {
        let driverName = "Lewis Hamilton"
        XCTAssert(formulaOneDriver?.formulaOneDriverName == driverName)
        XCTAssertEqual(formulaOneDriver?.formulaOneDriverName, driverName)
    }
    
    /// Testing that the driver team is valid
    func testFormulaOneDriverTeam() {
        let driverTeam = "Mercedes"
        XCTAssert(formulaOneDriver?.formulaOneDriverTeam == driverTeam)
        XCTAssertEqual(formulaOneDriver?.formulaOneDriverTeam, driverTeam)
    }
    
    /// Testing that the driver number of championships is valid
    func testFormulaOneDriverChampionships() {
        let driverChampionships = Int(6)
        XCTAssert(formulaOneDriver?.formulaOneDriverChampionships == driverChampionships)
        XCTAssertEqual(formulaOneDriver?.formulaOneDriverChampionships, driverChampionships)
    }
    
    /// Testing the FormulaOneDriverArray
    func testFormulaOneDriverArray() {
        
        let formulaOneDriver: [FormulaOneDriver] = [FormulaOneDriver(formulaOneDriverImage: "lewishH", formulaOneDriverName: "Lewis Hamilton", formulaOneDriverTeam: "Mercedes", formulaOneDriverChampionships: 6, formulaOneDriverNote: "")]

        XCTAssert((formulaOneDriver as Any) is [FormulaOneDriver])
        
        XCTAssertEqual(formulaOneDriver.count, 1)
    }
    
    /// Testing the viewModel adding and removing formulaOneDrivers
    func testViewModel() {
        
        /// Adding a new FormulaOneDriver
        viewModel?.addFormulaOneDriver(formulaOneDriver: formulaOneDriver!)
        
        /// Checking to see if the count is 2 as one has just been added
        XCTAssertEqual(viewModel?.formulaOneDrivers.count, 1)
        
        /// Removing the formulaOneDriver
        viewModel?.removeFormulaOneDriver(index: 0)
        
        XCTAssertEqual(viewModel?.formulaOneDrivers.count, 0)
        
        /// Testing the Image URL by updating it and getting the new image
        formulaOneDriver?.updateFormulaOneDriverImage(imageURL: "https://s3-eu-west-1.amazonaws.com/motorsport-magazine/wp-content/uploads/2019/10/02112526/lewis_hamilton_mexico_thursday.jpg")
        XCTAssert((formulaOneDriver?.getFormulaOneDriverImage() as Any) is Image)
    }
    
    /// Testing the JSON File (Encoding and Decoding)
    
    func testJSONFile() {
        
        let driver1 = FormulaOneDriver(formulaOneDriverImage: "lewishH", formulaOneDriverName: "Lewis Hamilton", formulaOneDriverTeam: "Mercedes", formulaOneDriverChampionships: 6, formulaOneDriverNote: "")
        
        guard let viewModel = viewModel else {
            XCTFail("ViewModel is nil")
            return
        }
        
        viewModel.addFormulaOneDriver(formulaOneDriver: driver1)
        
        /// Encoding successful and saving in the ViewModel. Error message added in the catch if fails
        do {
            let json = JSONEncoder()
            
            let data = try json.encode(viewModel)
            
            try data.write(to: fileURL)
        } catch {
            XCTFail("JSON Encode failed.")
        }
        
        var model = ViewModel()
        
        /// Decoding successful.  Error message added in the catch if fails
        do {
            
            let data = try Data(contentsOf: fileURL)
            
            let decoder = JSONDecoder()
            
            let decodedViewModel = try decoder.decode(ViewModel.self, from: data)
                
            model = decodedViewModel
            
        } catch {
            XCTFail("JSON Decode failed.")
        }
        
        /// Testing that it was saved correctly in the ViewModel
        XCTAssertEqual(model.formulaOneDrivers.count, 1)
        
        /// Testing and comparing that the listTitle is the same for the decoded model
        XCTAssertEqual(viewModel.listTitle, model.listTitle)
        
        /// Testing and comparing that the formulaOneDriverName is the same for the decoded model
        XCTAssertEqual(driver1.formulaOneDriverName, model.formulaOneDrivers[0].formulaOneDriverName)
        
        /// Testing and comparing that the formulaOneDriverImage is the same for the decoded model
        XCTAssertEqual(driver1.formulaOneDriverImage, model.formulaOneDrivers[0].formulaOneDriverImage)
        
        /// Testing and comparing that the formulaOneDriverTeam is the same for the decoded model
        XCTAssertEqual(driver1.formulaOneDriverTeam, model.formulaOneDrivers[0].formulaOneDriverTeam)
        
        /// Testing and comparing that the formulaOneDriverChampions is the same for the decoded model
        XCTAssertEqual(driver1.formulaOneDriverChampionships, model.formulaOneDrivers[0].formulaOneDriverChampionships)
        
        /// Testing and comparing that the formulaOneDriverNote is the same for the decoded model
        XCTAssertEqual(driver1.formulaOneDriverNote, model.formulaOneDrivers[0].formulaOneDriverNote)
        
        /// Testing and comparing that the formulaOneImageTitle is the same for the decoded model
        XCTAssertEqual(driver1.formulaOneDriverImageTitle, model.formulaOneDrivers[0].formulaOneDriverImageTitle)
        
        /// Testing and comparing that the formulaOneTeamTitle is the same for the decoded model
        XCTAssertEqual(driver1.formulaOneDriverTeamTitle, model.formulaOneDrivers[0].formulaOneDriverTeamTitle)
        
         /// Testing and comparing that the formulaOneChampionshipsTitle is the same for the decoded model
        XCTAssertEqual(driver1.formulaOneDriverChampionshipsTitle, model.formulaOneDrivers[0].formulaOneDriverChampionshipsTitle)
        
         /// Testing and comparing that the formulaOneNotesTitle is the same for the decoded model
        XCTAssertEqual(driver1.formulaOneDriverNotesTitle, model.formulaOneDrivers[0].formulaOneDriverNotesTitle)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

