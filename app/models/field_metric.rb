class FieldMetric < ServiceAbstract
	belongs_to :field
	belongs_to :metric
	has_many :profiles
	has_many :data_point

	def self.field_metric(fld, met)
		FieldMetric.where(:field_id => fld.id, :metric_id => met.id).first
	end

	def self.named(fld, met)
		FieldMetric.joins(:field, :metric).where('fields.name' => fld, 'metrics.name' => met).first
	end


end
