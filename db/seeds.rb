# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or find_or_create_byd alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.find_or_create_by([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.find_or_create_by(name: 'Luke', movie: movies.first)

# Add Participant Countries
Country.create!([
  {code: 'AUS', name: 'Australia'},
  {code: 'IRN', name: 'Iran'},
  {code: 'JPN', name: 'Japan'},
  {code: 'QAT', name: 'Qatar'},
  {code: 'KSA', name: 'Saudi Arabia'},
  {code: 'KOR', name: 'South Korea'},
  {code: 'CMR', name: 'Cameroon'},
  {code: 'GHA', name: 'Ghana'},
  {code: 'MAR', name: 'Morocco'},
  {code: 'SEN', name: 'Senegal'},
  {code: 'TUN', name: 'Tunisia'},
  {code: 'CAN', name: 'Canada'},
  {code: 'CRC', name: 'Costa Rica'},
  {code: 'MEX', name: 'Mexico'},
  {code: 'USA', name: 'United States'},
  {code: 'ARG', name: 'Argentina'},
  {code: 'BRA', name: 'Brazil'},
  {code: 'URU', name: 'Uruguay'},
  {code: 'ECU', name: 'Ecuador'},
  {code: 'BEL', name: 'Belgium'},
  {code: 'FRA', name: 'France'},
  {code: 'GER', name: 'Germany'},
  {code: 'ESP', name: 'Spain'},
  {code: 'ENG', name: 'England'},
  {code: 'DEN', name: 'Denmark'},
  {code: 'CRO', name: 'Croatia'},
  {code: 'NED', name: 'Netherlands'},
  {code: 'POL', name: 'Poland'},
  {code: 'POR', name: 'Portugal'},
  {code: 'SRB', name: 'Serbia'},
  {code: 'SUI', name: 'Switzerland'},
  {code: 'WAL', name: 'Wales'}
])

# # Add standard Outcome
Outcome.create!([
  {code: "HOME", name: "Home"},
  {code: "DRAW", name: "Draw"},
  {code: "AWAY", name: "Away"}
])

# # Add Stages
Stage.create!([
  {code: "GS",name: "Group Stage", weighting: 100},
  {code: "R16",name: "Round of 16", weighting: 150},
  {code: "QF",name: "Quarter Final", weighting: 200},
  {code: "SF",name: "Semi Final", weighting: 250},
  {code: "3P",name: "3rd Placing", weighting: 250},
  {code: "FN",name: "Final", weighting: 300}  
])

# # Add Stages
Day.create!([
  {match_day: 1,  match_date: Date.parse('2022-11-20')},
  {match_day: 2,  match_date: Date.parse('2022-11-21')},
  {match_day: 3,  match_date: Date.parse('2022-11-22')},
  {match_day: 4,  match_date: Date.parse('2022-11-23')},
  {match_day: 5,  match_date: Date.parse('2022-11-24')},
  {match_day: 6,  match_date: Date.parse('2022-11-25')},
  {match_day: 7,  match_date: Date.parse('2022-11-26')},
  {match_day: 8,  match_date: Date.parse('2022-11-27')},
  {match_day: 9,  match_date: Date.parse('2022-11-28')},
  {match_day: 10, match_date: Date.parse('2022-11-29')},
  {match_day: 11, match_date: Date.parse('2022-11-30')},
  {match_day: 12, match_date: Date.parse('2022-12-01')},
  {match_day: 13, match_date: Date.parse('2022-12-02')},
  {match_day: 14, match_date: Date.parse('2022-12-03')},
  {match_day: 15, match_date: Date.parse('2022-12-04')},
  {match_day: 16, match_date: Date.parse('2022-12-05')},
  {match_day: 17, match_date: Date.parse('2022-12-06')},
  {match_day: 18, match_date: Date.parse('2022-12-09')},
  {match_day: 19, match_date: Date.parse('2022-12-10')},
  {match_day: 20, match_date: Date.parse('2022-12-13')},
  {match_day: 21, match_date: Date.parse('2022-12-14')},
  {match_day: 22, match_date: Date.parse('2022-12-17')},
  {match_day: 23, match_date: Date.parse('2022-12-18')}
])

