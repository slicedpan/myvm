require 'lib/instruction_set'

class VMState
  include InstructionSet
  attr_accessor :registers, :ip, :code
  def initialize
    self.registers = []
    4.times{ self.registers.push(0) }
    @ip = 0
  end

  def increment_pointer
    self.ip += 1
  end

  def step
    instruction = self.code[self.ip]
    self.send(*instruction)
  end

  def finished?
    self.ip >= self.code.length
  end

  def print
    puts "Registers:"
    puts [0,1,2,3].map{|i| "      R#{i}|"}.join 
    puts [0,1,2,3].map{|i| sprintf("% 8d", registers[i]) + "|"}.join
    puts "Next instruction: [#{self.code[self.ip].join(', ')}]"
  end

end