class Contact < ApplicationRecord
    belongs_to :kind

    def kind_descrition
        self.kind.descrition
    end

    def as_json(options={})
        super(
            root:true,
            methods: [:kind_descrition],
            include: { kind: { only: :descrition}}
        )
    end
end
