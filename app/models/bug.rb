class Bug < ApplicationRecord
    belongs_to :user, required: true
    belongs_to :developer, class_name: "User", optional: true
    belongs_to :project
    enum status: {new_bug: 0, started: 1, completed: 2, resolved: 3}
    enum bug_type: {feature: 0, bug: 1}
    validate :image_type
    mount_uploader :image, ImageUploader
    validates :title, presence: true, uniqueness: true
    validates :status, presence: true
    validates :bug_type, presence: true
    private
    def image_type
        unless image or image.content_type =~ /^image\/(gif|png)$/
            errors.add(:upload, "Invalid type!")
        end
    end
end
