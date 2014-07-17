require 'prawn/layout'

@font_face = Spree::PrintInvoice::Config[:print_invoice_font_face]

font @font_face

im = Rails.application.assets.find_asset(Spree::PrintInvoice::Config[:print_invoice_logo_path])
image im , :at => [0,720], :scale => logo_scale

fill_color "5cb85c"
if @hide_prices
  text Spree.t(:packaging_slip), :align => :right, :style => :bold, :size => 18
else
  text "Kundenrechnung", :align => :right, :style => :bold, :size => 18
end
fill_color "000000"

move_down 4

#if Spree::PrintInvoice::Config.use_sequential_number? && @order.invoice_number.present? && !@hide_prices

  font @font_face,  :size => 9,  :style => :bold
  text "Rechnungsnummer: #{(@order.created_at.to_i - 1388534400).to_s}", :align => :right
  move_down 2
  text "Bestellnummer: #{@order.number}", :align => :right
  move_down 2
  font @font_face, :size => 9
  text "Rechnungsdatum: #{I18n.l(@order.created_at, format:"%d.%m.%Y")}", :align => :right
  font @font_face, :size => 9
  text "Leistungsdatum: #{I18n.l(@order.shipments[0].shipped_at, format:"%d.%m.%Y")}", :align => :right
#else

#  move_down 2
#  font @font_face,  :size => 9
#  text "#{Spree.t(:order_number, :number => @order.number)}", :align => :right

#  move_down 2
#  font @font_face, :size => 9
#  text "#{I18n.l @order.completed_at.to_date}", :align => :right

#end


render :partial => "address"

move_down 30

render :partial => "line_items_box"

move_down 480

render :partial => "bye"

move_down 630

# Footer
render :partial => "footer"

