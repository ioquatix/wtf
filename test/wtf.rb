# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2024, by Samuel Williams.

describe WTF do
	it "has a version number" do
		expect(WTF::VERSION).to be =~ /^\d+\.\d+\.\d+$/
	end
end
