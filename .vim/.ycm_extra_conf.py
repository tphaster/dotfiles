def Settings(**kwargs):
	return {
		'flags': [
			'-x',
			'c++',
			'-Wall',
			'-Wextra',
			'-Werror'
			'-I/usr/lib/',
			'-I/usr/include/'
		],
	}
