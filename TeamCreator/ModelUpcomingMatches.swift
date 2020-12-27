//
//  ModelUpcomingMatches.swift
//  Sportzax
//
//  Created by Bhaumik on 23/08/20.
//

import UIKit

struct ModelUpcomingMatches : Codable {

    let matcheData : [MatcheData]?
    let message : String?
    let status : Bool?

    enum CodingKeys: String, CodingKey {
        case matcheData = "data"
        case message = "message"
        case status = "status"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        matcheData = try values.decodeIfPresent([MatcheData].self, forKey: .matcheData)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
    }
}

struct MatcheData : Codable {

    let id : String?
    let amountSent : Int?
    let commentary : String?
    let competition : Competition?
    let created : String?
    let dateEnd : String?
    let dateStart : String?
    let domestic : String?
    let equation : String?
    let format : String?
    let formatStr : String?
    let gameState : String?
    let gameStateStr : String?
    let latestInningNumber : String?
    let live : String?
    let matchId : String?
    let modified : String?
    let mom : Int?
    let oddsAvailable : String?
    let playerPoints : [String]?
    let preSquad : String?
    let rankAnnounced : Int?
    let referee : String?
    let result : String?
    let resultType : String?
    let seariesPointAdded : Int?
    let shortTitle : String?
    let status : String?
    let statusNote : String?
    let statusStr : String?
    let subtitle : String?
    let teamAnnounced : Int?
    let teamCount : Int?
    let teama : Teama?
    let teamb : Teama?
    let timestampEnd : String?
    let timestampStart : String?
    let title : String?
    let toss : Tos?
    let umpires : String?
    let venue : Venue?
    let verified : String?
    let wagon : String?
    let winMargin : String?
    let winningTeamId : String?


    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case amountSent = "amountSent"
        case commentary = "commentary"
        case competition
        case created = "created"
        case dateEnd = "date_end"
        case dateStart = "date_start"
        case domestic = "domestic"
        case equation = "equation"
        case format = "format"
        case formatStr = "format_str"
        case gameState = "game_state"
        case gameStateStr = "game_state_str"
        case latestInningNumber = "latest_inning_number"
        case live = "live"
        case matchId = "match_id"
        case modified = "modified"
        case mom = "mom"
        case oddsAvailable = "odds_available"
        case playerPoints = "playerPoints"
        case preSquad = "pre_squad"
        case rankAnnounced = "rankAnnounced"
        case referee = "referee"
        case result = "result"
        case resultType = "result_type"
        case seariesPointAdded = "seariesPointAdded"
        case shortTitle = "short_title"
        case status = "status"
        case statusNote = "status_note"
        case statusStr = "status_str"
        case subtitle = "subtitle"
        case teamAnnounced = "teamAnnounced"
        case teamCount = "teamCount"
        case teama
        case teamb
        case timestampEnd = "timestamp_end"
        case timestampStart = "timestamp_start"
        case title = "title"
        case toss
        case umpires = "umpires"
        case venue
        case verified = "verified"
        case wagon = "wagon"
        case winMargin = "win_margin"
        case winningTeamId = "winning_team_id"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        amountSent = try values.decodeIfPresent(Int.self, forKey: .amountSent)
        commentary = try values.decodeIfPresent(String.self, forKey: .commentary)
        competition = try values.decodeIfPresent(Competition.self, forKey: .competition)
        created = try values.decodeIfPresent(String.self, forKey: .created)
        dateEnd = try values.decodeIfPresent(String.self, forKey: .dateEnd)
        dateStart = try values.decodeIfPresent(String.self, forKey: .dateStart)
        domestic = try values.decodeIfPresent(String.self, forKey: .domestic)
        equation = try values.decodeIfPresent(String.self, forKey: .equation)
        format = try values.decodeIfPresent(String.self, forKey: .format)
        formatStr = try values.decodeIfPresent(String.self, forKey: .formatStr)
        gameState = try values.decodeIfPresent(String.self, forKey: .gameState)
        gameStateStr = try values.decodeIfPresent(String.self, forKey: .gameStateStr)
        latestInningNumber = try values.decodeIfPresent(String.self, forKey: .latestInningNumber)
        live = try values.decodeIfPresent(String.self, forKey: .live)
        matchId = try values.decodeIfPresent(String.self, forKey: .matchId)
        modified = try values.decodeIfPresent(String.self, forKey: .modified)
        mom = try values.decodeIfPresent(Int.self, forKey: .mom)
        oddsAvailable = try values.decodeIfPresent(String.self, forKey: .oddsAvailable)
        playerPoints = try values.decodeIfPresent([String].self, forKey: .playerPoints)
        preSquad = try values.decodeIfPresent(String.self, forKey: .preSquad)
        rankAnnounced = try values.decodeIfPresent(Int.self, forKey: .rankAnnounced)
        referee = try values.decodeIfPresent(String.self, forKey: .referee)
        result = try values.decodeIfPresent(String.self, forKey: .result)
        resultType = try values.decodeIfPresent(String.self, forKey: .resultType)
        seariesPointAdded = try values.decodeIfPresent(Int.self, forKey: .seariesPointAdded)
        shortTitle = try values.decodeIfPresent(String.self, forKey: .shortTitle)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        statusNote = try values.decodeIfPresent(String.self, forKey: .statusNote)
        statusStr = try values.decodeIfPresent(String.self, forKey: .statusStr)
        subtitle = try values.decodeIfPresent(String.self, forKey: .subtitle)
        teamAnnounced = try values.decodeIfPresent(Int.self, forKey: .teamAnnounced)
        teamCount = try values.decodeIfPresent(Int.self, forKey: .teamCount)
        teama = try values.decodeIfPresent(Teama.self, forKey: .teama)
        teamb = try values.decodeIfPresent(Teama.self, forKey: .teamb)
        timestampEnd = try values.decodeIfPresent(String.self, forKey: .timestampEnd)
        timestampStart = try values.decodeIfPresent(String.self, forKey: .timestampStart)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        toss = try Tos(from: decoder)
        umpires = try values.decodeIfPresent(String.self, forKey: .umpires)
        venue = try Venue(from: decoder)
        verified = try values.decodeIfPresent(String.self, forKey: .verified)
        wagon = try values.decodeIfPresent(String.self, forKey: .wagon)
        winMargin = try values.decodeIfPresent(String.self, forKey: .winMargin)
        winningTeamId = try values.decodeIfPresent(String.self, forKey: .winningTeamId)
    }


}

