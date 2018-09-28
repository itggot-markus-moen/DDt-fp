def fp(tfp, cfp, hours)
    i = 0
    missing = tfp - cfp
    reclaimed = 0
    puts "Rest? (y/n)"
    rest = STDIN.gets.chomp
    while i < hours
        if (cfp + reclaimed) == tfp
            break
        end
        if rest == "y"
            restore = (missing * 0.1).ceil.to_i
        else
            restore = (missing * 0.1).floor.to_i
        end
        if restore == 0
            restore = 1
        end
        reclaimed += restore
        missing -= restore
        i += 1
    end
    output = "You restore #{reclaimed} fp.\nYou now have #{cfp + reclaimed} fp."
    return output
end

total_fp = ARGV[0].chomp.to_i
current_fp = ARGV[1].chomp.to_i
hours = ARGV[2].chomp.to_i

puts fp(total_fp, current_fp, hours)