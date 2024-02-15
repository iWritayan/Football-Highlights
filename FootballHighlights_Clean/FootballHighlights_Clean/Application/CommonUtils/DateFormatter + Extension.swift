//
//  DateFormatter + Extension.swift
//  FootballHighlights_Clean
//
//  Created by Writayan Das on 07/02/24.
//

import Foundation

extension Date {

    enum DateStyle {

        case medium

        var formatter: DateFormatter {
            switch self {
            case .medium:
                let formatter = DateFormatter()
                formatter.dateStyle = .medium
                return formatter
            }
        }
    }

    func string(dateStyle: DateStyle) -> String {
        return dateStyle.formatter.string(from: self)
    }
}
