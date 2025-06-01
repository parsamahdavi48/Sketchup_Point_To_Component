require 'sketchup.rb'
require 'extensions.rb'

module Parsa
  module PointToComponent
    PLUGIN_PATH = File.dirname(__FILE__)
    EXTENSION = SketchupExtension.new(
      "Parsa Point to Component",
      File.join(PLUGIN_PATH, "parsa_point_to_component", "core.rb")
    )
    EXTENSION.version     = "1.0.0"
    EXTENSION.creator     = "Parsa"
    EXTENSION.description = "Place selected component at guide points or place circles from CSV."
    Sketchup.register_extension(EXTENSION, true)
  end
end
