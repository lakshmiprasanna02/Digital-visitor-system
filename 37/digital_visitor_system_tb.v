`timescale 1ns/1ps

module digital_visitor_system_tb;

reg clk;
reg reset;
reg entry;
reg exit;

wire [7:0] visitor_count;

digital_visitor_system uut(
    .clk(clk),
    .reset(reset),
    .entry(entry),
    .exit(exit),
    .visitor_count(visitor_count)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    reset = 1;
    entry = 0;
    exit = 0;

    #10 reset = 0;

    // Visitor 1 enters
    #10 entry = 1;
    #10 entry = 0;

    // Visitor 2 enters
    #20 entry = 1;
    #10 entry = 0;

    // One visitor exits
    #20 exit = 1;
    #10 exit = 0;

    // Another visitor enters
    #20 entry = 1;
    #10 entry = 0;

    // Two visitors exit
    #20 exit = 1;
    #10 exit = 0;

    #20 exit = 1;
    #10 exit = 0;

    #30 $finish;
end

initial
begin
    $monitor("Time=%0t Reset=%b Entry=%b Exit=%b Visitors=%d",
              $time, reset, entry, exit, visitor_count);
end

endmodule