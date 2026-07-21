module tsync (
  input wire clk_a,
  input wire clk_b,
  input wire rst,
  output wire clk_a_active
);

  reg toggle_a;

  always @(posedge clk_a or negedge rst)
    begin if (!rst)
      togggle_a <= 1'b0;
    end else begin
      toggle_a <= ~toggle_a
    end

  reg [2:0] sync;

  always @(posedge clk_a or negedge rst)
    begin if (!rst)
      sync <= 3'b0;
    end else begin
      sync < = {sync[1:0],toggle_a};
    end

  assign clk_a_active = sync[2]^sync[1];

endmodule



      
