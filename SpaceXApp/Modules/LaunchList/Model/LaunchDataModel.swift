//
//  LaunchDataModel.swift
//  SpaceXApp
//
//  Created by Amit Rawal on 13/01/24.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)


// MARK: - WelcomeElement
struct LaunchDataModel: Codable {
    let flightNumber: Int
    let missionName: String
    let missionID: [String]
    let upcoming: Bool
    let launchYear: String
    let launchDateUnix: Int
    let launchDateUTC: String
    let launchDateLocal: Date
    let isTentative: Bool
    let tentativeMaxPrecision: TentativeMaxPrecision
    let tbd: Bool
    let launchWindow: Int?
    let rocket: Rocket
    let ships: [String]
    let telemetry: Telemetry
    let launchSite: LaunchSite
    let launchSuccess: Bool?
    let launchFailureDetails: LaunchFailureDetails?
    let links: Links
    let details, staticFireDateUTC: String?
    let staticFireDateUnix: Int?
    let timeline: [String: Int?]?
    let lastDateUpdate: String?
    let lastLlLaunchDate, lastLlUpdate: String?
    let lastWikiLaunchDate, lastWikiRevision, lastWikiUpdate: String?
    let launchDateSource: LaunchDateSource?

    enum CodingKeys: String, CodingKey {
        case flightNumber
        case missionName
        case missionID
        case upcoming
        case launchYear
        case launchDateUnix
        case launchDateUTC
        case launchDateLocal
        case isTentative
        case tentativeMaxPrecision
        case tbd
        case launchWindow
        case rocket, ships, telemetry
        case launchSite
        case launchSuccess
        case launchFailureDetails
        case links, details
        case staticFireDateUTC
        case staticFireDateUnix
        case timeline, crew
        case lastDateUpdate
        case lastLlLaunchDate
        case lastLlUpdate
        case lastWikiLaunchDate
        case lastWikiRevision
        case lastWikiUpdate
        case launchDateSource
    }
}

enum LaunchDateSource: String, Codable {
    case launchLibrary = "launch_library"
    case wiki = "wiki"
}

// MARK: - LaunchFailureDetails
struct LaunchFailureDetails: Codable {
    let time: Int
    let altitude: Int?
    let reason: String
}

// MARK: - LaunchSite
struct LaunchSite: Codable {
    let siteID: SiteID
    let siteName: SiteName
    let siteNameLong: SiteNameLong

    enum CodingKeys: String, CodingKey {
        case siteID
        case siteName
        case siteNameLong
    }
}

enum SiteID: String, Codable {
    case ccafsSlc40 = "ccafs_slc_40"
    case kscLc39A = "ksc_lc_39a"
    case kwajaleinAtoll = "kwajalein_atoll"
    case vafbSlc4E = "vafb_slc_4e"
}

enum SiteName: String, Codable {
    case ccafsSlc40 = "CCAFS SLC 40"
    case kscLc39A = "KSC LC 39A"
    case kwajaleinAtoll = "Kwajalein Atoll"
    case vafbSlc4E = "VAFB SLC 4E"
}

enum SiteNameLong: String, Codable {
    case capeCanaveralAirForceStationSpaceLaunchComplex40 = "Cape Canaveral Air Force Station Space Launch Complex 40"
    case kennedySpaceCenterHistoricLaunchComplex39A = "Kennedy Space Center Historic Launch Complex 39A"
    case kwajaleinAtollOmelekIsland = "Kwajalein Atoll Omelek Island"
    case vandenbergAirForceBaseSpaceLaunchComplex4E = "Vandenberg Air Force Base Space Launch Complex 4E"
}

// MARK: - Links
struct Links: Codable {
    let missionPatch, missionPatchSmall: String?
    let redditCampaign: String?
    let redditLaunch: String?
    let redditRecovery, redditMedia: String?
    let presskit: String?
    let articleLink: String?
    let wikipedia, videoLink: String?
    let youtubeID: String?
    let flickrImages: [String]

    enum CodingKeys: String, CodingKey {
        case missionPatch
        case missionPatchSmall
        case redditCampaign
        case redditLaunch
        case redditRecovery
        case redditMedia
        case presskit
        case articleLink
        case wikipedia
        case videoLink
        case youtubeID
        case flickrImages
    }
}

// MARK: - Rocket
struct Rocket: Codable {
    let rocketID: RocketID
    let rocketName: RocketName
    let rocketType: RocketType
    let firstStage: FirstStage
    let secondStage: SecondStage
    let fairings: Fairings?

    enum CodingKeys: String, CodingKey {
        case rocketID
        case rocketName
        case rocketType
        case firstStage
        case secondStage
        case fairings
    }
}

// MARK: - Fairings
struct Fairings: Codable {
    let reused, recoveryAttempt, recovered: Bool?
    let ship: Ship?

