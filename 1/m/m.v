/*             *
 * m.v         *
 * 系列検出回路 *
 *             */

`define st0 2'b00
`define st1 2'b01
`define st2 2'b10
`define st3 2'b11

module m(clk, reset, x, y);
  input clk, reset, x;
  output y;

  reg y_reg;         // 1-bit 入力レジスタ
  reg [1:0] st_reg;  // 2-bit 出力レジスタ

  assign y = y_reg;

  always @(posedge clk or negedge reset) begin
    if (reset == 1'b0) begin
      /*** レジスタの初期値設定 ***/
      y_reg <= 1'b0;
      st_reg <= 1'b0;
    end else begin
      case (st_reg)
        `st0: begin  // 状態　0 にいるとき
          if (x == 1'b0) begin
            /*** 0 が入力された時の状態遷移 ***/
            st_reg <= `st1;
          end else begin
            /*** 1が入力された時の状態遷移　***/
            st_reg <= `st0;
          end
          /*** 出力値のセット ***/
          y_reg <= 1'b0;
        end
        `st1: begin  // 状態 1 にいるとき
          if (x == 1'b0) begin
            st_reg <= `st2;
          end else begin
            st_reg <= `st0;
          end
          y_reg <= 1'b0;
        end
        `st2: begin  // 状態 2 にいるとき
          if (x == 1'b0) begin
            st_reg <= `st2;
          end else begin
            st_reg <= `st3;
          end
          y_reg <= 1'b0;
        end
        `st3: begin  // 状態 3 にいるとき
          if (x == 1'b0) begin
            st_reg <= `st1;
          end else begin
            st_reg <= `st0;
          end
          y_reg <= 1'b1;
        end
      endcase
    end
  end
endmodule // m
