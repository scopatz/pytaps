
cimport c_pyBase


cdef extern from "iGeom.h":


    ctypedef struct iGeom_Instance:
        pass


    void iGeom_getDescription( iGeom_Instance instance,
            char* descr,
            int descr_len );

    void iGeom_getErrorType( iGeom_Instance instance,
        int *error_type );

    void iGeom_newGeom( const char* options,
            iGeom_Instance* instance_out,
            int* err,
            int options_len );

    void iGeom_dtor( iGeom_Instance instance,
                int* err );

    void iGeom_load( iGeom_Instance instance,
                const char* name,
                const char* options,
                int* err,
                int name_len,
                int options_len );

    void iGeom_save( iGeom_Instance instance,
                const char* name,
                const char* options,
                int* err,
                int name_len,
                int options_len );

    void iGeom_getRootSet( iGeom_Instance instance,
         c_pyBase.iBase_EntitySetHandle* root_set,
         int* err );

    void iGeom_getBoundBox( iGeom_Instance instance,
            double* min_x,
            double* min_y,
            double* min_z,
            double* max_x,
            double* max_y,
            double* max_z,
            int* err );

    void iGeom_getEntities( iGeom_Instance instance,
            c_pyBase.iBase_EntitySetHandle set_handle,
            int entity_type,
            c_pyBase.iBase_EntityHandle** entity_handles,
            int* entity_handles_allococated,
            int* entity_handles_size,
            int* err );

    void iGeom_getNumOfType( iGeom_Instance instance,
        c_pyBase.iBase_EntitySetHandle set_handle,
        int entity_type,
        int* num_out,
        int* err );

    void iGeom_getEntType( iGeom_Instance instance,
         c_pyBase.iBase_EntityHandle entity_handle,
         int* type,
         int* err );

    void iGeom_getArrType( iGeom_Instance instance,
         const c_pyBase.iBase_EntityHandle* entity_handles,
         int entity_handles_size,
         int** type,
         int* type_allocated,
         int* type_size,
         int* err );


    void iGeom_getEntAdj( iGeom_Instance instance,
        c_pyBase.iBase_EntityHandle entity_handle,
        int to_dimension,
        c_pyBase.iBase_EntityHandle** adj_entities,
        int* adj_entities_allocated,
        int* adj_entities_size,
        int* err );


    void iGeom_getArrAdj( iGeom_Instance instance,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        int requested_entity_type,
        c_pyBase.iBase_EntityHandle** adj_entity_handles,
        int* adj_entity_handles_allocated,
        int* adj_entity_handles_size,
        int** offset,
        int* offset_allocated,
        int* offset_size,
        int* err );


    void iGeom_getEnt2ndAdj( iGeom_Instance instance,
        c_pyBase.iBase_EntityHandle entity_handle,
        int bridge_dimension,
        int to_dimension,
        c_pyBase.iBase_EntityHandle** adjacent_entities,
        int* adjacent_entities_allocated,
        int* adjacent_entities_size,
        int* err );


    void iGeom_getArr2ndAdj( iGeom_Instance instance,
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
        int* err );


    void iGeom_isEntAdj( iGeom_Instance instance,
        c_pyBase.iBase_EntityHandle entity_handle1,
        c_pyBase.iBase_EntityHandle entity_handle2,
        int* are_adjacent,
        int* err );


    void iGeom_isArrAdj( iGeom_Instance instance,
        const c_pyBase.iBase_EntityHandle* entity_handles_1,
        int entity_handles_1_size,
        const c_pyBase.iBase_EntityHandle* entity_handles_2,
        int entity_handles_2_size,
        int** is_adjacent_info,
        int* is_adjacent_info_allocated,
        int* is_adjacent_info_size,
        int* err );


    void iGeom_getTopoLevel( iGeom_Instance instance,
        int* topo_level_out,
        int* err );


    void iGeom_getEntClosestPt( iGeom_Instance instance,
               c_pyBase.iBase_EntityHandle entity_handle,
               double near_x, 
               double near_y,
               double near_z,
               double* on_x,
               double* on_y,
               double* on_z,
               int* err );


    void iGeom_getEntClosestPtTrimmed( iGeom_Instance instance,
                    c_pyBase.iBase_EntityHandle entity_handle,
                    double near_x,
                    double near_y,
                    double near_z,
                    double* on_x,
                    double* on_y,
                    double* on_z,
                    int* err );


    void iGeom_getArrClosestPt( iGeom_Instance instance,
               const c_pyBase.iBase_EntityHandle* entity_handles,
               int entity_handles_size,
               int storage_order,
               const double* near_coordinates,
               int near_coordinates_size,
               double** on_coordinates,
               int* on_coordinates_allocated,
               int* on_coordinates_size,
               int* err );


    void iGeom_getEntNrmlXYZ( iGeom_Instance instance,
           c_pyBase.iBase_EntityHandle entity_handle,
           double x,
           double y,
           double z,
           double* nrml_i,
           double* nrml_j,
           double* nrml_k,
           int* err );


    void iGeom_getArrNrmlXYZ( iGeom_Instance instance,
           const c_pyBase.iBase_EntityHandle* entity_handles,
           int entity_handles_size,
           int storage_order,
           const double* coordinates,
           int coordinates_size,
           double** normals,
           int* normals_allocated,
           int* normals_size,
           int* err );


    void iGeom_getEntNrmlPlXYZ( iGeom_Instance instance,
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
               int* err );


    void iGeom_getArrNrmlPlXYZ( iGeom_Instance instance,
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
               int* err );


    void iGeom_getEntTgntXYZ( iGeom_Instance instance,
           c_pyBase.iBase_EntityHandle entity_handle,
           double x,
           double y,
           double z,
           double* tgnt_i,
           double* tgnt_j,
           double* tgnt_k,
           int* err );


    void iGeom_getArrTgntXYZ( iGeom_Instance instance,
           const c_pyBase.iBase_EntityHandle* entity_handles,
           int entity_handles_size,
           int storage_order,
           const double* coordinates,
           int coordinates_size,
           double** tangents,
           int* tangents_allocated,
           int* tangents_size,
           int* err );



    void iGeom_getFcCvtrXYZ( iGeom_Instance instance,
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
        int* err );



    void iGeom_getEgCvtrXYZ( iGeom_Instance instance,
        c_pyBase.iBase_EntityHandle edge_handle,
        double x,
        double y,
        double z,
        double* cvtr_i,
        double* cvtr_j,
        double* cvtr_k,
        int* err );



    void iGeom_getEntArrCvtrXYZ( iGeom_Instance instance,
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
                int* err );



    void iGeom_getEgEvalXYZ( iGeom_Instance instance,
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
        int* err );


    void iGeom_getFcEvalXYZ( iGeom_Instance instance,
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
        int* err );



    void iGeom_getArrEgEvalXYZ( iGeom_Instance instance,
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
               int* err );



    void iGeom_getArrFcEvalXYZ( iGeom_Instance instance,
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
               int* err );



    void iGeom_getEntBoundBox( iGeom_Instance instance,
            c_pyBase.iBase_EntityHandle entity_handle,
            double* min_x,
            double* min_y,
            double* min_z,
            double* max_x,
            double* max_y,
            double* max_z,
            int* err );



    void iGeom_getArrBoundBox( iGeom_Instance instance,
            const c_pyBase.iBase_EntityHandle* entity_handles,
            int entity_handles_size,
            int storage_order,
            double** min_corner,
            int* min_corner_allocated,
            int* min_corner_size,
            double** max_corner,
            int* max_corner_allocated,
            int* max_corner_size,
            int* err );



    void iGeom_getVtxCoord( iGeom_Instance instance,
            c_pyBase.iBase_EntityHandle vertex_handle,
            double* x,
            double* y,
            double* z,
            int* err );



    void iGeom_getVtxArrCoords( iGeom_Instance instance,
               const c_pyBase.iBase_EntityHandle* entity_handles,
               int entity_handles_size,
               int storage_order,
               double** coordinates,
               int* coordinates_allocated,
               int* coordinates_size,
               int* err );



    void iGeom_getPntRayIntsct( iGeom_Instance instance,
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
               int* err );



    void iGeom_getPntArrRayIntsct( iGeom_Instance instance,
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
            int* err );



    void iGeom_getPntClsf( iGeom_Instance instance,
         double x,
         double y,
         double z,
         c_pyBase.iBase_EntityHandle* entity_handle,
         int* err );



    void iGeom_getPntArrClsf( iGeom_Instance instance,
           int storage_order,
           const double* coords,
           int coords_size,
           c_pyBase.iBase_EntityHandle** entity_handles,
           int* entity_handles_allocated,
           int* entity_handles_size,
           int* err );



    void iGeom_getEntNrmlSense( iGeom_Instance instance,
               c_pyBase.iBase_EntityHandle face,
               c_pyBase.iBase_EntityHandle region,
               int* sense_out,
               int* err );



    void iGeom_getArrNrmlSense( iGeom_Instance instance,
               const c_pyBase.iBase_EntityHandle* face_handles,
               int face_handles_size,
               const c_pyBase.iBase_EntityHandle* region_handles,
               int region_handles_size,
               int** sense,
               int* sense_allocated,
               int* sense_size,
               int* err );


    void iGeom_getEgFcSense( iGeom_Instance,
        c_pyBase.iBase_EntityHandle edge,
        c_pyBase.iBase_EntityHandle face,
        int* sense_out,
        int* err );



    void iGeom_getEgFcArrSense( iGeom_Instance instance,
               const c_pyBase.iBase_EntityHandle* edge_handles,
               int edge_handles_size,
               const c_pyBase.iBase_EntityHandle* face_handles,
               int face_handles_size,
               int** sense,
               int* sense_allocated,
               int* sense_size,
               int* err );



    void iGeom_getEgVtxSense( iGeom_Instance instance,
           c_pyBase.iBase_EntityHandle edge,
           c_pyBase.iBase_EntityHandle vertex1,
           c_pyBase.iBase_EntityHandle vertex2,
           int* sense_out,
           int* err );



    void iGeom_getEgVtxArrSense( iGeom_Instance instance,
                const c_pyBase.iBase_EntityHandle* edge_handles,
                int edge_handles_size,
                const c_pyBase.iBase_EntityHandle* vertex_handles_1,
                int veretx_handles_1_size,
                const c_pyBase.iBase_EntityHandle* vertex_handles_2,
                int vertex_handles_2_size,
                int** sense,
                int* sense_allocated,
                int* sense_size,
                int* err );



    void iGeom_measure( iGeom_Instance instance,
            const c_pyBase.iBase_EntityHandle* entity_handles,
            int entity_handles_size,
            double** measures,
            int* measures_allocated,
            int* measures_size,
            int* err );



    void iGeom_getFaceType( iGeom_Instance instance,
            c_pyBase.iBase_EntityHandle face_handle,
            char* face_type,
            int* err,
            int* face_type_length);



    void iGeom_getParametric( iGeom_Instance instance,
           int* is_parametric,
           int* err );



    void iGeom_isEntParametric( iGeom_Instance instance,
               c_pyBase.iBase_EntityHandle entity_handle,
               int* parametric,
               int* err );



    void iGeom_isArrParametric( iGeom_Instance instance,
               const c_pyBase.iBase_EntityHandle* entity_handles,
               int entity_handles_size,
               int** is_parametric,
               int* is_parametric_allocated,
               int* is_parametric_size,
               int* err );



    void iGeom_getEntUVtoXYZ( iGeom_Instance instance,
           c_pyBase.iBase_EntityHandle entity_handle,
           double u,
           double v,
           double* x,
           double* y,
           double* z,
           int* err );



    void iGeom_getArrUVtoXYZ( iGeom_Instance instance,
           const c_pyBase.iBase_EntityHandle* entity_handles,
           int entity_handles_size,
           int storage_order,
           const double* uv,
           int uv_size,
           double** coordinates,
           int* coordinates_allocated,
           int* coordinates_size,
           int* err );



    void iGeom_getEntUtoXYZ( iGeom_Instance instance,
        c_pyBase.iBase_EntityHandle entity_handle,
        double u,
        double* x, 
        double* y,
        double* z,
        int* err );



    void iGeom_getArrUtoXYZ( iGeom_Instance instance,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        const double* u,
        int u_size,
        int storage_order,
        double** on_coords,
        int* on_coords_allocated,
        int* on_coords_size,
        int* err );


    void iGeom_getEntXYZtoUV( iGeom_Instance instance,
           c_pyBase.iBase_EntityHandle entity_handle,
           double x,
           double y,
           double z,
           double* u,
           double* v, 
           int* err );



    void iGeom_getEntXYZtoU( iGeom_Instance instance,
        c_pyBase.iBase_EntityHandle entity_handle,
        double x,
        double y,
        double z,
        double* u,
        int* err );



    void iGeom_getArrXYZtoUV( iGeom_Instance instance,
           const c_pyBase.iBase_EntityHandle* entity_handles,
           int entity_handles_size,
           int storage_order,
           const double* coordinates,
           int coordinates_size,
           double** uv,
           int* uv_allocated,
           int* uv_size,
           int* err );



    void iGeom_getArrXYZtoU( iGeom_Instance instance,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        int storage_order,
        const double* coordinates,
        int coordinates_size,
        double** u,
        int* u_allocated,
        int* u_size,
        int* err );



    void iGeom_getEntXYZtoUVHint( iGeom_Instance instance,
           c_pyBase.iBase_EntityHandle entity_handle,
           double x,
           double y,
           double z,
           double* u,
           double* v,
           int* err );



    void iGeom_getArrXYZtoUVHint( iGeom_Instance instance,
           const c_pyBase.iBase_EntityHandle* entity_handles,
           int entity_handles_size,
           int storage_order,
           const double* coords,
           int coords_size,
           double** uv,
           int* uv_allocated,
           int* uv_size,
           int* err );



    void iGeom_getEntUVRange( iGeom_Instance instance,
           c_pyBase.iBase_EntityHandle entity_handle,
           double* u_min,
           double* v_min,
           double* u_max,
           double* v_max,
           int* err );



    void iGeom_getEntURange( iGeom_Instance instance,
        c_pyBase.iBase_EntityHandle entity_handle,
        double* u_min,
        double* u_max,
        int* err );



    void iGeom_getArrUVRange( iGeom_Instance instance,
           const c_pyBase.iBase_EntityHandle* entity_handles,
           int entity_handles_size,
           int storage_order,
           double** uv_min,
           int* uv_min_allocated,
           int* uv_min_size,
           double** uv_max,
           int* uv_max_allocated,
           int* uv_max_size,
           int* err );


    void iGeom_getArrURange( iGeom_Instance instance,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        double** u_min,
        int* u_min_allocated,
        int* u_min_size,
        double** u_max,
        int* u_max_allocated,
        int* u_max_size,
        int* err );



    void iGeom_getEntUtoUV( iGeom_Instance instance,
            c_pyBase.iBase_EntityHandle edge_handle,
            c_pyBase.iBase_EntityHandle face_handle,
            double in_u,
            double* u,
            double* v,
            int* err );



    void iGeom_getVtxToUV( iGeom_Instance instance,
         c_pyBase.iBase_EntityHandle vertex_handle,
         c_pyBase.iBase_EntityHandle face_handle,
         double* u,
         double* v,
         int* err );



    void iGeom_getVtxToU( iGeom_Instance instance,
        c_pyBase.iBase_EntityHandle vertex_handle,
        c_pyBase.iBase_EntityHandle edge_handle,
        double* u,
        int* err );



    void iGeom_getArrUtoUV( iGeom_Instance instance,
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
            int* err );



    void iGeom_getVtxArrToUV( iGeom_Instance instance,
           const c_pyBase.iBase_EntityHandle* vertex_handles,
           int vertex_handles_size,
           const c_pyBase.iBase_EntityHandle* face_handles,
           int face_handles_size,
           int storage_order,
           double** uv,
           int* uv_allocated,
           int* uv_size,
           int* err );



    void iGeom_getVtxArrToU( iGeom_Instance instance,
        const c_pyBase.iBase_EntityHandle* vertex_handles,
        int vertex_handles_size,
        const c_pyBase.iBase_EntityHandle* edge_handles,
        int edge_handles_size,
        double** u,
        int* u_allocated,
        int* u_size,
        int* err );


    void iGeom_getEntNrmlUV( iGeom_Instance instance,
        c_pyBase.iBase_EntityHandle entity_handle,
        double u,
        double v,
        double* nrml_i,
        double* nrml_j,
        double* nrml_k,
        int* err );



    void iGeom_getArrNrmlUV( iGeom_Instance instance,
        const c_pyBase.iBase_EntityHandle* face_handles,
        int face_handles_size,
        int storage_order,
        const double* parameters,
        int parameters_size,
        double** normals,
        int* normals_allocated,
        int* normals_size,
        int* err );


    void iGeom_getEntTgntU( iGeom_Instance instance,
            c_pyBase.iBase_EntityHandle entity_handle,
            double u,
            double* tgnt_i,
            double* tgnt_j,
            double* tgnt_k,
            int* err );


    void iGeom_getArrTgntU( iGeom_Instance instance,
            const c_pyBase.iBase_EntityHandle* edge_handles,
            int edge_handles_size,
            int storage_order,
            const double* parameters,
            int parameters_size,
            double** tangents,
            int* tangents_allocated,
            int* tangents_size,
            int* err );


    void iGeom_getEnt1stDrvt( iGeom_Instance instance,
           c_pyBase.iBase_EntityHandle entity_handle,
           double u,
           double v,
           double** drvt_u,
           int* drvt_u_allocated,
           int* drvt_u_size,
           double** drvt_v,
           int* dvrt_v_allocated,
           int* dvrt_v_size,
           int* err );



    void iGeom_getArr1stDrvt( iGeom_Instance instance,
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
           int* err );



    void iGeom_getEnt2ndDrvt( iGeom_Instance instance,
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
           int* err );



    void iGeom_getArr2ndDrvt( iGeom_Instance instance,
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
           int* err );



    void iGeom_getFcCvtrUV( iGeom_Instance instance,
            c_pyBase.iBase_EntityHandle face_handle,
            double u,
            double v,
            double* cvtr1_i,
            double* cvtr1_j,
            double* cvtr1_k,
            double* cvtr2_i,
            double* cvtr2_j,
            double* cvtr2_k,
            int* err );



    void iGeom_getFcArrCvtrUV( iGeom_Instance instance,
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
            int* err );



    void iGeom_isEntPeriodic( iGeom_Instance instance,
           c_pyBase.iBase_EntityHandle entity_handle,
           int* in_u,
           int* in_v,
           int* err );



    void iGeom_isArrPeriodic( iGeom_Instance instance,
           const c_pyBase.iBase_EntityHandle* entity_handles,
           int entity_handles_size,
           int** in_uv,
           int* in_uv_allocated,
           int* in_uv_size,
           int* err );



    void iGeom_isFcDegenerate( iGeom_Instance instance,
            c_pyBase.iBase_EntityHandle face_handle,
            int* is_degenerate,
            int* err );



    void iGeom_isFcArrDegenerate( iGeom_Instance instance,
           const c_pyBase.iBase_EntityHandle* face_handles,
           int face_handles_size,
           int** degenerate,
           int* degenerate_allocated,
           int* degenerate_size,
           int* err );



    void iGeom_getTolerance( iGeom_Instance instance,
        int* type,
        double* tolerance,
        int* err );



    void iGeom_getEntTolerance( iGeom_Instance instance,
               c_pyBase.iBase_EntityHandle entity_handle,
               double* tolerance,
               int* err );



    void iGeom_getArrTolerance( iGeom_Instance instance,
               const c_pyBase.iBase_EntityHandle* entity_handles,
               int entity_handles_size,
               double** tolerances,
               int* tolerances_allocated,
               int* tolerances_size,
               int* err );



    void iGeom_initEntIter( iGeom_Instance instance,
            c_pyBase.iBase_EntitySetHandle entity_set_handle,
            int requested_entity_type,
            c_pyBase.iBase_EntityIterator* entity_iterator,
            int* err );



    void iGeom_initEntArrIter( iGeom_Instance instance,
            c_pyBase.iBase_EntitySetHandle entity_set_handle,
            int requested_entity_type,
            int requested_array_size,
            c_pyBase.iBase_EntityArrIterator* entArr_iterator,
            int* err );


    void iGeom_getNextEntIter( iGeom_Instance instance,
            c_pyBase.iBase_EntityIterator entity_iterator,
            c_pyBase.iBase_EntityHandle* entity_handle,
            int* has_data,
            int* err );



    void iGeom_getNextEntArrIter( iGeom_Instance instance,
           c_pyBase.iBase_EntityArrIterator entArr_iterator,
           c_pyBase.iBase_EntityHandle** entity_handles,
           int* entity_handles_allocated,
           int* entity_handles_size,
           int* has_data,
           int* err );



    void iGeom_resetEntIter( iGeom_Instance instance,
        c_pyBase.iBase_EntityIterator entity_iterator,
        int* err );



    void iGeom_resetEntArrIter( iGeom_Instance instance,
               c_pyBase.iBase_EntityArrIterator entArr_iterator,
               int* err );


    void iGeom_endEntIter( iGeom_Instance instance,
         c_pyBase.iBase_EntityIterator entity_iterator,
         int* err );



    void iGeom_endEntArrIter( iGeom_Instance instance,
           c_pyBase.iBase_EntityArrIterator entArr_iterator,
           int* err );



    void iGeom_copyEnt( iGeom_Instance instance,
            c_pyBase.iBase_EntityHandle source,
            c_pyBase.iBase_EntityHandle* copy,
            int* err );


    void iGeom_sweepEntAboutAxis( iGeom_Instance instance,
           c_pyBase.iBase_EntityHandle geom_entity,
           double angle,
           double axis_x,
           double axis_y,
           double axis_z,
           c_pyBase.iBase_EntityHandle* geom_entity2,
           int* err );


    void iGeom_deleteAll( iGeom_Instance instance,
        int* err );


    void iGeom_deleteEnt( iGeom_Instance instance,
        c_pyBase.iBase_EntityHandle entity_handle,
        int* err );


    void iGeom_createSphere( iGeom_Instance instance,
        double radius,
        c_pyBase.iBase_EntityHandle* geom_entity,
        int* err );


    void iGeom_createPrism( iGeom_Instance instance,
            double height,
            int n_sides,
            double major_rad,
            double minor_rad,
            c_pyBase.iBase_EntityHandle* geom_entity,
            int* err );


    void iGeom_createBrick( iGeom_Instance instance,
            double x,
            double y,
            double z,
            c_pyBase.iBase_EntityHandle* geom_entity,
            int* err );


    void iGeom_createCylinder( iGeom_Instance instance,
            double height,
            double major_rad,
            double minor_rad,
            c_pyBase.iBase_EntityHandle* geom_entity,
            int* err );


    void iGeom_createCone( iGeom_Instance instance,
         double height,
         double major_rad_base,
         double minor_rad_base,
         double rad_top,
         c_pyBase.iBase_EntityHandle* geom_entity,
         int* err );


    void iGeom_createTorus( iGeom_Instance instance,
            double major_rad,
            double minor_rad,
            c_pyBase.iBase_EntityHandle* geom_entity,
            int* err );


    void iGeom_moveEnt( iGeom_Instance instance,
            c_pyBase.iBase_EntityHandle geom_entity,
            double x,
            double y,
            double z,
            int* err );


    void iGeom_rotateEnt( iGeom_Instance instance,
        c_pyBase.iBase_EntityHandle geom_entity,
        double angle,
        double axis_x,
        double axis_y,
        double axis_z,
        int* err );


    void iGeom_reflectEnt( iGeom_Instance instance,
        c_pyBase.iBase_EntityHandle geom_entity,
        double point_x,
        double point_y,
        double point_z,
        double plane_normal_x,
        double plane_normal_y,
        double plane_normal_z,
        int* err );


    void iGeom_scaleEnt( iGeom_Instance instance,
        c_pyBase.iBase_EntityHandle geom_entity,
        double point_x,
        double point_y,
        double point_z,
        double scale_x,
        double scale_y,
        double scale_z,
        int* err );


    void iGeom_uniteEnts( iGeom_Instance instace,
        const c_pyBase.iBase_EntityHandle* geom_entities,
        int geom_entities_size,
        c_pyBase.iBase_EntityHandle* geom_entity,
        int* err );


    void iGeom_subtractEnts( iGeom_Instance instance,
        c_pyBase.iBase_EntityHandle blank,
        c_pyBase.iBase_EntityHandle tool,
        c_pyBase.iBase_EntityHandle* geom_entity,
        int* err );


    void iGeom_intersectEnts( iGeom_Instance instance,
           c_pyBase.iBase_EntityHandle entity2,
           c_pyBase.iBase_EntityHandle entity1,
           c_pyBase.iBase_EntityHandle* geom_entity,
           int* err );


    void iGeom_sectionEnt( iGeom_Instance instance,
         c_pyBase.iBase_EntityHandle geom_entity,
         double plane_normal_x,
         double plane_normal_y,
         double plane_normal_z,
         double offset,
         int reverse,
         c_pyBase.iBase_EntityHandle* geom_entity2,
         int* err );


    void iGeom_imprintEnts( iGeom_Instance instance,
            const c_pyBase.iBase_EntityHandle* geom_entities,
            int geom_entities_size,
            int* err );


    void iGeom_mergeEnts( iGeom_Instance instance,
        const c_pyBase.iBase_EntityHandle* geom_entities,
        int geom_entities_size,
        double tolerance,
        int* err );


    void iGeom_createEntSet( iGeom_Instance instance,
        int isList,
        c_pyBase.iBase_EntitySetHandle* entity_set_created, 
        int *err );


    void iGeom_destroyEntSet( iGeom_Instance instance,
           c_pyBase.iBase_EntitySetHandle entity_set, 
           int *err );


    void iGeom_isList( iGeom_Instance instance,
         c_pyBase.iBase_EntitySetHandle entity_set,
         int *is_list, 
         int *err );


    void iGeom_getNumEntSets( iGeom_Instance instance,
           c_pyBase.iBase_EntitySetHandle entity_set_handle,
           int num_hops,
           int *num_sets, 
           int *err );


    void iGeom_getEntSets( iGeom_Instance instance,
         c_pyBase.iBase_EntitySetHandle entity_set_handle,
         int num_hops,
         c_pyBase.iBase_EntitySetHandle** contained_set_handles,
         int* contained_set_handles_allocated,
         int* contained_set_handles_size, 
         int *err );


    void iGeom_addEntToSet( iGeom_Instance instance,
            c_pyBase.iBase_EntityHandle entity_handle,
            c_pyBase.iBase_EntitySetHandle entity_set, 
            int *err );



    void iGeom_rmvEntFromSet( iGeom_Instance instance,
           c_pyBase.iBase_EntityHandle entity_handle,
           c_pyBase.iBase_EntitySetHandle entity_set, 
           int *err );



    void iGeom_addEntArrToSet( iGeom_Instance instance,
            const c_pyBase.iBase_EntityHandle* entity_handles,
            int entity_handles_size,
            c_pyBase.iBase_EntitySetHandle entity_set, 
            int *err );


    void iGeom_rmvEntArrFromSet( iGeom_Instance instance,
                const c_pyBase.iBase_EntityHandle* entity_handles,
                int entity_handles_size,
                c_pyBase.iBase_EntitySetHandle entity_set,
                int *err );


    void iGeom_addEntSet( iGeom_Instance instance,
        c_pyBase.iBase_EntitySetHandle entity_set_to_add,
        c_pyBase.iBase_EntitySetHandle entity_set_handle, 
        int *err);


    void iGeom_rmvEntSet( iGeom_Instance instance,
        c_pyBase.iBase_EntitySetHandle entity_set_to_remove,
        c_pyBase.iBase_EntitySetHandle entity_set_handle, 
        int *err );


    void iGeom_isEntContained( iGeom_Instance instance,
            c_pyBase.iBase_EntitySetHandle containing_entity_set,
            c_pyBase.iBase_EntityHandle contained_entity,
            int *is_contained, 
            int *err );


    void iGeom_isEntArrContained( iGeom_Instance instance,
           c_pyBase.iBase_EntitySetHandle containing_set,
           const c_pyBase.iBase_EntityHandle* entity_handles,
           int num_entity_handles,
           int** is_contained,
           int* is_contained_allocated,
           int* is_contained_size,
           int* err );


    void iGeom_isEntSetContained( iGeom_Instance instance,
           c_pyBase.iBase_EntitySetHandle containing_entity_set,
           c_pyBase.iBase_EntitySetHandle contained_entity_set,
           int *is_contained, 
           int *err );


    void iGeom_addPrntChld( iGeom_Instance instance,
            c_pyBase.iBase_EntitySetHandle parent_entity_set,
            c_pyBase.iBase_EntitySetHandle child_entity_set, 
            int *err );


    void iGeom_rmvPrntChld( iGeom_Instance instance,
            c_pyBase.iBase_EntitySetHandle parent_entity_set,
            c_pyBase.iBase_EntitySetHandle child_entity_set, 
            int *err );


    void iGeom_isChildOf( iGeom_Instance instance,
        c_pyBase.iBase_EntitySetHandle parent_entity_set,
        c_pyBase.iBase_EntitySetHandle child_entity_set,
        int *is_child, 
        int *err );


    void iGeom_getNumChld( iGeom_Instance instance,
         c_pyBase.iBase_EntitySetHandle entity_set,
         int num_hops,
         int *num_child, 
         int *err );


    void iGeom_getNumPrnt( iGeom_Instance instance,
         c_pyBase.iBase_EntitySetHandle entity_set,
         int num_hops,
         int *num_parent, 
         int *err );


    void iGeom_getChldn( iGeom_Instance instance,
        c_pyBase.iBase_EntitySetHandle from_entity_set,
        int num_hops,
        c_pyBase.iBase_EntitySetHandle** entity_set_handles,
        int* entity_set_handles_allocated,
        int* entity_set_handles_size, 
        int *err );


    void iGeom_getPrnts( iGeom_Instance instance,
        c_pyBase.iBase_EntitySetHandle from_entity_set,
        int num_hops,
        c_pyBase.iBase_EntitySetHandle** entity_set_handles,
        int* entity_set_handles_allocated,
        int* entity_set_handles_size, 
        int *err );


    void iGeom_createTag( iGeom_Instance instance,
        const char* tag_name,
        int tag_size,
        int tag_type,
        c_pyBase.iBase_TagHandle* tag_handle, 
        int *err,
        int tag_name_len );



    void iGeom_destroyTag( iGeom_Instance instance,
         c_pyBase.iBase_TagHandle tag_handle,
         int forced, 
         int *err);


    void iGeom_getTagName( iGeom_Instance instance,
         c_pyBase.iBase_TagHandle tag_handle,
         char *name, 
         int* err,
         int name_len );


    void iGeom_getTagSizeValues( iGeom_Instance instance,
                c_pyBase.iBase_TagHandle tag_handle,
                int *tag_size, 
                int *err );


    void iGeom_getTagSizeBytes( iGeom_Instance instance,
               c_pyBase.iBase_TagHandle tag_handle,
               int *tag_size, 
               int *err );


    void iGeom_getTagHandle( iGeom_Instance instance,
        const char* tag_name,
        c_pyBase.iBase_TagHandle *tag_handle, 
        int *err,
        int tag_name_len );


    void iGeom_getTagType( iGeom_Instance instance,
         c_pyBase.iBase_TagHandle tag_handle,
         int *tag_type, 
         int *err );


    void iGeom_setEntSetData( iGeom_Instance instance,
           c_pyBase.iBase_EntitySetHandle entity_set_handle,
           const c_pyBase.iBase_TagHandle tag_handle,
           const void* tag_value,
           const int tag_value_size,
           int *err );

    void iGeom_setEntSetIntData( iGeom_Instance instance,
                c_pyBase.iBase_EntitySetHandle entity_set,
                c_pyBase.iBase_TagHandle tag_handle,
                int tag_value, 
                int *err );


    void iGeom_setEntSetDblData( iGeom_Instance instance,
                c_pyBase.iBase_EntitySetHandle entity_set,
                c_pyBase.iBase_TagHandle tag_handle,
                double tag_value, 
                int *err );


    void iGeom_setEntSetEHData( iGeom_Instance instance,
               c_pyBase.iBase_EntitySetHandle entity_set,
               c_pyBase.iBase_TagHandle tag_handle,
               c_pyBase.iBase_EntityHandle tag_value, 
               int *err );


    void iGeom_setEntSetESHData( iGeom_Instance instance,
                c_pyBase.iBase_EntitySetHandle entity_set,
                c_pyBase.iBase_TagHandle tag_handle,
                c_pyBase.iBase_EntitySetHandle tag_value, 
                int *err );


    void iGeom_getEntSetData( iGeom_Instance instance,
           c_pyBase.iBase_EntitySetHandle entity_set_handle,
           c_pyBase.iBase_TagHandle tag_handle,
           void** tag_value,
           int* tag_value_allocated,
           int* tag_value_size, 
           int *err );


    void iGeom_getEntSetIntData( iGeom_Instance instance,
                c_pyBase.iBase_EntitySetHandle entity_set,
                c_pyBase.iBase_TagHandle tag_handle,
                int *out_data, 
                int *err );



    void iGeom_getEntSetDblData( iGeom_Instance instance,
                c_pyBase.iBase_EntitySetHandle entity_set,
                c_pyBase.iBase_TagHandle tag_handle,
                double *out_data, 
                int *err );

 

    void iGeom_getEntSetEHData( iGeom_Instance instance,
               c_pyBase.iBase_EntitySetHandle entity_set,
               c_pyBase.iBase_TagHandle tag_handle,
               c_pyBase.iBase_EntityHandle *out_data, 
               int *err );



    void iGeom_getEntSetESHData( iGeom_Instance instance,
               c_pyBase.iBase_EntitySetHandle entity_set,
               c_pyBase.iBase_TagHandle tag_handle,
               c_pyBase.iBase_EntitySetHandle *out_data, 
               int *err );



    void iGeom_getAllEntSetTags( iGeom_Instance instance,
                c_pyBase.iBase_EntitySetHandle entity_set_handle,
                c_pyBase.iBase_TagHandle** tag_handles,
                int* tag_handles_allocated,
                int* tag_handles_size, 
                int *err );



    void iGeom_rmvEntSetTag( iGeom_Instance instance,
        c_pyBase.iBase_EntitySetHandle entity_set_handle,
        c_pyBase.iBase_TagHandle tag_handle, 
        int *err );



    void iGeom_getArrData( iGeom_Instance instance,
         const c_pyBase.iBase_EntityHandle* entity_handles,
         int entity_handles_size,
         c_pyBase.iBase_TagHandle tag_handle,
         void** tag_values,
         int* tag_values_allocated,
         int* tag_values_size, 
         int *err );



    void iGeom_getIntArrData( iGeom_Instance instance,
           const c_pyBase.iBase_EntityHandle* entity_handles,
           int entity_handles_size,
           c_pyBase.iBase_TagHandle tag_handle,
           int** tag_values,
           int* tag_values_allocated,
           int* tag_values_size, 
           int *err );

 

    void iGeom_getDblArrData( iGeom_Instance instance,
           const c_pyBase.iBase_EntityHandle* entity_handles,
           int entity_handles_size,
           c_pyBase.iBase_TagHandle tag_handle,
           double** tag_values,
           int* tag_values_allocated,
           int* tag_values_size, 
           int *err );



    void iGeom_getEHArrData( iGeom_Instance instance,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        c_pyBase.iBase_TagHandle tag_handle,
        c_pyBase.iBase_EntityHandle** tag_value,
        int* tag_value_allocated,
        int* tag_value_size, 
        int *err );



    void iGeom_getESHArrData( iGeom_Instance instance,
           const c_pyBase.iBase_EntityHandle* entity_handles,
           int entity_handles_size,
           c_pyBase.iBase_TagHandle tag_handle,
           c_pyBase.iBase_EntitySetHandle** tag_value,
           int* tag_value_allocated,
           int* tag_value_size, 
           int *err );




    void iGeom_setArrData( iGeom_Instance instance,
         const c_pyBase.iBase_EntityHandle* entity_handles,
         int entity_handles_size,
         c_pyBase.iBase_TagHandle tag_handle,
         const void* tag_values,
         int tag_values_size, 
         int *err );



    void iGeom_setIntArrData( iGeom_Instance instance,
           const c_pyBase.iBase_EntityHandle* entity_handles,
           int entity_handles_size,
           c_pyBase.iBase_TagHandle tag_handle,
           const int* tag_values,
           int tag_values_size, 
           int *err );


    void iGeom_setDblArrData( iGeom_Instance instance,
           const c_pyBase.iBase_EntityHandle* entity_handles,
           int entity_handles_size,
           c_pyBase.iBase_TagHandle tag_handle,
           const double* tag_values,
           const int tag_values_size, 
           int *err );


    void iGeom_setEHArrData( iGeom_Instance instance,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        c_pyBase.iBase_TagHandle tag_handle,
        const c_pyBase.iBase_EntityHandle* tag_values,
        int tag_values_size, 
        int *err );

    void iGeom_setESHArrData( iGeom_Instance instance,
           const c_pyBase.iBase_EntityHandle* entity_handles,
           int entity_handles_size,
           c_pyBase.iBase_TagHandle tag_handle,
           const c_pyBase.iBase_EntitySetHandle* tag_values,
           int tag_values_size, 
           int *err );

    void iGeom_rmvArrTag( iGeom_Instance instance,
        const c_pyBase.iBase_EntityHandle* entity_handles,
        int entity_handles_size,
        c_pyBase.iBase_TagHandle tag_handle, 
        int *err );


    void iGeom_getData( iGeom_Instance instance,
            c_pyBase.iBase_EntityHandle entity_handle,
            c_pyBase.iBase_TagHandle tag_handle,
            void** tag_value,
            int *tag_value_allocated,
            int *tag_value_size, 
            int *err );


    void iGeom_getIntData( iGeom_Instance instance,
         c_pyBase.iBase_EntityHandle entity_handle,
         c_pyBase.iBase_TagHandle tag_handle,
         int *out_data, 
         int *err );


    void iGeom_getDblData( iGeom_Instance instance,
         const c_pyBase.iBase_EntityHandle entity_handle,
         const c_pyBase.iBase_TagHandle tag_handle,
         double *out_data,
         int *err );


    void iGeom_getEHData( iGeom_Instance instance,
        c_pyBase.iBase_EntityHandle entity_handle,
        c_pyBase.iBase_TagHandle tag_handle,
        c_pyBase.iBase_EntityHandle *out_data, 
        int *err );


    void iGeom_getESHData( iGeom_Instance instance,
         c_pyBase.iBase_EntityHandle entity_handle,
         c_pyBase.iBase_TagHandle tag_handle,
         c_pyBase.iBase_EntitySetHandle *out_data, 
         int *err );


    void iGeom_setData( iGeom_Instance instance,
            c_pyBase.iBase_EntityHandle entity_handle,
            c_pyBase.iBase_TagHandle tag_handle,
            const void* tag_value,
            int tag_value_size, 
            int *err );

 
    void iGeom_setIntData( iGeom_Instance instance,
         c_pyBase.iBase_EntityHandle entity_handle,
         c_pyBase.iBase_TagHandle tag_handle,
         int tag_value, 
         int *err );


    void iGeom_setDblData( iGeom_Instance instance,
         c_pyBase.iBase_EntityHandle entity_handle,
         c_pyBase.iBase_TagHandle tag_handle,
         double tag_value, 
         int *err );


    void iGeom_setEHData( iGeom_Instance instance,
        c_pyBase.iBase_EntityHandle entity_handle,
        c_pyBase.iBase_TagHandle tag_handle,
        c_pyBase.iBase_EntityHandle tag_value, 
        int *err );


    void iGeom_setESHData( iGeom_Instance instance,
         c_pyBase.iBase_EntityHandle entity_handle,
         c_pyBase.iBase_TagHandle tag_handle,
         c_pyBase.iBase_EntitySetHandle tag_value, 
         int *err );


    void iGeom_getAllTags( iGeom_Instance instance,
         c_pyBase.iBase_EntityHandle entity_handle,
         c_pyBase.iBase_TagHandle** tag_handles,
         int* tag_handles_allocated,
         int* tag_handles_size, 
         int *err );


    void iGeom_rmvTag( iGeom_Instance instance,
         c_pyBase.iBase_EntityHandle entity_handle,
         c_pyBase.iBase_TagHandle tag_handle, 
         int *err );


    void iGeom_subtract( iGeom_Instance instance,
        c_pyBase.iBase_EntitySetHandle entity_set_1,
        c_pyBase.iBase_EntitySetHandle entity_set_2,
        c_pyBase.iBase_EntitySetHandle* result_entity_set, 
        int *err );



    void iGeom_intersect( iGeom_Instance instance,
        c_pyBase.iBase_EntitySetHandle entity_set_1,
        c_pyBase.iBase_EntitySetHandle entity_set_2,
        c_pyBase.iBase_EntitySetHandle* result_entity_set, 
        int *err );



    void iGeom_unite( iGeom_Instance instance,
        c_pyBase.iBase_EntitySetHandle entity_set_1,
        c_pyBase.iBase_EntitySetHandle entity_set_2,
        c_pyBase.iBase_EntitySetHandle* result_entity_set, 
        int *err );



    void iGeom_getFacets(iGeom_Instance instance,
        c_pyBase.iBase_EntityHandle entity,
        double dist_tolerance,
        double **points, int *points_allocated, int *points_size,
        int **facets, int *facets_allocated, int *facets_size,
        int *err);

