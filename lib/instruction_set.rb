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
end