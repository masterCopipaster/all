#include "visualise_system.h"

#define N 200

int main()
{
    universe* un = make_new_universe(N + 1, 0);
    un -> do_common = 0;
    un -> do_len_joh = 1;
    un -> ln_j_k = 10;

    double radius = N*0.4/6.28;
    srand(clock());
    for(int i = 1; i <= N; i++)
    {
        un -> points[i] = new_point();
        un -> points[i] -> radius = 0.2;
        un -> points[i] -> mass = 1;
        un -> points[i] -> charge = 0;
        un -> points[i] -> rad_vect = new_vector(radius * cos( (double) i * 6.28 / N), radius * sin( (double) i * 6.28 / N), 0, TYPE_RAD);
        un -> points[i] -> vel_vect = new_vector(0, 0, 0, TYPE_VEL);
        //un -> points[i] -> vel_vect = new_vector((double)(rand() - 16200)/1000, (double)(rand() - 16200)/1000, 0, TYPE_VEL);
    }

    un -> points[0] = new_point();
    //un -> points[0] -> type = SOL;
    un -> points[0] -> radius = radius * 0.5;
    un -> points[0] -> mass = 3;
    un -> points[0] -> charge = 0;
    un -> points[0] -> rad_vect = new_vector(0, 0, 0, TYPE_RAD);
    un -> points[0] -> vel_vect = new_vector(0, 0, 0, TYPE_VEL);



    _txWindowStyle &= ~WS_CAPTION; // FullScreen: ���� ��� ���������, �������� � �����
    txCreateWindow (GetSystemMetrics (SM_CXSCREEN), GetSystemMetrics (SM_CYSCREEN));

    //txCreateWindow(1300, 650);
    //printf("%lg\n", txQueryPerformance());

    txSetColor(TX_GREEN, 2);
    txSetFillColor(TX_BLACK);
    txSelectFont ("Courier New", 20);


    double dt = 0.001;
    calc_group_energy(un);
    double energy0 = un -> mec_energy;
    char timestr[100];
    vid_sys_info conf = apply_autoscale(un);//set_video_conf(400, 300, 10);
    double time = 0, pretime = 0, autoscale_time = 0;

    while(time <= 20000)
    {
        time = cur_time();
        //printf("no error\n");
        calc_group_interactions(un);
        //printf("no error\n");
        make_timestep(un, dt);

        if(time - autoscale_time > 5)
        {
            //conf = apply_autoscale(un);

            autoscale_time = time;
            //printf("autoscale\n");
        }

        if(time - pretime > 0.05)
        {
            txBegin();
            redraw_universe(un, conf);
            calc_group_energy(un);
            sprintf(timestr, "����� � �������: %f ������, � ����� %f, ����� ������� %f\n", un -> time, time, un -> mec_energy);
            txSetColor(TX_ORANGE, 1);
            txTextOut(0, 0, (const char*) timestr);
            txEnd();
            txSleep(0.5);
            pretime = time;
        }
    }
    return 0;
}
