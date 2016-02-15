PROGRAM LAPLACE
    INTEGER, PARAMETER :: XSIZE=11,YSIZE=11
    REAL(8), DIMENSION(1:XSIZE,1:YSIZE) :: PHIOLD,PHINEW,ERROR
    REAL :: MAXDELTA
    REAL(8) :: ERRORSUM,NSQ=XSIZE*YSIZE

    REAL(8), PARAMETER :: CONVERGENCE = EPSILON(ERRORSUM)
    INTEGER :: ITERATIONS = 0

    INTEGER :: I,J

    DO I=1,XSIZE
        DO J=1,YSIZE
            PHINEW(I,J) = (I*I-J*J)/(NSQ)
        END DO
    END DO
    
    PHINEW(2:XSIZE-1,2:YSIZE-1)=0

    open(10,file='gs_11.csv')

    GAUSS_ITERATION: DO
        ITERATIONS = ITERATIONS+1
        PHIOLD=PHINEW

        DO I=2,XSIZE-1
            DO J=2,YSIZE-1
                PHINEW(I,J)=0.25*(&
                    &PHINEW(I-1,J)+&
                    &PHINEW(I+1,J)+&
                    &PHINEW(I,J-1)+&
                    &PHINEW(I,J+1))
            END DO
        END DO
        ERROR = PHIOLD-PHINEW
        ERRORSUM = SQRT(SUM(ERROR*ERROR)/NSQ)
        write(10,*) ERRORSUM, ITERATIONS 
        IF (ERRORSUM < 2*CONVERGENCE) EXIT GAUSS_ITERATION

     END DO GAUSS_ITERATION
   
    close(10)
END PROGRAM LAPLACE
