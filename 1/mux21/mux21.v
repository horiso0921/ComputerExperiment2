/*                   *
 * mux21.v           *
 * 2-1 マルチプレクサ *
 * (2-1 セレクタ回路) *
 *                   */

module mux21 (S1, D0, D1, Y);   // 入出力ポート
    input S1, D0, D1;           // 入力 S1, D0, D1
    output Y;                   // 出力 Y 
    
    // Multiplexer body
    // Y = ((not S1) and D0) or (S1 and D1)
    assign Y = (~S1 & D0)       // 出力ポートに対する
                | ( S1 & D1);   // 代入は assign 文で行う
endmodule
