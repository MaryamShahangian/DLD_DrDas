`timescale 1ns / 1ps
module tb();

     logic reset_b;
     logic clock;
     logic In;
     logic red, green, blue;
 
     // نمونه‌سازی FSM_RGB
     FSM_RGB dut (
         .red(red),
         .green(green),
         .blue(blue),
         .reset_b(reset_b),
         .clock(clock),
         .In(In)
     );
 
     // تولید کلاک: دوره 10 ns
     always #5 clock = ~clock;
 
     initial begin
         clock = 0;
         reset_b = 0;
         In = 0;
         #10 reset_b = 1;   // ریست غیرفعال می‌شود
         #20 In = 1;        // اعمال ورودی برای تغییر حالت
         #300 In = 0;       // تغییر ورودی پس از مدتی
         #500 $finish;      // پایان شبیه‌سازی
     end
 
     // نمایش خروجی‌ها در کنسول
     initial begin
         $monitor("Time=%0t ns | In=%b | red=%b | green=%b | blue=%b | state=%0d | timer=%0d", 
                  $time, In, red, green, blue, dut.state, dut.timer);
     end
 
 endmodule
