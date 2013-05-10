object @volume
cache @volume

attributes :id, :label, :pages_number

child(:volume_type) {
	attributes :name
}
child(:scan_authors) {
	attributes :id, :name
}
child(:pages) {
	attributes :id, :label, :sequence
	child(:scan) {
		attribute :path
	}
	child(:tricks) {
		child(:trick_type) {
			attribute :name
		}
		child(:game_version) {
			attribute :id
			child(:game) {
				attributes :id, :name
			}
			child(:system) {
				attributes :name
				child(:manufacturer) {
					attribute :id, :name
				}
			}
			child(:media) {
				attribute :name
			}
		}
	}
	child(:adverts) {
		attributes :id, :name
		child(:game) {
			attributes :id, :name
		}
	}
	child(:reviews) {
		attribute :vote
		child(:game_version) {
			attribute :id
			child(:game) {
				attributes :id, :name
			}
			child(:system) {
				attributes :name
				child(:manufacturer) {
					attribute :id, :name
				}
			}
			child(:media) {
				attribute :name
			}
		}
	}
}

