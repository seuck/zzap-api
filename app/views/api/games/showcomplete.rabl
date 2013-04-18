object @game

attributes :id, :name

child(:publisher) { attributes :id, :name}
child(:perspective) { attributes :id, :name}
child(:setting) { attributes :id, :name}
child(:genres) { attributes :id, :name}
child(:game_versions) {
	attribute :year
	child(:system) {
		attributes :id, :name
		child(:manufacturer) { attribute :id, :name }
	}
	child(:media) { attribute :id, :name }
	child(:developer) { attributes :id, :name }
}
