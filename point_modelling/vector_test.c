#include <stdio.h>

#include "ph_vector.h"

int main()
{
    ph_vector vect1 = new_vector(228, 1488, 0.5, TYPE_FORCE);
    ph_vector vect2 = new_vector(228, 1488, 0.5, TYPE_FORCE);
    printf("%s\n", str_output(vector_add(vect1, vect2)));
    return 0;
}
