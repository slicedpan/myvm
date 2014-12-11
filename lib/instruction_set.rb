module InstructionSet  
  def mov(source_register, dest_register)
    self.registers[dest_register] = self.registers[source_register]
    increment_pointer
  end

  def set(source_register, value)
    self.registers[source_register] = value
  end

  def jmp(position)
    self.ip = position
  end

  def jmpz(position)
    if self.register[2] == 0
      jmp(position)
    end
  end

  def mod
    self.register[2] = self.register[0] % self.register[1]
    increment_pointer
  end

  def div
    self.register[2] = self.register[0] / self.register[1]
    increment_pointer
  end

  def nop
    increment_pointer
  end
end