/*                  *
 * adder16.v        *
 * 16 ビット加算回路 *
 *                  */

module adder16 (x, y, cin, sum, count);
    input [15:0] x, y;
    input cin;
    output [15:0] sum;
    output count;

    assign {count, sum} = x + y + cin;
endmodule
