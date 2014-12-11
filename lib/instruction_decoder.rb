class InstructionDecoder
  def decode_instruction(code)
    parts = code.split(" ")
    name = parts[0].downcase
    args = parts.slice(1, parts.length).map{ |a| a.to_i }
    [name, *args]
  end
end