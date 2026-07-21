module flop_2_sync (
    input  wire data,
    input  wire enable,
    input  wire clk_a,
    input wire clk_b,
    input  wire rst_n,
    output reg  sync2
);

    reg sync1;
    wire combo;

    assign combo = enable & data;

  always @(posedge clk_b or negedge rst_n) begin
        if (!rst_n) begin
            sync1 <= 1'b0;
            sync2 <= 1'b0;
        end else begin
            sync1 <= combo;
  //combo is directly fed into sync, which is buggy. register combo in clk_a first
            sync2 <= sync1;
        end
    end

endmodule
