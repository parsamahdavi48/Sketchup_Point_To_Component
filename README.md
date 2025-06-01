# Sketchup_Point_To_Component

# Parsa Point to Component

A SketchUp extension for converting guide points or CSV coordinates into component instances — with a simple in-model UI.

---

## 🔧 Features

### 1. Convert Selected Guide Points to a Component
- Select **a component** already present in the model.
- Select one or more **guide points**.
- Click the toolbar icon to **place the component** at each point.

![image](https://github.com/user-attachments/assets/e6809895-ef78-4d2d-b6d2-1eeeb4f72458)


### 2. Import Points from CSV
- Import a `.csv` file containing `x`, `y`, and `z` columns.
- A **small circle marker component** is placed at each point.
- All placed instances are grouped and moved so the group origin aligns with `(0, 0, 0)`.
![image](https://github.com/user-attachments/assets/7a10aa26-5acd-4da3-af86-b5446ebfbb11)

![image](https://github.com/user-attachments/assets/15313595-a026-429e-8adf-5af3449c755b)


---

## 📁 Folder Structure

parsa_point_to_component/
├── parsa_point_to_component.rb # Main loader
├── parsa_point_to_component/
│ ├── core.rb # Extension registration
│ ├── csv_importer.rb # CSV file logic
│ ├── point_selector.rb # Guide point logic
│ └── ui.rb # UI buttons and toolbar
└── README.md


---

## 🚀 Installation

1. Clone or download this repository.
2. Copy both `parsa_point_to_component.rb` and the `parsa_point_to_component/` folder to:

C:/Users/YOUR_USERNAME/AppData/Roaming/SketchUp/SketchUp 2025/SketchUp/Plugins/


3. Restart SketchUp.

> A toolbar labeled **"Parsa Point to Component"** will appear with two icons.

---

## 📌 CSV Format Requirements

The CSV file must include at least the following headers (case-insensitive):

x,y,z
120.0,250.5,0.0
...


If the `z` column is missing, `z = 0` is assumed.

---

## 🧠 Developer Info

- **Author**: Parsa  
- **Field**: Landscape Architecture  
- **Target Platform**: SketchUp 2025  
- **Ruby Version**: 3.2.2  
- **Extension Version**: 1.0.0

---

## 🪪 License

This extension is provided under the **MIT License**. You may use, modify, and distribute it freely.

---

## 📬 Contact

For feedback or feature requests, open an issue on [GitHub](https://github.com/parsamahdavi48/parsa_point_to_component).
