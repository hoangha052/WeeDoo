//
//  Constant.swift
//  WeeDoo
//
//  Created by hoangha052 on 9/11/16.
//  Copyright © 2016 HoangHa. All rights reserved.
//

import Foundation
struct Constants {
    static let GOOGLE_API_KEY = "AIzaSyDiV6P3ZeiQtgnciWtNL-WPi_5kwEVBiyg"
    static let tabBarHeight: CGFloat = 49
    static let sizePageLoad = 10
    static let TinryKeychainService = "TinryKeychainService"
    static let TinryDeviceTokenKeychain = "TinryDeviceKeychain"
    
    struct Storyboard {
        static let authentication = "Authetication"
        static let search = "Search"
        static let main = "Main"
        static let calendar = "Calendar"
        static let tripProfile = "TripProfile"
        static let tinry = "Tinry"
        static let mylisting = "MyListing"
        static let offer = "Offer"
        static let imagePicker = "ImagePicker"
        static let mainProvider = "MainProvider"
        static let tripProvider = "TripProvider"
    }
    
    struct Notification {
        static let ImagePickDone = "ImagePickDone"
        static let CancelSearching = "CancelSearching"
        static let UserDidLogout = "UserDidLogout"
        static let FCMTokenFetched = "FCMTokenFetched"
        static let DidGetTinryDetail = "DidGetTinryDetail"
        static let DidUpdateTripProfile = "DidUpdateTripProfile"
        static let DidAcceptFlightOffer = "DidAcceptFlightOffer"
        
        // Remote notification
        static let Flight = "Flight"
        
        static let ReloadDataSearchTripProfile = "ReloadDataSearchTripProfile"
    }
    
    struct UserDefaultKey {
        static let facebookToken = "FACEBOOK_TOKEN"
        static let facebookEmail = "FACEBOOK_EMAIL"
        static let deviceToken = "DEVICE_TOKEN"
    }
}

struct AppColors {
    static let main = "#f58027"
    static let mainBackground = "#00b29c"
    static let mainGray = "#959595"
    static let buttonNormalState = "#959595"
    static let buttonSelectedState = "#00aeef"
    static let requiredFieldSign = "#ed2a32"
    static let hashtagText = "#ffffff"
    static let searchFilterHeader = "#959595"
    static let textLightGray = "#898989"
    static let stuffHighlight = "#2fbaee"
    static let formText = "#545454"
    static let sectionHeaderBackground = "#e9e9e9"
    static let receivedOfferCellBackground = "#ffffff"
    static let sentOfferCellBackground = "#f4f4f4"
}