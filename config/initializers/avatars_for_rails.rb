AvatarsForRails.setup do |config|
  config.avatarable_model = :user
  config.current_avatarable_object = :current_user
  config.avatarable_filters = []
  config.avatarable_styles = { :representation => "20x20>",
                                   :tie => "30x30>",
                                   :actor => '35x35>',
                                   :profile => '94x94'}

end