require 'action_controller/metal/renderers'

ActionController.add_renderer :pdf do |pdf, options|
  data = pdf.respond_to?(:generate) ? pdf.generate : pdf
  send_data(data,
            :type => Mime::PDF,
            :filename => options[:filename],
            :disposition => options[:disposition])
end