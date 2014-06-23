module Spree
  class PrintInvoiceConfiguration < Preferences::Configuration

    preference :print_invoice_next_number, :integer, :default => nil
#    preference :print_invoice_logo_path, :string, :default => Spree::Config[:admin_interface_logo]
    preference :print_invoice_logo_scale, :integer, :default => 50
    preference :print_invoice_font_face, :string, :default => 'Helvetica'
    preference :print_buttons, :string, :default => 'invoice'

#    preference :prawn_options, :hash, :default => {}
#    preference :print_invoice_footer_right1, :string, :default => 'Website:'
#    preference :print_invoice_footer_right2, :string, :default => 'http://www.google.com'
#    preference :print_invoice_footer_left1, :string, :default => 'Phone Number:'
#    preference :print_invoice_footer_left2, :string, :default => '+48-664-446-595'


    preference :print_invoice_logo_path => "logo.png"
#    preference :print_invoice_next_number => 24
    preference :prawn_options => {:page_layout => :portrait, :page_size => "A4", :margin => [50, 50, 50, 50]}


    def use_sequential_number?
      print_invoice_next_number.present? && print_invoice_next_number > 0
    end

    def increase_invoice_number
      current_invoice_number = print_invoice_next_number
      set_preference(:print_invoice_next_number, current_invoice_number + 1)
      current_invoice_number
    end

  end
end
