#!/usr/bin/ruby
# Welcome all Stack Exchange visitors!
# Say "Hi" in TNB if you read this

abort "Incorrect number of arguments.\nUsage: #{File.basename __FILE__} <infile>" if ARGV.size != 1
abort "The file #{ARGV[0]} does not exist." if not File.exist? ARGV[0]

begin
    program = File.read ARGV[0]
rescue SystemCallError
    abort "File #{ARGV[0]} cannot be read."
end

stack = Array.new

functions = {
    ?b => -> (a,b) {a ^ b},
    ?B => -> (f) {File.read f},
    ?c => -> (c) {c.ord},
    ?C => -> (n) {s = ""; n.times {s << stack.pop}; return s},
    ?d => -> (v) {v.to_i},
    ?D => -> (v) {v.to_s},
    ?f => -> {stack.shuffle!},
    ?F => -> (v) {v.to_s.length},
    ?g => -> {(stack.size == 0) ? 1 : 0},
    ?G => -> {File.read ascii-tomato.txt},
    ?h => -> (n) {n/2},
    ?H => -> {"Hello, World!"},
    ?j => -> (v) {return `bash -c '#{v}'`},
    ?J => -> (i) {exit i.to_i},
    ?k => -> {stack.length},
    ?K => -> {STDERR.puts stack.inspect},
    ?l => -> (a,b) {(a == b) ? 1 : 0},
    ?L => -> (a,b) {(a < b) ? 1 : 0},
    ?m => -> (a,b) {a + b},
    ?M => -> (a,b) {a * b},
    ?n => -> (v) {-v},
    ?N => -> (v) {~v},
    ?p => -> (v) {v},
    ?P => -> (v) {},
    ?q => -> (i) {sleep i.to_i},
    ?Q => -> (a,b) {a ** b},
    ?r => -> {}, # Special case, will handle in code
    ?R => -> {stack[-1], stack[-2] = stack[-2], stack[-1]},
    ?s => -> {}, # Not going to repeat myself more
    ?S => -> {}, # Seriously?
    ?t => -> (v) {(v == "" or v == 0 or v == nil or v == " ") : 1 ? 0},
    ?T => -> (x, y) {x ** (1.0 / y)},
    ?v => -> {}, # No idea how to implement this one yet
    ?V => -> {program},
    ?w => -> (v) {(v.to_s =~ /^[aeiou]/) ? 1 : 0},
    ?W => -> (v) {(v.to_s =~ /^[a-zA-Z0-9]/) ? 1 : 0},
    ?x => -> {stack = []},
    ?X => -> {stack.each_slice(2) {|i,j| i,j = j,i}},
    ?z => -> (x, y) {x % y},
    ?Z => -> {rand(2**32)}
}

functions_reversed = {
    ?b => -> (a,b) {~(a ^ b)},
    ?B => -> (f, g) {File.write f, g},
    ?c => -> (c) {c.chr},
    ?C => -> (n) {}, # NYI: Push all characters to stack
    ?d => -> (v) {v.to_i},
    ?D => -> (v) {v.to_s},
    ?f => -> {stack.shuffle!},
    ?F => -> (v) {v.to_s.length},
    ?g => -> {(stack.size == 0) ? 1 : 0},
    ?G => -> {File.read ascii-tomato.txt},
    ?h => -> (n) {n/2},
    ?H => -> {"Hello, World!"},
    ?j => -> (v) {return `bash -c '#{v}'`},
    ?J => -> (i) {exit i.to_i},
    ?k => -> {stack.length},
    ?K => -> {STDERR.puts stack.inspect},
    ?l => -> (a,b) {(a == b) ? 1 : 0},
    ?L => -> (a,b) {(a < b) ? 1 : 0},
    ?m => -> (a,b) {a + b},
    ?M => -> (a,b) {a * b},
    ?n => -> (v) {-v},
    ?N => -> (v) {~v},
    ?p => -> (v) {v},
    ?P => -> (v) {},
    ?q => -> (i) {sleep i.to_i},
    ?Q => -> (a,b) {a ** b},
    ?r => -> {}, # Special case, will handle in code
    ?R => -> {stack[-1], stack[-2] = stack[-2], stack[-1]},
    ?s => -> {}, # Not going to repeat myself more
    ?S => -> {}, # Seriously?
    ?t => -> (v) {(v == "" or v == 0 or v == nil or v == " ") : 1 ? 0},
    ?T => -> (x, y) {x ** (1.0 / y)},
    ?v => -> {}, # No idea how to implement this one yet
    ?V => -> {program},
    ?w => -> (v) {(v.to_s =~ /^[aeiou]/) ? 1 : 0},
    ?W => -> (v) {(v.to_s =~ /^[a-zA-Z0-9]/) ? 1 : 0},
    ?x => -> {stack = []},
    ?X => -> {stack.each_slice(2) {|i,j| i,j = j,i}},
    ?z => -> (x, y) {x % y},
    ?Z => -> {rand(2**32)}
}
