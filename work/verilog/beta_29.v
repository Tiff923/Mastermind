/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module beta_29 (
    input clk,
    input rst,
    input fsmregisterbullpluscowcal,
    input alufninput,
    input demuxinput,
    input aselinput,
    input bselinput,
    output reg [12:0] guess_out,
    output reg [12:0] check_answer_out,
    output reg [7:0] led_1,
    output reg [7:0] led_2,
    output reg [7:0] led_3,
    output reg [7:0] led_4,
    output reg [7:0] led_5,
    output reg [7:0] led_6,
    output reg [15:0] fsmregisterlife,
    output reg [15:0] fsmregisterbull,
    output reg [15:0] fsmregisterbullpluscow
  );
  
  
  
  reg [15:0] inputAlu_a;
  
  reg [15:0] inputAlu_b;
  
  reg [2:0] asel;
  
  reg [2:0] bsel;
  
  reg [1:0] demux;
  
  reg [5:0] alufn;
  
  reg [15:0] M_registerlife_d, M_registerlife_q = 1'h0;
  reg [15:0] M_registerbull_d, M_registerbull_q = 1'h0;
  wire [16-1:0] M_mastermind_alu_alu;
  wire [1-1:0] M_mastermind_alu_z;
  wire [1-1:0] M_mastermind_alu_v;
  wire [1-1:0] M_mastermind_alu_n;
  reg [6-1:0] M_mastermind_alu_alufn;
  reg [16-1:0] M_mastermind_alu_a;
  reg [16-1:0] M_mastermind_alu_b;
  alumodule_30 mastermind_alu (
    .clk(clk),
    .rst(rst),
    .alufn(M_mastermind_alu_alufn),
    .a(M_mastermind_alu_a),
    .b(M_mastermind_alu_b),
    .alu(M_mastermind_alu_alu),
    .z(M_mastermind_alu_z),
    .v(M_mastermind_alu_v),
    .n(M_mastermind_alu_n)
  );
  
  always @* begin
    M_registerlife_d = M_registerlife_q;
    M_registerbull_d = M_registerbull_q;
    
    guess_out = 1'h0;
    check_answer_out = 1'h0;
    led_1 = 1'h0;
    led_2 = 1'h0;
    led_3 = 1'h0;
    led_4 = 1'h0;
    led_5 = 1'h0;
    led_6 = 1'h0;
    fsmregisterbullpluscow = 1'h0;
    asel = aselinput;
    bsel = bselinput;
    demux = demuxinput;
    alufn = alufninput;
    
    case (asel)
      3'h0: begin
        inputAlu_a = 3'h7;
      end
      3'h1: begin
        inputAlu_a = 1'h0;
      end
      3'h2: begin
        inputAlu_a = M_registerlife_q;
      end
      3'h3: begin
        inputAlu_a = M_registerbull_q;
      end
      3'h7: begin
        inputAlu_a = fsmregisterbullpluscowcal;
      end
      default: begin
        inputAlu_a = 1'h0;
      end
    endcase
    fsmregisterlife = M_registerlife_q;
    fsmregisterbull = M_registerbull_q;
    
    case (bsel)
      3'h0: begin
        inputAlu_b = 1'h0;
      end
      3'h1: begin
        inputAlu_b = 1'h1;
      end
      3'h2: begin
        inputAlu_b = 2'h2;
      end
      3'h3: begin
        inputAlu_b = 2'h3;
      end
      3'h7: begin
        inputAlu_b = 3'h4;
      end
      default: begin
        inputAlu_b = 1'h0;
      end
    endcase
    M_mastermind_alu_a = inputAlu_a;
    M_mastermind_alu_b = inputAlu_b;
    M_mastermind_alu_alufn = alufn;
    
    case (demux)
      2'h1: begin
        M_registerlife_d = M_mastermind_alu_alu;
      end
      2'h2: begin
        M_registerbull_d = M_mastermind_alu_alu;
      end
      2'h3: begin
        fsmregisterbullpluscow = M_mastermind_alu_alu;
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_registerlife_q <= 1'h0;
      M_registerbull_q <= 1'h0;
    end else begin
      M_registerlife_q <= M_registerlife_d;
      M_registerbull_q <= M_registerbull_d;
    end
  end
  
endmodule