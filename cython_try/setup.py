from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize

examples_extension = Extension(
    name="test_cython",
    sources=["main.pyx"],
    libraries=["main"],
    library_dirs=["lib"],
    include_dirs=["lib"]
)
setup(
    name="test_cython",
    ext_modules=cythonize([examples_extension])
)