module suma(input logic a,b,c,d,e,f,g,h,output logic r,s,t,u,v,w,y,z, output logic [6:0] units_seg,output logic [1:0] tens_seg);
//Primer bit
assign y = (a|e)&((a&e)|b);
assign z = (a^e)^b;

endmodule