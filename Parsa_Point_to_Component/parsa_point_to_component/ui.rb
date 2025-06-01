module Parsa
  module PointToComponent
    unless file_loaded?(__FILE__)
      toolbar = UI::Toolbar.new("Parsa P2C")

      # Icon 1: From Guide Points
      cmd1 = UI::Command.new("Guide Points to Component") {
        Parsa::PointToComponent.place_selected_component_on_guides
      }
      cmd1.tooltip = "Replace selected guide points with selected component"
      icon_path = File.join(__dir__, "icons", "point_icon.png")
      cmd1.small_icon = icon_path
      cmd1.large_icon = icon_path
      toolbar.add_item(cmd1)

      # Icon 2: CSV to Circles
      cmd2 = UI::Command.new("CSV to Circles") {
        Parsa::PointToComponent.place_circle_from_csv
      }
      cmd2.tooltip = "Place circle components at CSV points"
      icon_path2 = File.join(__dir__, "icons", "csv_icon.png")
      cmd2.small_icon = icon_path2
      cmd2.large_icon = icon_path2
      toolbar.add_item(cmd2)

      toolbar.restore
      file_loaded(__FILE__)
    end
  end
end
