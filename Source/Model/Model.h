#ifndef MODEL_H
#define MODEL_H

#include "../OpenGL/Glew/glew.h"

//The reason the data is seperate is so that when the loader returns the
//model data, it doesn't have to it as a heap allocated object pointer.
//It would have to do that as the copying of data would infact invoke the
//destructor of the Model class, thus deleting the model.
struct Model_Data
{
    Model_Data () = default;
    Model_Data (    GLuint vao,
                    GLuint vertexPosId,
                    GLuint uvCoordsId,
                    size_t vertexCount );

    GLuint vao          = 0;
    GLuint vertexPosId  = 0;
    GLuint uvCoordsId   = 0;

    size_t vertexCount  = 0;
};

class Model
{
    public:
        Model   () = default;
        Model   ( const Model_Data& data );

        void addData ( const Model_Data& data );

        void bind   () const;
        void unbind () const;


        GLuint getVertexCount   () const;

        ~Model  ();

    private:
        void deleteData ();

        Model_Data m_glData;
};

#endif //MODEL_H
