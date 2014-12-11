module InstructionSet  
  def mov(source_register, dest_register)
    self.registers[dest_register] = self.registers[source_register]
    increment_pointer
  end

  def set(source_register, value)
    self.registers[source_register] = value
    increment_pointer
  end

  def jmp(position)
    self.ip = position
  end

  def jmpr(position)
    self.ip += position
  end

  def jmpz(position)
    if self.registers[2] == 0
      jmp(position)
    else
      increment_pointer
    end
  end

  def jmpzr(position)
    if self.registers[2] == 0
      jmpr(position)
    else
      increment_pointer
    end
  end

  def ret
    puts "The code returned: #{self.registers[0]}"
    increment_pointer
  end

  def mod
    self.registers[2] = self.registers[0] % self.registers[1]
    increment_pointer
  end

  def div
    self.registers[2] = self.registers[0] / self.registers[1]
    increment_pointer
  end

  def nop
    increment_pointer
  end

  def load
    self.registers[0] = self.memory[self.registers[1]]
    increment_pointer
  end

  def store
    self.memory[self.registers[1]] = self.registers[0]
    increment_pointer
  end

  def add
    self.registers[2] = self.registers[0] + self.registers[1]
    increment_pointer
  end

  def sub
    self.registers[2] = self.registers[0] - self.registers[1]
    increment_pointer
  end

  def mul
    self.registers[2] = self.registers[0] * self.registers[1]
    increment_pointer
  end

  def write
    output_buffer.push(registers[0])
    increment_pointer
  end

  def clrbuf
    output_buffer.clear
    increment_pointer
  end

  def read
    self.registers[0] = self.input_buffer[self.input_pointer]
    self.input_pointer += 1
    increment_pointer
  end

  def rewind
    self.input_pointer = 0
    increment_pointer
  end

  def output
    tmp = []
    self.output_buffer.each do |v|
      break if v == 0
      tmp.push(v)
    end
    puts tmp.pack('U*')
    increment_pointer
  end

  def input
    str = gets
    self.input_buffer.clear
    str.unpack('U*').concat([0]).each{ |v| self.input_buffer.push(v) }
    increment_pointer
  end

end