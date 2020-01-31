# -*- coding: utf-8 -*-

### DO NOT DELETE THESE LINES ###
from collections import namedtuple
NewTupleType = namedtuple('NewTupleType', 'var1, var2')
### DO NOT DELETE THESE LINES ###

# Sample configuration

# simple constant
SAMPLE_CONST = 12345

# tuple constant
TUPLE_CONST = NewTupleType('text1', 1)

# dictionary constant
DICT_CONST = {
    'key1': {
    #   nr:            (  desc,  var)
        0: NewTupleType( 'val',    7),
    },
    'key2': {
        # ...
    }
}
