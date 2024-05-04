# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2024, by Samuel Williams.

module WTF
	def self.is_it_doing?(object)
		log_all_the_things = Module.new
		log_all_the_things.include(IsItDoing)
		
		object.methods.each do |method|
			next if method.to_s.start_with?('__')
			
			log_all_the_things.define_method(method) do |*arguments, **options, &block|
				__log__(__method__, arguments, options, block)
				
				super(*arguments, **options, &block)
			end
		end
		
		object.singleton_class.prepend(log_all_the_things)
		
		return object
	end
	
	module IsItDoing
		alias __class__ class
		
		def __log__(method, arguments, options, block)
			buffer = String.new
			buffer << __class__.name << '#' << method.to_s << '('
			first = true
			
			if arguments.any?
				buffer << arguments.inspect[1...-1]
				first = false
			end
			
			if options.any?
				buffer << ', ' unless first
				buffer << options.inspect[1...-1]
				first = false
			end
			
			if block
				buffer << ', ' unless first
				buffer << '&' << block.inspect
			end
			
			buffer << ')'
				
			$stderr.puts(buffer)
		end
	end
end
