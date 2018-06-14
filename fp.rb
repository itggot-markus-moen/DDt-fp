def fp(tfp, cfp, hours)
    i = 0
    missing = tfp - cfp
    reclaimed = 0
    puts "Rest? (y/n)"
    rest = STDIN.gets.chomp
    if rest == "y"
        round = 0.5
    else
        round = 0.0
    end
    while i < hours
        if (cfp + reclaimed) == tfp
            break
        end
        restore = ((missing * 0.1) + round).to_i
        if restore == 0
            restore = 1
        end
        reclaimed += restore
        missing -= restore
        i += 1
    end
    if reclaimed == 0 && cfp != tfp
        reclaimed = 1
    end
    output = "You restore #{reclaimed} fp.\nYour now have #{cfp + reclaimed} fp."
    return output
end

total_fp = ARGV[0].chomp.to_i
current_fp = ARGV[1].chomp.to_i
hours = ARGV[2].chomp.to_i

puts fp(total_fp, current_fp, hours)