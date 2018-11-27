 module MUL5
(
    input control,
    input [4:0] in0,
    input [4:0] in1,
    output [4:0] out
);

    assign out = control ? in1 : in0;

endmodule