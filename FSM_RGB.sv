module FSM_RGB (
    output logic red,      // خروجی LED قرمز
    output logic green,    // خروجی LED سبز
    output logic blue,     // خروجی LED آبی
    input  logic reset_b,  // ریست فعال با صفر
    input  logic clock,    // سیگنال کلاک
    input  logic In        // ورودی FSM برای تغییر حالت
);

    // تعریف حالت‌ها: S0 (قرمز)، S1 (سبز)، S2 (آبی)، BLINK (چشمک زدن سفید)
    typedef enum logic [1:0] {S0, S1, S2, BLINK} statetype;
    statetype state, nextState;

    // شمارنده 10 بیتی برای زمان‌بندی
    logic [9:0] timer;

    // رجیستر حالت و تایمر: به‌روزرسانی در لبه‌ی بالارونده کلاک یا زمانی که reset_b فعال شود
    always_ff @(posedge clock or negedge reset_b) begin
        if (!reset_b) begin
            state <= S0;
            timer <= 10'd0;      // ریست کردن تایمر
        end else begin
            // اگر حالت تغییر کند، تایمر ریست می‌شود؛ در غیر این صورت تایمر افزایش می‌یابد
            if (state != nextState)
                timer <= 10'd0;
            else
                timer <= timer + 1;

            // به حالت بعدی برو
            state <= nextState;
        end
    end

    // منطق حالت بعدی و خروجی‌ها
    always_comb begin
        // مقداردهی پیش‌فرض
        nextState = state;
        red   = 1'b0;
        green = 1'b0;
        blue  = 1'b0;

        case (state)
            // حالت S0: نمایش LED قرمز
            S0: begin
                red   = 1'b1; // LED قرمز روشن
                green = 1'b0;
                blue  = 1'b0;
                // اگر In=1 شود، به حالت S1 برو
                if (In)
                    nextState = S1;
            end

            // حالت S1: نمایش LED سبز
            S1: begin
                red   = 1'b0;
                green = 1'b1; // LED سبز روشن
                blue  = 1'b0;
                // اگر In=1 شود، به حالت S2 برو
                if (In)
                    nextState = S2;
            end

            // حالت S2: نمایش LED آبی
            S2: begin
                red   = 1'b0;
                green = 1'b0;
                blue  = 1'b1; // LED آبی روشن
                // اگر In=1 و تایمر به مقدار مشخصی (مثلاً > 100) رسید، به حالت BLINK برو
                if (In && (timer > 10'd100))
                    nextState = BLINK;
            end

            // حالت BLINK: LED چشمک‌زن (نمایش رنگ سفید)
            BLINK: begin
                // خروجی LED بر اساس بیت صفر تایمر تنظیم می‌شود؛ یعنی هر بار بیت 0 تغییر کند، LED چشمک می‌زند
                red   = timer[0];
                green = timer[0];
                blue  = timer[0];
                // پس از 200 سیکل، به حالت S0 برگرد
                if (timer > 10'd200)
                    nextState = S0;
            end

            // حالت پیش‌فرض: در صورت خطا، به S0 برگرد
            default: begin
                nextState = S0;
                red = 1'bx;
                green = 1'bx;
                blue = 1'bx;
            end
        endcase
    end

endmodule
