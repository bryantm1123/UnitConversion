import Foundation

public protocol UnitConversionProviding {
    func convertTemperature(value: Double, fromUnit: UnitTemperature, toUnit: UnitTemperature) -> Measurement<UnitTemperature>
    func convertDistance(value: Double, fromUnit: UnitLength, toUnit: UnitLength) -> Measurement<UnitLength>
    func convertTime(value: Double, fromUnit: UnitDuration, toUnit: UnitDuration) -> Measurement<UnitDuration>
}

final class UnitConversionProvider: UnitConversionProviding {
    func convertTemperature(value: Double, fromUnit: UnitTemperature, toUnit: UnitTemperature) -> Measurement<UnitTemperature> {
        Measurement(value: value, unit: fromUnit).converted(to: toUnit)
    }
    
    func convertDistance(value: Double, fromUnit: UnitLength, toUnit: UnitLength) -> Measurement<UnitLength> {
        Measurement(value: value, unit: fromUnit).converted(to: toUnit)
    }
    
    func convertTime(value: Double, fromUnit: UnitDuration, toUnit: UnitDuration) -> Measurement<UnitDuration> {
        Measurement(value: value, unit: fromUnit).converted(to: toUnit)
    }
}
