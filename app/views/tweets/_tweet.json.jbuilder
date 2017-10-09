json.extract! tweet, :id, :dc_title_s, :dc_identifier_s, :layer_slug_s, :dc_description_s, :solr_geom, :dct_provenance_s, :dc_rights_s, :geoblacklight_version, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
