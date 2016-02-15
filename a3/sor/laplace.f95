PROGRAM LAPLACE
    INTEGER, PARAMETER :: XSIZE=41,YSIZE=41
    REAL(8), DIMENSION(1:XSIZE,1:YSIZE) :: PHIOLD,PHINEW,ORIPHI,ERROR
    REAL :: MAXDELTA
    REAL(8) :: ERRORSUM,PHISTAR,NSQ=XSIZE*YSIZE
    REAL :: OMEGA

    REAL(8), PARAMETER :: CONVERGENCE = EPSILON(ERRORSUM)
    INTEGER :: ITERATIONS = 0

    INTEGER :: I,J

    DO I=1,XSIZE
        DO J=1,YSIZE
            PHINEW(I,J) = (I*I-J*J)/(NSQ)
        END DO
    END DO
    
    PHINEW(2:XSIZE-1,2:YSIZE-1)=0

    ORIPHI(1:XSIZE,1:YSIZE) = PHINEW(1:XSIZE,1:YSIZE)

    open(10,file='sor_41.csv')

    OMEGA = 0.0

    HUNT_OMEGA:DO
        OMEGA = OMEGA+0.1
        ITERATIONS = 0
        PHINEW(1:XSIZE,1:YSIZE) = ORIPHI(1:XSIZE,1:YSIZE)
        GAUSS_ITERATION: DO
            ITERATIONS = ITERATIONS+1
            PHIOLD=PHINEW

            DO I=2,XSIZE-1
                DO J=2,YSIZE-1
                    PHINEW(I,J)=(0.25*(&
                        &PHINEW(I-1,J)+&
                        &PHINEW(I+1,J)+&
                        &PHINEW(I,J-1)+&
                        &PHINEW(I,J+1))-PHINEW(I,J))*OMEGA+&
                        &PHINEW(I,J)
                END DO
            END DO
            ERROR = PHIOLD-PHINEW
            ERRORSUM = SQRT(SUM(ERROR*ERROR)/NSQ)
            if (ITERATIONS>=100) EXIT GAUSS_ITERATION
         END DO GAUSS_ITERATION

         write(10,*) OMEGA, ERRORSUM 
         if (OMEGA >= 1.0) EXIT HUNT_OMEGA
    END DO HUNT_OMEGA
   
    close(10)
END PROGRAM LAPLACE
