class Tweet < ActiveRecord::Base
  validates :dc_identifier_s, :layer_slug_s, :dc_title_s, :dc_description_s,
            :solr_geom, :dc_rights_s, :geoblacklight_version, presence: true

  after_commit :index_data_in_solr, on: [:create, :update]
  before_destroy :remove_data_from_solr

  def to_solr
    {
      "dc_identifier_s" => dc_identifier_s, "layer_slug_s" => layer_slug_s, "dc_title_s" => dc_title_s, "dc_description_s" => dc_description_s,
      "solr_geom" => solr_geom, "solr_geom" => solr_geom, "geoblacklight_version" => geoblacklight_version, "id" => id
    }
  end


  def index_data_in_solr
    SolrService.add(to_solr)
    SolrService.commit
  end

  def remove_data_from_solr
    SolrService.delete_by_id(id)
    SolrService.commit
  end
end
