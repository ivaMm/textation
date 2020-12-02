require 'textation/text'

describe Textation::Text do
  it 'text analyze' do
    expect(Textation::Text.analyze('I love Ruby!')).to be_a Hash
  end

  it 'analyze file' do
    expect(Textation::Text.analyze_file('data/test_source_text.txt')).to be_a Hash
  end
end

# terminal:
# bundle exec rspec spec
