module Parsa
  module PointToComponent
    def self.place_selected_component_on_guides
      model = Sketchup.active_model
      selection = model.selection

      component_instance = selection.find { |e| e.is_a?(Sketchup::ComponentInstance) }
      unless component_instance
        UI.messagebox("Select a component instance and at least one guide point.")
        return
      end

      component_def = component_instance.definition
      guide_points = selection.select { |e| e.is_a?(Sketchup::ConstructionPoint) }

      if guide_points.empty?
        UI.messagebox("No guide points selected.")
        return
      end

      model.start_operation("Place Component on Guides", true)

      guide_points.each do |pt|
        transform = Geom::Transformation.new(pt.position)
        model.active_entities.add_instance(component_def, transform)
      end

      model.commit_operation
    end
  end
end
