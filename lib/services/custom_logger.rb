require 'logger'

module CustomLogger
  def log(message)
    unless @logger
      @logger ||= ::Logger.new(STDOUT)
      @logger.level = ::Logger::INFO
    end

    @logger.info(message)
  end
end
