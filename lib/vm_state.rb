require 'lib/instruction_set'

class VMState
  include InstructionSet
  attr_accessor :registers, :ip, :code, :memory, :output_buffer, :input_buffer, :input_pointer
  def initialize
    self.registers = []
    4.times{ self.registers.push(0) }
    @ip = 0
    self.memory = []
    self.output_buffer = []
    self.input_buffer = []
    self.input_pointer = 0
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
    puts "Input buffer: #{self.input_buffer.join(',')}"
    puts "Output buffer: #{self.output_buffer.join(',')}"
    puts "Main memory: #{self.memory.join(',')}"
    if self.ip == self.code.length
      puts "Ended"
    else
      puts "Next instruction: [#{self.code[self.ip].join(', ')}]"
    end
  end

end