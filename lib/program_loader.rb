class ProgramLoader
  def load_program(filename)
    f = File.open(filename)
    code = f.read
    f.close
    decoder = InstructionDecoder.new
    @instructions = code.each_line.map{ |l| decoder.decode_instruction(l) }
  end

  def run_program(*register_values, opts)
    if !opts.is_a? Hash
      register_values.push(opts)
      opts = {}
    end
    vm_state = VMState.new
    vm_state.code = @instructions
    register_values.each.with_index do |val, i|
      vm_state.registers[i] = val
    end
    loop do      
      break if vm_state.finished?
      vm_state.print if opts[:debug]
      vm_state.step
      sleep(0.1) if opts[:debug]
    end
    vm_state.print if opts[:debug]
  end

end