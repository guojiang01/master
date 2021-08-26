module AD5592(
    clk,
    rst_n,
    start,
    //DAC_CHNNEL,
    //DAC_DATA,
    AD5592_SYNC,
    AD5592_clk,
    AD5592_SDI,
    AD5592_SDO
);
    parameter IDLE          = 5'b00000;
    parameter DAC_READBACK  = 5'b00001;
    parameter GEN_CTRL      = 5'b00010;
    parameter DAC_CONFIG    = 5'b00100;
    parameter REF_VOLT      = 5'b01000;
    parameter REC_DATA      = 5'b10000;

    input               clk;
    input               rst_n;
    input               start;
    input               AD5592_SDI;
    //input      [2:0]    DAC_CHNNEL;
    //input      [11:0]   DAC_DATA;
    output reg          AD5592_clk;
    output reg          AD5592_SDO;
    output reg          AD5592_SYNC;
    
    reg    [9:0]     cnt;
    reg    [15:0]    ctrl_word;
    reg    [4:0]     Current_State;
    reg    [4:0]     Next_State;
    reg              cnt_flag;

    always@(posedge cnt_flag or negedge rst_n)
    begin
        if(!rst_n)
            Current_State <= IDLE;
        else
           Current_State <= Next_State;
    end

    always@(Current_State)
    begin
        case(Current_State)
            IDLE:
                begin
                    ctrl_word <= 16'h0000;
                    Next_State <= DAC_READBACK;
                end
            DAC_READBACK:
                begin
                    //ctrl_word <= {13'h103,DAC_CHNNEL}; /// dac read back channel
                    ctrl_word <= 16'h0819;
                    Next_State <= GEN_CTRL;
                end
            GEN_CTRL:
                begin
                    ctrl_word <= 16'h1810;
                    Next_State <= DAC_CONFIG;
                end
            DAC_CONFIG:
                begin
                    ctrl_word <= 16'h28ff;
                    Next_State <= REF_VOLT;
                end
            REF_VOLT:
                begin
                    ctrl_word <= 16'h5a00;
                    Next_State <= REC_DATA;
                end
            REC_DATA:
                begin
                    //ctrl_word <= {1'h1,DAC_CHNNEL,DAC_DATA};
                    ctrl_word <= 16'h9a5a;
                    Next_State <= REC_DATA;
                end
            default:;
        endcase
    end

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        begin
            cnt <= 10'd0;
            cnt_flag <= 1'b0;
        end
        
    else if(start == 1 | (cnt != 10'd0))
        begin
            if(cnt == 10'd200)
                begin
                    cnt <= 10'd0;
                    cnt_flag <= 1'b1;
                end
                
            else 
                begin
                    cnt <= cnt + 10'd1;
                    cnt_flag <= 1'b0;
                end
                
        end 
    else 
        cnt <= 10'd0;
        
   always@(posedge clk or negedge rst_n)
    if(!rst_n)
        begin
            AD5592_clk  <= 1'b0;
            AD5592_SDO  <= 1'b0;
            AD5592_SYNC <= 1'b0;
        end 
    else 
        begin
            case(cnt)
                0:
                    begin
                        AD5592_clk  <= 1'b0;
                        AD5592_SDO  <= 1'b0;
                        AD5592_SYNC <= 1'b0;
                    end 
                    
                5:
                    begin
                        AD5592_clk  <= 1'b1;
                        AD5592_SDO  <= 1'b0;
                        AD5592_SYNC <= 1'b1;
                    end 
                10:
                    begin
                        AD5592_clk  <= 1'b0;
                        AD5592_SDO  <= 1'b0;
                        AD5592_SYNC <= 1'b1;
                    end 
                15:
                    begin
                        AD5592_clk  <= 1'b1;
                        AD5592_SDO  <= 1'b0;
                        AD5592_SYNC <= 1'b0;
                        AD5592_SDO  <= ctrl_word[15];
                    end
                20:
                    begin
                        AD5592_clk  <= 1'b0;
                        //AD5592_SDO  <= 1'b0;
                    end 
                25:
                    begin
                        AD5592_clk  <= 1'b1;
                        AD5592_SDO  <= ctrl_word[14];

                    end
                30:
                    begin
                        AD5592_clk  <= 1'b0;
                    end 
                35:
                    begin
                        AD5592_clk  <= 1'b1;
                        AD5592_SDO  <= ctrl_word[13];
                    end
                40:
                    begin
                        AD5592_clk  <= 1'b0;
                    end 
                45:
                    begin
                        AD5592_clk  <= 1'b1;
                        AD5592_SDO  <= ctrl_word[12];

                    end
                50:AD5592_clk  <= 1'b0;
                55:
                    begin
                        AD5592_clk  <= 1'b1;
                        AD5592_SDO  <= ctrl_word[11];

                    end
                60:
                    begin
                        AD5592_clk  <= 1'b0;
                    end
                65:
                    begin
                        AD5592_clk  <= 1'b1;
                        AD5592_SDO  <= ctrl_word[10];

                    end
                70:
                    begin    
                        AD5592_clk  <= 1'b0;
                    end 
                75:
                    begin
                        AD5592_clk  <= 1'b1;
                        AD5592_SDO  <= ctrl_word[9];

                    end
                80:
                    begin
                        AD5592_clk  <= 1'b0;
                    end 
                85:
                    begin
                        AD5592_clk  <= 1'b1;
                        AD5592_SDO  <= ctrl_word[8];

                    end
                90:
                    begin
                        AD5592_clk  <= 1'b0;
                    end 
                95:
                    begin
                        AD5592_clk  <= 1'b1;
                        AD5592_SDO  <= ctrl_word[7];

                    end
                100:
                    begin
                        AD5592_clk  <= 1'b0;
                    end 
                105:
                    begin
                        AD5592_clk  <= 1'b1;
                        AD5592_SDO  <= ctrl_word[6];
                    end
                110:
                    begin
                        AD5592_clk  <= 1'b0;
                    end
                115:
                    begin
                        AD5592_clk  <= 1'b1;
                        AD5592_SDO  <= ctrl_word[5];
                    end
                120:
                    begin
                        AD5592_clk  <= 1'b0;
                    end
                125:
                    begin
                        AD5592_clk  <= 1'b1;
                        AD5592_SDO  <= ctrl_word[4];
                    end
                130:
                    begin
                        AD5592_clk  <= 1'b0;
                    end
                135:
                    begin
                        AD5592_clk  <= 1'b1;
                        AD5592_SDO  <= ctrl_word[3];
                    end
                140:
                    begin
                        AD5592_clk  <= 1'b0;
                    end
                145:
                    begin
                        AD5592_clk  <= 1'b1;
                        AD5592_SDO  <= ctrl_word[2];
                    end
                150:
                    begin
                        AD5592_clk  <= 1'b0;
                    end
                155:
                    begin
                        AD5592_clk  <= 1'b1;
                        AD5592_SDO  <= ctrl_word[1];
                    end
                160:
                    begin
                        AD5592_clk  <= 1'b0;
                    end
                165:
                    begin
                        AD5592_clk  <= 1'b1;
                        AD5592_SDO  <= ctrl_word[0];
                    end
                170:
                    begin
                        AD5592_clk  <= 1'b0;
                        AD5592_SYNC <= 1'b1;
                    end
                175:
                    begin
                        AD5592_clk  <= 1'b1;
                        
                    end
                /*180:
                    begin
                        AD5592_clk  <= 1'b0;
                    end
                185:
                     begin
                        AD5592_clk  <= 1'b1;
                        AD5592_SYNC <= 1'b1;
                    end */

                default:;
            endcase
        end 
endmodule
        
                
                
              
                
                