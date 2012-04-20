class Discovery
  attr_accessor :discovery_info, :session_id

  def self.make_from_session_id_and_attribute_name(session_id, operation_name)
    s = DiscoverySession.recent.find_by_discovery_session_id(session_id)
    unless s.nil?
      identities = s.user.find_identities_by_attribute_name(operation_name)
      discovery_info = Array.new
      identities.each do |i|
        discovery_info << {:domain => i.domain, :trid => i.TRID}
      end
      d = Discovery.new
      d.discovery_info = discovery_info
      d.session_id = session_id
      return d
    end
  end
end
