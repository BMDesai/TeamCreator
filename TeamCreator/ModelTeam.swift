//
import Foundation

struct ModelTeam : Codable {

    var teamData : [TeamData]
    let message : String
    let status : Bool


    enum CodingKeys: String, CodingKey {
        case teamData = "data"
        case message = "message"
        case status = "status"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        teamData = try values.decodeIfPresent([TeamData].self, forKey: .teamData)!
        message = try values.decodeIfPresent(String.self, forKey: .message)!
        status = try values.decodeIfPresent(Bool.self, forKey: .status)!
    }


}

struct TeamData : Codable {
    var isSelected : Bool
    var isCaptain : Bool
    var isViceCaptain : Bool
    var battingStyle : String
    let birthdate : String
    let birthplace : String
    let bowlingStyle : String
    let country : String
    let fantasyPlayerRating : Double
    let fieldingPosition : String
    let firstName : String
    let isAnnounce : Bool
    let lastName : String
    let logoUrl : String
    let middleName : String
    let nationalFlag : String
    let nationality : String?
    let pid : Int
    let playingRole : String
    let points : String
    let primaryTeam : [String]
    let recentAppearance : Int
    let recentMatch : Int
    let seriesPoints : Int
    let shortName : String
    let team : String
    let thumbUrl : String
    let title : String
    
    enum CodingKeys: String, CodingKey {
        case isSelected = ""
        case isCaptain = "0"
        case isViceCaptain = "1"
        case battingStyle = "batting_style"
        case birthdate = "birthdate"
        case birthplace = "birthplace"
        case bowlingStyle = "bowling_style"
        case country = "country"
        case fantasyPlayerRating = "fantasy_player_rating"
        case fieldingPosition = "fielding_position"
        case firstName = "first_name"
        case isAnnounce = "isAnnounce"
        case lastName = "last_name"
        case logoUrl = "logo_url"
        case middleName = "middle_name"
        case nationalFlag = "national_flag"
        case nationality = "nationality"
        case pid = "pid"
        case playingRole = "playing_role"
        case points = "points"
        case primaryTeam = "primary_team"
        case recentAppearance = "recent_appearance"
        case recentMatch = "recent_match"
        case seriesPoints = "seriesPoints"
        case shortName = "short_name"
        case team = "team"
        case thumbUrl = "thumb_url"
        case title = "title"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        isSelected = try values.decodeIfPresent(Bool.self, forKey: .isSelected) ?? false
        isCaptain = try values.decodeIfPresent(Bool.self, forKey: .isCaptain) ?? false
        isViceCaptain = try values.decodeIfPresent(Bool.self, forKey: .isViceCaptain) ?? false
        battingStyle = try values.decodeIfPresent(String.self, forKey: .battingStyle)!
        birthdate = try values.decodeIfPresent(String.self, forKey: .birthdate)!
        birthplace = try values.decodeIfPresent(String.self, forKey: .birthplace)!
        bowlingStyle = try values.decodeIfPresent(String.self, forKey: .bowlingStyle)!
        country = try values.decodeIfPresent(String.self, forKey: .country)!
        fantasyPlayerRating = try values.decodeIfPresent(Double.self, forKey: .fantasyPlayerRating)!
        fieldingPosition = try values.decodeIfPresent(String.self, forKey: .fieldingPosition)!
        firstName = try values.decodeIfPresent(String.self, forKey: .firstName)!
        isAnnounce = try values.decodeIfPresent(Bool.self, forKey: .isAnnounce)!
        lastName = try values.decodeIfPresent(String.self, forKey: .lastName)!
        logoUrl = try values.decodeIfPresent(String.self, forKey: .logoUrl)!
        middleName = try values.decodeIfPresent(String.self, forKey: .middleName)!
        nationalFlag = try values.decodeIfPresent(String.self, forKey: .nationalFlag)!
        nationality = try values.decodeIfPresent(String.self, forKey: .nationality) ?? ""
        pid = try values.decodeIfPresent(Int.self, forKey: .pid)!
        playingRole = try values.decodeIfPresent(String.self, forKey: .playingRole)!
        points = try values.decodeIfPresent(String.self, forKey: .points)!
        primaryTeam = try values.decodeIfPresent([String].self, forKey: .primaryTeam)!
        recentAppearance = try values.decodeIfPresent(Int.self, forKey: .recentAppearance)!
        recentMatch = try values.decodeIfPresent(Int.self, forKey: .recentMatch)!
        seriesPoints = try values.decodeIfPresent(Int.self, forKey: .seriesPoints) ?? 0
        shortName = try values.decodeIfPresent(String.self, forKey: .shortName)!
        team = try values.decodeIfPresent(String.self, forKey: .team)!
        thumbUrl = try values.decodeIfPresent(String.self, forKey: .thumbUrl)!
        title = try values.decodeIfPresent(String.self, forKey: .title)!
    }


}
