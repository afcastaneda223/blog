module Visible
    extend ActiveSupport::Concern

    VALID_STATUSES = ['public', 'private', 'archived']

    include do
        validates :status, inclusion: { in: VALID_STATUSES }
    end

    class_method do
        def public_count
            where(status: 'public').count
        end
    end

    def archived?
        status == 'archived'
    end
    
end