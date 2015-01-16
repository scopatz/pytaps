from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize
import os
import sys
from Cython.Distutils import build_ext

setup(
    name = 'pytaps',
    cmdclass = {'build_ext': build_ext},
    packages = ['pytaps'],
    ext_modules = cythonize([
    Extension("pyBase", ["src/pyBase.pyx"]),
    Extension("pyMesh", ["src/pyMesh.pyx"]),
    Extension("pyGeom", ["src/pyGeom.pyx"])
    ])
)

