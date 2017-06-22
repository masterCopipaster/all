#include "ph_point.h"

int main()
{
    /*ph_point point;

    point. mass = 1;
    point. charge = 0;
    point. radius = 10;
    point. vel_vect = new_vector(1, 0, 0, TYPE_VEL);
    point. rad_vect = new_vector(0, 0, 0, TYPE_RAD);
    point. force_vect = new_vector(-1, 1, 0, TYPE_FORCE);

    /*printf("%lg\n", point.mass);
    printf("%s\n", str_output(point. rad_vect));
    printf("%s\n", str_output(point. vel_vect));

    calc_movement(&point, 1);
    printf("%s\n", str_output(point. rad_vect));
    printf("%s\n", str_output(point. vel_vect));
    */


    ph_point* point = new_point();
    point -> mass = 100;
    point -> radius = 1;
    point -> charge = 1;

    point -> rad_vect = new_vector(0, 0, 0, TYPE_RAD);
    point -> vel_vect = new_vector(1, 0, 0, TYPE_VEL);
    point -> force_vect = new_vector(-1, 1, 0, TYPE_FORCE);





    for(long long  i = 0; i < 100000000; i++)
    {
        calc_movement(point, 0.001);

        //printf("%s\n", point_str_printout(point));
    }

    printf("%s\n", point_str_printout(point));


    return 0;
}
