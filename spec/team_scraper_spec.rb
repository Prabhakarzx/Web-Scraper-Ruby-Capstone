require_relative '../lib/team_scraper.rb'

describe TeamScraper do
  it 'Rais argument error when less than two arguments are given' do
    expect { TeamScraper.new }.to raise_error(ArgumentError)
  end
end
