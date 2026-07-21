//clk_a domain  --> registering combo before passing through synchronizer

reg combo_r;

always @(posedge clk_a or negedge rst_n)
  begin if (!rst_n) begin
    combo_r <= 1'b0;
  end else begin
    combo_r <= a & b;
  end
    always @(posedge clk_b or negedge rst_n)
      begin if (!rst_n) begin
        sync1 <= 1'b0;
        sync2 <= 1'b0;
      end else begin
        sync1 <= combo_r;
        sync2 <= sync1;
      end 
