class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================


    @character_count_with_spaces = @text.length

    @character_count_without_spaces = @text.length - (@text.count " ")

    @word_count = @text.split.length

    @occurrences = @text.downcase.split.count(@special_word.downcase)

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("word_count.html.erb")
  end

  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================

    rate = @apr/1200
    months = @years*12

    @monthly_payment = ((rate+(rate/(((1+rate)**months)-1)))*@principal)

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("loan_payment.html.erb")
  end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================
    #seconds
    seconds = @ending - @starting

    s_comma = seconds.to_i.to_s.partition('.')
    n = s_comma[0].length - 3

    while n > 0
    	s_comma[0].insert(n, ',')
    	n = n-3
    end

    #minutes
    minutes = seconds/60

    m_comma = minutes.to_i.to_s.partition('.')
    n = m_comma[0].length - 3

    while n > 0
      m_comma[0].insert(n, ',')
      n = n-3
    end

    #hours
    hours = seconds/60/60

    h_comma = hours.round(2).to_s.partition('.')
    n = h_comma[0].length - 3

    while n > 0
      h_comma[0].insert(n, ',')
      n = n-3
    end

    #days
    days = seconds/60/60/24

    d_comma = days.round(2).to_s.partition('.')
    n = d_comma[0].length - 3

    while n > 0
      d_comma[0].insert(n, ',')
      n = n-3
    end

    #weeks
    weeks = seconds/60/60/24/7

    w_comma = weeks.round(2).to_s.partition('.')
    n = w_comma[0].length - 3

    while n > 0
      w_comma[0].insert(n, ',')
      n = n-3
    end

    #years
    end_yr = @ending.year
    begin_yr = @starting.year
    yrs = end_yr - begin_yr
    leaps = []

    while begin_yr<(end_yr+1)
    	mod4   = begin_yr%4   ==0
    	mod100 = begin_yr%100 ==0
    	mod400 = begin_yr%400 ==0
    	if mod4==true
    		if mod100==false || mod400==true
    			leaps.push(begin_yr)
    		end
    	end
    	begin_yr+=1
    end

    no_leaps = leaps.length
    no_nonleaps = yrs - no_leaps
    avg_yr_length = (365*no_nonleaps + 366*no_leaps)/yrs

    years = seconds/60/60/24/avg_yr_length.to_f

    y_comma = years.round(2).to_s.partition('.')
    n = y_comma[0].length - 3

    while n > 0
      y_comma[0].insert(n, ',')
      n = n-3
    end

    @seconds = s_comma[0] + s_comma[1] + s_comma[2]
    @minutes = m_comma[0] + m_comma[1] + m_comma[2]
    @hours = h_comma[0] + h_comma[1] + h_comma[2]
    @days = d_comma[0] + d_comma[1] + d_comma[2]
    @weeks = w_comma[0] + w_comma[1] + w_comma[2]
    @years = y_comma[0] + y_comma[1] + y_comma[2]

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("time_between.html.erb")
  end

  def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = "Replace this string with your answer."

    @count = "Replace this string with your answer."

    @minimum = "Replace this string with your answer."

    @maximum = "Replace this string with your answer."

    @range = "Replace this string with your answer."

    @median = "Replace this string with your answer."

    @sum = "Replace this string with your answer."

    @mean = "Replace this string with your answer."

    @variance = "Replace this string with your answer."

    @standard_deviation = "Replace this string with your answer."

    @mode = "Replace this string with your answer."

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("descriptive_statistics.html.erb")
  end
end
