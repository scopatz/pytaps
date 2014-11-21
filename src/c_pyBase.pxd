cdef extern from "iBase.h":

    ctypedef void* iBase_Instance;
    ctypedef struct iBase_EntityHandle:
        pass
    ctypedef struct iBase_EntitySetHandle:
        pass
    ctypedef struct  iBase_TagHandle:
        pass
    ctypedef struct  iBase_EntityIterator:
        pass
    ctypedef struct  iBase_EntityArrIterator:
        pass

    enum iBase_EntityType:
        iBase_EntityType_MIN = 0
        iBase_VERTEX = iBase_EntityType_MIN
        iBase_EDGE = 1
        iBase_FACE = 2
        iBase_REGION = 3
        iBase_ALL_TYPES = 4
        iBase_EntityType_MAX = iBase_ALL_TYPES

    enum iBase_AdjacencyCost:
        iBase_AdjacencyCost_MIN = 0
        iBase_UNAVAILABLE = iBase_AdjacencyCost_MIN
        iBase_ALL_ORDER_1 = 1
        iBase_ALL_ORDER_LOGN = 2 
        iBase_ALL_ORDER_N = 3 
        iBase_SOME_ORDER_1 = 4
        iBase_SOME_ORDER_LOGN = 5
        iBase_SOME_ORDER_N = 6
        iBase_AVAILABLE = 7
        iBase_AdjacencyCost_MAX = iBase_AVAILABLE


    enum iBase_CreationStatus:
        iBase_CreationStatus_MIN = 0
        iBase_NEW = iBase_CreationStatus_MIN
        iBase_ALREADY_EXISTED = 1 
        iBase_CREATED_DUPLICATE = 2
        iBase_CREATION_FAILED = 3 
        iBase_CreationStatus_MAX = iBase_CREATION_FAILED


    enum iBase_ErrorType:
        iBase_ErrorType_MIN = 0
        iBase_SUCCESS = iBase_ErrorType_MIN
        iBase_MESH_ALREADY_LOADED = 1
        iBase_FILE_NOT_FOUND = 2
        iBase_FILE_WRITE_ERROR = 3
        iBase_NIL_ARRAY = 4
        iBase_BAD_ARRAY_SIZE = 5
        iBase_BAD_ARRAY_DIMENSION = 6
        iBase_INVALID_ENTITY_HANDLE = 7
        iBase_INVALID_ENTITY_COUNT = 8
        iBase_INVALID_ENTITY_TYPE = 9
        iBase_INVALID_ENTITY_TOPOLOGY = 10
        iBase_BAD_TYPE_AND_TOPO = 11
        iBase_ENTITY_CREATION_ERROR = 12
        iBase_INVALID_TAG_HANDLE = 13
        iBase_TAG_NOT_FOUND = 14
        iBase_TAG_ALREADY_EXISTS = 15 
        iBase_TAG_IN_USE = 16
        iBase_INVALID_ENTITYSET_HANDLE = 17 
        iBase_INVALID_ITERATOR_HANDLE = 18
        iBase_INVALID_ARGUMENT = 19
        iBase_MEMORY_ALLOCATION_FAILED = 20
        iBase_NOT_SUPPORTED = 21
        iBase_FAILURE = 22
        iBase_ErrorType_MAX = iBase_FAILURE
  

    enum iBase_StorageOrder:
        iBase_StorageOrder_MIN = 0
        iBase_BLOCKED = iBase_StorageOrder_MIN
        iBase_INTERLEAVED = 1
        iBase_StorageOrder_MAX = iBase_INTERLEAVED


    enum iBase_TagValueType:
        iBase_TagValueType_MIN = 0
        iBase_BYTES = iBase_TagValueType_MIN
        iBase_INTEGER = 1
        iBase_DOUBLE = 2
        iBase_ENTITY_HANDLE = 3
        iBase_ENTITY_SET_HANDLE = 4
        iBase_TagValueType_MAX = iBase_ENTITY_SET_HANDLE