struct Venue : Codable {

    let location : String?
    let name : String?
    let timezone : String?


    enum CodingKeys: String, CodingKey {
        case location = "location"
        case name = "name"
        case timezone = "timezone"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        location = try values.decodeIfPresent(String.self, forKey: .location)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        timezone = try values.decodeIfPresent(String.self, forKey: .timezone)
    }


}

struct Tos : Codable {

    let decision : Int?
    let winner : Int?


    enum CodingKeys: String, CodingKey {
        case decision = "decision"
        case winner = "winner"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        decision = try values.decodeIfPresent(Int.self, forKey: .decision)
        winner = try values.decodeIfPresent(Int.self, forKey: .winner)
    }


}

struct Teama : Codable {

    let logoUrl : String?
    let name : String?
    let shortName : String?
    let teamId : Int?


    enum CodingKeys: String, CodingKey {
        case logoUrl = "logo_url"
        case name = "name"
        case shortName = "short_name"
        case teamId = "team_id"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        logoUrl = try values.decodeIfPresent(String.self, forKey: .logoUrl)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        shortName = try values.decodeIfPresent(String.self, forKey: .shortName)
        teamId = try values.decodeIfPresent(Int.self, forKey: .teamId)
    }


}

struct Competition : Codable {

    let abbr : String?
    let category : String?
    let cid : Int?
    let country : String?
    let dateend : String?
    let datestart : String?
    let matchFormat : String?
    let season : String?
    let status : String?
    let title : String?
    let totalMatches : String?
    let totalRounds : String?
    let totalTeams : String?
    let type : String?


    enum CodingKeys: String, CodingKey {
        case abbr = "abbr"
        case category = "category"
        case cid = "cid"
        case country = "country"
        case dateend = "dateend"
        case datestart = "datestart"
        case matchFormat = "match_format"
        case season = "season"
        case status = "status"
        case title = "title"
        case totalMatches = "total_matches"
        case totalRounds = "total_rounds"
        case totalTeams = "total_teams"
        case type = "type"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        abbr = try values.decodeIfPresent(String.self, forKey: .abbr)
        category = try values.decodeIfPresent(String.self, forKey: .category)
        cid = try values.decodeIfPresent(Int.self, forKey: .cid)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        dateend = try values.decodeIfPresent(String.self, forKey: .dateend)
        datestart = try values.decodeIfPresent(String.self, forKey: .datestart)
        matchFormat = try values.decodeIfPresent(String.self, forKey: .matchFormat)
        season = try values.decodeIfPresent(String.self, forKey: .season)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        totalMatches = try values.decodeIfPresent(String.self, forKey: .totalMatches)
        totalRounds = try values.decodeIfPresent(String.self, forKey: .totalRounds)
        totalTeams = try values.decodeIfPresent(String.self, forKey: .totalTeams)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }


}
