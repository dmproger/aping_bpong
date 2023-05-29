# frozen_string_literal: true

require_relative '../lib/raise_based'
require_relative '../lib/simple'

RSpec.configure do |config|
  config.default_formatter = 'doc'
end

RSpec.describe 'aping bpong functions' do
  subject { function.() }

  let(:range) { 1..16 }
  let(:output) { StringIO.new }
  let(:expected_results) do
    %(
      1
      2
      APing
      4
      BPong
      APing
      7
      8
      APing
      BPong
      11
      APing
      13
      14
      APingBPong
      16
    ).gsub(/^\s+/, '')
  end

  shared_examples 'expected results' do
    before do
      stub_const("#{function}::RANGE", range)
      stub_const("#{function}::OUTPUT", output)
    end

    it "prints nums with 'APing', 'BPong' and 'APingBPong' replaces" do
      subject
      expect(output.string).to eq(expected_results)
    end
  end

  describe 'raise based variant' do
    let(:function) { RaiseBased }
    it_behaves_like 'expected results'
  end

  describe 'simple variant' do
    let(:function) { Simple }
    it_behaves_like 'expected results'
  end
end
