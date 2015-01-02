class Address < ActiveRecord::Base
  belongs_to :user

  before_save :prepare_to_save

  VALID_NAME_REGEX = /\A[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]+\z/u
  validates :first_name,              length: { in: 3..30 },
                                      format: { with: VALID_NAME_REGEX }

  validates :last_name,               length: { in: 3..30 },
                                      format: { with: VALID_NAME_REGEX }

  VALID_NUMBER_REGEX = /\d+/
  validates :tel_num,                 length: { is: 9 },
                                      format: { with: VALID_NUMBER_REGEX }

  validates :street,                  length: { in: 3..40 }

  VALID_HOUSE_NUMBER_REGEX = /\A\d{1,4}([a-z]{1})?((-|\/)\d{1,4})?([a-z]{1})?\z/
  validates :house_num,               length: { in: 1..9 },
                                      format: { with: VALID_HOUSE_NUMBER_REGEX }

  validates :town,                    length: { in: 3..40 }

  VALID_POSTCODE_REGEX = /\A\d{2}-\d{3}\z/
  validates :postcode,                length: { is: 6 },
                                      format: { with: VALID_POSTCODE_REGEX }

  validates :user,                    presence: true

  ###############################

  private

  def prepare_to_save
    first_name.capitalize!
    last_name.capitalize!
    street.capitalize!
    town.capitalize!
  end

end