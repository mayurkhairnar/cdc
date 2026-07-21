always @(posedge clk_b) begin
  sync1 <= data;
  sync2 <= sync1;
end

always @(posedge sync2) begin
  data_out <= data_in;
end

// buggy as clock created is a glitch prone clock , will result into buggy design. 
