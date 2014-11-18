import os
from xdress.utils import apiname


package = 'pytaps'     # top-level python package name
packagedir = 'pytaps'  # location of the python package

includes = ['itaps']

_fromsrcdir = lambda x: os.path.join('itaps', x)

plugins = ('xdress.autoall', 'xdress.pep8names', 'xdress.cythongen', 
           'xdress.extratypes')

extra_types = 'pytaps_extra_types'  # non-default value

_inbase = {'srcfiles': _fromsrcdir('ibase.h'),
             'incfiles': 'ibase.h',
             }



_ingeom = {'srcfiles': _fromsrcdir('igeom/FBiGeom.h'),
             'incfiles': 'igeom/FBiGeom.h',
             }

_inmesh = {'srcfiles': _fromsrcdir('imesh/iMesh.h'),
             'incfiles': 'iMesh/iMesh.h',
             }


# will be used later, but need to be present now
variables = [
	apiname('*',tarbase='pyBase', **_inbase),
	apiname('*',tarbase='pyGeom', **_ingeom),
	apiname('*',tarbase='pyMesh', **_inmesh),
	#apiname('iBase_EntityType',tarbase='pyBase', **_inbase),
	#apiname('iBase_AdjacencyCost',tarbase='pyBase', **_inbase),
	#apiname('iBase_CreationStatus',tarbase='pyBase', **_inbase),
	#apiname('iBase_ErrorType',tarbase='pyBase', **_inbase),	
	#apiname('iBase_StorageOrder',tarbase='pyBase', **_inbase),
	#apiname('iBase_TagValueType',tarbase='pyBase', **_inbase),	
		]

classes = [
	apiname('*', tarbase='pyBase', **_inbase),
	apiname('*', tarbase='pyGeom', **_ingeom),
	apiname('*', tarbase='pyMesh',**_inmesh),
	apiname('iBase_EntityHandle', tarbase='pyBase', **_inbase),	
	apiname('iBase_EntitySetHandle', tarbase='pyBase', **_inbase),
	apiname('iBase_TagHandle', tarbase='pyBase', **_inbase),
	apiname('iBase_EntityIterator', tarbase='pyBase', **_inbase),
	apiname('iBase_EntityArrIterator', tarbase='pyBase', **_inbase),
]

functions = [
	apiname('*', **_ingeom),
]

del os
del apiname
