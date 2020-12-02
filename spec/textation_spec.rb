require 'textation/text'

describe Text do
  tx = Text.new
  it 'text analyze' do
    expect(tx.analyze('I love Ruby!')).to be_a Hash
  end

  it 'analyze file' do
    expect(tx.analyze_file('data/test_source_text.txt')).to be_a Hash
  end

  it 'top words' do
    expect(tx.top_words('I love Ruby! And Ruby loves me!', 1)).to eq('ruby')
  end
end

# terminal:
# bundle exec rspec spec
