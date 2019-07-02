class ChangeSchoolClassesTableNameBack < ActiveRecord::Migration
  def change
    rename_table :school_classes, :schoolclasses
  end
end