    enum CodingKeys: String, CodingKey {
        case reused
        case recoveryAttempt
        case recovered, ship
    }
}

enum Ship: String, Codable {
    case gomschief = "GOMSCHIEF"
    case gomstree = "GOMSTREE"
    case gosearcher = "GOSEARCHER"
}

// MARK: - FirstStage
struct FirstStage: Codable {
    let cores: [Core]
}

// MARK: - Core
struct Core: Codable {
    let coreSerial: String?
    let flight, block: Int?
    let gridfins, legs, reused, landSuccess: Bool?
    let landingIntent: Bool?
    let landingType: LandingType?
    let landingVehicle: LandingVehicle?

    enum CodingKeys: String, CodingKey {
        case coreSerial
        case flight, block, gridfins, legs, reused
        case landSuccess
        case landingIntent
        case landingType
        case landingVehicle
    }
}

enum LandingType: String, Codable {
    case asds = "ASDS"
    case ocean = "Ocean"
    case rtls = "RTLS"
}

enum LandingVehicle: String, Codable {
    case jrti = "JRTI"
    case jrti1 = "JRTI-1"
    case lz1 = "LZ-1"
    case lz2 = "LZ-2"
    case lz4 = "LZ-4"
    case ocisly = "OCISLY"
}

enum RocketID: String, Codable {
    case falcon1 = "falcon1"
    case falcon9 = "falcon9"
    case falconheavy = "falconheavy"
}

enum RocketName: String, Codable {
    case falcon1 = "Falcon 1"
    case falcon9 = "Falcon 9"
    case falconHeavy = "Falcon Heavy"
}

enum RocketType: String, Codable {
    case ft = "FT"
    case merlinA = "Merlin A"
    case merlinC = "Merlin C"
    case v10 = "v1.0"
    case v11 = "v1.1"
}

// MARK: - SecondStage
struct SecondStage: Codable {
    let block: Int?
    let payloads: [Payload]
}

// MARK: - Payload
struct Payload: Codable {
    let payloadID: String
    let noradID: [Int]
    let reused: Bool
    let customers: [String]
    let nationality: String?
    let manufacturer: String?
    let payloadType: PayloadType
    let payloadMassKg, payloadMassLbs: Double?
    let orbit: String
    let orbitParams: OrbitParams
    let capSerial: String?
    let massReturnedKg, massReturnedLbs: Double?
    let flightTimeSEC: Int?
    let cargoManifest: String?
    let uid: String?

    enum CodingKeys: String, CodingKey {
        case payloadID
        case noradID
        case reused, customers, nationality, manufacturer
        case payloadType
        case payloadMassKg
        case payloadMassLbs
        case orbit
        case orbitParams
        case capSerial
        case massReturnedKg
        case massReturnedLbs
        case flightTimeSEC
        case cargoManifest
        case uid
    }
}

// MARK: - OrbitParams
struct OrbitParams: Codable {
    let referenceSystem: ReferenceSystem?
    let regime: Regime?
    let longitude, semiMajorAxisKM, eccentricity, periapsisKM: Double?
    let apoapsisKM, inclinationDeg, periodMin, lifespanYears: Double?
    let epoch: String?
    let meanMotion, raan: Double?
    let argOfPericenter, meanAnomaly: Double?

    enum CodingKeys: String, CodingKey {
        case referenceSystem
        case regime, longitude
        case semiMajorAxisKM
        case eccentricity
        case periapsisKM
        case apoapsisKM
        case inclinationDeg
        case periodMin
        case lifespanYears
        case epoch
        case meanMotion
        case raan
        case argOfPericenter
        case meanAnomaly
    }
}

enum ReferenceSystem: String, Codable {
    case geocentric = "geocentric"
    case heliocentric = "heliocentric"
    case highlyElliptical = "highly-elliptical"
}

enum Regime: String, Codable {
    case geostationary = "geostationary"
    case geosynchronous = "geosynchronous"
    case highEarth = "high-earth"
    case highlyElliptical = "highly-elliptical"
    case l1Point = "L1-point"
    case lowEarth = "low-earth"
    case mediumEarth = "medium-earth"
    case semiSynchronous = "semi-synchronous"
    case subOrbital = "sub-orbital"
    case sunSynchronous = "sun-synchronous"
    case veryLowEarth = "very-low-earth"
}

enum PayloadType: String, Codable {
    case crewDragon = "Crew Dragon"
    case dragon10 = "Dragon 1.0"
    case dragon11 = "Dragon 1.1"
    case dragon20 = "Dragon 2.0"
    case dragonBoilerplate = "Dragon Boilerplate"
    case lander = "Lander"
    case satellite = "Satellite"
}

// MARK: - Telemetry
struct Telemetry: Codable {
    let flightClub: String?

    enum CodingKeys: String, CodingKey {
        case flightClub
    }
}

enum TentativeMaxPrecision: String, Codable {
    case hour = "hour"
}


