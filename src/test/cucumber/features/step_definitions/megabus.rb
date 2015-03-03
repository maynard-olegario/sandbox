And /^I print all megabus dollar deals under \$\d+$/ do |maxPrice|

    @resultHash = Hash.new
    require 'date'
    time = Time.new
    date=Date.parse(time.to_s)
    @daysToAdd = 1

    begin
        currentDate = date + @daysToAdd
        month = currentDate.month
        day = currentDate.day
        year = currentDate.year

        url = "http://us.megabus.com/JourneyResults.aspx?originCode=413&destinationCode=466&outboundDepartureDate=#{month}%2f#{day}%2f#{year}&inboundDepartureDate=&passengerCount=4&transportType=0&concessionCount=0&nusCount=0&outboundWheelchairSeated=0&outboundOtherDisabilityCount=0&inboundWheelchairSeated=0&inboundOtherDisabilityCount=0&outboundPcaCount=0&inboundPcaCount=0&promotionCode=&withReturn=0"
        Capybara::visit(url)

        # get all prices
        prices = page.body.scan(/\$\d*\.\d\d/)

        if not prices.empty?
            prices.sort.each { |price|
                price = price.match(/\d*\.\d\d/).to_s
                price = price.to_i
                if price <= maxPrice
                    puts currentDate.to_s + '   $' + price.to_s
                    puts url.to_s
                    @resultHash["#{price}"] = url
                    break
                end
            }

            # update date
            @daysToAdd = @daysToAdd + 1
        end
    end until (@daysToAdd > 90) or prices.empty?
end
