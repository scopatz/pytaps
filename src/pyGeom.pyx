cimport c_pyGeom
cimport c_pyBase

from libc.stdlib cimport malloc, free


cdef class iGeom_Instance:
    cdef c_pyGeom.iGeom_Instance* instance

    def __cinit__(self, const char* options, int err,int options_len ):
        c_pyGeom.iGeom_newGeom(options, self.instance ,<int *> err, options_len)
        if self.instance is NULL:
            raise MemoryError()

    def __dealloc__(self):
        if <void *>self.instance is not NULL:
            free(<void *>self.instance)

    cdef iGeom_getDescription( self,
        char* descr,
        int descr_len ):
        c_pyGeom.iGeom_getDescription(self.instance[0],descr, descr_len )



    cdef iGeom_getErrorType( self,
        int *error_type ):
        c_pyGeom.iGeom_getErrorType( self.instance[0],
        error_type )

    cdef iGeom_dtor( self,
        int* err ):
        c_pyGeom.iGeom_dtor( self.instance[0], err )


    cdef iGeom_load( self,
        const char* name,
        const char* options,
        int* err,
        int name_len,
        int options_len ):
        c_pyGeom.iGeom_load( self.instance[0], name, options, err, name_len, options_len )




    cdef iGeom_save( self,
        const char* name,
        const char* options,
        int* err,
        int name_len,
        int options_len ):
        c_pyGeom.iGeom_save( self.instance[0], name, options, err, name_len, options_len )





    cdef iGeom_getRootSet( self,
        c_pyBase.iBase_EntitySetHandle* root_set,
        int* err ):
        c_pyGeom.iGeom_getRootSet( self.instance[0], root_set, err) 



    cdef iGeom_getBoundBox( self,
        double* min_x,
        double* min_y,
        double* min_z,
        double* max_x,
        double* max_y,
        double* max_z,
        int* err ):
        c_pyGeom.iGeom_getBoundBox( self.instance[0], min_x, min_y, min_z, max_x, max_y, max_z, err )



    cdef iGeom_getEntities( self,
        c_pyBase.iBase_EntitySetHandle set_handle,
        int entity_type,
        c_pyBase.iBase_EntityHandle** entity_handles,
        int* entity_handles_allococated,
        int* entity_handles_size,
        int* err ):
        c_pyGeom.iGeom_getEntities( self.instance[0],
        set_handle,
        entity_type,
        entity_handles,
        entity_handles_allococated,
        entity_handles_size,
        err )


    cdef iGeom_getNumOfType( self,
        c_pyBase.iBase_EntitySetHandle set_handle,
        int entity_type,
        int* num_out,
        int* err ):
        c_pyGeom.iGeom_getNumOfType( self.instance[0],
        set_handle,
        entity_type,
        num_out,
        err )


    cdef iGeom_getEntType( self,
        c_pyBase.iBase_EntityHandle entity_handle,
        int* type,
        int* err ):
        c_pyGeom.iGeom_getEntType( self.instance[0],
        entity_handle,
        type,
        err )

    cdef iGeom_getArrType( self,
        const c_pyBase.iBase_EntityHandle * entity_handles,
        int entity_handles_size,
        int** type,
        int* type_allocated,
        int* type_size,
        int* err ):
        c_pyGeom.iGeom_getArrType( self.instance[0],
        entity_handles,
        entity_handles_size,
        type,
        type_allocated,
        type_size,
        err )



    cdef iGeom_getEntAdj( self,
        c_pyBase.iBase_EntityHandle entity_handle,
        int to_dimension,
        c_pyBase.iBase_EntityHandle** adj_entities,
        int* adj_entities_allocated,
        int* adj_entities_size,
        int* err ):
        c_pyGeom.iGeom_getEntAdj( self.instance[0],
        entity_handle,
        to_dimension,
        adj_entities,
        adj_entities_allocated,
        adj_entities_size,
        err )

    cdef iGeom_getArrAdj( self,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        int requested_entity_type,
        c_pyBase.iBase_EntityHandle** adj_entity_handles,
        int* adj_entity_handles_allocated,
        int* adj_entity_handles_size,
        int** offset,
        int* offset_allocated,
        int* offset_size,
        int* err ):
        c_pyGeom.iGeom_getArrAdj( self.instance[0],
        entity_handles,
        entity_handles_size,
        requested_entity_type,
        adj_entity_handles,
        adj_entity_handles_allocated,
        adj_entity_handles_size,
        offset,
        offset_allocated,
        offset_size,
        err )

    cdef iGeom_getEnt2ndAdj( self,
        c_pyBase.iBase_EntityHandle entity_handle,
        int bridge_dimension,
        int to_dimension,
        c_pyBase.iBase_EntityHandle** adjacent_entities,
        int* adjacent_entities_allocated,
        int* adjacent_entities_size,
        int* err ):
        c_pyGeom.iGeom_getEnt2ndAdj( self.instance[0],
        entity_handle,
        bridge_dimension,
        to_dimension,
        adjacent_entities,
        adjacent_entities_allocated,
        adjacent_entities_size,
        err )

    cdef iGeom_getArr2ndAdj( self,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        int order_adjacent_key,
        int requested_entity_type,
        c_pyBase.iBase_EntityHandle** adj_entity_handles,
        int* adj_entity_handles_allocated,
        int* adj_entity_handles_size,
        int** offset,
        int* offset_allocated,
        int* offset_size,
        int* err ):
        c_pyGeom.iGeom_getArr2ndAdj( self.instance[0],
        entity_handles,
        entity_handles_size,
        order_adjacent_key,
        requested_entity_type,
        adj_entity_handles,
        adj_entity_handles_allocated,
        adj_entity_handles_size,
        offset,
        offset_allocated,
        offset_size,
        err )

    cdef iGeom_isEntAdj( self,
        c_pyBase.iBase_EntityHandle entity_handle1,
        c_pyBase.iBase_EntityHandle entity_handle2,
        int* are_adjacent,
        int* err ):
        c_pyGeom.iGeom_isEntAdj( self.instance[0],
        entity_handle1,
        entity_handle2,
        are_adjacent,
        err )

    cdef iGeom_isArrAdj( self,
        const c_pyBase.iBase_EntityHandle* entity_handles_1,
        int entity_handles_1_size,
        const c_pyBase.iBase_EntityHandle* entity_handles_2,
        int entity_handles_2_size,
        int** is_adjacent_info,
        int* is_adjacent_info_allocated,
        int* is_adjacent_info_size,
        int* err ):
        c_pyGeom.iGeom_isArrAdj( self.instance[0],
        entity_handles_1,
        entity_handles_1_size,
        entity_handles_2,
        entity_handles_2_size,
        is_adjacent_info,
        is_adjacent_info_allocated,
        is_adjacent_info_size,
        err) 

    cdef iGeom_getTopoLevel( self,
        int* topo_level_out,
        int* err ):
        c_pyGeom.iGeom_getTopoLevel( self.instance[0],
        topo_level_out,
        err) 

    cdef iGeom_getEntClosestPt( self,
        c_pyBase.iBase_EntityHandle entity_handle,
        double near_x, 
        double near_y,
        double near_z,
        double* on_x,
        double* on_y,
        double* on_z,
        int* err ):
        c_pyGeom.iGeom_getEntClosestPt( self.instance[0],
        entity_handle,
        near_x, 
        near_y,
        near_z,
        on_x,
        on_y,
        on_z,
        err )

    cdef iGeom_getEntClosestPtTrimmed( self,
        c_pyBase.iBase_EntityHandle entity_handle,
        double near_x,
        double near_y,
        double near_z,
        double* on_x,
        double* on_y,
        double* on_z,
        int* err ):
        c_pyGeom.iGeom_getEntClosestPtTrimmed( self.instance[0],
        entity_handle,
        near_x,
        near_y,
        near_z,
        on_x,
        on_y,
        on_z,
        err) 

    cdef iGeom_getArrClosestPt( self,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        int storage_order,
        const double* near_coordinates,
        int near_coordinates_size,
        double** on_coordinates,
        int* on_coordinates_allocated,
        int* on_coordinates_size,
        int* err ):
        c_pyGeom.iGeom_getArrClosestPt( self.instance[0],
        entity_handles,
        entity_handles_size,
        storage_order,
        near_coordinates,
        near_coordinates_size,
        on_coordinates,
        on_coordinates_allocated,
        on_coordinates_size,
        err) 

    cdef iGeom_getEntNrmlXYZ( self,
        c_pyBase.iBase_EntityHandle entity_handle,
        double x,
        double y,
        double z,
        double* nrml_i,
        double* nrml_j,
        double* nrml_k,
        int* err ):
        c_pyGeom.iGeom_getEntNrmlXYZ( self.instance[0],
        entity_handle,
        x,
        y,
        z,
        nrml_i,
        nrml_j,
        nrml_k,
        err )

    cdef iGeom_getArrNrmlXYZ( self,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        int storage_order,
        const double* coordinates,
        int coordinates_size,
        double** normals,
        int* normals_allocated,
        int* normals_size,
        int* err ):
        c_pyGeom.iGeom_getArrNrmlXYZ( self.instance[0],
        entity_handles,
        entity_handles_size,
        storage_order,
        coordinates,
        coordinates_size,
        normals,
        normals_allocated,
        normals_size,
        err )

    cdef iGeom_getEntNrmlPlXYZ( self,
        c_pyBase.iBase_EntityHandle entity_handle,
        double x,
        double y,
        double z,
        double* pt_x,
        double* pt_y,
        double* pt_z,
        double* nrml_i,
        double* nrml_j,
        double* nrml_k,
        int* err ):
        c_pyGeom.iGeom_getEntNrmlPlXYZ( self.instance[0],
        entity_handle,
        x,
        y,
        z,
        pt_x,
        pt_y,
        pt_z,
        nrml_i,
        nrml_j,
        nrml_k,
        err) 

    cdef iGeom_getArrNrmlPlXYZ( self,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        int storage_order,
        const double* near_coordinates,
        int near_coordinates_size,
        double** on_coordinates,
        int* on_coordinates_allocated,
        int* on_coordinates_size,
        double** normals,
        int* normals_allocated,
        int* normals_size,
        int* err ):
        c_pyGeom.iGeom_getArrNrmlPlXYZ( self.instance[0],
        entity_handles,
        entity_handles_size,
        storage_order,
        near_coordinates,
        near_coordinates_size,
        on_coordinates,
        on_coordinates_allocated,
        on_coordinates_size,
        normals,
        normals_allocated,
        normals_size,
        err )

    cdef iGeom_getEntTgntXYZ( self,
        c_pyBase.iBase_EntityHandle entity_handle,
        double x,
        double y,
        double z,
        double* tgnt_i,
        double* tgnt_j,
        double* tgnt_k,
        int* err ):
        c_pyGeom.iGeom_getEntTgntXYZ( self.instance[0],
        entity_handle,
        x,
        y,
        z,
        tgnt_i,
        tgnt_j,
        tgnt_k,
        err) 

    cdef iGeom_getArrTgntXYZ( self,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        int storage_order,
        const double* coordinates,
        int coordinates_size,
        double** tangents,
        int* tangents_allocated,
        int* tangents_size,
        int* err ):
        c_pyGeom.iGeom_getArrTgntXYZ( self.instance[0],
        entity_handles,
        entity_handles_size,
        storage_order,
        coordinates,
        coordinates_size,
        tangents,
        tangents_allocated,
        tangents_size,
        err )


    cdef iGeom_getFcCvtrXYZ( self,
        c_pyBase.iBase_EntityHandle face_handle,
        double x,
        double y,
        double z,
        double* cvtr1_i,
        double* cvtr1_j,
        double* cvtr1_k,
        double* cvtr2_i,
        double* cvtr2_j,
        double* cvtr2_k,
        int* err ):
        c_pyGeom.iGeom_getFcCvtrXYZ( self.instance[0],
        face_handle,
        x,
        y,
        z,
        cvtr1_i,
        cvtr1_j,
        cvtr1_k,
        cvtr2_i,
        cvtr2_j,
        cvtr2_k,
        err )


    cdef iGeom_getEgCvtrXYZ( self,
        c_pyBase.iBase_EntityHandle edge_handle,
        double x,
        double y,
        double z,
        double* cvtr_i,
        double* cvtr_j,
        double* cvtr_k,
        int* err ):
        c_pyGeom.iGeom_getEgCvtrXYZ( self.instance[0],
        edge_handle,
        x,
        y,
        z,
        cvtr_i,
        cvtr_j,
        cvtr_k,
        err )


    cdef iGeom_getEntArrCvtrXYZ( self,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        int storage_order,
        const double* coords,
        int coords_size,
        double** cvtr_1,
        int* cvtr_1_allocated,
        int* cvtr_1_size,
        double** cvtr_2,
        int* cvtr_2_allocated,
        int* cvtr_2_size,
        int* err ):
        c_pyGeom.iGeom_getEntArrCvtrXYZ( self.instance[0],
        entity_handles,
        entity_handles_size,
        storage_order,
        coords,
        coords_size,
        cvtr_1,
        cvtr_1_allocated,
        cvtr_1_size,
        cvtr_2,
        cvtr_2_allocated,
        cvtr_2_size,
        err )


    cdef iGeom_getEgEvalXYZ( self,
        c_pyBase.iBase_EntityHandle edge_handle,
        double x,
        double y,
        double z,
        double* on_x,
        double* on_y,
        double* on_z,
        double* tgnt_i,
        double* tgnt_j,
        double* tgnt_k,
        double* cvtr_i,
        double* cvtr_j,
        double* cvtr_k,
        int* err ):
        c_pyGeom.iGeom_getEgEvalXYZ( self.instance[0],
        edge_handle,
        x,
        y,
        z,
        on_x,
        on_y,
        on_z,
        tgnt_i,
        tgnt_j,
        tgnt_k,
        cvtr_i,
        cvtr_j,
        cvtr_k,
        err )

    cdef iGeom_getFcEvalXYZ( self,
        c_pyBase.iBase_EntityHandle face_handle,
        double x,
        double y,
        double z,
        double* on_x,
        double* on_y,
        double* on_z,
        double* nrml_i,
        double* nrml_j,
        double* nrml_k,
        double* cvtr1_i,
        double* cvtr1_j,
        double* cvtr1_k,
        double* cvtr2_i,
        double* cvtr2_j,
        double* cvtr2_k,
        int* err ):
        c_pyGeom.iGeom_getFcEvalXYZ( self.instance[0],
        face_handle,
        x,
        y,
        z,
        on_x,
        on_y,
        on_z,
        nrml_i,
        nrml_j,
        nrml_k,
        cvtr1_i,
        cvtr1_j,
        cvtr1_k,
        cvtr2_i,
        cvtr2_j,
        cvtr2_k,
        err )


    cdef iGeom_getArrEgEvalXYZ( self,
        const c_pyBase.iBase_EntityHandle* edge_handles,
        int edge_handles_size,
        int storage_order,
        const double* coords,
        int coords_size,
        double** on_coords,
        int* on_coords_allocated,
        int* on_coords_size,
        double** tangent,
        int* tangent_allocated,
        int* tangent_size,
        double** cvtr,
        int* cvtr_allocated,
        int* cvtr_size,
        int* err ):
        c_pyGeom.iGeom_getArrEgEvalXYZ( self.instance[0],
        edge_handles,
        edge_handles_size,
        storage_order,
        coords,
        coords_size,
        on_coords,
        on_coords_allocated,
        on_coords_size,
        tangent,
        tangent_allocated,
        tangent_size,
        cvtr,
        cvtr_allocated,
        cvtr_size,
        err )


    cdef iGeom_getArrFcEvalXYZ( self,
        const c_pyBase.iBase_EntityHandle* face_handles,
        int face_handles_size,
        int storage_order,
        const double* coords,
        int coords_size,
        double** on_coords,
        int* on_coords_allocated,
        int* on_coords_size,
        double** normal,
        int* normal_allocated,
        int* normal_size,
        double** cvtr1,
        int* cvtr1_allocated,
        int* cvtr1_size,
        double** cvtr2,
        int* cvtr2_allocated,
        int* cvtr2_size,
        int* err ):
        c_pyGeom.iGeom_getArrFcEvalXYZ( self.instance[0],
        face_handles,
        face_handles_size,
        storage_order,
        coords,
        coords_size,
        on_coords,
        on_coords_allocated,
        on_coords_size,
        normal,
        normal_allocated,
        normal_size,
        cvtr1,
        cvtr1_allocated,
        cvtr1_size,
        cvtr2,
        cvtr2_allocated,
        cvtr2_size,
        err )


    cdef iGeom_getEntBoundBox( self,
        c_pyBase.iBase_EntityHandle entity_handle,
        double* min_x,
        double* min_y,
        double* min_z,
        double* max_x,
        double* max_y,
        double* max_z,
        int* err ):
        c_pyGeom.iGeom_getEntBoundBox( self.instance[0],
        entity_handle,
        min_x,
        min_y,
        min_z,
        max_x,
        max_y,
        max_z,
        err )


    cdef iGeom_getArrBoundBox( self,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        int storage_order,
        double** min_corner,
        int* min_corner_allocated,
        int* min_corner_size,
        double** max_corner,
        int* max_corner_allocated,
        int* max_corner_size,
        int* err ):
        c_pyGeom.iGeom_getArrBoundBox( self.instance[0],
        entity_handles,
        entity_handles_size,
        storage_order,
        min_corner,
        min_corner_allocated,
        min_corner_size,
        max_corner,
        max_corner_allocated,
        max_corner_size,
        err )


    cdef iGeom_getVtxCoord( self,
        c_pyBase.iBase_EntityHandle vertex_handle,
        double* x,
        double* y,
        double* z,
        int* err ):
        c_pyGeom.iGeom_getVtxCoord( self.instance[0],
        vertex_handle,
        x,
        y,
        z,
        err )


    cdef iGeom_getVtxArrCoords( self,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        int storage_order,
        double** coordinates,
        int* coordinates_allocated,
        int* coordinates_size,
        int* err ):
        c_pyGeom.iGeom_getVtxArrCoords( self.instance[0],
        entity_handles,
        entity_handles_size,
        storage_order,
        coordinates,
        coordinates_allocated,
        coordinates_size,
        err )


    cdef iGeom_getPntRayIntsct( self,
        double x,
        double y,
        double z,
        double dir_x,
        double dir_y,
        double dir_z,
        c_pyBase.iBase_EntityHandle** intersect_entity_handles,
        int* intersect_entity_handles_allocated,
        int* intersect_entity_hangles_size,
        int storage_order,
        double** intersect_coords,
        int* intersect_coords_allocated,
        int* intersect_coords_size,
        double** param_coords,
        int* param_coords_allocated,
        int* param_coords_size,
        int* err ):
        c_pyGeom.iGeom_getPntRayIntsct( self.instance[0],
        x,
        y,
        z,
        dir_x,
        dir_y,
        dir_z,
        intersect_entity_handles,
        intersect_entity_handles_allocated,
        intersect_entity_hangles_size,
        storage_order,
        intersect_coords,
        intersect_coords_allocated,
        intersect_coords_size,
        param_coords,
        param_coords_allocated,
        param_coords_size,
        err )


    cdef iGeom_getPntArrRayIntsct( self,
        int storage_order,
        const double* coords,
        int coords_size,
        const double* directions,
        int directions_size,
        c_pyBase.iBase_EntityHandle** intersect_entity_handles,
        int* intersect_entity_handles_allocated,
        int* intersect_entity_hangles_size,
        int** offset,
        int* offset_allocated,
        int* offset_size,
        double** intersect_coords,
        int* intersect_coords_allocated,
        int* intersect_coords_size,
        double** param_coords,
        int* param_coords_allocated,
        int* param_coords_size,
        int* err ):
        c_pyGeom.iGeom_getPntArrRayIntsct( self.instance[0],
        storage_order,
        coords,
        coords_size,
        directions,
        directions_size,
        intersect_entity_handles,
        intersect_entity_handles_allocated,
        intersect_entity_hangles_size,
        offset,
        offset_allocated,
        offset_size,
        intersect_coords,
        intersect_coords_allocated,
        intersect_coords_size,
        param_coords,
        param_coords_allocated,
        param_coords_size,
        err) 


    cdef iGeom_getPntClsf( self,
        double x,
        double y,
        double z,
        c_pyBase.iBase_EntityHandle* entity_handle,
        int* err ):
        c_pyGeom.iGeom_getPntClsf( self.instance[0],
        x,
        y,
        z,
        entity_handle,
        err )


    cdef iGeom_getPntArrClsf( self,
        int storage_order,
        const double* coords,
        int coords_size,
        c_pyBase.iBase_EntityHandle** entity_handles,
        int* entity_handles_allocated,
        int* entity_handles_size,
        int* err ):
        c_pyGeom.iGeom_getPntArrClsf( self.instance[0],
        storage_order,
        coords,
        coords_size,
        entity_handles,
        entity_handles_allocated,
        entity_handles_size,
        err )


    cdef iGeom_getEntNrmlSense( self,
        c_pyBase.iBase_EntityHandle face,
        c_pyBase.iBase_EntityHandle region,
        int* sense_out,
        int* err ):
        c_pyGeom.iGeom_getEntNrmlSense( self.instance[0],
        face,
        region,
        sense_out,
        err )


    cdef iGeom_getArrNrmlSense( self,
        const c_pyBase.iBase_EntityHandle* face_handles,
        int face_handles_size,
        const c_pyBase.iBase_EntityHandle* region_handles,
        int region_handles_size,
        int** sense,
        int* sense_allocated,
        int* sense_size,
        int* err ):
        c_pyGeom.iGeom_getArrNrmlSense( self.instance[0],
        face_handles,
        face_handles_size,
        region_handles,
        region_handles_size,
        sense,
        sense_allocated,
        sense_size,
        err )

    cdef iGeom_getEgFcSense( iGeom_Instance,
        c_pyBase.iBase_EntityHandle edge,
        c_pyBase.iBase_EntityHandle face,
        int* sense_out,
        int* err ):
        c_pyGeom.iGeom_getEgFcSense( iGeom_Instance,
        edge,
        face,
        sense_out,
        err)


    cdef iGeom_getEgFcArrSense( self,
        const c_pyBase.iBase_EntityHandle* edge_handles,
        int edge_handles_size,
        const c_pyBase.iBase_EntityHandle* face_handles,
        int face_handles_size,
        int** sense,
        int* sense_allocated,
        int* sense_size,
        int* err ):
        c_pyGeom.iGeom_getEgFcArrSense( self.instance[0],
        edge_handles,
        edge_handles_size,
        face_handles,
        face_handles_size,
        sense,
        sense_allocated,
        sense_size,
        err )


    cdef iGeom_getEgVtxSense( self,
        c_pyBase.iBase_EntityHandle edge,
        c_pyBase.iBase_EntityHandle vertex1,
        c_pyBase.iBase_EntityHandle vertex2,
        int* sense_out,
        int* err ):
        c_pyGeom.iGeom_getEgVtxSense( self.instance[0],
        edge,
        vertex1,
        vertex2,
        sense_out,
        err )


    cdef iGeom_getEgVtxArrSense( self,
        const c_pyBase.iBase_EntityHandle* edge_handles,
        int edge_handles_size,
        const c_pyBase.iBase_EntityHandle* vertex_handles_1,
        int veretx_handles_1_size,
        const c_pyBase.iBase_EntityHandle* vertex_handles_2,
        int vertex_handles_2_size,
        int** sense,
        int* sense_allocated,
        int* sense_size,
        int* err ):
        c_pyGeom.iGeom_getEgVtxArrSense( self.instance[0],
        edge_handles,
        edge_handles_size,
        vertex_handles_1,
        veretx_handles_1_size,
        vertex_handles_2,
        vertex_handles_2_size,
        sense,
        sense_allocated,
        sense_size,
        err )


    cdef iGeom_measure( self,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        double** measures,
        int* measures_allocated,
        int* measures_size,
        int* err ):
        c_pyGeom.iGeom_measure( self.instance[0],
        entity_handles,
        entity_handles_size,
        measures,
        measures_allocated,
        measures_size,
        err) 


    cdef iGeom_getFaceType( self,
        c_pyBase.iBase_EntityHandle face_handle,
        char* face_type,
        int* err,
        int* face_type_length):
        c_pyGeom.iGeom_getFaceType( self.instance[0],
        face_handle,
        face_type,
        err,
        face_type_length)


    cdef iGeom_getParametric( self,
        int* is_parametric,
        int* err ):
        c_pyGeom.iGeom_getParametric( self.instance[0],
        is_parametric,
        err )


    cdef iGeom_isEntParametric( self,
        c_pyBase.iBase_EntityHandle entity_handle,
        int* parametric,
        int* err ):
        c_pyGeom.iGeom_isEntParametric( self.instance[0],
        entity_handle,
        parametric,
        err )


    cdef iGeom_isArrParametric( self,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        int** is_parametric,
        int* is_parametric_allocated,
        int* is_parametric_size,
        int* err ):
        c_pyGeom.iGeom_isArrParametric( self.instance[0],
        entity_handles,
        entity_handles_size,
        is_parametric,
        is_parametric_allocated,
        is_parametric_size,
        err )


    cdef iGeom_getEntUVtoXYZ( self,
        c_pyBase.iBase_EntityHandle entity_handle,
        double u,
        double v,
        double* x,
        double* y,
        double* z,
        int* err ):
        c_pyGeom.iGeom_getEntUVtoXYZ( self.instance[0],
        entity_handle,
        u,
        v,
        x,
        y,
        z,
        err )


    cdef iGeom_getArrUVtoXYZ( self,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        int storage_order,
        const double* uv,
        int uv_size,
        double** coordinates,
        int* coordinates_allocated,
        int* coordinates_size,
        int* err ):
        c_pyGeom.iGeom_getArrUVtoXYZ( self.instance[0],
        entity_handles,
        entity_handles_size,
        storage_order,
        uv,
        uv_size,
        coordinates,
        coordinates_allocated,
        coordinates_size,
        err )


    cdef iGeom_getEntUtoXYZ( self,
        c_pyBase.iBase_EntityHandle entity_handle,
        double u,
        double* x, 
        double* y,
        double* z,
        int* err ):
        c_pyGeom.iGeom_getEntUtoXYZ( self.instance[0],
        entity_handle,
        u,
        x, 
        y,
        z,
        err )


    cdef iGeom_getArrUtoXYZ( self,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        const double* u,
        int u_size,
        int storage_order,
        double** on_coords,
        int* on_coords_allocated,
        int* on_coords_size,
        int* err ):
        c_pyGeom.iGeom_getArrUtoXYZ( self.instance[0],
        entity_handles,
        entity_handles_size,
        u,
        u_size,
        storage_order,
        on_coords,
        on_coords_allocated,
        on_coords_size,
        err )

    cdef iGeom_getEntXYZtoUV( self,
        c_pyBase.iBase_EntityHandle entity_handle,
        double x,
        double y,
        double z,
        double* u,
        double* v, 
        int* err ):
        c_pyGeom.iGeom_getEntXYZtoUV( self.instance[0],
        entity_handle,
        x,
        y,
        z,
        u,
        v, 
        err )


    cdef iGeom_getEntXYZtoU( self,
        c_pyBase.iBase_EntityHandle entity_handle,
        double x,
        double y,
        double z,
        double* u,
        int* err ):
        c_pyGeom.iGeom_getEntXYZtoU( self.instance[0],
        entity_handle,
        x,
        y,
        z,
        u,
        err )


    cdef iGeom_getArrXYZtoUV( self,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        int storage_order,
        const double* coordinates,
        int coordinates_size,
        double** uv,
        int* uv_allocated,
        int* uv_size,
        int* err ):
        c_pyGeom.iGeom_getArrXYZtoUV( self.instance[0],
        entity_handles,
        entity_handles_size,
        storage_order,
        coordinates,
        coordinates_size,
        uv,
        uv_allocated,
        uv_size,
        err )


    cdef iGeom_getArrXYZtoU( self,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        int storage_order,
        const double* coordinates,
        int coordinates_size,
        double** u,
        int* u_allocated,
        int* u_size,
        int* err ):
        c_pyGeom.iGeom_getArrXYZtoU( self.instance[0],
        entity_handles,
        entity_handles_size,
        storage_order,
        coordinates,
        coordinates_size,
        u,
        u_allocated,
        u_size,
        err )


    cdef iGeom_getEntXYZtoUVHint( self,
        c_pyBase.iBase_EntityHandle entity_handle,
        double x,
        double y,
        double z,
        double* u,
        double* v,
        int* err ):
        c_pyGeom.iGeom_getEntXYZtoUVHint( self.instance[0],
        entity_handle,
        x,
        y,
        z,
        u,
        v,
        err )


    cdef iGeom_getArrXYZtoUVHint( self,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        int storage_order,
        const double* coords,
        int coords_size,
        double** uv,
        int* uv_allocated,
        int* uv_size,
        int* err ):
        c_pyGeom.iGeom_getArrXYZtoUVHint( self.instance[0],
        entity_handles,
        entity_handles_size,
        storage_order,
        coords,
        coords_size,
        uv,
        uv_allocated,
        uv_size,
        err )


    cdef iGeom_getEntUVRange( self,
        c_pyBase.iBase_EntityHandle entity_handle,
        double* u_min,
        double* v_min,
        double* u_max,
        double* v_max,
        int* err ):
        c_pyGeom.iGeom_getEntUVRange( self.instance[0],
        entity_handle,
        u_min,
        v_min,
        u_max,
        v_max,
        err )


    cdef iGeom_getEntURange( self,
        c_pyBase.iBase_EntityHandle entity_handle,
        double* u_min,
        double* u_max,
        int* err ):
        c_pyGeom.iGeom_getEntURange( self.instance[0],
        entity_handle,
        u_min,
        u_max,
        err )


    cdef iGeom_getArrUVRange( self,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        int storage_order,
        double** uv_min,
        int* uv_min_allocated,
        int* uv_min_size,
        double** uv_max,
        int* uv_max_allocated,
        int* uv_max_size,
        int* err ):
        c_pyGeom.iGeom_getArrUVRange( self.instance[0],
        entity_handles,
        entity_handles_size,
        storage_order,
        uv_min,
        uv_min_allocated,
        uv_min_size,
        uv_max,
        uv_max_allocated,
        uv_max_size,
        err )

    cdef iGeom_getArrURange( self,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        double** u_min,
        int* u_min_allocated,
        int* u_min_size,
        double** u_max,
        int* u_max_allocated,
        int* u_max_size,
        int* err ):
        c_pyGeom.iGeom_getArrURange( self.instance[0],
        entity_handles,
        entity_handles_size,
        u_min,
        u_min_allocated,
        u_min_size,
        u_max,
        u_max_allocated,
        u_max_size,
        err )


    cdef iGeom_getEntUtoUV( self,
        c_pyBase.iBase_EntityHandle edge_handle,
        c_pyBase.iBase_EntityHandle face_handle,
        double in_u,
        double* u,
        double* v,
        int* err ):
        c_pyGeom.iGeom_getEntUtoUV( self.instance[0],
        edge_handle,
        face_handle,
        in_u,
        u,
        v,
        err )


    cdef iGeom_getVtxToUV( self,
        c_pyBase.iBase_EntityHandle vertex_handle,
        c_pyBase.iBase_EntityHandle face_handle,
        double* u,
        double* v,
        int* err ):
        c_pyGeom.iGeom_getVtxToUV( self.instance[0],
        vertex_handle,
        face_handle,
        u,
        v,
        err )


    cdef iGeom_getVtxToU( self,
        c_pyBase.iBase_EntityHandle vertex_handle,
        c_pyBase.iBase_EntityHandle edge_handle,
        double* u,
        int* err ):
        c_pyGeom.iGeom_getVtxToU( self.instance[0],
        vertex_handle,
        edge_handle,
        u,
        err )


    cdef iGeom_getArrUtoUV( self,
        const c_pyBase.iBase_EntityHandle* edge_handles,
        int edge_handles_size,
        const c_pyBase.iBase_EntityHandle* face_handles,
        int face_handles_size,
        const double* u_in,
        int u_in_size,
        int storage_order,
        double** uv,
        int* uv_allocated,
        int* uv_size,
        int* err ):
        c_pyGeom.iGeom_getArrUtoUV( self.instance[0],
        edge_handles,
        edge_handles_size,
        face_handles,
        face_handles_size,
        u_in,
        u_in_size,
        storage_order,
        uv,
        uv_allocated,
        uv_size,
        err )


    cdef iGeom_getVtxArrToUV( self,
        const c_pyBase.iBase_EntityHandle* vertex_handles,
        int vertex_handles_size,
        const c_pyBase.iBase_EntityHandle* face_handles,
        int face_handles_size,
        int storage_order,
        double** uv,
        int* uv_allocated,
        int* uv_size,
        int* err ):
        c_pyGeom.iGeom_getVtxArrToUV( self.instance[0],
        vertex_handles,
        vertex_handles_size,
        face_handles,
        face_handles_size,
        storage_order,
        uv,
        uv_allocated,
        uv_size,
        err )


    cdef iGeom_getVtxArrToU( self,
        const c_pyBase.iBase_EntityHandle* vertex_handles,
        int vertex_handles_size,
        const c_pyBase.iBase_EntityHandle* edge_handles,
        int edge_handles_size,
        double** u,
        int* u_allocated,
        int* u_size,
        int* err ):
        c_pyGeom.iGeom_getVtxArrToU( self.instance[0],
        vertex_handles,
        vertex_handles_size,
        edge_handles,
        edge_handles_size,
        u,
        u_allocated,
        u_size,
        err )

    cdef iGeom_getEntNrmlUV( self,
        c_pyBase.iBase_EntityHandle entity_handle,
        double u,
        double v,
        double* nrml_i,
        double* nrml_j,
        double* nrml_k,
        int* err ):
        c_pyGeom.iGeom_getEntNrmlUV( self.instance[0],
        entity_handle,
        u,
        v,
        nrml_i,
        nrml_j,
        nrml_k,
        err )


    cdef iGeom_getArrNrmlUV( self,
        const c_pyBase.iBase_EntityHandle* face_handles,
        int face_handles_size,
        int storage_order,
        const double* parameters,
        int parameters_size,
        double** normals,
        int* normals_allocated,
        int* normals_size,
        int* err ):
        c_pyGeom.iGeom_getArrNrmlUV( self.instance[0],
        face_handles,
        face_handles_size,
        storage_order,
        parameters,
        parameters_size,
        normals,
        normals_allocated,
        normals_size,
        err )

    cdef iGeom_getEntTgntU( self,
        c_pyBase.iBase_EntityHandle entity_handle,
        double u,
        double* tgnt_i,
        double* tgnt_j,
        double* tgnt_k,
        int* err ):
        c_pyGeom.iGeom_getEntTgntU( self.instance[0],
        entity_handle,
        u,
        tgnt_i,
        tgnt_j,
        tgnt_k,
        err )

    cdef iGeom_getArrTgntU( self,
        const c_pyBase.iBase_EntityHandle* edge_handles,
        int edge_handles_size,
        int storage_order,
        const double* parameters,
        int parameters_size,
        double** tangents,
        int* tangents_allocated,
        int* tangents_size,
        int* err ):
        c_pyGeom.iGeom_getArrTgntU( self.instance[0],
        edge_handles,
        edge_handles_size,
        storage_order,
        parameters,
        parameters_size,
        tangents,
        tangents_allocated,
        tangents_size,
        err )

    cdef iGeom_getEnt1stDrvt( self,
        c_pyBase.iBase_EntityHandle entity_handle,
        double u,
        double v,
        double** drvt_u,
        int* drvt_u_allocated,
        int* drvt_u_size,
        double** drvt_v,
        int* dvrt_v_allocated,
        int* dvrt_v_size,
        int* err ):
        c_pyGeom.iGeom_getEnt1stDrvt( self.instance[0],
        entity_handle,
        u,
        v,
        drvt_u,
        drvt_u_allocated,
        drvt_u_size,
        drvt_v,
        dvrt_v_allocated,
        dvrt_v_size,
        err )


    cdef iGeom_getArr1stDrvt( self,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        int storage_order,
        const double* uv,
        int uv_size,
        double** dvrt_u,
        int* dvrt_u_allocated,
        int* dvrt_u_size,
        int** u_offset,
        int* u_offset_allocated,
        int* u_offset_size,
        double** dvrt_v,
        int* dvrt_v_allocated,
        int* dvrt_v_size,
        int** v_offset,
        int* v_offset_allocated,
        int* v_offset_size,
        int* err ):
        c_pyGeom.iGeom_getArr1stDrvt( self.instance[0],
        entity_handles,
        entity_handles_size,
        storage_order,
        uv,
        uv_size,
        dvrt_u,
        dvrt_u_allocated,
        dvrt_u_size,
        u_offset,
        u_offset_allocated,
        u_offset_size,
        dvrt_v,
        dvrt_v_allocated,
        dvrt_v_size,
        v_offset,
        v_offset_allocated,
        v_offset_size,
        err )


    cdef iGeom_getEnt2ndDrvt( self,
        c_pyBase.iBase_EntityHandle entity_handle,
        double u,
        double v,
        double** drvt_uu,
        int* drvt_uu_allocated,
        int* drvt_uu_size,
        double** drvt_vv,
        int* dvrt_vv_allocated,
        int* dvrt_vv_size,
        double** drvt_uv,
        int* dvrt_uv_allocated,
        int* dvrt_uv_size,
        int* err ):
        c_pyGeom.iGeom_getEnt2ndDrvt( self.instance[0],
        entity_handle,
        u,
        v,
        drvt_uu,
        drvt_uu_allocated,
        drvt_uu_size,
        drvt_vv,
        dvrt_vv_allocated,
        dvrt_vv_size,
        drvt_uv,
        dvrt_uv_allocated,
        dvrt_uv_size,
        err )


    cdef iGeom_getArr2ndDrvt( self,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        int storage_order,
        const double* uv,
        int uv_size,
        double** dvtr_uu,
        int* dvrt_uu_allocated,
        int* dvrt_uu_size,
        int** uu_offset,
        int* uu_offset_allocated,
        int* uu_offset_size,
        double** dvtr_vv,
        int* dvrt_vv_allocated,
        int* dvrt_vv_size,
        int** vv_offset,
        int* vv_offset_allocated,
        int* vv_offset_size,
        double** dvrt_uv,
        int* dvrt_uv_allocated,
        int* dvrt_uv_size,
        int** uv_offset,
        int* uv_offset_allocated,
        int* uv_offset_size,
        int* err ):
        c_pyGeom.iGeom_getArr2ndDrvt( self.instance[0],
        entity_handles,
        entity_handles_size,
        storage_order,
        uv,
        uv_size,
        dvtr_uu,
        dvrt_uu_allocated,
        dvrt_uu_size,
        uu_offset,
        uu_offset_allocated,
        uu_offset_size,
        dvtr_vv,
        dvrt_vv_allocated,
        dvrt_vv_size,
        vv_offset,
        vv_offset_allocated,
        vv_offset_size,
        dvrt_uv,
        dvrt_uv_allocated,
        dvrt_uv_size,
        uv_offset,
        uv_offset_allocated,
        uv_offset_size,
        err )


    cdef iGeom_getFcCvtrUV( self,
        c_pyBase.iBase_EntityHandle face_handle,
        double u,
        double v,
        double* cvtr1_i,
        double* cvtr1_j,
        double* cvtr1_k,
        double* cvtr2_i,
        double* cvtr2_j,
        double* cvtr2_k,
        int* err ):
        c_pyGeom.iGeom_getFcCvtrUV( self.instance[0],
        face_handle,
        u,
        v,
        cvtr1_i,
        cvtr1_j,
        cvtr1_k,
        cvtr2_i,
        cvtr2_j,
        cvtr2_k,
        err )


    cdef iGeom_getFcArrCvtrUV( self,
        const c_pyBase.iBase_EntityHandle* face_handles,
        int face_handles_size,
        int storage_order,
        const double* uv,
        int uv_size,
        double** cvtr_1,
        int* cvtr_1_allocated,
        int* cvtr_1_size,
        double** cvtr_2,
        int* cvtr_2_allocated,
        int* cvtr_2_size,
        int* err ):
        c_pyGeom.iGeom_getFcArrCvtrUV( self.instance[0],
        face_handles,
        face_handles_size,
        storage_order,
        uv,
        uv_size,
        cvtr_1,
        cvtr_1_allocated,
        cvtr_1_size,
        cvtr_2,
        cvtr_2_allocated,
        cvtr_2_size,
        err )


    cdef iGeom_isEntPeriodic( self,
        c_pyBase.iBase_EntityHandle entity_handle,
        int* in_u,
        int* in_v,
        int* err ):
        c_pyGeom.iGeom_isEntPeriodic( self.instance[0],
        entity_handle,
        in_u,
        in_v,
        err )


    cdef iGeom_isArrPeriodic( self,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        int** in_uv,
        int* in_uv_allocated,
        int* in_uv_size,
        int* err ):
        c_pyGeom.iGeom_isArrPeriodic( self.instance[0],
        entity_handles,
        entity_handles_size,
        in_uv,
        in_uv_allocated,
        in_uv_size,
        err )


    cdef iGeom_isFcDegenerate( self,
        c_pyBase.iBase_EntityHandle face_handle,
        int* is_degenerate,
        int* err ):
        c_pyGeom.iGeom_isFcDegenerate( self.instance[0],
        face_handle,
        is_degenerate,
        err )        


    cdef iGeom_isFcArrDegenerate( self,
        const c_pyBase.iBase_EntityHandle* face_handles,
        int face_handles_size,
        int** degenerate,
        int* degenerate_allocated,
        int* degenerate_size,
        int* err ):
        c_pyGeom.iGeom_isFcArrDegenerate( self.instance[0],
        face_handles,
        face_handles_size,
        degenerate,
        degenerate_allocated,
        degenerate_size,
        err )


    cdef iGeom_getTolerance( self,
        int* type,
        double* tolerance,
        int* err ):
        c_pyGeom.iGeom_getTolerance( self.instance[0],
        type,
        tolerance,
        err )


    cdef iGeom_getEntTolerance( self,
        c_pyBase.iBase_EntityHandle entity_handle,
        double* tolerance,
        int* err ):
        c_pyGeom.iGeom_getEntTolerance( self.instance[0],
        entity_handle,
        tolerance,
        err )


    cdef iGeom_getArrTolerance( self,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        double** tolerances,
        int* tolerances_allocated,
        int* tolerances_size,
        int* err ):
        c_pyGeom.iGeom_getArrTolerance( self.instance[0],
        entity_handles,
        entity_handles_size,
        tolerances,
        tolerances_allocated,
        tolerances_size,
        err )


    cdef iGeom_initEntIter( self,
        c_pyBase.iBase_EntitySetHandle entity_set_handle,
        int requested_entity_type,
        c_pyBase.iBase_EntityIterator* entity_iterator,
        int* err ):
        c_pyGeom.iGeom_initEntIter( self.instance[0],
        entity_set_handle,
        requested_entity_type,
        entity_iterator,
        err )


    cdef iGeom_initEntArrIter( self,
        c_pyBase.iBase_EntitySetHandle entity_set_handle,
        int requested_entity_type,
        int requested_array_size,
        c_pyBase.iBase_EntityArrIterator* entArr_iterator,
        int* err ):
        c_pyGeom.iGeom_initEntArrIter( self.instance[0],
        entity_set_handle,
        requested_entity_type,
        requested_array_size,
        entArr_iterator,
        err )

    cdef iGeom_getNextEntIter( self,
        c_pyBase.iBase_EntityIterator entity_iterator,
        c_pyBase.iBase_EntityHandle* entity_handle,
        int* has_data,
        int* err ):
        c_pyGeom.iGeom_getNextEntIter( self.instance[0],
        entity_iterator,
        entity_handle,
        has_data,
        err )


    cdef iGeom_getNextEntArrIter( self,
        c_pyBase.iBase_EntityArrIterator entArr_iterator,
        c_pyBase.iBase_EntityHandle** entity_handles,
        int* entity_handles_allocated,
        int* entity_handles_size,
        int* has_data,
        int* err ):
        c_pyGeom.iGeom_getNextEntArrIter( self.instance[0],
        entArr_iterator,
        entity_handles,
        entity_handles_allocated,
        entity_handles_size,
        has_data,
        err )


    cdef iGeom_resetEntIter( self,
        c_pyBase.iBase_EntityIterator entity_iterator,
        int* err ):
        c_pyGeom.iGeom_resetEntIter( self.instance[0],
        entity_iterator,
        err )


    cdef iGeom_resetEntArrIter( self,
        c_pyBase.iBase_EntityArrIterator entArr_iterator,
        int* err ):
        c_pyGeom.iGeom_resetEntArrIter( self.instance[0],
        entArr_iterator,
        err )

    cdef iGeom_endEntIter( self,
        c_pyBase.iBase_EntityIterator entity_iterator,
        int* err ):
        c_pyGeom.iGeom_endEntIter( self.instance[0],
        entity_iterator,
        err )


    cdef iGeom_endEntArrIter( self,
        c_pyBase.iBase_EntityArrIterator entArr_iterator,
        int* err ):
        c_pyGeom.iGeom_endEntArrIter( self.instance[0],
        entArr_iterator,
        err )


    cdef iGeom_copyEnt( self,
        c_pyBase.iBase_EntityHandle source,
        c_pyBase.iBase_EntityHandle* copy,
        int* err ):
        c_pyGeom.iGeom_copyEnt( self.instance[0],
        source,
        copy,
        err )

    cdef iGeom_sweepEntAboutAxis( self,
        c_pyBase.iBase_EntityHandle geom_entity,
        double angle,
        double axis_x,
        double axis_y,
        double axis_z,
        c_pyBase.iBase_EntityHandle* geom_entity2,
        int* err ):
        c_pyGeom.iGeom_sweepEntAboutAxis( self.instance[0],
        geom_entity,
        angle,
        axis_x,
        axis_y,
        axis_z,
        geom_entity2,
        err )

    cdef iGeom_deleteAll( self,
        int* err ):
        c_pyGeom.iGeom_deleteAll( self.instance[0],
         err )

    cdef iGeom_deleteEnt( self,
        c_pyBase.iBase_EntityHandle entity_handle,
        int* err ):
        c_pyGeom.iGeom_deleteEnt( self.instance[0],
        entity_handle,
        err )

    cdef iGeom_createSphere( self,
        double radius,
        c_pyBase.iBase_EntityHandle* geom_entity,
        int* err ):
        c_pyGeom.iGeom_createSphere( self.instance[0],
        radius,
        geom_entity,
        err )

    cdef iGeom_createPrism( self,
        double height,
        int n_sides,
        double major_rad,
        double minor_rad,
        c_pyBase.iBase_EntityHandle* geom_entity,
        int* err ):
        c_pyGeom.iGeom_createPrism( self.instance[0],
        height,
        n_sides,
        major_rad,
        minor_rad,
        geom_entity,
        err )

    cdef iGeom_createBrick( self,
        double x,
        double y,
        double z,
        c_pyBase.iBase_EntityHandle* geom_entity,
        int* err ):
        c_pyGeom.iGeom_createBrick( self.instance[0],
        x,
        y,
        z,
        geom_entity,
        err )

    cdef iGeom_createCylinder( self,
        double height,
        double major_rad,
        double minor_rad,
        c_pyBase.iBase_EntityHandle* geom_entity,
        int* err ):
        c_pyGeom.iGeom_createCylinder( self.instance[0],
        height,
        major_rad,
        minor_rad,
        geom_entity,
        err )

    cdef iGeom_createCone( self,
        double height,
        double major_rad_base,
        double minor_rad_base,
        double rad_top,
        c_pyBase.iBase_EntityHandle* geom_entity,
        int* err ):
        c_pyGeom.iGeom_createCone( self.instance[0],
        height,
        major_rad_base,
        minor_rad_base,
        rad_top,
        geom_entity,
        err )

    cdef iGeom_createTorus( self,
        double major_rad,
        double minor_rad,
        c_pyBase.iBase_EntityHandle* geom_entity,
        int* err ):
        c_pyGeom.iGeom_createTorus( self.instance[0],
        major_rad,
        minor_rad,
        geom_entity,
        err )

    cdef iGeom_moveEnt( self,
        c_pyBase.iBase_EntityHandle geom_entity,
        double x,
        double y,
        double z,
        int* err ):
        c_pyGeom.iGeom_moveEnt( self.instance[0],
        geom_entity,
        x,
        y,
        z,
        err)

    cdef iGeom_rotateEnt( self,
        c_pyBase.iBase_EntityHandle geom_entity,
        double angle,
        double axis_x,
        double axis_y,
        double axis_z,
        int* err ):
        c_pyGeom.iGeom_rotateEnt( self.instance[0],
        geom_entity,
        angle,
        axis_x,
        axis_y,
        axis_z,
        err )

    cdef iGeom_reflectEnt( self,
        c_pyBase.iBase_EntityHandle geom_entity,
        double point_x,
        double point_y,
        double point_z,
        double plane_normal_x,
        double plane_normal_y,
        double plane_normal_z,
        int* err ):
        c_pyGeom.iGeom_reflectEnt( self.instance[0],
        geom_entity,
        point_x,point_y,point_z,plane_normal_x,
        plane_normal_y,
        plane_normal_z,
        err )

    cdef iGeom_scaleEnt( self,
        c_pyBase.iBase_EntityHandle geom_entity,
        double point_x,
        double point_y,
        double point_z,
        double scale_x,
        double scale_y,
        double scale_z,
        int* err ):
        c_pyGeom.iGeom_scaleEnt( self.instance[0],
        geom_entity,point_x,point_y,point_z,
        scale_x,
        scale_y,
        scale_z,
        err )

    cdef iGeom_uniteEnts( self,
        const c_pyBase.iBase_EntityHandle* geom_entities,
        int geom_entities_size,
        c_pyBase.iBase_EntityHandle* geom_entity,
        int* err ):
        c_pyGeom.iGeom_uniteEnts( self.instance[0],
        geom_entities,
        geom_entities_size,
        geom_entity,
        err )

    cdef iGeom_subtractEnts( self,
        c_pyBase.iBase_EntityHandle blank,
        c_pyBase.iBase_EntityHandle tool,
        c_pyBase.iBase_EntityHandle* geom_entity,
        int* err ):
        c_pyGeom.iGeom_subtractEnts( self.instance[0],
        blank,
        tool,
        geom_entity,
        err )

    cdef iGeom_intersectEnts( self,
        c_pyBase.iBase_EntityHandle entity2,
        c_pyBase.iBase_EntityHandle entity1,
        c_pyBase.iBase_EntityHandle* geom_entity,
        int* err ):
        c_pyGeom.iGeom_intersectEnts( self.instance[0],
        entity2,
        entity1,
        geom_entity,
        err )

    cdef iGeom_sectionEnt( self,
        c_pyBase.iBase_EntityHandle geom_entity,
        double plane_normal_x,
        double plane_normal_y,
        double plane_normal_z,
        double offset,
        int reverse,
        c_pyBase.iBase_EntityHandle* geom_entity2,
        int* err ):
        c_pyGeom.iGeom_sectionEnt( self.instance[0],
        geom_entity,
        plane_normal_x,
        plane_normal_y,
        plane_normal_z,
        offset,
        reverse,
        geom_entity2,
        err )

    cdef iGeom_imprintEnts( self,
        const c_pyBase.iBase_EntityHandle* geom_entities,
        int geom_entities_size,
        int* err ):
        c_pyGeom.iGeom_imprintEnts( self.instance[0],
        geom_entities,
        geom_entities_size,
        err )

    cdef iGeom_mergeEnts( self,
        const c_pyBase.iBase_EntityHandle* geom_entities,
        int geom_entities_size,
        double tolerance,
        int* err ):
        c_pyGeom.iGeom_mergeEnts( self.instance[0],
        geom_entities,
        geom_entities_size,
        tolerance,
        err )

    cdef iGeom_createEntSet( self,
        int isList,
        c_pyBase.iBase_EntitySetHandle* entity_set_created, 
        int *err ):
        c_pyGeom.iGeom_createEntSet( self.instance[0],
        isList,
        entity_set_created, 
        err )

    cdef iGeom_destroyEntSet( self,
        c_pyBase.iBase_EntitySetHandle entity_set, 
        int *err ):
        c_pyGeom.iGeom_destroyEntSet( self.instance[0],
        entity_set, 
        err )

    cdef iGeom_isList( self,
        c_pyBase.iBase_EntitySetHandle entity_set,
        int *is_list, 
        int *err ):
        c_pyGeom.iGeom_isList( self.instance[0],
        entity_set,
        is_list, 
        err )

    cdef iGeom_getNumEntSets( self,
        c_pyBase.iBase_EntitySetHandle entity_set_handle,
        int num_hops,
        int *num_sets, 
        int *err ):
        c_pyGeom.iGeom_getNumEntSets( self.instance[0],
        entity_set_handle,
        num_hops,
        num_sets, 
        err )

    cdef iGeom_getEntSets( self,
        c_pyBase.iBase_EntitySetHandle entity_set_handle,
        int num_hops,
        c_pyBase.iBase_EntitySetHandle** contained_set_handles,
        int* contained_set_handles_allocated,
        int* contained_set_handles_size, 
        int *err ):
        c_pyGeom.iGeom_getEntSets( self.instance[0],
        entity_set_handle,
        num_hops,
        contained_set_handles,
        contained_set_handles_allocated,
        contained_set_handles_size, 
        err )

    cdef iGeom_addEntToSet( self,
        c_pyBase.iBase_EntityHandle entity_handle,
        c_pyBase.iBase_EntitySetHandle entity_set, 
        int *err ):
        c_pyGeom.iGeom_addEntToSet( self.instance[0],
        entity_handle,
        entity_set, 
        err )


    cdef iGeom_rmvEntFromSet( self,
        c_pyBase.iBase_EntityHandle entity_handle,
        c_pyBase.iBase_EntitySetHandle entity_set, 
        int *err ):
        c_pyGeom.iGeom_rmvEntFromSet( self.instance[0],
        entity_handle,
        entity_set, 
        err )


    cdef iGeom_addEntArrToSet( self,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        c_pyBase.iBase_EntitySetHandle entity_set, 
        int *err ):
        c_pyGeom.iGeom_addEntArrToSet( self.instance[0],
        entity_handles,
        entity_handles_size,
        entity_set, 
        err )

    cdef iGeom_rmvEntArrFromSet( self,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        c_pyBase.iBase_EntitySetHandle entity_set,
        int *err ):
        c_pyGeom.iGeom_rmvEntArrFromSet( self.instance[0],
        entity_handles,
        entity_handles_size,
        entity_set,
        err )

    cdef iGeom_addEntSet( self,
        c_pyBase.iBase_EntitySetHandle entity_set_to_add,
        c_pyBase.iBase_EntitySetHandle entity_set_handle, 
        int *err):
        c_pyGeom.iGeom_addEntSet( self.instance[0],
        entity_set_to_add,
        entity_set_handle, 
        err)

    cdef iGeom_rmvEntSet( self,
        c_pyBase.iBase_EntitySetHandle entity_set_to_remove,
        c_pyBase.iBase_EntitySetHandle entity_set_handle, 
        int *err ):
        c_pyGeom.iGeom_rmvEntSet( self.instance[0],
        entity_set_to_remove,
        entity_set_handle, 
        err )

    cdef iGeom_isEntContained( self,
        c_pyBase.iBase_EntitySetHandle containing_entity_set,
        c_pyBase.iBase_EntityHandle contained_entity,
        int *is_contained, 
        int *err ):
        c_pyGeom.iGeom_isEntContained( self.instance[0],
        containing_entity_set,
        contained_entity,
        is_contained, 
        err )

    cdef iGeom_isEntArrContained( self,
        c_pyBase.iBase_EntitySetHandle containing_set,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int num_entity_handles,
        int** is_contained,
        int* is_contained_allocated,
        int* is_contained_size,
        int* err ):
        c_pyGeom.iGeom_isEntArrContained( self.instance[0],
        containing_set,
        entity_handles,
        num_entity_handles,
        is_contained,
        is_contained_allocated,
        is_contained_size,
        err )

    cdef iGeom_isEntSetContained( self,
        c_pyBase.iBase_EntitySetHandle containing_entity_set,
        c_pyBase.iBase_EntitySetHandle contained_entity_set,
        int *is_contained, 
        int *err ):
        c_pyGeom.iGeom_isEntSetContained( self.instance[0],
        containing_entity_set,
        contained_entity_set,
        is_contained, 
        err )

    cdef iGeom_addPrntChld( self,
        c_pyBase.iBase_EntitySetHandle parent_entity_set,
        c_pyBase.iBase_EntitySetHandle child_entity_set, 
        int *err ):
        c_pyGeom.iGeom_addPrntChld( self.instance[0],
        parent_entity_set,
        child_entity_set, 
        err )

    cdef iGeom_rmvPrntChld( self,
        c_pyBase.iBase_EntitySetHandle parent_entity_set,
        c_pyBase.iBase_EntitySetHandle child_entity_set, 
        int *err ):
        c_pyGeom.iGeom_rmvPrntChld( self.instance[0],
        parent_entity_set,
        child_entity_set, 
        err )

    cdef iGeom_isChildOf( self,
        c_pyBase.iBase_EntitySetHandle parent_entity_set,
        c_pyBase.iBase_EntitySetHandle child_entity_set,
        int *is_child, 
        int *err ):
        c_pyGeom.iGeom_isChildOf( self.instance[0],
        parent_entity_set,
        child_entity_set,
        is_child, 
        err )

    cdef iGeom_getNumChld( self,
        c_pyBase.iBase_EntitySetHandle entity_set,
        int num_hops,
        int *num_child, 
        int *err ):
        c_pyGeom.iGeom_getNumChld( self.instance[0],
        entity_set,
        num_hops,
        num_child, 
        err )

    cdef iGeom_getNumPrnt( self,
        c_pyBase.iBase_EntitySetHandle entity_set,
        int num_hops,
        int *num_parent, 
        int *err ):
        c_pyGeom.iGeom_getNumPrnt( self.instance[0],
        entity_set,
        num_hops,
        num_parent, 
        err )

    cdef iGeom_getChldn( self,
        c_pyBase.iBase_EntitySetHandle from_entity_set,
        int num_hops,
        c_pyBase.iBase_EntitySetHandle** entity_set_handles,
        int* entity_set_handles_allocated,
        int* entity_set_handles_size, 
        int *err ):
        c_pyGeom.iGeom_getChldn( self.instance[0],
        from_entity_set,
        num_hops,
        entity_set_handles,
        entity_set_handles_allocated,
        entity_set_handles_size, 
        err )

    cdef iGeom_getPrnts( self,
        c_pyBase.iBase_EntitySetHandle from_entity_set,
        int num_hops,
        c_pyBase.iBase_EntitySetHandle** entity_set_handles,
        int* entity_set_handles_allocated,
        int* entity_set_handles_size, 
        int *err ):
        c_pyGeom.iGeom_getPrnts( self.instance[0],
        from_entity_set,
        num_hops,
        entity_set_handles,
        entity_set_handles_allocated,
        entity_set_handles_size, 
        err )

    cdef iGeom_createTag( self,
        const char* tag_name,
        int tag_size,
        int tag_type,
        c_pyBase.iBase_TagHandle* tag_handle, 
        int *err,
        int tag_name_len ):
        c_pyGeom.iGeom_createTag( self.instance[0],
        tag_name,
        tag_size,
        tag_type,
        tag_handle, 
        err,
        tag_name_len )


    cdef iGeom_destroyTag( self,
        c_pyBase.iBase_TagHandle tag_handle,
        int forced, 
        int *err):
        c_pyGeom.iGeom_destroyTag( self.instance[0],
        tag_handle,
        forced, 
        err)

    cdef iGeom_getTagName( self,
        c_pyBase.iBase_TagHandle tag_handle,
        char *name, 
        int* err,
        int name_len ):
        c_pyGeom.iGeom_getTagName( self.instance[0],
        tag_handle,
        name, 
        err,
        name_len )

    cdef iGeom_getTagSizeValues( self,
        c_pyBase.iBase_TagHandle tag_handle,
        int *tag_size, 
        int *err ):
        c_pyGeom.iGeom_getTagSizeValues( self.instance[0],
        tag_handle,
        tag_size, 
        err )

    cdef iGeom_getTagSizeBytes( self,
        c_pyBase.iBase_TagHandle tag_handle,
        int *tag_size, 
        int *err ):
        c_pyGeom.iGeom_getTagSizeBytes( self.instance[0],
        tag_handle,
        tag_size, 
        err )

    cdef iGeom_getTagHandle( self,
        const char* tag_name,
        c_pyBase.iBase_TagHandle *tag_handle, 
        int *err,
        int tag_name_len ):
        c_pyGeom.iGeom_getTagHandle( self.instance[0],
        tag_name,
        tag_handle, 
        err,
        tag_name_len )

    cdef iGeom_getTagType( self,
        c_pyBase.iBase_TagHandle tag_handle,
        int *tag_type, 
        int *err ):
        c_pyGeom.iGeom_getTagType( self.instance[0],
        tag_handle,
        tag_type, 
        err )

    cdef iGeom_setEntSetData( self,
        c_pyBase.iBase_EntitySetHandle entity_set_handle,
        const c_pyBase.iBase_TagHandle tag_handle,
        const void* tag_value,
        const int tag_value_size,
        int *err ):
        c_pyGeom.iGeom_setEntSetData( self.instance[0],
        entity_set_handle,
        tag_handle,
        tag_value,
        tag_value_size,
        err )


    cdef iGeom_setEntSetIntData( self,
        c_pyBase.iBase_EntitySetHandle entity_set,
        c_pyBase.iBase_TagHandle tag_handle,
        int tag_value, 
        int *err ):
        c_pyGeom.iGeom_setEntSetIntData( self.instance[0],
        entity_set,
        tag_handle,
        tag_value, 
        err )

    cdef iGeom_setEntSetDblData( self,
        c_pyBase.iBase_EntitySetHandle entity_set,
        c_pyBase.iBase_TagHandle tag_handle,
        double tag_value, 
        int *err ):
        c_pyGeom.iGeom_setEntSetDblData( self.instance[0],
        entity_set,
        tag_handle,
        tag_value, 
        err )

    cdef iGeom_setEntSetEHData( self,
        c_pyBase.iBase_EntitySetHandle entity_set,
        c_pyBase.iBase_TagHandle tag_handle,
        c_pyBase.iBase_EntityHandle tag_value, 
        int *err ):
        c_pyGeom.iGeom_setEntSetEHData( self.instance[0],
        entity_set,
        tag_handle,
        tag_value, 
        err )

    cdef iGeom_setEntSetESHData( self,
        c_pyBase.iBase_EntitySetHandle entity_set,
        c_pyBase.iBase_TagHandle tag_handle,
        c_pyBase.iBase_EntitySetHandle tag_value, 
        int *err ):
        c_pyGeom.iGeom_setEntSetESHData( self.instance[0],
        entity_set,
        tag_handle,
        tag_value, 
        err )

    cdef iGeom_getEntSetData( self,
        c_pyBase.iBase_EntitySetHandle entity_set_handle,
        c_pyBase.iBase_TagHandle tag_handle,
        void** tag_value,
        int* tag_value_allocated,
        int* tag_value_size, 
        int *err ):
        c_pyGeom.iGeom_getEntSetData( self.instance[0],
        entity_set_handle,
        tag_handle,
        tag_value,
        tag_value_allocated,
        tag_value_size, 
        err )

    cdef iGeom_getEntSetIntData( self,
        c_pyBase.iBase_EntitySetHandle entity_set,
        c_pyBase.iBase_TagHandle tag_handle,
        int *out_data, 
        int *err ):
        c_pyGeom.iGeom_getEntSetIntData( self.instance[0],
        entity_set,
        tag_handle,
        out_data, 
        err )


    cdef iGeom_getEntSetDblData( self,
        c_pyBase.iBase_EntitySetHandle entity_set,
        c_pyBase.iBase_TagHandle tag_handle,
        double *out_data, 
        int *err ):
        c_pyGeom.iGeom_getEntSetDblData( self.instance[0],
        entity_set,
        tag_handle,
        out_data, 
        err )
 

    cdef iGeom_getEntSetEHData( self,
        c_pyBase.iBase_EntitySetHandle entity_set,
        c_pyBase.iBase_TagHandle tag_handle,
        c_pyBase.iBase_EntityHandle *out_data, 
        int *err ):
        c_pyGeom.iGeom_getEntSetEHData( self.instance[0],
        entity_set,
        tag_handle,
        out_data, 
        err )


    cdef iGeom_getEntSetESHData( self,
        c_pyBase.iBase_EntitySetHandle entity_set,
        c_pyBase.iBase_TagHandle tag_handle,
        c_pyBase.iBase_EntitySetHandle *out_data, 
        int *err ):
        c_pyGeom.iGeom_getEntSetESHData( self.instance[0],
        entity_set,
        tag_handle,
        out_data, 
        err )


    cdef iGeom_getAllEntSetTags( self,
        c_pyBase.iBase_EntitySetHandle entity_set_handle,
        c_pyBase.iBase_TagHandle** tag_handles,
        int* tag_handles_allocated,
        int* tag_handles_size, 
        int *err ):
        c_pyGeom.iGeom_getAllEntSetTags( self.instance[0],
        entity_set_handle,
        tag_handles,
        tag_handles_allocated,
        tag_handles_size, 
        err )


    cdef iGeom_rmvEntSetTag( self,
        c_pyBase.iBase_EntitySetHandle entity_set_handle,
        c_pyBase.iBase_TagHandle tag_handle, 
        int *err ):
        c_pyGeom.iGeom_rmvEntSetTag( self.instance[0],
        entity_set_handle,
        tag_handle, 
        err )


    cdef iGeom_getArrData( self,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        c_pyBase.iBase_TagHandle tag_handle,
        void** tag_values,
        int* tag_values_allocated,
        int* tag_values_size, 
        int *err ):
        c_pyGeom.iGeom_getArrData( self.instance[0],
        entity_handles,
        entity_handles_size,
        tag_handle,
        tag_values,
        tag_values_allocated,
        tag_values_size, 
        err )


    cdef iGeom_getIntArrData( self,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        c_pyBase.iBase_TagHandle tag_handle,
        int** tag_values,
        int* tag_values_allocated,
        int* tag_values_size, 
        int *err ):
        c_pyGeom.iGeom_getIntArrData( self.instance[0],
        entity_handles,
        entity_handles_size,
        tag_handle,
        tag_values,
        tag_values_allocated,
        tag_values_size, 
        err )
 

    cdef iGeom_getDblArrData( self,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        c_pyBase.iBase_TagHandle tag_handle,
        double** tag_values,
        int* tag_values_allocated,
        int* tag_values_size, 
        int *err ):
        c_pyGeom.iGeom_getDblArrData( self.instance[0],
        entity_handles,
        entity_handles_size,
        tag_handle,
        tag_values,
        tag_values_allocated,
        tag_values_size, 
        err )


    cdef iGeom_getEHArrData( self,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        c_pyBase.iBase_TagHandle tag_handle,
        c_pyBase.iBase_EntityHandle** tag_value,
        int* tag_value_allocated,
        int* tag_value_size, 
        int *err ):
        c_pyGeom.iGeom_getEHArrData( self.instance[0],
        entity_handles,
        entity_handles_size,
        tag_handle,
        tag_value,
        tag_value_allocated,
        tag_value_size, 
        err )


    cdef iGeom_getESHArrData( self,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        c_pyBase.iBase_TagHandle tag_handle,
        c_pyBase.iBase_EntitySetHandle** tag_value,
        int* tag_value_allocated,
        int* tag_value_size, 
        int *err ):
        c_pyGeom.iGeom_getESHArrData( self.instance[0],
        entity_handles,
        entity_handles_size,
        tag_handle,
        tag_value,
        tag_value_allocated,
        tag_value_size, 
        err )



    cdef iGeom_setArrData( self,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        c_pyBase.iBase_TagHandle tag_handle,
        const void* tag_values,
        int tag_values_size, 
        int *err ):
        c_pyGeom.iGeom_setArrData( self.instance[0],
        entity_handles,
        entity_handles_size,
        tag_handle,
        tag_values,
        tag_values_size, 
        err )


    cdef iGeom_setIntArrData( self,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        c_pyBase.iBase_TagHandle tag_handle,
        const int* tag_values,
        int tag_values_size, 
        int *err ):
        c_pyGeom.iGeom_setIntArrData( self.instance[0],
        entity_handles,
        entity_handles_size,
        tag_handle,
        tag_values,
        tag_values_size, 
        err )

    cdef iGeom_setDblArrData( self,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        c_pyBase.iBase_TagHandle tag_handle,
        const double* tag_values,
        const int tag_values_size, 
        int *err ):
        c_pyGeom.iGeom_setDblArrData( self.instance[0],
        entity_handles,
        entity_handles_size,
        tag_handle,
        tag_values,
        tag_values_size, 
        err )

    cdef iGeom_setEHArrData( self,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        c_pyBase.iBase_TagHandle tag_handle,
        const c_pyBase.iBase_EntityHandle* tag_values,
        int tag_values_size, 
        int *err ):
        c_pyGeom.iGeom_setEHArrData( self.instance[0],
        entity_handles,
        entity_handles_size,
        tag_handle,
        tag_values,
        tag_values_size, 
        err )



    cdef iGeom_setESHArrData( self,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        c_pyBase.iBase_TagHandle tag_handle,
        const c_pyBase.iBase_EntitySetHandle* tag_values,
        int tag_values_size, 
        int *err ):
        c_pyGeom.iGeom_setESHArrData( self.instance[0],
        entity_handles,
        entity_handles_size,
        tag_handle,
        tag_values,
        tag_values_size, 
        err )


    cdef iGeom_rmvArrTag( self,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        c_pyBase.iBase_TagHandle tag_handle, 
        int *err ):
        c_pyGeom.iGeom_rmvArrTag( self.instance[0],
        entity_handles,
        entity_handles_size,
        tag_handle, 
        err )

    cdef iGeom_getData( self,
        c_pyBase.iBase_EntityHandle entity_handle,
        c_pyBase.iBase_TagHandle tag_handle,
        void** tag_value,
        int *tag_value_allocated,
        int *tag_value_size, 
        int *err ):
        c_pyGeom.iGeom_getData( self.instance[0],
        entity_handle,
        tag_handle,
        tag_value,
        tag_value_allocated,
        tag_value_size, 
        err )

    cdef iGeom_getIntData( self,
        c_pyBase.iBase_EntityHandle entity_handle,
        c_pyBase.iBase_TagHandle tag_handle,
        int *out_data, 
        int *err ):
        c_pyGeom.iGeom_getIntData( self.instance[0],
        entity_handle,
        tag_handle,
        out_data, 
        err )

    cdef iGeom_getDblData( self,
        const c_pyBase.iBase_EntityHandle entity_handle,
        const c_pyBase.iBase_TagHandle tag_handle,
        double *out_data,
        int *err ):
        c_pyGeom.iGeom_getDblData( self.instance[0],
        entity_handle,
        tag_handle,
        out_data,
        err )

    cdef iGeom_getEHData( self,
        c_pyBase.iBase_EntityHandle entity_handle,
        c_pyBase.iBase_TagHandle tag_handle,
        c_pyBase.iBase_EntityHandle *out_data, 
        int *err ):
        c_pyGeom.iGeom_getEHData( self.instance[0],
        entity_handle,
        tag_handle,
        out_data, 
        err )

    cdef iGeom_getESHData( self,
        c_pyBase.iBase_EntityHandle entity_handle,
        c_pyBase.iBase_TagHandle tag_handle,
        c_pyBase.iBase_EntitySetHandle *out_data, 
        int *err ):
        c_pyGeom.iGeom_getESHData( self.instance[0],
        entity_handle,
        tag_handle,
        out_data, 
        err )

    cdef iGeom_setData( self,
        c_pyBase.iBase_EntityHandle entity_handle,
        c_pyBase.iBase_TagHandle tag_handle,
        const void* tag_value,
        int tag_value_size, 
        int *err ):
        c_pyGeom.iGeom_setData( self.instance[0],
        entity_handle,
        tag_handle,
        tag_value,
        tag_value_size, 
        err )
 
    cdef iGeom_setIntData( self,
        c_pyBase.iBase_EntityHandle entity_handle,
        c_pyBase.iBase_TagHandle tag_handle,
        int tag_value, 
        int *err ):
        c_pyGeom.iGeom_setIntData( self.instance[0],
        entity_handle,
        tag_handle,
        tag_value, 
        err )

    cdef iGeom_setDblData( self,
        c_pyBase.iBase_EntityHandle entity_handle,
        c_pyBase.iBase_TagHandle tag_handle,
        double tag_value, 
        int *err ):
        c_pyGeom.iGeom_setDblData( self.instance[0],
        entity_handle,
        tag_handle,
        tag_value, 
        err )

    cdef iGeom_setEHData( self,
        c_pyBase.iBase_EntityHandle entity_handle,
        c_pyBase.iBase_TagHandle tag_handle,
        c_pyBase.iBase_EntityHandle tag_value, 
        int *err ):
        c_pyGeom.iGeom_setEHData( self.instance[0],
        entity_handle,
        tag_handle,
        tag_value, 
        err )

    cdef iGeom_setESHData( self,
        c_pyBase.iBase_EntityHandle entity_handle,
        c_pyBase.iBase_TagHandle tag_handle,
        c_pyBase.iBase_EntitySetHandle tag_value, 
        int *err ):
        c_pyGeom.iGeom_setESHData( self.instance[0],
        entity_handle,
        tag_handle,
        tag_value, 
        err )

    cdef iGeom_getAllTags( self,
        c_pyBase.iBase_EntityHandle entity_handle,
        c_pyBase.iBase_TagHandle** tag_handles,
        int* tag_handles_allocated,
        int* tag_handles_size, 
        int *err ):
        c_pyGeom.iGeom_getAllTags( self.instance[0],
        entity_handle,
        tag_handles,
        tag_handles_allocated,
        tag_handles_size, 
        err )

    cdef iGeom_rmvTag( self,
        c_pyBase.iBase_EntityHandle entity_handle,
        c_pyBase.iBase_TagHandle tag_handle, 
        int *err ):
        c_pyGeom.iGeom_rmvTag( self.instance[0],
        entity_handle,
        tag_handle, 
        err )

    cdef iGeom_subtract( self,
        c_pyBase.iBase_EntitySetHandle entity_set_1,
        c_pyBase.iBase_EntitySetHandle entity_set_2,
        c_pyBase.iBase_EntitySetHandle* result_entity_set, 
        int *err ):
        c_pyGeom.iGeom_subtract( self.instance[0],
        entity_set_1,
        entity_set_2,
        result_entity_set, 
        err )


    cdef iGeom_intersect( self,
        c_pyBase.iBase_EntitySetHandle entity_set_1,
        c_pyBase.iBase_EntitySetHandle entity_set_2,
        c_pyBase.iBase_EntitySetHandle* result_entity_set, 
        int *err ):
        c_pyGeom.iGeom_intersect( self.instance[0],
        entity_set_1,
        entity_set_2,
        result_entity_set, 
        err )


    cdef iGeom_unite( self,
        c_pyBase.iBase_EntitySetHandle entity_set_1,
        c_pyBase.iBase_EntitySetHandle entity_set_2,
        c_pyBase.iBase_EntitySetHandle* result_entity_set, 
        int *err ):
        c_pyGeom.iGeom_unite( self.instance[0],
        entity_set_1,
        entity_set_2,
        result_entity_set, 
        err )


    cdef iGeom_getFacets(self,
        c_pyBase.iBase_EntityHandle entity,
        double dist_tolerance,
        double **points, int *points_allocated, int *points_size,
        int **facets, int *facets_allocated, int *facets_size,
        int *err):
        c_pyGeom.iGeom_getFacets(self.instance[0],
        entity,
        dist_tolerance,
        points, points_allocated, points_size,
        facets, facets_allocated, facets_size,
        err)

