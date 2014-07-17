#data = [
#  [Spree.t(:footer_left), Spree.t(:footer_left2), Spree.t(:footer_right), Spree.t(:footer_right2)]
#]


font "Helvetica", :size => 8, :color => "#444444"

data = [
    ["VANA \n OMM Ideas UG (haftungsbeschränkt) i.G. \n Sitz: Trochtelfingerstr. 4, 70567 Stuttgart \n Amtsgericht - Registergericht Stuttgart \n Geschäftsführer: Malte Horstmann, Olaf Horstmann \n ", "http://my-vana.de \n info@my-vana.de"]
]

table(data, :cell_style => { :border_width => 0 }, :column_widths => [300, 180] )