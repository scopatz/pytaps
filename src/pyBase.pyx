cimport c_pyBase


from libc.stdlib cimport malloc, free

cdef class iBase_EntityHandle:
    cdef c_pyBase.iBase_EntityHandle* _c_queue
    def __cinit__(self):
        self._c_queue =<c_pyBase.iBase_EntityHandle *> malloc(sizeof(c_pyBase.iBase_EntityHandle))
        if self._c_queue is NULL:
            raise MemoryError()

    def __dealloc__(self):
        if <void *>self._c_queue is not NULL:
            free(<void *>self._c_queue)



cdef class iBase_EntitySetHandle:
    cdef c_pyBase.iBase_EntitySetHandle* _c_queue
    def __cinit__(self):
        self._c_queue =<c_pyBase.iBase_EntitySetHandle *> malloc(sizeof(c_pyBase.iBase_EntitySetHandle))
        if self._c_queue is NULL:
            raise MemoryError()

    def __dealloc__(self):
        if <void *>self._c_queue is not NULL:
            free(<void *>self._c_queue)


cdef class iBase_TagHandle:
    cdef c_pyBase.iBase_TagHandle* _c_queue
    def __cinit__(self):
        self._c_queue =<c_pyBase.iBase_TagHandle *> malloc(sizeof(c_pyBase.iBase_TagHandle))
        if self._c_queue is NULL:
            raise MemoryError()

    def __dealloc__(self):
        if <void *>self._c_queue is not NULL:
            free(<void *>self._c_queue)


cdef class iBase_EntityIterator:
    cdef c_pyBase.iBase_EntityIterator* _c_queue
    def __cinit__(self):
        self._c_queue =<c_pyBase.iBase_EntityIterator *> malloc(sizeof(c_pyBase.iBase_EntityIterator))
        if self._c_queue is NULL:
            raise MemoryError()

    def __dealloc__(self):
        if <void *>self._c_queue is not NULL:
            free(<void *>self._c_queue)


