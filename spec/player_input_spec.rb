require "spec_helper"
require_relative "../lib/player_input.rb"

RSpec.describe PlayerInput do
  describe "#valid_coordinate?" do
    it "is true if in the first row and first column of the grid" do
      valid_row_column = StringIO.new
      player_input = PlayerInput.new(valid_row_column)
      allow(valid_row_column).to receive(:gets).and_return("A1")

      expect(player_input.valid_coordinate?(valid_row_column)).to eq true
    end

    it "is true if somewhere in the middle of the grid" do
      valid_row_column = StringIO.new
      player_input = PlayerInput.new(valid_row_column)
      allow(valid_row_column).to receive(:gets).and_return("B2")

      expect(player_input.valid_coordinate?(valid_row_column)).to eq true
    end

    it "is true if in the last row and last column of the grid" do
      valid_row_column = StringIO.new
      player_input = PlayerInput.new(valid_row_column)
      allow(valid_row_column).to receive(:gets).and_return("C3")

      expect(player_input.valid_coordinate?(valid_row_column)).to eq true
    end

    it "is false when after the last row of the grid" do
      invalid_row = StringIO.new
      player_input = PlayerInput.new(invalid_row)
      allow(invalid_row).to receive(:gets).and_return("D1")

      expect(player_input.valid_coordinate?(invalid_row)).to eq false
    end

    it "is false when before the first column of the grid" do
      invalid_row = StringIO.new
      player_input = PlayerInput.new(invalid_row)
      allow(invalid_row).to receive(:gets).and_return("A0")

      expect(player_input.valid_coordinate?(invalid_row)).to eq false
    end

    it "is false when after the last column of the grid" do
      invalid_column = StringIO.new
      player_input = PlayerInput.new(invalid_column)
      allow(invalid_column).to receive(:gets).and_return("B4")

      expect(player_input.valid_coordinate?(invalid_column)).to eq false
    end

    it "is false when input is not in the correct format" do
      invalid_format = StringIO.new
      player_input = PlayerInput.new(invalid_format)
      allow(invalid_format).to receive(:gets).and_return("3A")

      expect(player_input.valid_coordinate?(invalid_format)).to eq false
    end

    it "is false when input is too many characters" do
      invalid_format = StringIO.new
      player_input = PlayerInput.new(invalid_format)
      allow(invalid_format).to receive(:gets).and_return("A3 ")

      expect(player_input.valid_coordinate?(invalid_format)).to eq false
    end

    it "is false when input is too few characters" do
      invalid_format = StringIO.new
      player_input = PlayerInput.new(invalid_format)
      allow(invalid_format).to receive(:gets).and_return("A")

      expect(player_input.valid_coordinate?(invalid_format)).to eq false
    end

    it "is false when the first character is not upper case" do
      invalid_lower_case = StringIO.new
      player_input = PlayerInput.new(invalid_lower_case)
      allow(invalid_lower_case).to receive(:gets).and_return("a3")

      expect(player_input.valid_coordinate?(invalid_lower_case)).to eq false
    end
  end

  # describe "#assign_to_player" do
  #   it "takes the input and saves it" do
  #     valid_format = StringIO.new
  #     player_input = PlayerInput.new(valid_format)
  #     allow(valid_format).to receive(:gets).and_return("A1")

  #     player_input.assign_to_player

  #     expect(player_input.player_choice).to eq(valid_format)

  #   end
  # end
end