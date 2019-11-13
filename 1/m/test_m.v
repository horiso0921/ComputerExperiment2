/*                     *
 * test_mv.v           *
 * 系列検出器のﾃｽﾄベンチ *
 *                     */
 
`timescale 1ns / 1ns    // シミュレーションの単位時間 / 精度
                        // 1ns = 1/1000000000 sec
`include "m.v"          // m.v の取り込み
 
module test ;
  /*** m 入力値格納用のレジスタ ****/
  reg reset, clk, x;

  /*** y の出力観測用の信号線 ****/
  wire y;

  /*** m の実体化***/
  m ma(clk, reset, x, y);
 
  always begin
    #5      clk = ~clk;
  end
 
  initial begin
    reset = 1; clk = 0; x = 0;

    // 20 単位時間(20 ns)後��
    #20 reset = 0;

    // 更に 20 単位時間(20 ns)後��
    #20 reset = 1;

    #10 x = 1;
    #10 x = 0;
    #10 x = 0;
    #10 x = 1;
    #10 x = 1;
    #10 x = 1;
    #10 x = 0;

    #10 x = 1;
    #10 x = 0;
    #10 x = 0;
    #10 x = 1;
    #10 x = 0;
    #10 x = 0;
    #10 x = 1;
    #10 x = 1;
    // 更に 1000 単位時間追加(1000 ns)後, 終了λ
    #1000 $finish;
  end
endmodule // test