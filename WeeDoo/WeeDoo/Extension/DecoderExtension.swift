//
//  DecoderExtension.swift
//  Bartr
//
//  Created by Thuy Luong on 5/31/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import Foundation
//import Gloss
/*
extension Decoder {
    
    static func decodeImageUrl(json: JSON, key: String) -> String? {
        if let imageUrl = json[key] as? String {
            if imageUrl.containsString("/Images/") {
                return TinryAPI.properImageBaseUrl + imageUrl
            }
            else {
                return imageUrl
            }
        }
        return nil
    }
    
    static func decodeImageUrl(json: JSON) -> String? {
        if let imageUrl = json["Image"] as? String {
            if imageUrl.containsString("Images/") {
                return TinryAPI.properImageBaseUrl + imageUrl
            }
            else {
                return imageUrl
            }
        }
        return nil
    }
    
    static func decodeServiceType(json : JSON) -> ServiceType? {
        if let serviceType = json["ServiceType"] as? Int {
            return ServiceType(rawValue: serviceType)
        }
        return nil
    }
    
    static func decodeOfferStatus(json : JSON) -> OfferStatus? {
        if let status = json["Status"] as? Int {
            return OfferStatus(rawValue: status)
        }
        return nil
    }
    
    static func decodeTimeslotStatus(json: JSON) -> TimeslotStatus? {
        if let status = json["Status"] as? Int {
            return TimeslotStatus(rawValue: status)
        }
        return nil
    }
    
    static func decodeFlightPrice(json: JSON) -> Float? {
        if let flightPrice = json["FlightPrice"]?.firstObject as? JSON,
               price = flightPrice["Price"] as? Float {
            return price
        }
        return nil
    }
    
    static func decodeCurrency(json: JSON) -> String? {
        if let flightPrice = json["FlightPrice"]?.firstObject as? JSON,
            currency = flightPrice["Currency"] as? String {
            return currency
        }
        return nil
    }
    
    static func decodeFlightOfferId(json: JSON) -> String? {
        if let flightPrice = json["FlightPrice"]?.firstObject as? JSON,
            flightOfferId = flightPrice["Id"] as? String {
            return flightOfferId
        }
        return nil
    }
    
    static func decodeFLightOfferImageUrl(json: JSON) -> String? {
        if let flightPrice = json["FlightPrice"]?.firstObject as? JSON,
            imageUrl = flightPrice["ImageUrl"] as? String {
            return imageUrl
        }
        return nil
    }
    
    static func decodeFLightOfferCarrierName(json: JSON) -> String? {
        if let outbound = json["Outbound"] as? JSON,
            carrier = outbound["Carrier"]?.firstObject as? JSON,
            name = carrier["Name"] as? String {
            return name
        }
        return nil
    }
    
    static func decodeTripStatus(json: JSON) -> TripStatus? {
        if let status = json["Status"] as? Int {
            return TripStatus(rawValue: status)
        }
        return nil
    }
}*/
