import XCTest
@testable import UnitConversion

final class UnitConversionProviderTests: XCTestCase {
    
    var subject: UnitConversionProviding!
    
    override func setUpWithError() throws {
        subject = UnitConversionProvider()
    }
    
    override func tearDownWithError() throws {
        subject = nil
    }
    
    func testConversionFromCelciusToFahrenheit() {
        let testValue = 0.0
        let fahrenheit = subject.convertTemperature(value: testValue, fromUnit: .celsius, toUnit: .fahrenheit)
        XCTAssertEqual(fahrenheit.value.rounded(.toNearestOrAwayFromZero), 32.0)
    }
    
    func testConversionFromFahrenheitToCelcius() {
        let testValue = 32.0
        let celcius = subject.convertTemperature(value: testValue, fromUnit: .fahrenheit, toUnit: .celsius)
        XCTAssertEqual(celcius.value.rounded(.toNearestOrAwayFromZero), 0.0)
    }
    
    func testConversionFromMilesToKilometers() {
        let testValue = 3.2
        let kilometers = subject.convertDistance(value: testValue, fromUnit: .miles, toUnit: .kilometers)
        XCTAssertEqual(kilometers.value.rounded(.toNearestOrAwayFromZero), 5.0)
    }
    
    func testConversionFromKilometersToMiles() {
        let testValue = 5.0
        let miles = subject.convertDistance(value: testValue, fromUnit: .kilometers, toUnit: .miles)
        XCTAssertEqual(miles.value.rounded(.toNearestOrAwayFromZero), 3.0)
    }
    
    @available(iOS 13.0, *)
    func testConversionFromSecondsToMilliseconds() {
        let testValue = 1.0
        let milliseconds = subject.convertTime(value: testValue, fromUnit: .seconds, toUnit: .milliseconds)
        XCTAssertEqual(milliseconds.value.rounded(.toNearestOrAwayFromZero), 1000.0)
    }
    
    @available(iOS 13.0, *)
    func testConversionFromMillisecondsToSeconds() {
        let testValue = 1000.0
        let seconds = subject.convertTime(value: testValue, fromUnit: .milliseconds, toUnit: .seconds)
        XCTAssertEqual(seconds.value.rounded(.toNearestOrAwayFromZero), 1.0)
    }
    
    func testConvert12HourTimeTo24HourTime() {
        let testTime = "8:30 PM"
        let testResult = "20:30"
        
        let result = subject.convertTime(from: testTime)
        XCTAssertEqual(result, testResult)
    }
    
    func testConvert24HourTimeTo12HourTime() {
        let testTime = "20:30"
        let testResult = "8:30 PM"
        
        let result = subject.convertTime(from: testTime)
        XCTAssertEqual(result, testResult)
    }
    
    func testTimeConverterReturnsNilOnInvalidInputFormat() {
        let testTime = "20:30 PM"
        
        let result = subject.convertTime(from: testTime)
        XCTAssertNil(result)
    }
}
