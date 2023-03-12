# frozen_string_literal: true

require_relative '../lib/range_function'

RSpec.configure do |config|
  config.default_formatter = 'doc'
end

RSpec.describe RangeFunction do
  subject { described_class.() }

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

  before do
    stub_const("#{described_class}::RANGE", range)
    stub_const("#{described_class}::OUTPUT", output)
  end

  it "prints range nums and replace with 'APing' when it divided into 3, 'BPong' when into 5 and 'APingBPong' when into 3 and 5" do
    subject
    expect(output.string).to eq(expected_results)
  end
end
