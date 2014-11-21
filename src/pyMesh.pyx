cimport c_pyMesh
cimport c_pyBase

from libc.stdlib cimport malloc, free


cdef class iMesh_Instance:
    cdef c_pyMesh.iMesh_Instance* instance

    def __cinit__(self, const char* options, int err,int options_len ):
        c_pyMesh.iMesh_newMesh(options,self.instance,<int *>err,options_len)
        if self.instance is NULL:
            raise MemoryError()

    def __dealloc__(self):
        if <void *>self.instance is not NULL:
            free(<void *>self.instance)

    cdef iMesh_getErrorType(self,int* error_type):
        c_pyMesh.iMesh_getErrorType(self.instance[0],error_type)

    cdef iMesh_getDescription(self,char* descr,int descr_len  ):
        c_pyMesh.iMesh_getDescription(self.instance[0],descr,descr_len)


    cdef iMesh_dtor(self,int* err  ):
        c_pyMesh.iMesh_dtor(self.instance[0],err)


    cdef iMesh_load(self, const c_pyBase.iBase_EntitySetHandle entity_set_handle, 
        const char* name, const char* options, 
        int* err, int name_len, int options_len  ):
        c_pyMesh.iMesh_load(self.instance[0],entity_set_handle,name,options,err,name_len,options_len)



    cdef iMesh_save(self, const c_pyBase.iBase_EntitySetHandle entity_set_handle, 
        const char* name, const char* options, int* err, const int name_len, 
        int options_len  ):
        c_pyMesh.iMesh_save(self.instance[0],entity_set_handle,name,options,err,name_len,options_len)


    cdef iMesh_getRootSet(self, c_pyBase.iBase_EntitySetHandle* root_set, int* err  ):
        c_pyMesh.iMesh_getRootSet(self.instance[0],root_set,err)


    cdef iMesh_getGeometricDimension(self,int* geom_dim,int* err  ):
        c_pyMesh.iMesh_getGeometricDimension(self.instance[0],geom_dim,err)


    cdef iMesh_setGeometricDimension(self,int geom_dim,int* err   ):
        c_pyMesh.iMesh_setGeometricDimension(self.instance[0],geom_dim,err)


    cdef iMesh_getDfltStorage(self, int* order, int* err  ):
        c_pyMesh.iMesh_getDfltStorage(self.instance[0],order,err)


    cdef iMesh_getAdjTable (self,int** adjacency_table,int* adjacency_table_allocated, 
        int* adjacency_table_size, int* err  ):
        c_pyMesh.iMesh_getAdjTable(self.instance[0],adjacency_table,adjacency_table_allocated,
            adjacency_table_size,err)

    cdef iMesh_setAdjTable (self,int* adjacency_table,int adjacency_table_size,int* err):
        c_pyMesh.iMesh_setAdjTable(self.instance[0], adjacency_table, adjacency_table_size, err)


    cdef iMesh_getNumOfType(self, const c_pyBase.iBase_EntitySetHandle entity_set_handle, 
        const int entity_type, int* num_type, int* err  ):
        c_pyMesh.iMesh_getNumOfType(self.instance[0], entity_set_handle, 
            entity_type,  num_type,  err  )


    cdef iMesh_getNumOfTopo(self, const c_pyBase.iBase_EntitySetHandle entity_set_handle, 
        const int entity_topology, int* num_topo, int* err  ):
        c_pyMesh.iMesh_getNumOfTopo(self.instance[0],entity_set_handle,entity_topology,num_topo,err)


    cdef iMesh_optimize(self, int* handles_invalidated,  int* err  ):
        c_pyMesh.iMesh_optimize(self.instance[0], handles_invalidated, err)


    cdef iMesh_getEntities(self, const c_pyBase.iBase_EntitySetHandle entity_set_handle, 
        const int entity_type, const int entity_topology,c_pyBase.iBase_EntityHandle** entity_handles, 
        int* entity_handles_allocated, int* entity_handles_size, int* err  ):
        c_pyMesh.iMesh_getEntities(self.instance[0], entity_set_handle, 
        entity_type, entity_topology,entity_handles,entity_handles_allocated,
        entity_handles_size,err)


    cdef iMesh_getVtxArrCoords(self,const c_pyBase.iBase_EntityHandle* vertex_handles, 
        const int vertex_handles_size, const int storage_order, 
        double** coords, int* coords_allocated,int* coords_size, 
        int* err  ):
        c_pyMesh.iMesh_getVtxArrCoords(self.instance[0], vertex_handles, vertex_handles_size,
        storage_order, coords, coords_allocated, coords_size, err  )


    cdef iMesh_initEntArrIter(self, const c_pyBase.iBase_EntitySetHandle entity_set_handle, 
        const int requested_entity_type, const int requested_entity_topology, 
        const int requested_array_size, const int resilient,
        c_pyBase.iBase_EntityArrIterator* entArr_iterator,   int* err  ):
        c_pyMesh.iMesh_initEntArrIter(self.instance[0], entity_set_handle, 
        requested_entity_type,requested_entity_topology, 
        requested_array_size, resilient, entArr_iterator,err  )


    cdef iMesh_getNextEntArrIter(self,c_pyBase.iBase_EntityArrIterator entArr_iterator, 
        c_pyBase.iBase_EntityHandle** entity_handles, int* entity_handles_allocated, 
        int* entity_handles_size, int* has_data,int* err  ):
        c_pyMesh.iMesh_getNextEntArrIter(self.instance[0], entArr_iterator, 
        entity_handles, entity_handles_allocated, 
         entity_handles_size,  has_data, err  )


    cdef iMesh_resetEntArrIter(self,c_pyBase.iBase_EntityArrIterator entArr_iterator, int* err  ):
        c_pyMesh.iMesh_resetEntArrIter(self.instance[0],entArr_iterator,err)


    cdef iMesh_endEntArrIter(self, c_pyBase.iBase_EntityArrIterator entArr_iterator, 
        int* err  ):
        c_pyMesh.iMesh_endEntArrIter(self.instance[0],entArr_iterator,err)


    cdef iMesh_getEntArrTopo(self, const c_pyBase.iBase_EntityHandle* entity_handles, 
        const int entity_handles_size,  int** topology,int* topology_allocated, 
        int* topology_size, int* err  ):
        c_pyMesh.iMesh_getEntArrTopo(self.instance[0], entity_handles, 
        entity_handles_size,  topology, topology_allocated, 
        topology_size,  err  )


    cdef iMesh_getEntArrType(self,const c_pyBase.iBase_EntityHandle* entity_handles, 
        const int entity_handles_size, int** type,  int* type_allocated, 
        int* type_size, int* err  ):
        c_pyMesh.iMesh_getEntArrType(self.instance[0], entity_handles, 
        entity_handles_size,type, type_allocated, 
        type_size, err )


    cdef iMesh_getEntArrAdj(self, const c_pyBase.iBase_EntityHandle* entity_handles, 
        const int entity_handles_size, const int entity_type_requested, 
        c_pyBase.iBase_EntityHandle** adjacentEntityHandles, 
        int* adjacentEntityHandles_allocated, int* adj_entity_handles_size, 
        int** offset, int* offset_allocated, int* offset_size,int* err  ):
        c_pyMesh.iMesh_getEntArrAdj(self.instance[0], entity_handles, 
            entity_handles_size, entity_type_requested,adjacentEntityHandles, 
            adjacentEntityHandles_allocated, adj_entity_handles_size, 
            offset, offset_allocated, offset_size,err  )


    cdef iMesh_getEntArr2ndAdj(self,const c_pyBase.iBase_EntityHandle * entity_handles, 
        int entity_handles_size, int bridge_entity_type, 
        int requested_entity_type, c_pyBase.iBase_EntityHandle** adj_entity_handles, 
        int* adj_entity_handles_allocated,  int* adj_entity_handles_size, 
        int** offset, int* offset_allocated,int* offset_size, int* err   ):
        c_pyMesh.iMesh_getEntArr2ndAdj(self.instance[0],entity_handles, 
        entity_handles_size,  bridge_entity_type, requested_entity_type,
        adj_entity_handles, adj_entity_handles_allocated, 
        adj_entity_handles_size, offset, offset_allocated, offset_size, err)


    cdef iMesh_getAdjEntIndices(self,c_pyBase.iBase_EntitySetHandle entity_set_handle, 
        int entity_type_requester, int entity_topology_requester, 
        int entity_type_requested, c_pyBase.iBase_EntityHandle** entity_handles, 
        int* entity_handles_allocated, int* entity_handles_size, 
        c_pyBase.iBase_EntityHandle** adj_entity_handles, 
        int* adj_entity_handles_allocated, int* adj_entity_handles_size, 
        int** adj_entity_indices, int* adj_entity_indices_allocated, 
        int* adj_entity_indices_size, int** offset, int* offset_allocated, 
        int* offset_size, int* err  ):
        c_pyMesh.iMesh_getAdjEntIndices(self.instance[0], entity_set_handle, 
        entity_type_requester, entity_topology_requester, 
        entity_type_requested,  entity_handles, entity_handles_allocated,
        entity_handles_size,  adj_entity_handles, adj_entity_handles_allocated, 
        adj_entity_handles_size,  adj_entity_indices, 
        adj_entity_indices_allocated, adj_entity_indices_size, offset, 
        offset_allocated, offset_size, err  )




    cdef iMesh_createEntSet(self, const int isList,
        c_pyBase.iBase_EntitySetHandle* entity_set_created, int* err  ):
        c_pyMesh.iMesh_createEntSet(self.instance[0],isList,entity_set_created,err)



    cdef iMesh_destroyEntSet(self, c_pyBase.iBase_EntitySetHandle entity_set, 
        int* err  ):
        c_pyMesh.iMesh_destroyEntSet(self.instance[0],entity_set,err)



    cdef iMesh_isList(self, const c_pyBase.iBase_EntitySetHandle entity_set, 
        int* is_list, int* err  ):
        c_pyMesh.iMesh_isList(self.instance[0],entity_set,is_list,err)


    cdef iMesh_getNumEntSets(self,const c_pyBase.iBase_EntitySetHandle entity_set_handle, 
        const int num_hops, int* num_sets,int* err  ):
        c_pyMesh.iMesh_getNumEntSets(self.instance[0],entity_set_handle,num_hops,
            num_sets,err)


    cdef iMesh_getEntSets(self,const c_pyBase.iBase_EntitySetHandle entity_set_handle, 
        const int num_hops,c_pyBase.iBase_EntitySetHandle** contained_set_handles, 
        int* contained_set_handles_allocated,int* contained_set_handles_size, 
        int* err  ):
        c_pyMesh.iMesh_getEntSets(self.instance[0], entity_set_handle, 
        num_hops, contained_set_handles,contained_set_handles_allocated,
        contained_set_handles_size, err  )

        
       


    cdef iMesh_rmvEntFromSet(self, c_pyBase.iBase_EntityHandle entity_handle, 
        c_pyBase.iBase_EntitySetHandle entity_set, int* err  ):
        c_pyMesh.iMesh_rmvEntFromSet(self.instance[0],entity_handle,entity_set,err)


    cdef iMesh_addEntArrToSet(self, const c_pyBase.iBase_EntityHandle* entity_handles, 
        int entity_handles_size, c_pyBase.iBase_EntitySetHandle entity_set, int* err  ):
        c_pyMesh.iMesh_addEntArrToSet(self.instance[0],entity_handles,entity_handles_size,entity_set,err)


    cdef iMesh_rmvEntArrFromSet(self, const c_pyBase.iBase_EntityHandle* entity_handles, 
        int entity_handles_size, c_pyBase.iBase_EntitySetHandle entity_set,int* err  ):
        c_pyMesh.iMesh_rmvEntArrFromSet(self.instance[0], entity_handles, 
        entity_handles_size, entity_set, err)


    cdef iMesh_addEntSet(self, c_pyBase.iBase_EntitySetHandle entity_set_to_add, 
        c_pyBase.iBase_EntitySetHandle entity_set_handle, int* err  ):
        c_pyMesh.iMesh_addEntSet(self.instance[0],entity_set_to_add,entity_set_handle,err)


    cdef iMesh_rmvEntSet(self, c_pyBase.iBase_EntitySetHandle entity_set_to_remove, 
        c_pyBase.iBase_EntitySetHandle entity_set_handle, int* err  ):
        c_pyMesh.iMesh_rmvEntSet(self.instance[0], entity_set_to_remove, 
        entity_set_handle,  err)


    cdef iMesh_isEntContained(self, c_pyBase.iBase_EntitySetHandle containing_entity_set, 
        c_pyBase.iBase_EntityHandle contained_entity,int* is_contained,int* err):
        c_pyMesh.iMesh_isEntContained(self.instance[0], containing_entity_set, 
        contained_entity, is_contained, err)


    cdef iMesh_isEntArrContained(self, c_pyBase.iBase_EntitySetHandle containing_entity_set, 
        const c_pyBase.iBase_EntityHandle* entity_handles,int num_entity_handles, 
        int** is_contained, int* is_contained_allocated,int* is_contained_size, 
        int* err   ):
        c_pyMesh.iMesh_isEntArrContained(self.instance[0],containing_entity_set, 
        entity_handles, num_entity_handles,is_contained, is_contained_allocated,
        is_contained_size,err   )


    cdef iMesh_isEntSetContained(self, const c_pyBase.iBase_EntitySetHandle containing_entity_set, 
        const c_pyBase.iBase_EntitySetHandle contained_entity_set, int* is_contained, 
        int* err  ):
        c_pyMesh.iMesh_isEntSetContained(self.instance[0],containing_entity_set, 
        contained_entity_set, is_contained, err  )


    cdef iMesh_addPrntChld(self, c_pyBase.iBase_EntitySetHandle parent_entity_set, 
        c_pyBase.iBase_EntitySetHandle child_entity_set,int* err  ):
        c_pyMesh.iMesh_addPrntChld(self.instance[0],parent_entity_set, 
        child_entity_set, err  )


    cdef iMesh_rmvPrntChld(self,c_pyBase.iBase_EntitySetHandle parent_entity_set, 
        c_pyBase.iBase_EntitySetHandle child_entity_set, int* err  ):
        c_pyMesh.iMesh_rmvPrntChld(self.instance[0], parent_entity_set, 
         child_entity_set,  err )


    cdef iMesh_isChildOf(self, const c_pyBase.iBase_EntitySetHandle parent_entity_set, 
        const c_pyBase.iBase_EntitySetHandle child_entity_set, 
        int* is_child, int* err  ):
        c_pyMesh.iMesh_isChildOf(self.instance[0],parent_entity_set, 
        child_entity_set, is_child, err  )



    cdef iMesh_getNumChld(self, const c_pyBase.iBase_EntitySetHandle entity_set, 
        const int num_hops,int* num_child,  int* err  ):
        c_pyMesh.iMesh_getNumChld(self.instance[0],  entity_set, 
        num_hops, num_child,   err )


    cdef iMesh_getNumPrnt(self,  const c_pyBase.iBase_EntitySetHandle entity_set, 
        const int num_hops,  int* num_parent,  int* err  ):
        c_pyMesh.iMesh_getNumPrnt(self.instance[0], entity_set, 
        num_hops,  num_parent,  err  )



    cdef iMesh_getChldn(self, const c_pyBase.iBase_EntitySetHandle from_entity_set, 
        const int num_hops, c_pyBase.iBase_EntitySetHandle** entity_set_handles, 
        int* entity_set_handles_allocated, int* entity_set_handles_size, 
        int* err  ):
        c_pyMesh.iMesh_getChldn(self.instance[0],from_entity_set, 
        num_hops, entity_set_handles, entity_set_handles_allocated, 
        entity_set_handles_size, err  )



    cdef iMesh_getPrnts(self,  const c_pyBase.iBase_EntitySetHandle from_entity_set, 
        const int num_hops,  c_pyBase.iBase_EntitySetHandle** entity_set_handles, 
        int* entity_set_handles_allocated,  int* entity_set_handles_size, 
        int* err  ):
        c_pyMesh.iMesh_getPrnts(self.instance[0], from_entity_set, 
        num_hops,   entity_set_handles, entity_set_handles_allocated,
        entity_set_handles_size, err  )



    cdef iMesh_setVtxArrCoords(self,  const c_pyBase.iBase_EntityHandle* vertex_handles, 
        const int vertex_handles_size,  const int storage_order, 
        const double* new_coords,  const int new_coords_size,  int* err  ):
        c_pyMesh.iMesh_setVtxArrCoords(self.instance[0], vertex_handles, 
        vertex_handles_size, storage_order, new_coords, new_coords_size, err)



    cdef iMesh_createVtxArr(self,  const int num_verts,  const int storage_order, 
        const double* new_coords,  const int new_coords_size, 
        c_pyBase.iBase_EntityHandle** new_vertex_handles, 
        int* new_vertex_handles_allocated, int* new_vertex_handles_size, 
        int* err  ):
        c_pyMesh.iMesh_createVtxArr(self.instance[0], num_verts, storage_order, 
        new_coords, new_coords_size, new_vertex_handles, 
        new_vertex_handles_allocated, new_vertex_handles_size, 
        err  )



    cdef iMesh_createEntArr(self, const int new_entity_topology, 
        const c_pyBase.iBase_EntityHandle* lower_order_entity_handles, 
        const int lower_order_entity_handles_size, 
        c_pyBase.iBase_EntityHandle** new_entity_handles, 
        int* new_entity_handles_allocated, 
        int* new_entity_handles_size,  int** status,  int* status_allocated, 
        int* status_size,  int* err  ):
        c_pyMesh.iMesh_createEntArr(self.instance[0],new_entity_topology, 
        lower_order_entity_handles, lower_order_entity_handles_size, 
        new_entity_handles, new_entity_handles_allocated, 
        new_entity_handles_size, status, status_allocated, 
        status_size, err  )



    cdef iMesh_deleteEntArr(self,  const c_pyBase.iBase_EntityHandle* entity_handles, 
        const int entity_handles_size,  int* err  ):
        c_pyMesh.iMesh_deleteEntArr(self.instance[0],entity_handles, 
        entity_handles_size, err  )



    cdef iMesh_createTag(self,  const char* tag_name,  const int tag_size, 
        const int tag_type,  c_pyBase.iBase_TagHandle* tag_handle,  int* err, 
        const int tag_name_len  ):
        c_pyMesh.iMesh_createTag(self.instance[0], tag_name, tag_size, 
        tag_type, tag_handle,  err, tag_name_len  )



    cdef iMesh_destroyTag(self,  c_pyBase.iBase_TagHandle tag_handle,  const int forced, 
        int* err  ):
        c_pyMesh.iMesh_destroyTag(self.instance[0],tag_handle, forced, err)



    cdef iMesh_getTagName(self,  const c_pyBase.iBase_TagHandle tag_handle, 
        char* name,  int* err,  int name_len  ):
        c_pyMesh.iMesh_getTagName(self.instance[0],tag_handle, name, err, name_len)



    cdef iMesh_getTagSizeValues(self,  const c_pyBase.iBase_TagHandle tag_handle, 
        int* tag_size,  int* err  ):
        c_pyMesh.iMesh_getTagSizeValues(self.instance[0],tag_handle, 
        tag_size, err  )



    cdef iMesh_getTagSizeBytes(self,  const c_pyBase.iBase_TagHandle tag_handle, 
        int* tag_size,  int* err  ):
        c_pyMesh.iMesh_getTagSizeBytes(self.instance[0],tag_handle, 
        tag_size, err  )



    cdef iMesh_getTagHandle(self,  const char* tag_name,  c_pyBase.iBase_TagHandle* tag_handle, 
        int* err,  int tag_name_len  ):
        c_pyMesh.iMesh_getTagHandle(self.instance[0],tag_name, tag_handle, err, tag_name_len)



    cdef iMesh_getTagType(self,  const c_pyBase.iBase_TagHandle tag_handle, 
        int* tag_type,  int* err  ):
        c_pyMesh.iMesh_getTagType(self.instance[0],tag_handle, tag_type, err)



    cdef iMesh_setEntSetData(self,  c_pyBase.iBase_EntitySetHandle entity_set_handle, 
        const c_pyBase.iBase_TagHandle tag_handle,  const void* tag_value, 
        const int tag_value_size,  int* err  ):
        c_pyMesh.iMesh_setEntSetData(self.instance[0], entity_set_handle, 
        tag_handle, tag_value, tag_value_size, err  )



    cdef iMesh_setEntSetIntData(self,  c_pyBase.iBase_EntitySetHandle entity_set, 
        const c_pyBase.iBase_TagHandle tag_handle,  const int tag_value, 
        int* err  ):
        c_pyMesh.iMesh_setEntSetIntData(self.instance[0],entity_set, 
        tag_handle, tag_value, err  )



    cdef iMesh_setEntSetDblData(self,  c_pyBase.iBase_EntitySetHandle entity_set, 
        const c_pyBase.iBase_TagHandle tag_handle,  const double tag_value, 
        int* err  ):
        c_pyMesh.iMesh_setEntSetDblData(self.instance[0], entity_set, 
        tag_handle, tag_value,  err  )



    cdef iMesh_setEntSetEHData(self,  c_pyBase.iBase_EntitySetHandle entity_set, 
        const c_pyBase.iBase_TagHandle tag_handle,  const c_pyBase.iBase_EntityHandle tag_value, 
        int* err  ):
        c_pyMesh.iMesh_setEntSetEHData(self.instance[0],entity_set, 
        tag_handle, tag_value, err)



    cdef iMesh_setEntSetESHData(self,  c_pyBase.iBase_EntitySetHandle entity_set, 
        const c_pyBase.iBase_TagHandle tag_handle,  const c_pyBase.iBase_EntitySetHandle tag_value, 
        int* err  ):
        c_pyMesh.iMesh_setEntSetESHData(self.instance[0],entity_set, 
        tag_handle, tag_value, err  )



    cdef iMesh_getEntSetData(self,  const c_pyBase.iBase_EntitySetHandle entity_set_handle, 
        const c_pyBase.iBase_TagHandle tag_handle,  void* tag_value,  int* tag_value_allocated, 
        int* tag_value_size,  int* err  ):
        c_pyMesh.iMesh_getEntSetData(self.instance[0],entity_set_handle, 
        tag_handle,  tag_value,  tag_value_allocated, 
        tag_value_size,  err  )



    cdef iMesh_getEntSetIntData(self,  const c_pyBase.iBase_EntitySetHandle entity_set, 
        const c_pyBase.iBase_TagHandle tag_handle,  int* out_data, 
        int* err  ):
        c_pyMesh.iMesh_getEntSetIntData(self.instance[0],entity_set, 
        tag_handle, out_data, err  )



    cdef iMesh_getEntSetDblData(self,  const c_pyBase.iBase_EntitySetHandle entity_set, 
        const c_pyBase.iBase_TagHandle tag_handle,  double* out_data, 
        int* err  ):
        c_pyMesh.iMesh_getEntSetDblData(self.instance[0], entity_set, 
        tag_handle, out_data, err  )



    cdef iMesh_getEntSetEHData(self,  const c_pyBase.iBase_EntitySetHandle entity_set, 
        const c_pyBase.iBase_TagHandle tag_handle,  c_pyBase.iBase_EntityHandle* out_data, 
        int* err  ):
        c_pyMesh.iMesh_getEntSetEHData(self.instance[0], entity_set, 
        tag_handle, out_data, err  )



    cdef iMesh_getEntSetESHData(self,  const c_pyBase.iBase_EntitySetHandle entity_set, 
        const c_pyBase.iBase_TagHandle tag_handle,  c_pyBase.iBase_EntitySetHandle* out_data, 
        int* err  ):
        c_pyMesh.iMesh_getEntSetESHData(self.instance[0],entity_set, 
        tag_handle,  out_data, err)



    cdef iMesh_getAllEntSetTags(self,  const c_pyBase.iBase_EntitySetHandle entity_set_handle, 
        c_pyBase.iBase_TagHandle** tag_handles,  int* tag_handles_allocated, 
        int* tag_handles_size,  int* err  ):
        c_pyMesh.iMesh_getAllEntSetTags(self.instance[0], entity_set_handle, 
        tag_handles, tag_handles_allocated,tag_handles_size, err  )



    cdef iMesh_rmvEntSetTag(self,  c_pyBase.iBase_EntitySetHandle entity_set_handle, 
        const c_pyBase.iBase_TagHandle tag_handle,  int* err  ):
        c_pyMesh.iMesh_rmvEntSetTag(self.instance[0],entity_set_handle, 
        tag_handle, err  )



    cdef iMesh_setVtxCoord(self,  c_pyBase.iBase_EntityHandle vertex_handle, 
        const double x,  const double y,  const double z, 
        int* err  ):
        c_pyMesh.iMesh_setVtxCoord(self.instance[0],vertex_handle, 
        x, y,  z,  err  )



    cdef iMesh_createVtx(self,  const double x,  const double y,  const double z, 
        c_pyBase.iBase_EntityHandle* new_vertex_handle,  int* err  ):
        c_pyMesh.iMesh_createVtx(self.instance[0], x, y, z, new_vertex_handle, err  )



    cdef iMesh_createEnt(self,  const int new_entity_topology, 
        const c_pyBase.iBase_EntityHandle* lower_order_entity_handles, 
        const int lower_order_entity_handles_size,  c_pyBase.iBase_EntityHandle* new_entity_handle,  int* status, 
        int* err  ):
        c_pyMesh.iMesh_createEnt(self.instance[0], new_entity_topology, 
        lower_order_entity_handles, lower_order_entity_handles_size,  
        new_entity_handle, status, err  )



    cdef iMesh_deleteEnt(self,  c_pyBase.iBase_EntityHandle entity_handle, 
        int* err  ):
        c_pyMesh.iMesh_deleteEnt(self.instance[0], entity_handle, err)



    cdef iMesh_getArrData(self,  const c_pyBase.iBase_EntityHandle* entity_handles, 
        const int entity_handles_size,  const c_pyBase.iBase_TagHandle tag_handle, 
        void* tag_values,  int* tag_values_allocated, 
        int* tag_values_size,  int* err  ):
        c_pyMesh.iMesh_getArrData(self.instance[0],  entity_handles, 
        entity_handles_size,  tag_handle, tag_values, tag_values_allocated, 
        tag_values_size, err  )



    cdef iMesh_getIntArrData(self,  const c_pyBase.iBase_EntityHandle* entity_handles, 
        const int entity_handles_size,  const c_pyBase.iBase_TagHandle tag_handle, 
        int** tag_values,  int* tag_values_allocated, 
        int* tag_values_size,  int* err  ):
        c_pyMesh.iMesh_getIntArrData(self.instance[0], entity_handles, 
        entity_handles_size, tag_handle, tag_values, tag_values_allocated, 
        tag_values_size, err  )



    cdef iMesh_getDblArrData(self,  const c_pyBase.iBase_EntityHandle* entity_handles, 
        const int entity_handles_size,  const c_pyBase.iBase_TagHandle tag_handle, 
        double** tag_values,  int* tag_values_allocated, 
        int* tag_values_size,  int* err  ):
        c_pyMesh.iMesh_getDblArrData(self.instance[0], entity_handles, 
        entity_handles_size, tag_handle, tag_values, tag_values_allocated, 
        tag_values_size, err  )



    cdef iMesh_getEHArrData(self,  const c_pyBase.iBase_EntityHandle* entity_handles, 
        const int entity_handles_size,  const c_pyBase.iBase_TagHandle tag_handle, 
        c_pyBase.iBase_EntityHandle** tag_value,  int* tag_value_allocated, 
        int* tag_value_size,  int* err  ):
        c_pyMesh.iMesh_getEHArrData(self.instance[0],entity_handles, 
        entity_handles_size, tag_handle, tag_value, tag_value_allocated, 
        tag_value_size, err  )



    cdef iMesh_getESHArrData(self,  const c_pyBase.iBase_EntityHandle* entity_handles, 
        const int entity_handles_size,  const c_pyBase.iBase_TagHandle tag_handle, 
        c_pyBase.iBase_EntitySetHandle** tag_value,  int* tag_value_allocated, 
        int* tag_value_size,  int* err  ):
        c_pyMesh.iMesh_getESHArrData(self.instance[0],entity_handles, 
        entity_handles_size,  tag_handle, tag_value,  tag_value_allocated, 
        tag_value_size, err  )



    cdef iMesh_setArrData(self,  const c_pyBase.iBase_EntityHandle* entity_handles, 
        const int entity_handles_size,  const c_pyBase.iBase_TagHandle tag_handle, 
        const void* tag_values,  const int tag_values_size, 
        int* err  ): 
        c_pyMesh.iMesh_setArrData(self.instance[0], entity_handles, 
        entity_handles_size, tag_handle, tag_values, tag_values_size, 
        err)



    cdef iMesh_setIntArrData(self,  const c_pyBase.iBase_EntityHandle* entity_handles, 
        const int entity_handles_size,  const c_pyBase.iBase_TagHandle tag_handle, 
        const int* tag_values,  const int tag_values_size, 
        int* err  ):
        c_pyMesh.iMesh_setIntArrData(self.instance[0], entity_handles, 
        entity_handles_size, tag_handle, tag_values, tag_values_size, 
        err)



    cdef iMesh_setDblArrData(self,  const c_pyBase.iBase_EntityHandle* entity_handles, 
        const int entity_handles_size,  const c_pyBase.iBase_TagHandle tag_handle, 
        const double* tag_values,  const int tag_values_size, 
        int* err  ):
        c_pyMesh.iMesh_setDblArrData(self.instance[0], entity_handles, 
        entity_handles_size, tag_handle, 
        tag_values, tag_values_size, err  )



    cdef iMesh_setEHArrData(self,  const c_pyBase.iBase_EntityHandle* entity_handles, 
        const int entity_handles_size,  const c_pyBase.iBase_TagHandle tag_handle, 
        const c_pyBase.iBase_EntityHandle* tag_values,  const int tag_values_size, 
        int* err  ):
        c_pyMesh.iMesh_setEHArrData(self.instance[0], entity_handles, 
        entity_handles_size, tag_handle, tag_values, tag_values_size, 
        err  )



    cdef iMesh_setESHArrData(self,  const c_pyBase.iBase_EntityHandle* entity_handles, 
        const int entity_handles_size,  const c_pyBase.iBase_TagHandle tag_handle, 
        const c_pyBase.iBase_EntitySetHandle* tag_values, 
        const int tag_values_size,  int* err  ):
        c_pyMesh.iMesh_setESHArrData(self.instance[0], entity_handles, 
        entity_handles_size, tag_handle, tag_values, 
        tag_values_size, err  )



    cdef iMesh_rmvArrTag(self,  const c_pyBase.iBase_EntityHandle* entity_handles, 
        const int entity_handles_size,  const c_pyBase.iBase_TagHandle tag_handle, 
        int* err  ):
        c_pyMesh.iMesh_rmvArrTag(self.instance[0],entity_handles, 
        entity_handles_size,  tag_handle, err  )



    cdef iMesh_getData(self,  const c_pyBase.iBase_EntityHandle entity_handle, 
        const c_pyBase.iBase_TagHandle tag_handle,  void* tag_value, 
        int* tag_value_allocated,  int* tag_value_size, 
        int* err  ):
        c_pyMesh.iMesh_getData(self.instance[0], entity_handle, 
        tag_handle, tag_value, tag_value_allocated, tag_value_size, 
        err )



    cdef iMesh_getIntData(self,  const c_pyBase.iBase_EntityHandle entity_handle, 
        const c_pyBase.iBase_TagHandle tag_handle,  int* out_data, 
        int* err  ):
        c_pyMesh.iMesh_getIntData(self.instance[0], entity_handle, 
        tag_handle, out_data, err)



    cdef iMesh_getDblData(self,  const c_pyBase.iBase_EntityHandle entity_handle, 
        const c_pyBase.iBase_TagHandle tag_handle,  double* out_data, 
        int* err  ):
        c_pyMesh.iMesh_getDblData(self.instance[0], entity_handle, 
        tag_handle, out_data, err)



    cdef iMesh_getEHData(self,  const c_pyBase.iBase_EntityHandle entity_handle, 
        const c_pyBase.iBase_TagHandle tag_handle,  c_pyBase.iBase_EntityHandle* out_data, 
        int* err  ):
        c_pyMesh.iMesh_getEHData(self.instance[0], entity_handle, 
        tag_handle, out_data, err)



    cdef iMesh_getESHData(self,  const c_pyBase.iBase_EntityHandle entity_handle, 
        const c_pyBase.iBase_TagHandle tag_handle,  c_pyBase.iBase_EntitySetHandle* out_data, 
        int* err  ):
        c_pyMesh.iMesh_getESHData(self.instance[0], entity_handle, 
        tag_handle, out_data, err)



    cdef iMesh_setData(self,  c_pyBase.iBase_EntityHandle entity_handle, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        const void* tag_value,  const int tag_value_size, 
        int* err  ):
        c_pyMesh.iMesh_setData(self.instance[0], entity_handle, 
        tag_handle, tag_value, tag_value_size, err  )



    cdef iMesh_setIntData(self,  c_pyBase.iBase_EntityHandle entity_handle, 
        const c_pyBase.iBase_TagHandle tag_handle, 
        const int tag_value,  int* err  ):
        c_pyMesh.iMesh_setIntData(self.instance[0], entity_handle, 
        tag_handle, tag_value, err  )



    cdef iMesh_setDblData(self,  c_pyBase.iBase_EntityHandle entity_handle, 
        const c_pyBase.iBase_TagHandle tag_handle,  const double tag_value, 
        int* err  ):
        c_pyMesh.iMesh_setDblData(self.instance[0],  entity_handle, 
        tag_handle, tag_value, err  )



    cdef iMesh_setEHData(self,  c_pyBase.iBase_EntityHandle entity_handle, 
        const c_pyBase.iBase_TagHandle tag_handle,  const c_pyBase.iBase_EntityHandle tag_value, 
        int* err  ):
        c_pyMesh.iMesh_setEHData(self.instance[0],entity_handle, 
        tag_handle, tag_value, err  )


    cdef iMesh_setESHData(self, c_pyBase.iBase_EntityHandle entity_handle, 
        const c_pyBase.iBase_TagHandle tag_handle,  const c_pyBase.iBase_EntitySetHandle tag_value, 
        int* err  ):
        c_pyMesh.iMesh_setESHData(self.instance[0], entity_handle, 
        tag_handle,  tag_value, err  )



    cdef iMesh_getAllTags(self,  const c_pyBase.iBase_EntityHandle entity_handle, 
        c_pyBase.iBase_TagHandle** tag_handles,  int* tag_handles_allocated, 
        int* tag_handles_size,  int* err  ):
        c_pyMesh.iMesh_getAllTags(self.instance[0], entity_handle, 
        tag_handles, tag_handles_allocated, tag_handles_size, err  )



    cdef iMesh_rmvTag(self,  c_pyBase.iBase_EntityHandle entity_handle, 
        const c_pyBase.iBase_TagHandle tag_handle,  int* err  ):
        c_pyMesh.iMesh_rmvTag(self.instance[0], entity_handle, 
        tag_handle, err  )



    cdef iMesh_initEntIter(self,  const c_pyBase.iBase_EntitySetHandle entity_set_handle, 
        const int requested_entity_type,  const int requested_entity_topology, 
        const int resilient,  c_pyBase.iBase_EntityIterator* entity_iterator, 
        int* err  ):
        c_pyMesh.iMesh_initEntIter(self.instance[0], entity_set_handle, 
        requested_entity_type, requested_entity_topology, 
        resilient, entity_iterator, err  )



    cdef iMesh_getNextEntIter(self,  c_pyBase.iBase_EntityIterator entity_iterator, 
        c_pyBase.iBase_EntityHandle* entity_handle,  int* has_data, 
        int* err  ):
        c_pyMesh.iMesh_getNextEntIter(self.instance[0], entity_iterator, 
        entity_handle, has_data, err  )



    cdef iMesh_resetEntIter(self,  c_pyBase.iBase_EntityIterator entity_iterator, 
        int* err  ):
        c_pyMesh.iMesh_resetEntIter(self.instance[0], entity_iterator, 
        err  )



    cdef iMesh_endEntIter(self,  c_pyBase.iBase_EntityIterator entity_iterator, 
        int* err  ):
        c_pyMesh.iMesh_endEntIter(self.instance[0], entity_iterator, err  )



    cdef iMesh_getEntTopo(self,  const c_pyBase.iBase_EntityHandle entity_handle, 
        int* out_topo,  int* err  ):
        c_pyMesh.iMesh_getEntTopo(self.instance[0], entity_handle, 
        out_topo, err  )



    cdef iMesh_getEntType(self,  const c_pyBase.iBase_EntityHandle entity_handle, 
        int* out_type,  int* err  ):
        c_pyMesh.iMesh_getEntType(self.instance[0], entity_handle, 
         out_type, err  )



    cdef iMesh_getVtxCoord(self,  const c_pyBase.iBase_EntityHandle vertex_handle, 
        double* x,  double* y,  double* z,  int* err  ):
        c_pyMesh.iMesh_getVtxCoord(self.instance[0],vertex_handle, 
        x, y, z, err  )



    cdef iMesh_getEntAdj(self,  const c_pyBase.iBase_EntityHandle entity_handle, 
        const int entity_type_requested,  c_pyBase.iBase_EntityHandle** adj_entity_handles, 
        int* adj_entity_handles_allocated,  int* adj_entity_handles_size, 
        int* err  ):
        c_pyMesh.iMesh_getEntAdj(self.instance[0], entity_handle, 
        entity_type_requested, adj_entity_handles, adj_entity_handles_allocated,
        adj_entity_handles_size, err  )



    cdef iMesh_getEnt2ndAdj(self,  c_pyBase.iBase_EntityHandle entity_handle, 
        int bridge_entity_type,  int requested_entity_type, 
        c_pyBase.iBase_EntityHandle** adjacent_entities,  int* adjacent_entities_allocated, 
        int* adjacent_entities_size,  int* err   ):
        c_pyMesh.iMesh_getEnt2ndAdj(self.instance[0],entity_handle, 
        bridge_entity_type, requested_entity_type,  adjacent_entities, 
        adjacent_entities_allocated, adjacent_entities_size, err)



    cdef iMesh_subtract(self,  const c_pyBase.iBase_EntitySetHandle entity_set_1, 
        const c_pyBase.iBase_EntitySetHandle entity_set_2,  c_pyBase.iBase_EntitySetHandle* result_entity_set, 
        int* err  ):
        c_pyMesh.iMesh_subtract(self.instance[0], entity_set_1, 
        entity_set_2, result_entity_set, err  )



    cdef iMesh_intersect(self,  const c_pyBase.iBase_EntitySetHandle entity_set_1, 
        const c_pyBase.iBase_EntitySetHandle entity_set_2,  c_pyBase.iBase_EntitySetHandle* result_entity_set, 
        int* err  ):
        c_pyMesh.iMesh_intersect(self.instance[0],entity_set_1, 
        entity_set_2, result_entity_set, err)



    cdef iMesh_unite(self,  const c_pyBase.iBase_EntitySetHandle entity_set_1, 
        const c_pyBase.iBase_EntitySetHandle entity_set_2, 
        c_pyBase.iBase_EntitySetHandle* result_entity_set, 
        int* err  ):
        c_pyMesh.iMesh_unite(self.instance[0], entity_set_1, 
        entity_set_2, result_entity_set, err  )



