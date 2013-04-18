collection @games

attributes :id, :name

child(:publisher) { attributes :name}
child(:perspective) { attributes :name}
child(:setting) { attributes :name}
child(:genres) { attributes :name}
