require 'method_profiler'

module MethodProfilerForCode
	
	# config variable for enabling/disabling log. To disable profile logger, set METHOD_PROFILE_LOGGER_STATUS = false
	METHOD_PROFILE_LOGGER_STATUS = false

	def self.profile_logger_enabled?
		METHOD_PROFILE_LOGGER_STATUS
	end

	
	# profile logger. As of now, it will log the records inside performance/hande-request-TerminalUser.txt file
	def self.profile_logger(file_name,request_url,class_name,profiler,command)
		yield
		puts profiler.report
		record_url_and_command(file_name,class_name,request_url,command)
		File.open "../performance/#{file_name}-#{class_name}.txt", 'a+' do |file|
			file.puts profiler.report.sort_by(:total_time).order(:desc)
		end
	end	

	# Method for recording the command and url
	def self.record_url_and_command(file_name,class_name,request_url,command)
		File.open "../performance/#{file_name}-#{class_name}.txt", 'a+' do |file|
			file.puts "Request_url: #{request_url} command_executed: #{command}"
		end
	end
	

end
