// var alx1,alx2,acx1,acx2,x3,x4,aly1,acy1,acy2,aly2,y3,y4,xin,yin,tin;

//     alx1 =0;
//     alx2 = 6;
//     aly1 = 4;
//     aly2 = 10
//     acx1=4;
//     acx2=10;
//     acy1=4;
//     acy2=10;
//     function processprediction(ux1,ux2,uy1,uy2){
//         x3=ux1;
//         x4=ux2;
//         y3=uy1;
//         y4=uy2;
// if(x3>=4){
//     var slopeOfLine1;
//     var slopeOfLine2;
//     if(alx2 - alx1 != 0)
//         slopeOfLine1 = (aly2 - y1)/(alx2 - alx1);
//     else
//         slopeOfLine1 = 0;
//     if(x4 - x3 != 0)
//         slopeOfLine2 = (y4 - y3)/(x4 - x3);
//     else
//         slopeOfLine1 = 0;
//     if(slopeOfLine1 != slopeOfLine2)
//     {
//         xin = ((alx1*aly2 - y1*alx2)*(x3 - x4) - (x3*y4 - y3*x4)*(alx1 - alx2) )/( ((alx1 - alx2)*(y3 - y4))- ((y1 - aly2)*(x3 - x4)));
//         yin = ((alx1*aly2 - y1*alx2)*(y3 - y4) - (x3*y4 - y3*x4)*(y1 - aly2) )/( ((alx1 - alx2)*(y3 - y4))- ((y1 - aly2)*(x3 - x4)));
//         if(yin ==0){
//             yin=0;
//         }
//         else{
//             tin = x4-xin
//         }
//     }
// }
