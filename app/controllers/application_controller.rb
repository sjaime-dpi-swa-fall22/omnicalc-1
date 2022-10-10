class ApplicationController < ActionController::Base

  MONTHS_IN_YEAR = 12
  CONVERT_PERCENT = 100

  def blank_square_form
    render({ :template => "calculation_templates/square_form.html.erb"})
  end

  def calculate_square
    @num=params["elephant"].to_f
    @square = @num * @num
    render({ :template => "calculation_templates/square_results.html.erb"})
  end

  def blank_square_root_form
    render({ :template => "calculation_templates/square_root_form.html.erb"})
  end

  def calculate_square_root
    @num=params["number"].to_f
    @square_root = @num ** 0.5
    render({ :template => "calculation_templates/square_root_results.html.erb"})
  end

  def blank_random_form
    render({ :template => "calculation_templates/rand_form.html.erb"})
  end

  def calculate_random
    @min_num=params["user_min"].to_f
    @max_num=params["user_max"].to_f
    @random = rand(@min_num..@max_num)
    render({ :template => "calculation_templates/rand_results.html.erb"})
  end

  def blank_payment_form
    render({ :template => "calculation_templates/payment_form.html.erb"})
  end

  def calculate_payment
    @apr=params["apr"].to_f
    @years=params["years"].to_i
    @principal=params["principal"].to_f
    r = (@apr/MONTHS_IN_YEAR)/CONVERT_PERCENT
    n = @years*MONTHS_IN_YEAR
    @numerator = r * @principal
    @denominator = 1 - ((1+r) ** (-n))
    @payment = @numerator/@denominator
    render({ :template => "calculation_templates/payment_results.html.erb"})
  end


end
