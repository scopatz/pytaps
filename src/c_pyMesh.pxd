
cimport c_pyBase


cdef extern from "iMesh.h":


    ctypedef struct iMesh_Instance:
        pass

    enum iMesh_EntityTopology:
        iMesh_EntityTopology_MIN = 0
        iMesh_POINT = iMesh_EntityTopology_MIN
        iMesh_LINE_SEGMENT = 1
        iMesh_POLYGON = 2
        iMesh_TRIANGLE = 3
        iMesh_QUADRILATERAL = 4
        iMesh_POLYHEDRON = 5
        iMesh_TETRAHEDRON = 6
        iMesh_HEXAHEDRON = 7
        iMesh_PRISM = 8
        iMesh_PYRAMID = 9
        iMesh_SEPTAHEDRON = 10
        iMesh_ALL_TOPOLOGIES = 11
        iMesh_EntityTopology_MAX = iMesh_ALL_TOPOLOGIES


    void iMesh_getErrorType(
        iMesh_Instance instance, 
        int* error_type  );

    void iMesh_getDescription(
        iMesh_Instance instance, 
        char* descr, 
        int descr_len  );


    void iMesh_newMesh(
        const char* options, 
        iMesh_Instance* instance, 
        int* err, 
        int options_len  );


    void iMesh_dtor(
        iMesh_Instance instance, 
        int* err  );


    void iMesh_load(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntitySetHandle entity_set_handle, 
        const char* name, 
        const char* options, 
        int* err, 
        int name_len, 
        int options_len  );


    void iMesh_save(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntitySetHandle entity_set_handle, 
        const char* name, 
        const char* options, 
        int* err, 
        const int name_len, 
        int options_len  );


    void iMesh_getRootSet(
        iMesh_Instance instance, 
        c_pyBase.iBase_EntitySetHandle* root_set, 
        int* err);


    void iMesh_getGeometricDimension(
        iMesh_Instance instance, 
        int* geom_dim, 
        int* err  );

    void iMesh_setGeometricDimension(
         iMesh_Instance instance, 
        int geom_dim, 
        int* err   );

    void iMesh_getDfltStorage(
        iMesh_Instance instance, 
        int* order, 
        int* err  );


    void iMesh_getAdjTable (
        iMesh_Instance instance, 
        int** adjacency_table, 
        int* adjacency_table_allocated, 
        int* adjacency_table_size, 
        int* err  );

    void iMesh_setAdjTable (
        iMesh_Instance instance, 
        int* adjacency_table, 
        int adjacency_table_size, 
        int* err  );


    void iMesh_getNumOfType(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntitySetHandle entity_set_handle, 
        const int entity_type, 
        int* num_type, 
        int* err  );


    void iMesh_getNumOfTopo(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntitySetHandle entity_set_handle, 
        const int entity_topology, 
        int* num_topo, 
        int* err  );


    void iMesh_optimize(
        iMesh_Instance instance, 
        int* handles_invalidated,
        int* err  );


    void iMesh_getEntities(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntitySetHandle entity_set_handle, 
        const int entity_type, 
        const int entity_topology, 
        c_pyBase.iBase_EntityHandle** entity_handles, 
        int* entity_handles_allocated, 
        int* entity_handles_size, 
        int* err  );


    void iMesh_getVtxArrCoords(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntityHandle* vertex_handles, 
        const int vertex_handles_size, 
        const int storage_order, 
        double** coords, 
        int* coords_allocated, 
        int* coords_size, 
        int* err  );


    void iMesh_initEntArrIter(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntitySetHandle entity_set_handle, 
        const int requested_entity_type, 
        const int requested_entity_topology, 
        const int requested_array_size, 
        const int resilient,
        c_pyBase.iBase_EntityArrIterator* entArr_iterator, 
        int* err  );


    void iMesh_getNextEntArrIter(
        iMesh_Instance instance, 
        c_pyBase.iBase_EntityArrIterator entArr_iterator, 
        c_pyBase.iBase_EntityHandle** entity_handles, 
        int* entity_handles_allocated, 
        int* entity_handles_size, 
        int* has_data, 
        int* err  );


    void iMesh_resetEntArrIter(
        iMesh_Instance instance, 
        c_pyBase.iBase_EntityArrIterator entArr_iterator, 
        int* err  );


    void iMesh_endEntArrIter(
        iMesh_Instance instance, 
        c_pyBase.iBase_EntityArrIterator entArr_iterator, 
        int* err  );


    void iMesh_getEntArrTopo(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntityHandle* entity_handles, 
        const int entity_handles_size, 
        int** topology, 
        int* topology_allocated, 
        int* topology_size, 
        int* err  );


    void iMesh_getEntArrType(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntityHandle* entity_handles, 
        const int entity_handles_size, 
        int** type, 
        int* type_allocated, 
        int* type_size, 
        int* err  );


    void iMesh_getEntArrAdj(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntityHandle* entity_handles, 
        const int entity_handles_size, 
        const int entity_type_requested, 
        c_pyBase.iBase_EntityHandle** adjacentEntityHandles, 
        int* adjacentEntityHandles_allocated, 
        int* adj_entity_handles_size, 
        int** offset, 
        int* offset_allocated, 
        int* offset_size, 
        int* err  );


    void iMesh_getEntArr2ndAdj(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntityHandle * entity_handles, 
        int entity_handles_size, 
        int bridge_entity_type, 
        int requested_entity_type, 
        c_pyBase.iBase_EntityHandle** adj_entity_handles, 
        int* adj_entity_handles_allocated, 
        int* adj_entity_handles_size, 
        int** offset, 
        int* offset_allocated, 
        int* offset_size, 
        int* err   );



    void iMesh_getAdjEntIndices(
        iMesh_Instance instance, 
        c_pyBase.iBase_EntitySetHandle entity_set_handle, 
        int entity_type_requester, 
        int entity_topology_requester, 
        int entity_type_requested, 
        c_pyBase.iBase_EntityHandle** entity_handles, 
        int* entity_handles_allocated, 
        int* entity_handles_size, 
        c_pyBase.iBase_EntityHandle** adj_entity_handles, 
        int* adj_entity_handles_allocated, 
        int* adj_entity_handles_size, 
        int** adj_entity_indices, 
        int* adj_entity_indices_allocated, 
        int* adj_entity_indices_size, 
        int** offset, 
        int* offset_allocated, 
        int* offset_size, 
        int* err  );




    void iMesh_createEntSet(
        iMesh_Instance instance, 
        const int isList, 
        c_pyBase.iBase_EntitySetHandle* entity_set_created, 
        int* err  );



    void iMesh_destroyEntSet(
        iMesh_Instance instance, 
        c_pyBase.iBase_EntitySetHandle entity_set, 
        int* err  );



    void iMesh_isList(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntitySetHandle entity_set, 
        int* is_list, 
        int* err  );


    void iMesh_getNumEntSets(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntitySetHandle entity_set_handle, 
        const int num_hops, 
        int* num_sets, 
        int* err  );



    void iMesh_getEntSets(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntitySetHandle entity_set_handle, 
        const int num_hops, 
        c_pyBase.iBase_EntitySetHandle** contained_set_handles, 
        int* contained_set_handles_allocated, 
        int* contained_set_handles_size, 
        int* err  );


    void iMesh_addEntToSet(
        iMesh_Instance instance, 
        c_pyBase.iBase_EntityHandle entity_handle, 
        c_pyBase.iBase_EntitySetHandle entity_set, 
        int* err  );


    void iMesh_rmvEntFromSet(
        iMesh_Instance instance, 
        c_pyBase.iBase_EntityHandle entity_handle, 
        c_pyBase.iBase_EntitySetHandle entity_set, 
        int* err  );


    void iMesh_addEntArrToSet(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntityHandle* entity_handles, 
        int entity_handles_size, 
        c_pyBase.iBase_EntitySetHandle entity_set, 
        int* err  );


    void iMesh_rmvEntArrFromSet(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntityHandle* entity_handles, 
        int entity_handles_size, 
        c_pyBase.iBase_EntitySetHandle entity_set, 
        int* err  );


    void iMesh_addEntSet(
        iMesh_Instance instance, 
        c_pyBase.iBase_EntitySetHandle entity_set_to_add, 
        c_pyBase.iBase_EntitySetHandle entity_set_handle, 
        int* err  );


    void iMesh_rmvEntSet(
        iMesh_Instance instance, 
        c_pyBase.iBase_EntitySetHandle entity_set_to_remove, 
        c_pyBase.iBase_EntitySetHandle entity_set_handle, 
        int* err  );


    void iMesh_isEntContained(
        iMesh_Instance instance, 
        c_pyBase.iBase_EntitySetHandle containing_entity_set, 
        c_pyBase.iBase_EntityHandle contained_entity, 
        int* is_contained, 
        int* err  );


    void iMesh_isEntArrContained(
         iMesh_Instance instance, 
        c_pyBase.iBase_EntitySetHandle containing_entity_set, 
        const c_pyBase.iBase_EntityHandle* entity_handles, 
        int num_entity_handles, 
        int** is_contained, 
        int* is_contained_allocated, 
        int* is_contained_size, 
        int* err   );


    void iMesh_isEntSetContained(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntitySetHandle containing_entity_set, 
        const c_pyBase.iBase_EntitySetHandle contained_entity_set, 
        int* is_contained, 
        int* err  );


    void iMesh_addPrntChld(
        iMesh_Instance instance, 
        c_pyBase.iBase_EntitySetHandle parent_entity_set, 
        c_pyBase.iBase_EntitySetHandle child_entity_set, 
        int* err  );


    void iMesh_rmvPrntChld(
        iMesh_Instance instance, 
        c_pyBase.iBase_EntitySetHandle parent_entity_set, 
        c_pyBase.iBase_EntitySetHandle child_entity_set, 
        int* err  );


    void iMesh_isChildOf(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntitySetHandle parent_entity_set, 
        const c_pyBase.iBase_EntitySetHandle child_entity_set, 
        int* is_child, 
        int* err  );



    void iMesh_getNumChld(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntitySetHandle entity_set, 
        const int num_hops, 
        int* num_child, 
        int* err  );


    void iMesh_getNumPrnt(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntitySetHandle entity_set, 
        const int num_hops, 
        int* num_parent, 
        int* err  );


    void iMesh_getChldn(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntitySetHandle from_entity_set, 
        const int num_hops, 
        c_pyBase.iBase_EntitySetHandle** entity_set_handles, 
        int* entity_set_handles_allocated, 
        int* entity_set_handles_size, 
        int* err  );


    void iMesh_getPrnts(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntitySetHandle from_entity_set, 
        const int num_hops, 
        c_pyBase.iBase_EntitySetHandle** entity_set_handles, 
        int* entity_set_handles_allocated, 
        int* entity_set_handles_size, 
        int* err  );


    void iMesh_setVtxArrCoords(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntityHandle* vertex_handles, 
        const int vertex_handles_size, 
        const int storage_order, 
        const double* new_coords, 
        const int new_coords_size, 
        int* err  );


    void iMesh_createVtxArr(
        iMesh_Instance instance, 
        const int num_verts, 
        const int storage_order, 
        const double* new_coords, 
        const int new_coords_size, 
        c_pyBase.iBase_EntityHandle** new_vertex_handles, 
        int* new_vertex_handles_allocated, 
        int* new_vertex_handles_size, 
        int* err  );


    void iMesh_createEntArr(
        iMesh_Instance instance, 
        const int new_entity_topology, 
        const c_pyBase.iBase_EntityHandle* lower_order_entity_handles, 
        const int lower_order_entity_handles_size, 
        c_pyBase.iBase_EntityHandle** new_entity_handles, 
        int* new_entity_handles_allocated, 
        int* new_entity_handles_size, 
        int** status, 
        int* status_allocated, 
        int* status_size, 
        int* err  );


    void iMesh_deleteEntArr(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntityHandle* entity_handles, 
        const int entity_handles_size, 
        int* err  );


    void iMesh_createTag(
        iMesh_Instance instance, 
        const char* tag_name, 
        const int tag_size, 
        const int tag_type, 
        c_pyBase.iBase_TagHandle* tag_handle, 
        int* err, 
        const int tag_name_len  );


    void iMesh_destroyTag(
        iMesh_Instance instance, 
        c_pyBase.iBase_TagHandle tag_handle, 
        const int forced, 
        int* err  );


    void iMesh_getTagName(
        iMesh_Instance instance, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        char* name, 
        int* err, 
        int name_len  );


    void iMesh_getTagSizeValues(
        iMesh_Instance instance, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        int* tag_size, 
        int* err  );


    void iMesh_getTagSizeBytes(
        iMesh_Instance instance, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        int* tag_size, 
        int* err  );


    void iMesh_getTagHandle(
        iMesh_Instance instance, 
        const char* tag_name, 
        c_pyBase.iBase_TagHandle* tag_handle, 
        int* err, 
        int tag_name_len  );


    void iMesh_getTagType(
        iMesh_Instance instance, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        int* tag_type, 
        int* err  );


    void iMesh_setEntSetData(
        iMesh_Instance instance, 
        c_pyBase.iBase_EntitySetHandle entity_set_handle, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        const void* tag_value, 
        const int tag_value_size, 
        int* err  );


    void iMesh_setEntSetIntData(
        iMesh_Instance instance, 
        c_pyBase.iBase_EntitySetHandle entity_set, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        const int tag_value, 
        int* err  );


    void iMesh_setEntSetDblData(
        iMesh_Instance instance, 
        c_pyBase.iBase_EntitySetHandle entity_set, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        const double tag_value, 
        int* err  );


    void iMesh_setEntSetEHData(
        iMesh_Instance instance, 
        c_pyBase.iBase_EntitySetHandle entity_set, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        const c_pyBase.iBase_EntityHandle tag_value, 
        int* err  );


    void iMesh_setEntSetESHData(
        iMesh_Instance instance, 
        c_pyBase.iBase_EntitySetHandle entity_set, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        const c_pyBase.iBase_EntitySetHandle tag_value, 
        int* err  );


    void iMesh_getEntSetData(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntitySetHandle entity_set_handle, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        void* tag_value, 
        int* tag_value_allocated, 
        int* tag_value_size, 
        int* err  );


    void iMesh_getEntSetIntData(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntitySetHandle entity_set, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        int* out_data, 
        int* err  );


    void iMesh_getEntSetDblData(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntitySetHandle entity_set, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        double* out_data, 
        int* err  );


    void iMesh_getEntSetEHData(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntitySetHandle entity_set, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        c_pyBase.iBase_EntityHandle* out_data, 
        int* err  );


    void iMesh_getEntSetESHData(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntitySetHandle entity_set, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        c_pyBase.iBase_EntitySetHandle* out_data, 
        int* err  );


    void iMesh_getAllEntSetTags(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntitySetHandle entity_set_handle, 
        c_pyBase.iBase_TagHandle** tag_handles, 
        int* tag_handles_allocated, 
        int* tag_handles_size, 
        int* err  );


    void iMesh_rmvEntSetTag(
        iMesh_Instance instance, 
        c_pyBase.iBase_EntitySetHandle entity_set_handle, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        int* err  );


    void iMesh_setVtxCoord(
        iMesh_Instance instance, 
        c_pyBase.iBase_EntityHandle vertex_handle, 
        const double x, 
        const double y, 
        const double z, 
        int* err  );


    void iMesh_createVtx(
        iMesh_Instance instance, 
        const double x, 
        const double y, 
        const double z, 
        c_pyBase.iBase_EntityHandle* new_vertex_handle, 
        int* err  );


    void iMesh_createEnt(
        iMesh_Instance instance, 
        const int new_entity_topology, 
        const c_pyBase.iBase_EntityHandle* lower_order_entity_handles, 
        const int lower_order_entity_handles_size, 
        c_pyBase.iBase_EntityHandle* new_entity_handle,
        int* status, 
        int* err  );


    void iMesh_deleteEnt(
        iMesh_Instance instance, 
        c_pyBase.iBase_EntityHandle entity_handle, 
        int* err  );


    void iMesh_getArrData(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntityHandle* entity_handles, 
        const int entity_handles_size, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        void* tag_values, 
        int* tag_values_allocated, 
        int* tag_values_size, 
        int* err  );


    void iMesh_getIntArrData(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntityHandle* entity_handles, 
        const int entity_handles_size, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        int** tag_values, 
        int* tag_values_allocated, 
        int* tag_values_size, 
        int* err  );


    void iMesh_getDblArrData(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntityHandle* entity_handles, 
        const int entity_handles_size, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        double** tag_values, 
        int* tag_values_allocated, 
        int* tag_values_size, 
        int* err  );


    void iMesh_getEHArrData(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntityHandle* entity_handles, 
        const int entity_handles_size, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        c_pyBase.iBase_EntityHandle** tag_value, 
        int* tag_value_allocated, 
        int* tag_value_size, 
        int* err  );


    void iMesh_getESHArrData(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntityHandle* entity_handles, 
        const int entity_handles_size, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        c_pyBase.iBase_EntitySetHandle** tag_value, 
        int* tag_value_allocated, 
        int* tag_value_size, 
        int* err  );


    void iMesh_setArrData(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntityHandle* entity_handles, 
        const int entity_handles_size, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        const void* tag_values, 
        const int tag_values_size, 
        int* err  );


    void iMesh_setIntArrData(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntityHandle* entity_handles, 
        const int entity_handles_size, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        const int* tag_values, 
        const int tag_values_size, 
        int* err  );


    void iMesh_setDblArrData(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntityHandle* entity_handles, 
        const int entity_handles_size, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        const double* tag_values, 
        const int tag_values_size, 
        int* err  );


    void iMesh_setEHArrData(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntityHandle* entity_handles, 
        const int entity_handles_size, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        const c_pyBase.iBase_EntityHandle* tag_values, 
        const int tag_values_size, 
        int* err  );


    void iMesh_setESHArrData(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntityHandle* entity_handles, 
        const int entity_handles_size, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        const c_pyBase.iBase_EntitySetHandle* tag_values, 
        const int tag_values_size, 
        int* err  );


    void iMesh_rmvArrTag(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntityHandle* entity_handles, 
        const int entity_handles_size, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        int* err  );


    void iMesh_getData(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntityHandle entity_handle, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        void* tag_value, 
        int* tag_value_allocated, 
        int* tag_value_size, 
        int* err  );


    void iMesh_getIntData(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntityHandle entity_handle, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        int* out_data, 
        int* err  );


    void iMesh_getDblData(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntityHandle entity_handle, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        double* out_data, 
        int* err  );


    void iMesh_getEHData(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntityHandle entity_handle, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        c_pyBase.iBase_EntityHandle* out_data, 
        int* err  );


    void iMesh_getESHData(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntityHandle entity_handle, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        c_pyBase.iBase_EntitySetHandle* out_data, 
        int* err  );


    void iMesh_setData(
        iMesh_Instance instance, 
        c_pyBase.iBase_EntityHandle entity_handle, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        const void* tag_value, 
        const int tag_value_size, 
        int* err  );


    void iMesh_setIntData(
        iMesh_Instance instance, 
        c_pyBase.iBase_EntityHandle entity_handle, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        const int tag_value, 
        int* err  );


    void iMesh_setDblData(
        iMesh_Instance instance,
        c_pyBase.iBase_EntityHandle entity_handle, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        const double tag_value, 
        int* err  );


    void iMesh_setEHData(
        iMesh_Instance instance, 
        c_pyBase.iBase_EntityHandle entity_handle, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        const c_pyBase.iBase_EntityHandle tag_value, 
        int* err  );


    void iMesh_setESHData(
        iMesh_Instance instance, 
        c_pyBase.iBase_EntityHandle entity_handle, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        const c_pyBase.iBase_EntitySetHandle tag_value, 
        int* err  );


    void iMesh_getAllTags(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntityHandle entity_handle, 
        c_pyBase.iBase_TagHandle** tag_handles, 
        int* tag_handles_allocated, 
        int* tag_handles_size, 
        int* err  );


    void iMesh_rmvTag(
        iMesh_Instance instance, 
        c_pyBase.iBase_EntityHandle entity_handle, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        int* err  );


    void iMesh_initEntIter(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntitySetHandle entity_set_handle, 
        const int requested_entity_type, 
        const int requested_entity_topology, 
        const int resilient,
        c_pyBase.iBase_EntityIterator* entity_iterator, 
        int* err  );


    void iMesh_getNextEntIter(
        iMesh_Instance instance, 
        c_pyBase.iBase_EntityIterator entity_iterator, 
        c_pyBase.iBase_EntityHandle* entity_handle, 
        int* has_data, 
        int* err  );


    void iMesh_resetEntIter(
        iMesh_Instance instance, 
        c_pyBase.iBase_EntityIterator entity_iterator, 
        int* err  );


    void iMesh_endEntIter(
        iMesh_Instance instance, 
        c_pyBase.iBase_EntityIterator entity_iterator, 
        int* err  );


    void iMesh_getEntTopo(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntityHandle entity_handle, 
        int* out_topo, 
        int* err  );


    void iMesh_getEntType(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntityHandle entity_handle, 
        int* out_type, 
        int* err  );


    void iMesh_getVtxCoord(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntityHandle vertex_handle, 
        double* x, 
        double* y, 
        double* z, 
        int* err  );


    void iMesh_getEntAdj(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntityHandle entity_handle, 
        const int entity_type_requested, 
        c_pyBase.iBase_EntityHandle** adj_entity_handles, 
        int* adj_entity_handles_allocated, 
        int* adj_entity_handles_size, 
        int* err  );


    void iMesh_getEnt2ndAdj(
        iMesh_Instance instance, 
        c_pyBase.iBase_EntityHandle entity_handle, 
        int bridge_entity_type, 
        int requested_entity_type, 
        c_pyBase.iBase_EntityHandle** adjacent_entities, 
        int* adjacent_entities_allocated, 
        int* adjacent_entities_size, 
        int* err   );


    void iMesh_subtract(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntitySetHandle entity_set_1, 
        const c_pyBase.iBase_EntitySetHandle entity_set_2, 
        c_pyBase.iBase_EntitySetHandle* result_entity_set, 
        int* err  );


    void iMesh_intersect(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntitySetHandle entity_set_1, 
        const c_pyBase.iBase_EntitySetHandle entity_set_2, 
        c_pyBase.iBase_EntitySetHandle* result_entity_set, 
        int* err  );


    void iMesh_unite(
        iMesh_Instance instance, 
        const c_pyBase.iBase_EntitySetHandle entity_set_1, 
        const c_pyBase.iBase_EntitySetHandle entity_set_2, 
        c_pyBase.iBase_EntitySetHandle* result_entity_set, 
        int* err  );


