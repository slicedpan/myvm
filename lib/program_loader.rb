class ProgramLoader
  def load_program(filename)
    f = File.open(filename)
    code = f.read
    f.close
    decoder = InstructionDecoder.new
    @instructions = code.each_line.map{ |l| decoder.decode_instruction(l) }
  end

  def run_program
    vm_state = VMState.new
    vm_state.code = @instructions
    loop do      
      break if vm_state.finished?
      vm_state.step
    end
    vm_state.print
  end

end