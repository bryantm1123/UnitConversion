import Foundation

public protocol UnitConversionProviding {
    func convertTemperature(value: Double, fromUnit: UnitTemperature, toUnit: UnitTemperature) -> Measurement<UnitTemperature>
    func convertDistance(value: Double, fromUnit: UnitLength, toUnit: UnitLength) -> Measurement<UnitLength>
    func convertTime(value: Double, fromUnit: UnitDuration, toUnit: UnitDuration) -> Measurement<UnitDuration>
    func convertTime(from time: String) -> String?
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
    
    func convertTime(from time: String) -> String? {
        let dateFormatter = DateFormatter()
        
        // Handle 12 hour to 24 hour conversion
        dateFormatter.dateFormat = "h:mm a"
        if let date = dateFormatter.date(from: time) {
            dateFormatter.dateFormat = "HH:mm"
            return dateFormatter.string(from: date)
        }
        
        // Handle 24 hour to 12 hour conversion
        dateFormatter.dateFormat = "HH:mm"
        if let date = dateFormatter.date(from: time) {
            dateFormatter.dateFormat = "h:mm a"
            return dateFormatter.string(from: date)
        }

        return nil // Invalid input format
    }
}
