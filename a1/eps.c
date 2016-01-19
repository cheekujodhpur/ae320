/* Calculting epsilon of machine
 * for types float and double
 * 
 * Author: Kumar Ayush, 140260016
 */

#include <stdio.h>

int main()
{
    float eps_f = 1.0f;
    float eps_d = 1.0;

    while(1.0f+eps_f > 1.0f)
        eps_f /= 2.0;

    while(1.0 + eps_d > 1.0)
        eps_d /= 2.0;

    printf("Epsilon for float: %.17g\n",eps_f);
    printf("Epsilon for double: %.17g\n",eps_d);
    return 0;
}
