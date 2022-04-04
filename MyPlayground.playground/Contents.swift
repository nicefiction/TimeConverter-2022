/// Source:
/// https://www.hackingwithswift.com/example-code/system/how-to-convert-units-using-unit-and-measurement

import SwiftUI


let heightFeet = Measurement(value: 6.00,
                             unit: UnitLength.feet)

let heightInches = heightFeet.converted(to: UnitLength.inches).formatted()
let heightCentimeter = heightFeet.converted(to: UnitLength.centimeters).formatted()
let heightMillimeter = heightFeet.converted(to: UnitLength.millimeters).formatted()
let heightAstronomical = heightFeet.converted(to: UnitLength.astronomicalUnits).formatted()


