class ChartController < ApplicationController
  def chart
  	g = Gruff::Line.new
    g.title = "Example Graph" 
    g.data("Opportunities", [3, 2, 3, 6, 8, 2])
    g.data("Tasks", [8, 8, 7, 5, 4, 4])
    g.data("Accounts", [2, 3, 1, 5, 6, 8])
    g.data("Contacts", [7, 9, 10, 8, 7, 5])

    g.labels = {0 => 'July', 2 => 'August', 4 => 'September'}

    filename = 'my_fruity_graph.png'
    
    g.write(filename)
    send_file filename, :type => 'image/png', :disposition => 'inline'
  end
  def chart2
	# With more options now
	f = Gruff::Bar.new('800x500') # Define a custom size

	f.sort = false  # Do NOT sort data based on values
	f.maximum_value = 50  # Declare a max value for the Y axis
	f.minimum_value = 0   # Declare a min value for the Y axis

	f.theme_37signals  # Declare a theme from the presets available

	f.title = 'Another example chart'
  filename = 'another_chart.png'
	f.data('Patents obtained', [20, 15, 22])
	f.data('Patents sold', [3, 8, 30])
	f.data('Clients', [4, 21, 40])

	f.labels = {0 => '2011', 1 => '2012', 2 => '2013'} # Define labels for each of the "columns" in data

	f.write(filename)
  send_file filename, :type => 'image/png', :disposition => 'inline'
  end

  def chart3
    m = Gruff::Pie.new
    m.title = "Pie chart example"
    m.data 'Tasks', 20
    m.data 'Opportunities', 50
    filename = 'pie_chart.png'
    m.write(filename)
    send_file filename, :type => 'image/png', :disposition => 'inline'
  end
end
