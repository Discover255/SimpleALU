module simpleALU(f,co,p,g,a,b,ci,s,m);//s,a,b是数组类型


input[1:0] s;
input[3:0] a,b;
input ci,m;
output[3:0] f;
output co,p,g;
wire[3:0] innerG,innerC,mid1,ari,log1,log2,bContainer,virtualP;//三种中间量
wire[4:0] cContainer;


//P和G的运算，按位与，按位异或



assign mid1[0] = s[0]?1:b[0];
assign mid1[1] = s[0]?(m?1:0):b[1];
assign mid1[2] = s[0]?(m?1:0):b[2];
assign mid1[3] = s[0]?(m?1:0):b[3];

assign ari[0] = s[0]?1:(~b[0]);
assign ari[1] = s[0]?1:(~b[1]);
assign ari[2] = s[0]?1:(~b[2]);
assign ari[3] = s[0]?1:(~b[3]);

assign log1[0] = s[0]?log2[0]:a[0];
assign log1[1] = s[0]?log2[1]:a[1];
assign log1[2] = s[0]?log2[2]:a[2];
assign log1[3] = s[0]?log2[3]:a[3];

assign log2[0] = s[0]?(a[0] | b[0]):b[0];
assign log2[1] = s[0]?(a[1] | b[1]):b[1];
assign log2[2] = s[0]?(a[2] | b[2]):b[2];
assign log2[3] = s[0]?(a[3] | b[3]):b[3];

assign bContainer = s[1]?ari:mid1;

assign innerG[0] = a[0]&bContainer[0];
assign innerG[1] = a[1]&bContainer[1];
assign innerG[2] = a[2]&bContainer[2];
assign innerG[3] = a[3]&bContainer[3];
assign virtualP[0] = (a[0] | (s[1]?(m?log1[0]:ari[0]):mid1[0])) & ((~a[0]) | ~(s[1]?(m?(~log2[0]):ari[0]):mid1[0]));
assign virtualP[1] = (a[1] | (s[1]?(m?log1[1]:ari[1]):mid1[1])) & ((~a[1]) | ~(s[1]?(m?(~log2[1]):ari[1]):mid1[1]));
assign virtualP[2] = (a[2] | (s[1]?(m?log1[2]:ari[2]):mid1[2])) & ((~a[2]) | ~(s[1]?(m?(~log2[2]):ari[2]):mid1[2]));
assign virtualP[3] = (a[3] | (s[1]?(m?log1[3]:ari[3]):mid1[3])) & ((~a[3]) | ~(s[1]?(m?(~log2[3]):ari[3]):mid1[3]));


//进位的运算
assign innerC[0] = innerG[0]|(virtualP[0]&ci);
assign innerC[1] = innerG[1]|(virtualP[1]&innerC[0]);
assign innerC[2] = innerG[2]|(virtualP[2]&innerC[1]);
assign innerC[3] = innerG[3]|(virtualP[3]&innerC[2]);


assign cContainer[0] = m?0:ci;
assign cContainer[1] = m?0:innerC[0];
assign cContainer[2] = m?0:innerC[1];
assign cContainer[3] = m?0:innerC[2];
assign cContainer[4] = m?0:(s[1]?(~innerC[3]):innerC[3]);
//assign cContainer[4] = innerC[3];


//结果的运算
assign f = virtualP^cContainer;

//引出输出
assign co = cContainer[4];
assign p = m?0:virtualP[3];
assign g = m?0:innerG[3];
endmodule
