# Transform /^(.*?)<(alphaNum(\d+)|rnd(\d+)|prev(\d+)|firstRnd(\d+))>(.*?)$/ do |head, type, alphaNumLen, randLen, prevLen, firstLen, tail|
#
#     if $prev == nil
#         $prev = $rand
#     end
#
#     if type.index('alphaNum')
#
#         if @newRand == nil
#             @newRand = true
#             o        = [(0..9), ('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
#             $rand    = (0...alphaNumLen.to_i).map { o[rand(o.length)] }.join
#         end
#
#         alphaNumLen = alphaNumLen.to_i
#         rand2       = $rand * alphaNumLen
#         val         = head + rand2
#         val[0, alphaNumLen] + tail
#
#     elsif type.index('rnd')
#
#         if @newRand == nil
#             @newRand = true
#             $rand    = generateRandomNumber(11)
#         end
#
#         randLen = randLen.to_i
#         rand2   = $rand * randLen
#         val     = head + rand2
#         val[0, randLen] + tail
#
#     elsif type.index('prev')
#
#         if $prev == nil
#             val = '<prevNil>'
#         else
#             prevLen = prevLen.to_i
#             prev2   = $prev * prevLen
#             val     = head + prev2
#             val[0, prevLen] + tail
#         end
#     elsif type.index('firstRnd')
#
#         if @firstRnd == nil
#             val = '<firstRndNil>'
#         else
#             firstLen = firstLen.to_i
#             firstVal = @firstRnd * firstLen
#             val      = head + firstVal
#             val[0, firstLen] + tail
#         end
#     end
# end
#
# Transform /^(.*?)<spChar>$/ do |head|
#
#     head + '!@%^&*+=-[]|:<>?/.,'
# end
#
# Transform /^(.*?)?<email(\d+)>$/ do |head, len|
#
#     len = len.to_i
#     val = 'abc' * len
#     static = 'qa@.com'
#     val = val[0, (len - static.length) - head.length]
#     head + 'qa@' + val + '.com'
# end
#
# Transform /^<yyyy-mm-dd(\d+)?>$/ do |daysLater|
#     (Date.today + daysLater.to_i).strftime('%Y-%m-%d')
# end
#
# Transform /^<today(\+|\-)?(\d+)?>$/ do |plusOrMinus, days|
#     if plusOrMinus == '+'
#         (Date.today + days.to_i).strftime('%Y-%m-%d')
#     else
#         (Date.today - days.to_i).strftime('%Y-%m-%d')
#     end
# end
#
# Transform /^@(.*)/ do |variable|
#     $variables[variable]
# end
#
# Transform /^(the )?saved "(.+)"$/ do |name|
#     STDOUT.puts name
#     @global[name]
# end
#
# Transform /^saved (.*)$/ do |name|
#     @global[name]
# end
#
# Transform /^@global/ do |key|
#     eval key
# end
