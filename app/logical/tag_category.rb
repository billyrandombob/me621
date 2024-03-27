# frozen_string_literal: true

class TagCategory
  MAPPING = {
    "general" => 0,
    "gen" => 0,
    "artist" => 1,
    "art" => 1,
    "copyright" => 3,
    "copy" => 3,
    "co" => 3,
    "name" => 4,
    "nam" => 4,
    "nm" => 4,
    "oc" => 4,
    "demographics" => 5,
    "demo" => 5,
    "invalid" => 6,
    "inv" => 6,
    "meta" => 7,
    "lore" => 8,
    "lor" => 8,
    "category" => 9,
    "cat" => 9,
    "organization" => 10,
    "org" => 10,
    "location" => 11,
    "loc" => 11,
    "request" => 12,
    "req" => 12,
    "genre" => 13,
    "gnr" => 13,
    "body" => 14,
    "bod" => 14,
    "har" => 15,
    "clo" => 16,
  }.freeze

  CANONICAL_MAPPING = {
    "General" => 0,
    "Artist" => 1,
    "Copyright" => 3,
    "Name" => 4,
    "Demographics" => 5,
    "Invalid" => 6,
    "Meta" => 7,
    "Lore" => 8,
    "Category" => 9,
    "Organization" => 10,
    "Location" => 11,
    "Request" => 12,
    "Genre" => 13,
    "Body" => 14,
    "Hair" => 14,
    "Clothes" => 16,
  }.freeze

  REVERSE_MAPPING = {
    0 => "general",
    1 => "artist",
    3 => "copyright",
    4 => "name",
    5 => "demographics",
    6 => "invalid",
    7 => "meta",
    8 => "lore",
    9 => "category",
    10 => "organization",
    11 => "location",
    12 => "request",
    13 => "genre",
    14 => "body",
    15 => "hair",
    16 => "clothes",
  }.freeze

  SHORT_NAME_MAPPING = {
    "gen" => "general",
    "art" => "artist",
    "copy" => "copyright",
    "nam" => "name",
    "demo" => "demographics",
    "inv" => "invalid",
    "meta" => "meta",
    "lor" => "lore",
    "cat" => "category",
    "org" => "organization",
    "loc" => "location",
    "req" => "request",
    "gnr" => "genre",
    "bod" => "body",
    "har" => "hair",
    "clo" => "clothes",
  }.freeze

  HEADER_MAPPING = {
    "general" => "General",
    "artist" => "Artists",
    "copyright" => "Copyrights",
    "name" => "Names",
    "demographics" => "Demographics",
    "invalid" => "Invalid",
    "meta" => "Meta",
    "lore" => "Lore",
    "category" => "Categories",
    "organization" => "Organizations",
    "location" => "Locations",
    "request" => "Requests",
    "genre" => "Genres",
    "body" => "Body",
    "hair" => "Hair",
    "clothes" => "Clothes",
  }.freeze

  ADMIN_ONLY_MAPPING = {
    "general" => false,
    "artist" => false,
    "copyright" => false,
    "name" => false,
    "demographics" => false,
    "category" => false,
    "invalid" => true,
    "meta" => true,
    "lore" => true,
    "organization" => false,
    "location" => false,
    "request" => false,
    "genre" => false,
    "body" => false,
    "hair" => false,
    "clothes" => false,
  }.freeze

  HUMANIZED_MAPPING = {
    "artist" => {
      "slice" => 0,
      "exclusion" => %w[avoid_posting conditional_dnp epilepsy_warning sound_warning],
      "regexmap" => //,
      "formatstr" => "created by %s",
    },
    "copyright" => {
      "slice" => 1,
      "exclusion" => [],
      "regexmap" => //,
      "formatstr" => "(%s)",
    },
    "name" => {
      "slice" => 5,
      "exclusion" => [],
      "regexmap" => /^(.+?)(?:_\(.+\))?$/,
      "formatstr" => "%s",
    },
  }.freeze

  CATEGORIES = %w[general demographics name copyright artist invalid lore meta category organization location request genre body hair clothes].freeze
  CATEGORY_IDS = CANONICAL_MAPPING.values

  SHORT_NAME_LIST = SHORT_NAME_MAPPING.keys
  HUMANIZED_LIST = %w[name copyright artist].freeze
  SPLIT_HEADER_LIST = %w[invalid artist copyright name demographics general meta lore category organization location request genre body hair clothes].freeze
  CATEGORIZED_LIST = %w[invalid artist copyright name demographics meta general lore category organization location request genre body hair clothes].freeze

  SHORT_NAME_REGEX = SHORT_NAME_LIST.join("|").freeze
end
