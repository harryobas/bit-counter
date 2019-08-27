
def read_file(file)
  contents = File.read(file)
rescue Errno::ENOENT => e
  abort "file not found"
end

def get_bits(file_content)
  bytes = file_content.unpack("B*")
  bits = bytes[0].split("")
end

def count_ones_and_zeros(bits)
  ones = bits.select{|b| b == "1"}
  zeros = bits.select{|b| b == "0"}

  puts "found #{ones.count} bits set to 1"
  puts "found #{zeros.count} bits set to 0"
end

abort "ruby #{__FILE__} [file path]" if ARGV[0].nil?

content = read_file(ARGV[0])
bits = get_bits(content)

count_ones_and_zeros(bits)
