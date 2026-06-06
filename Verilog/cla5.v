`timescale 1ns/1ps

module cla5 (
    input  [4:0] A,
    input  [4:0] B,
    output [4:0] S,
    output       Cout
);

    wire [4:0] prop, gen;
    assign prop = A ^ B;
    assign gen  = A & B;

    wire carry_in;
    assign carry_in = 1'b0;
    wire [5:0] carry; 
    assign carry[1] = gen[0];

    wire and_term1;
    and (and_term1, prop[1], gen[0]);
    or  (carry[2], gen[1], and_term1);

    wire and_term2, and_term3;
    and (and_term2, prop[2], gen[1]);
    and (and_term3, prop[2], prop[1], gen[0]);
    or  (carry[3], gen[2], and_term2, and_term3);

    wire and_term4, and_term5, prop_chain1, and_term6, or_temp1;
    and (and_term4,  prop[3], gen[2]);
    and (and_term5,  prop[3], prop[2], gen[1]);
    and (prop_chain1, prop[3], prop[2], prop[1]);
    and (and_term6,  prop_chain1, gen[0]);
    or  (or_temp1, gen[3], and_term4, and_term5);
    or  (carry[4], or_temp1, and_term6);

    wire and_term7, and_term8, prop_chain2, and_term9, prop_chain3, and_term10;
    wire or_temp2, or_temp3;
    and (and_term7, prop[4], gen[3]);
    and (and_term8, prop[4], prop[3], gen[2]);
    and (prop_chain2, prop[4], prop[3], prop[2]);
    and (and_term9, prop_chain2, gen[1]);
    and (prop_chain3, prop_chain2, prop[1]);
    and (and_term10, prop_chain3, gen[0]);
    or  (or_temp2, gen[4], and_term7, and_term8);
    or  (or_temp3, and_term9, and_term10);
    or  (carry[5], or_temp2, or_temp3);

    assign Cout = carry[5];

    assign S[0] = prop[0] ^ carry_in;
    assign S[1] = prop[1] ^ carry[1];
    assign S[2] = prop[2] ^ carry[2];
    assign S[3] = prop[3] ^ carry[3];
    assign S[4] = prop[4] ^ carry[4];

endmodule

module tb_cla5;
    reg  [4:0] A;
    reg  [4:0] B;
    wire [4:0] S;
    wire       Cout;

    cla5 dut(.A(A), .B(B), .S(S), .Cout(Cout));

    initial begin
        $dumpfile("cla5.vcd");
        $dumpvars(0, tb_cla5);

        $display("Time   A      B      | Cout  S");
        A = 5'b00000; B = 5'b00000; #10;
        A = 5'b00001; B = 5'b00001; #10;
        A = 5'b00011; B = 5'b00101; #10;
        A = 5'b01010; B = 5'b00111; #10;
        A = 5'b11111; B = 5'b00001; #10;
        A = 5'b10101; B = 5'b10101; #10;
        A = 5'b11111; B = 5'b11111; #10;

        $finish;
    end

    initial begin
        $monitor("%4t   %b   %b   |   %b   %b",
                 $time, A, B, Cout, S);
    end

endmodule