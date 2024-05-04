# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2024, by Samuel Williams.

require 'wtf/is_it_doing'

describe WTF::IsItDoing do
	let(:object) {String.new}
	
	it "logs all the things" do
		WTF.is_it_doing?(object)
		
		expect(object).to receive(:__log__).with(:upcase, [], {}, nil).and_return(true)
		
		object.upcase
	end
end
