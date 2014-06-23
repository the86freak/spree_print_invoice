#data = [
#  [Spree.t(:footer_left), Spree.t(:footer_left2), Spree.t(:footer_right), Spree.t(:footer_right2)]
#]


font "Helvetica", :size => 8, :color => "#444444"

data = [
    ["VANA - OMM Ideas UG (haftungsbeschränkt) \n Sitz Trochtelfingerstr. 4, 70567 Stuttgart \n Amtsgericht - Registergericht Stuttgart HRB XXXYYYYZZZZX \n Geschäftsführer: Malte Horstmann, Olaf Horstmann \n Steuernummer: 687568699", "http://my-vana.de \n info@my-vana.de", "Bankverbindung\n Kontonr.: 123422233 \n BLZ: 22334322 (Commerzbank) \n BIC: DECOM..23232322.3 \n IBAN: Iiieheh223.40.f3fasd"]
]

table(data, :cell_style => { :border_width => 0 }, :column_widths => [200, 120, 160] )