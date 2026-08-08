module digital_visitor_system(
    input clk,
    input reset,
    input entry,
    input exit,
    output reg [7:0] visitor_count
);

always @(posedge clk or posedge reset)
begin
    if(reset)
        visitor_count <= 0;

    else if(entry && !exit)
        visitor_count <= visitor_count + 1;

    else if(exit && !entry && visitor_count > 0)
        visitor_count <= visitor_count - 1;
end

endmodule