//
//  SearchResult.swift
//  Picture Me
//
//  Created by Narcis Zait on 22/11/2019.
//  Copyright © 2019 Narcis Zait. All rights reserved.
//

import Foundation

// MARK: - SearchResult
struct Search: Codable {
    let data: [Datum]?
    let meta: Meta?
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case meta = "meta"
    }
}

// MARK: - Datum
struct Datum: Codable {
    let id: Int?
    let datumDescription: String?
    let image: Image?
    let counts: DatumCounts?
    let createdAt, updatedAt: String?
    let uploader: Artist?
//    let client: String? //was coming as null
    let artist: Artist?
    let shop: Shop?
    let popularity: Int?
    let explicit: Bool?
    let classification: Classification?
    let shareUrl: String?
    let isUsers: Bool?
    let postType: PostType?
    let videoStreams: String? //was coming as null

    enum CodingKeys: String, CodingKey {
        case id
        case datumDescription = "description"
        case image, counts
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case uploader, artist, shop, popularity, explicit, classification //client,
        case shareUrl = "share_url"
        case isUsers = "is_users"
        case postType = "post_type"
        case videoStreams = "video_streams"
    }
}

// MARK: - Artist
struct Artist: Codable {
    let id: Int?
    let name, username: String?
    let imageUrl: String?
    let userType: UserType?
    let isVerified: Bool?
    let artistId: Int?
    let artistPlan: Plan?
    let allowBookings, allowMessages: Bool? //was coming as null
    let counts: ArtistCounts?
    let numberOfTattoos: Int? //was coming as null
    let location: ArtistLocation?

    enum CodingKeys: String, CodingKey {
        case id, name, username
        case imageUrl = "image_url"
        case userType = "user_type"
        case isVerified = "is_verified"
        case artistId = "artist_id"
        case artistPlan = "artist_plan"
        case allowBookings = "allow_bookings"
        case allowMessages = "allow_messages"
        case counts
        case numberOfTattoos = "number_of_tattoos"
        case location
    }
}

enum Plan: String, Codable {
    case free = "free"
    case pro = "pro"
}

// MARK: - ArtistCounts
struct ArtistCounts: Codable {
    let posts, mentions, comments, following: Int?
    let followers: Int?
}

// MARK: - ArtistLocation
struct ArtistLocation: Codable {
    let latitude, longitude: Double?
    let name: String?
}

enum UserType: String, Codable {
    case artist = "artist"
    case standard = "standard"
}

// MARK: - Classification
struct Classification: Codable {
    let hashtags, styles, motifs: [String]?
}

// MARK: - DatumCounts
struct DatumCounts: Codable {
    let likes, comments, pins: Int?
}

// MARK: - Image
struct Image: Codable {
    let url: String?
    let width, height: Int?
}

enum PostType: String, Codable {
    case image = "image"
}

// MARK: - Shop
struct Shop: Codable {
    let id, userId: Int?
    let username, slug, name, shopDescription: String?
    let reviewsAverage: Int?
    let contact: Contact?
    let address: Address?
    let imageUrl, heroImageUrl: String?
    let heroImageOffsetTop: Double?
    let croppedHeroImageUrl: String?
    let timezone: String?
    let openingHours: OpeningHours?
    let consultationHours: String? //was coming as null
    let portfolioPreview: [PortfolioPreview]?
    let counts: ShopCounts?
    let location: ShopLocation?
    let verified, claimed: Claimed?
    let createdAt, updatedAt: String?
    let plan: Plan?
    let distance: Double? //was coming as null
    let allowMessages, allowBookings, allowTimeslotBookings: Bool?
    let socialLinks: SocialLinks?
    let minimumRate, hourlyRate: Double? //was coming as null

    enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case username, slug, name
        case shopDescription = "description"
        case reviewsAverage = "reviews_average"
        case contact, address
        case imageUrl = "image_url"
        case heroImageUrl = "hero_image_url"
        case heroImageOffsetTop = "hero_image_offset_top"
        case croppedHeroImageUrl = "cropped_hero_image_url"
        case timezone
        case openingHours = "opening_hours"
        case consultationHours = "consultation_hours"
        case portfolioPreview = "portfolio_preview"
        case counts, location, verified, claimed
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case plan, distance
        case allowMessages = "allow_messages"
        case allowBookings = "allow_bookings"
        case allowTimeslotBookings = "allow_timeslot_bookings"
        case socialLinks = "social_links"
        case minimumRate = "minimum_rate"
        case hourlyRate = "hourly_rate"
    }
}

// MARK: - Address
struct Address: Codable {
    let address1: String?
    let address2: String?
    let zipCode, city, state, country: String?

    enum CodingKeys: String, CodingKey {
        case address1, address2
        case zipCode = "zip_code"
        case city, state, country
    }
}

// MARK: - Claimed
struct Claimed: Codable {
    let claimedSet: Bool?
    let at: String?

    enum CodingKeys: String, CodingKey {
        case claimedSet = "set"
        case at
    }
}

// MARK: - Contact
struct Contact: Codable {
    let phone, email: String?
    let website: String?
}

// MARK: - ShopCounts
struct ShopCounts: Codable {
    let followers, artists, reviews, posts: Int?
}

// MARK: - ShopLocation
struct ShopLocation: Codable {
    let latitude, longitude: Double?
}

// MARK: - OpeningHours
struct OpeningHours: Codable {
    let monday, tuesday: Day?
    let wednesday: Day?
    let thursday: Day?
    let friday: Day?
    let saturday, sunday: Day?
}

// MARK: - Day
struct Day: Codable {
    let dayOpen, closed: String?

    enum CodingKeys: String, CodingKey {
        case dayOpen = "open"
        case closed
    }
}

// MARK: - PortfolioPreview
struct PortfolioPreview: Codable {
    let id: Int?
    let image: Image?
}

// MARK: - SocialLinks
struct SocialLinks: Codable {
    let facebookLink, twitterLink, instagramLink: String? //was coming as null

    enum CodingKeys: String, CodingKey {
        case facebookLink = "facebook_link"
        case twitterLink = "twitter_link"
        case instagramLink = "instagram_link"
    }
}

// MARK: - Meta
struct Meta: Codable {
    let pagination: Pagination?
}

// MARK: - Pagination
struct Pagination: Codable {
    let total, count, perPage, currentPage: Int?
    let totalPages: Int?
    let links: Links?

    enum CodingKeys: String, CodingKey {
        case total, count
        case perPage = "per_page"
        case currentPage = "current_page"
        case totalPages = "total_pages"
        case links
    }
}

// MARK: - Links
struct Links: Codable {
    let next: String?
    let previous: String?
}
