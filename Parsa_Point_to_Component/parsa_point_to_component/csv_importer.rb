require 'csv'

module Parsa
  module PointToComponent

    CIRCLE_NAME = 'CircleMarker'

    def self.ensure_circle_component
      model = Sketchup.active_model
      defs = model.definitions
      existing = defs[CIRCLE_NAME]
      return existing if existing

      circle_def = defs.add(CIRCLE_NAME)
      entities = circle_def.entities
      center = Geom::Point3d.new(0, 0, 0)
      normal = Geom::Vector3d.new(0, 0, 1)
      edges = entities.add_circle(center, normal, 10.cm, 24)
      face = entities.add_face(edges)
      face.reverse! if face.normal.z < 0
      circle_def
    end

    def self.place_circle_from_csv
      model = Sketchup.active_model
      component_def = ensure_circle_component

      file_path = UI.openpanel("Select CSV File", "", "CSV Files|*.csv||")
      return unless file_path && File.exist?(file_path)

      points = []
      begin
        headers = nil
        x_idx = y_idx = z_idx = nil

        CSV.foreach(file_path, headers: true).with_index do |row, i|
          if i == 0
            headers = row.headers.map(&:downcase)
            x_idx = headers.index('x')
            y_idx = headers.index('y')
            z_idx = headers.index('z')
            unless x_idx && y_idx
              UI.messagebox("CSV must contain 'x' and 'y' headers.")
              return
            end
          end

          x = row[x_idx].to_f
          y = row[y_idx].to_f
          z = z_idx ? row[z_idx].to_f : 0.0
          points << Geom::Point3d.new(x, y, z)
        end

      rescue => e
        UI.messagebox("Error reading CSV: #{e.message}")
        return
      end

      model.start_operation("Place Circles from CSV", true)

      # Place instances directly into model's active_entities
      instances = []
      points.each do |pt|
        transform = Geom::Transformation.new(pt)
        instance = model.active_entities.add_instance(component_def, transform)
        instances << instance
      end

      # Group all instances
      group = model.active_entities.add_group(instances)

      # Calculate group's bounding box origin (min corner)
      bbox = group.bounds
      origin = bbox.corner(0) # Lower-left-front corner

      # Move group to model origin (0,0,0)
      translation = Geom::Transformation.new(origin.vector_to(Geom::Point3d.new(0,0,0)))
      group.transform!(translation)

      model.commit_operation

      UI.messagebox("Placed #{points.size} points inside a group moved to origin.")
    end

  end
end
