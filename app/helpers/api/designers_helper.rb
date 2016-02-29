module Api::DesignersHelper
  def self.gen_designer_auth(designer)
    access_token = get_access_token(designer)
    access_token = get_access_token(designer) while duplicated(access_token)
    DesignerAuth.create(designer_id: designer.id, access_token: access_token)
  end

  def self.duplicated(access_token)
    DesignerAuth.all.find_by_access_token(access_token).present?
  end

  def self.get_access_token(designer)
    id = designer.id
    pw = designer.password
    realm = Digest::SHA1.hexdigest(SecureRandom.base64)
    Digest::MD5.hexdigest([id, realm, pw].join(':'))
  end
end