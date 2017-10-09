class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.text :dc_title_s
      t.text :dc_identifier_s
      t.text :layer_slug_s
      t.text :dc_description_s
      t.text :solr_geom
      t.text :dct_provenance_s
      t.text :dc_rights_s
      t.text :geoblacklight_version

      t.timestamps
    end
  end
end