# Add Group Stage Matches
Match.create!([
  {day_id: 1,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 20, 19, 00, 00, Rational(3, 24)), home_country_code: "QAT", away_country_code: "ECU", home_odds: 3.58, draw_odds: 3.37, away_odds: 2.14},
  {day_id: 2,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 21, 19, 00, 00, Rational(3, 24)), home_country_code: "SEN", away_country_code: "NED", home_odds: 5.69, draw_odds: 3.72, away_odds: 1.67},
  {day_id: 2,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 21, 16, 00, 00, Rational(3, 24)), home_country_code: "ENG", away_country_code: "IRN", home_odds: 1.32, draw_odds: 5.22, away_odds: 10.92},
  {day_id: 2,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 21, 22, 00, 00, Rational(3, 24)), home_country_code: "USA", away_country_code: "WAL", home_odds: 2.58, draw_odds: 3.10, away_odds: 3.01},
  {day_id: 3,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 22, 22, 00, 00, Rational(3, 24)), home_country_code: "FRA", away_country_code: "AUS", home_odds: 1.21, draw_odds: 6.72, away_odds: 14.38},
  {day_id: 3,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 22, 16, 00, 00, Rational(3, 24)), home_country_code: "DEN", away_country_code: "TUN", home_odds: 1.47, draw_odds: 4.25, away_odds: 7.79},
  {day_id: 3,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 22, 19, 00, 00, Rational(3, 24)), home_country_code: "MEX", away_country_code: "POL", home_odds: 2.86, draw_odds: 3.21, away_odds: 2.59},
  {day_id: 3,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 22, 13, 00, 00, Rational(3, 24)), home_country_code: "ARG", away_country_code: "KSA", home_odds: 1.18, draw_odds: 7.00, away_odds: 18.26},
  {day_id: 4,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 23, 22, 00, 00, Rational(3, 24)), home_country_code: "BEL", away_country_code: "CAN", home_odds: 1.28, draw_odds: 5.76, away_odds: 11.72},
  {day_id: 4,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 23, 19, 00, 00, Rational(3, 24)), home_country_code: "ESP", away_country_code: "CRC", home_odds: 1.26, draw_odds: 5.77, away_odds: 13.41},
  {day_id: 4,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 23, 16, 00, 00, Rational(3, 24)), home_country_code: "GER", away_country_code: "JPN", home_odds: 1.36, draw_odds: 5.13, away_odds: 8.83},
  {day_id: 4,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 23, 13, 00, 00, Rational(3, 24)), home_country_code: "MAR", away_country_code: "CRO", home_odds: 4.81, draw_odds: 3.39, away_odds: 1.85},
  {day_id: 5,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 24, 13, 00, 00, Rational(3, 24)), home_country_code: "SUI", away_country_code: "CMR", home_odds: 1.89, draw_odds: 3.36, away_odds: 4.62},
  {day_id: 5,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 24, 16, 00, 00, Rational(3, 24)), home_country_code: "URU", away_country_code: "KOR", home_odds: 1.87, draw_odds: 3.40, away_odds: 4.67},
  {day_id: 5,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 24, 19, 00, 00, Rational(3, 24)), home_country_code: "POR", away_country_code: "GHA", home_odds: 1.53, draw_odds: 4.01, away_odds: 7.11},
  {day_id: 5,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 24, 22, 00, 00, Rational(3, 24)), home_country_code: "BRA", away_country_code: "SRB", home_odds: 1.47, draw_odds: 4.48, away_odds: 7.17},
  {day_id: 6,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 25, 13, 00, 00, Rational(3, 24)), home_country_code: "WAL", away_country_code: "IRN", home_odds: 2.19, draw_odds: 3.18, away_odds: 3.61},
  {day_id: 6,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 25, 16, 00, 00, Rational(3, 24)), home_country_code: "QAT", away_country_code: "SEN", home_odds: 3.94, draw_odds: 3.32, away_odds: 2.05},
  {day_id: 6,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 25, 19, 00, 00, Rational(3, 24)), home_country_code: "NED", away_country_code: "ECU", home_odds: 1.77, draw_odds: 3.78, away_odds: 4.67},
  {day_id: 6,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 25, 22, 00, 00, Rational(3, 24)), home_country_code: "ENG", away_country_code: "USA", home_odds: 1.75, draw_odds: 3.69, away_odds: 4.99},
  {day_id: 7,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 26, 13, 00, 00, Rational(3, 24)), home_country_code: "TUN", away_country_code: "AUS", home_odds: 2.93, draw_odds: 3.03, away_odds: 2.69},  
  {day_id: 7,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 26, 16, 00, 00, Rational(3, 24)), home_country_code: "POL", away_country_code: "KSA", home_odds: 1.74, draw_odds: 3.75, away_odds: 5.00},
  {day_id: 7,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 26, 19, 00, 00, Rational(3, 24)), home_country_code: "FRA", away_country_code: "DEN", home_odds: 1.95, draw_odds: 3.46, away_odds: 4.14},
  {day_id: 7,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 26, 22, 00, 00, Rational(3, 24)), home_country_code: "ARG", away_country_code: "MEX", home_odds: 1.61, draw_odds: 3.94, away_odds: 5.98},
  {day_id: 8,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 27, 13, 00, 00, Rational(3, 24)), home_country_code: "JPN", away_country_code: "CRC", home_odds: 2.23, draw_odds: 3.06, away_odds: 3.68},
  {day_id: 8,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 27, 16, 00, 00, Rational(3, 24)), home_country_code: "BEL", away_country_code: "MAR", home_odds: 1.51, draw_odds: 4.37, away_odds: 6.61},
  {day_id: 8,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 27, 19, 00, 00, Rational(3, 24)), home_country_code: "CRO", away_country_code: "CAN", home_odds: 1.81, draw_odds: 3.71, away_odds: 4.54},
  {day_id: 8,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 27, 22, 00, 00, Rational(3, 24)), home_country_code: "ESP", away_country_code: "GER", home_odds: 2.59, draw_odds: 3.38, away_odds: 2.77},
  {day_id: 9,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 28, 13, 00, 00, Rational(3, 24)), home_country_code: "CMR", away_country_code: "SRB", home_odds: 3.64, draw_odds: 3.07, away_odds: 2.26},
  {day_id: 9,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 28, 16, 00, 00, Rational(3, 24)), home_country_code: "KOR", away_country_code: "GHA", home_odds: 2.77, draw_odds: 3.02, away_odds: 2.85},
  {day_id: 9,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 28, 19, 00, 00, Rational(3, 24)), home_country_code: "BRA", away_country_code: "SUI", home_odds: 1.48, draw_odds: 4.40, away_odds: 6.97},
  {day_id: 9,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 28, 22, 00, 00, Rational(3, 24)), home_country_code: "POR", away_country_code: "URU", home_odds: 2.11, draw_odds: 3.31, away_odds: 3.74},
  {day_id: 10,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 29, 22, 00, 00, Rational(3, 24)), home_country_code: "WAL", away_country_code: "ENG", home_odds: 5.82, draw_odds: 3.78, away_odds: 1.60},
  {day_id: 10,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 29, 22, 00, 00, Rational(3, 24)), home_country_code: "IRN", away_country_code: "USA", home_odds: 3.37, draw_odds: 3.32, away_odds: 2.18},
  {day_id: 10,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 29, 18, 00, 00, Rational(3, 24)), home_country_code: "ECU", away_country_code: "SEN", home_odds: 2.94, draw_odds: 3.15, away_odds: 2.50},
  {day_id: 10,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 29, 18, 00, 00, Rational(3, 24)), home_country_code: "NED", away_country_code: "QAT", home_odds: 1.31, draw_odds: 5.17, away_odds: 10.28}, 
  {day_id: 11,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 30, 18, 00, 00, Rational(3, 24)), home_country_code: "AUS", away_country_code: "DEN", home_odds: 6.56, draw_odds: 3.68, away_odds: 1.61},
  {day_id: 11,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 30, 18, 00, 00, Rational(3, 24)), home_country_code: "TUN", away_country_code: "FRA", home_odds: 14.20, draw_odds: 5.40, away_odds: 1.24},
  {day_id: 11,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 30, 22, 00, 00, Rational(3, 24)), home_country_code: "POL", away_country_code: "ARG", home_odds: 4.80, draw_odds: 4.05, away_odds: 1.69},
  {day_id: 11,  stage_code: "GS", started_at: DateTime.civil(2022, 11, 30, 22, 00, 00, Rational(3, 24)), home_country_code: "KSA", away_country_code: "MEX", home_odds: 6.24, draw_odds: 4.02, away_odds: 1.54},
  {day_id: 12,  stage_code: "GS", started_at: DateTime.civil(2022, 12, 01, 18, 00, 00, Rational(3, 24)), home_country_code: "CRO", away_country_code: "BEL", home_odds: 3.92, draw_odds: 3.58, away_odds: 1.91},
  {day_id: 12,  stage_code: "GS", started_at: DateTime.civil(2022, 12, 01, 18, 00, 00, Rational(3, 24)), home_country_code: "CAN", away_country_code: "MAR", home_odds: 3.22, draw_odds: 3.22, away_odds: 2.29},
  {day_id: 12,  stage_code: "GS", started_at: DateTime.civil(2022, 12, 01, 22, 00, 00, Rational(3, 24)), home_country_code: "JPN", away_country_code: "ESP", home_odds: 10.02, draw_odds: 5.36, away_odds: 1.30},
  {day_id: 12,  stage_code: "GS", started_at: DateTime.civil(2022, 12, 01, 22, 00, 00, Rational(3, 24)), home_country_code: "CRC", away_country_code: "GER", home_odds: 11.05, draw_odds: 4.89, away_odds: 1.31},  
  {day_id: 13,  stage_code: "GS", started_at: DateTime.civil(2022, 12, 02, 18, 00, 00, Rational(3, 24)), home_country_code: "GHA", away_country_code: "URU", home_odds: 4.90, draw_odds: 3.48, away_odds: 1.75},
  {day_id: 13,  stage_code: "GS", started_at: DateTime.civil(2022, 12, 02, 18, 00, 00, Rational(3, 24)), home_country_code: "KOR", away_country_code: "POR", home_odds: 7.30, draw_odds: 4.03, away_odds: 1.47},
  {day_id: 13,  stage_code: "GS", started_at: DateTime.civil(2022, 12, 02, 22, 00, 00, Rational(3, 24)), home_country_code: "SRB", away_country_code: "SUI", home_odds: 2.76, draw_odds: 3.33, away_odds: 2.47},
  {day_id: 13,  stage_code: "GS", started_at: DateTime.civil(2022, 12, 02, 22, 00, 00, Rational(3, 24)), home_country_code: "CMR", away_country_code: "BRA", home_odds: 8.95, draw_odds: 5.05, away_odds: 1.33},
  {day_id: 14,  stage_code: "R16", started_at: DateTime.civil(2022, 12, 03, 18, 00, 00, Rational(3, 24))},
  {day_id: 14,  stage_code: "R16", started_at: DateTime.civil(2022, 12, 03, 22, 00, 00, Rational(3, 24))},
  {day_id: 15,  stage_code: "R16", started_at: DateTime.civil(2022, 12, 04, 18, 00, 00, Rational(3, 24))},
  {day_id: 15,  stage_code: "R16", started_at: DateTime.civil(2022, 12, 04, 22, 00, 00, Rational(3, 24))},
  {day_id: 16,  stage_code: "R16", started_at: DateTime.civil(2022, 12, 05, 18, 00, 00, Rational(3, 24))},
  {day_id: 16,  stage_code: "R16", started_at: DateTime.civil(2022, 12, 05, 22, 00, 00, Rational(3, 24))},
  {day_id: 17,  stage_code: "R16", started_at: DateTime.civil(2022, 12, 06, 18, 00, 00, Rational(3, 24))},
  {day_id: 17,  stage_code: "R16", started_at: DateTime.civil(2022, 12, 06, 22, 00, 00, Rational(3, 24))},
  {day_id: 18,  stage_code: "QF", started_at: DateTime.civil(2022, 12, 9, 18, 00, 00, Rational(3, 24))},
  {day_id: 18,  stage_code: "QF", started_at: DateTime.civil(2022, 12, 9, 22, 00, 00, Rational(3, 24))},
  {day_id: 19,  stage_code: "QF", started_at: DateTime.civil(2022, 12, 10, 18, 00, 00, Rational(3, 24))},
  {day_id: 19,  stage_code: "QF", started_at: DateTime.civil(2022, 12, 10, 22, 00, 00, Rational(3, 24))},
  {day_id: 20,  stage_code: "SF", started_at: DateTime.civil(2022, 12, 13, 22, 00, 00, Rational(3, 24))},
  {day_id: 21,  stage_code: "SF", started_at: DateTime.civil(2022, 12, 14, 22, 00, 00, Rational(3, 24))},
  {day_id: 22,  stage_code: "3P", started_at: DateTime.civil(2022, 12, 17, 18, 00, 00, Rational(3, 24))},
  {day_id: 23,  stage_code: "FN", started_at: DateTime.civil(2022, 12, 18, 18, 00, 00, Rational(3, 24))} 
])


