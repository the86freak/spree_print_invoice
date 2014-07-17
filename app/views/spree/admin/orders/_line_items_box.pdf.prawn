data = []

if @hide_prices
  @column_widths = { 0 => 100, 1 => 165, 2 => 75, 3 => 75 }
  @align = { 0 => :left, 1 => :left, 2 => :right, 3 => :right }
  data << [Spree.t(:sku), "Beschreibung", "Optionen", "Anzahl"]
else
  @column_widths = { 0 => 30, 1 => 90, 2 => 140, 3 => 90, 4 => 50, 5 => 80 }
  @align = { 0 => :left, 1 => :left, 2 => :left, 3 => :right, 4 => :right, 5 => :right}
  data << [Spree.t(:sku), "Produkt", "Optionen", "Stückpreis (netto)", "Anzahl", "Positionsbetrag (netto)"]
end

@order.line_items.each do |item|
  row = [ item.variant.product.sku, item.variant.product.name]
  row << item.variant.options_text
  row << "€"+(item.price/1.19).round(2).to_s unless @hide_prices
  row << item.quantity
  row << "€"+(item.total/1.19).round(2).to_s unless @hide_prices
  data << row
end

extra_row_count = 0

unless @hide_prices
  extra_row_count += 1
  #data << [""] * 4
  data << [nil, nil, nil, {:content => "Zwischensumme (netto)", :colspan => 2}, "€"+(@order.item_total / 1.19).round(2).to_s]

  @order.all_adjustments.eligible.each do |adjustment|
    if adjustment.label.include? "Promotion"
      extra_row_count += 1
      data << [nil, nil, nil, { :content => adjustment.label, :colspan => 2}, "€"+(adjustment.amount/1.19).round(2).to_s]
    end
  end

#add Tax (Umsatzsteuer 19%)
data << [nil, nil, nil, {:content => "USt 19%", :colspan => 2}, "€"+(@order.amount-(@order.amount/1.19)).round(2).to_s]

#  @order.shipments.each do |shipment|
#    extra_row_count += 1
#    data << [nil, nil, nil, nil, shipment.shipping_method.name, shipment.display_cost.to_s]
#  end

  data << [nil, nil, nil, {:content => "Gesamtbetrag (brutto)", :colspan => 2}, @order.display_total.to_s]
end

move_down(200)
table(data, :width => 480, :column_widths => @column_widths) do
  cells.border_width = 0.5

  row(0).borders = [:bottom]
  row(0).font_style = :bold

  last_column = data[0].length - 1
  row(0).columns(0..last_column).borders = [:top, :right, :bottom, :left]
  row(0).columns(0..last_column).border_widths = [0.5, 0, 0.5, 0.5]

  row(0).column(last_column).border_widths = [0.5, 0.5, 0.5, 0.5]

  if extra_row_count > 0
    extra_rows = row((-2-extra_row_count)..-2)
    extra_rows.columns(0..5).borders = []
    extra_rows.column(3).font_style = :bold
    extra_rows.column(4).font_style = :bold

    row(-1).columns(0..5).borders = []
    row(-1).column(3).font_style = :bold
    row(-1).column(4).font_style = :bold
  end
end
