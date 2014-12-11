Dir["lib/*.rb"].each{ |f| require f }

pl = ProgramLoader.new