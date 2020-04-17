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

    /// Setup function
    override func setUp() {
        
        formulaOneDriver = FormulaOneDriver(formulaOneDriverImage: "lewishH", formulaOneDriverName: "Lewis Hamilton", formulaOneDriverNationality: "United Kingdom", formulaOneDriverTeam: "Mercedes", formulaOneDriverChampionships: 6, formulaOneDriverRaceStarts: 250, formulaOneDriverRaceWins: 84, formulaOneDriverPodiums: 151, formulaOneDriverPolePositions: 88, formulaOneDriverFastestLaps: 47, formulaOneDriverLapsCompleted: 14216, formulaOneDriverCareerPoints: 3431)
        
        guard let formulaOneDriver = formulaOneDriver else {
            return
        }
        
        formulaOneDrivers = [formulaOneDriver]
           
        viewModel = ViewModel(formulaOneDrivers: formulaOneDrivers)
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

    /// Testing that the driver nationality is valid
    func testFormulaOneDriverNationality() {
        let driverNationality = "United Kingdom"
        XCTAssert(formulaOneDriver?.formulaOneDriverNationality == driverNationality)
        XCTAssertEqual(formulaOneDriver?.formulaOneDriverNationality, driverNationality)
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
    
    /// Testing that the driver number of race starts is valid
    func testFormulaOneDriverRaceStarts() {
        let driverRaceStarts = Int(250)
        XCTAssert(formulaOneDriver?.formulaOneDriverRaceStarts == driverRaceStarts)
        XCTAssertEqual(formulaOneDriver?.formulaOneDriverRaceStarts, driverRaceStarts)
    }
    
    /// Testing that the driver number of race wins is valid
    func testFormulaOneDriverRaceWins() {
        let driverRaceWins = Int(84)
        XCTAssert(formulaOneDriver?.formulaOneDriverRaceWins == driverRaceWins)
        XCTAssertEqual(formulaOneDriver?.formulaOneDriverRaceWins, driverRaceWins)
    }
    
    /// Testing that the driver number of podiums is valid
    func testFormulaOneDriverPodiums() {
        let driverPodiums = Int(151)
        XCTAssert(formulaOneDriver?.formulaOneDriverPodiums == driverPodiums)
        XCTAssertEqual(formulaOneDriver?.formulaOneDriverPodiums, driverPodiums)
    }
    
    /// Testing that the driver number of pole positions is valid
    func testFormulaOneDriverPolePositions() {
        let driverPolePositions = Int(88)
        XCTAssert(formulaOneDriver?.formulaOneDriverPolePositions == driverPolePositions)
        XCTAssertEqual(formulaOneDriver?.formulaOneDriverPolePositions, driverPolePositions)
    }
    
    /// Testing that the driver number of fastest laps is valid
    func testFormulaOneDriverFastestLaps() {
        let driverFastestLaps = Int(47)
        XCTAssert(formulaOneDriver?.formulaOneDriverFastestLaps == driverFastestLaps)
        XCTAssertEqual(formulaOneDriver?.formulaOneDriverFastestLaps, driverFastestLaps)
    }
    
    /// Testing that the driver number of laps completed is valid
    func testFormulaOneDriverLapsCompleted() {
        let driverLapsCompleted = Int(14216)
        XCTAssert(formulaOneDriver?.formulaOneDriverLapsCompleted == driverLapsCompleted)
        XCTAssertEqual(formulaOneDriver?.formulaOneDriverLapsCompleted, driverLapsCompleted)
    }
    
    /// Testing that the driver number of career points is valid
    func testFormulaOneDriverCareerPoints() {
        let driverCareerPoints = Int(3431)
        XCTAssert(formulaOneDriver?.formulaOneDriverCareerPoints == driverCareerPoints)
        XCTAssertEqual(formulaOneDriver?.formulaOneDriverCareerPoints, driverCareerPoints)
    }
    
    /// Testing the FormulaOneDriverArray
    func testFormulaOneDriverArray() {
        
        let formulaOneDriver: [FormulaOneDriver] = [FormulaOneDriver(formulaOneDriverImage: "lewishH", formulaOneDriverName: "Lewis Hamilton", formulaOneDriverNationality: "United Kingdom", formulaOneDriverTeam: "Mercedes", formulaOneDriverChampionships: 6, formulaOneDriverRaceStarts: 250, formulaOneDriverRaceWins: 84, formulaOneDriverPodiums: 151, formulaOneDriverPolePositions: 88, formulaOneDriverFastestLaps: 47, formulaOneDriverLapsCompleted: 14216, formulaOneDriverCareerPoints: 3431)]

        XCTAssert((formulaOneDriver as Any) is [FormulaOneDriver])
        
        XCTAssertEqual(formulaOneDriver.count, 1)
    }
    
    /// Testing the viewModel adding and removing formulaOneDrivers
    func testViewModel() {
        
        /// Adding a new FormulaOneDriver
        viewModel?.addFormulaOneDriver()
        
        /// Checking to see if the count is 2 as one has just been added
        XCTAssertEqual(viewModel?.formulaOneDrivers.count, 2)
        
        /// Removing the formulaOneDriver
        viewModel?.removeFormulaOneDriver(index: 0)
        
        XCTAssertEqual(viewModel?.formulaOneDrivers.count, 1)
        
        /// Testing the Image URL by updating it and getting the new image
        formulaOneDriver?.updateFormulaOneDriverImage(imageURL: "https://s3-eu-west-1.amazonaws.com/motorsport-magazine/wp-content/uploads/2019/10/02112526/lewis_hamilton_mexico_thursday.jpg")
        XCTAssert((formulaOneDriver?.getFormulaOneDriverImage() as Any) is Image)
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

