Tout = 30;                   %������¶�%
Qla = 0;                    %���ڵ���Դ%
Tsa = 2;                    %�ͷ���¶�%
Msa =0.021;                 %�ͷ��ʪ��%
Min =0.021;                 %���ڵĳ�ʼʪ��%
Tin = 30;                   %���ڵĳ�ʼ�¶�%
Gsa = 0.15;                 %�ͷ�������
X = [Tin;0;0;0;0;Min];      %״̬�����ĳ�ʼֵ���ף������¶ȣ�β������ʪ��
U = [Tout;Tsa;Qla;Msa];     %�����¶ȣ��ͷ��¶ȣ�������Դ

rou_wa = 2800;              %ǽ���ܶ�
rou_fl = 2500;              %�컨����ܶ�
roua = 1.34;                %�������ܶ�
delta_wa = 0.3;             %ǽ�ĺ��
delta_fl = 0.3;             %�컨��ĺ��
Awin = 2;                   %ǽ�����
Awa = 11.5;                 %���������
Afl = 20;                   %�컨������
V = 60;                     %��������
Cf = 10000;                 %������Ʒ��������
Cwa = 1000;                 %ǽ������
Ca = 1000;                  %����������
Cfl = 950;                  %�컨�������
Kwa = 0.5;                  %ǽ�Ķ�������ϵ��
Kwa_out = 12;               %ǽ���Ķ�������ϵ��
Kwa_in = 5;                 %ǽ�ڲ�Ķ�������ϵ��
Kfl = 2;                    %�컨��Ķ�������ϵ��
Kfl_in = 5;                 %�컨���ڲ�Ķ�������ϵ��
Kfl_out = 6;                %�컨�����Ķ�������ϵ��
Kwin = 3;                   %�����Ķ�������ϵ��

% CVin = 200;
% CVout = 100;
% Cin = 540;
% Cout = 360;

beita2 = 2500000;

%A00 = -16*Awa*Kwa*Kwa/(4*Kwa+Kwa_in)-Kwin*Awin-8*Afl*Kfl*Kfl/(4*Kfl+Kfl_in)-roua*V*Ca*Gsa;
A00 = -4*Kwa/(4*Kwa+Kwa_in)-Kwin*Awin-4*Kfl/(4*Kfl+Kfl_in)-Ca*Gsa;
%A01 = 16*Awa*Kwa*Kwa/(4*Kwa+4*Kwa_in);
A01 = 4*Kwa/(4*Kwa+Kwa_in);
A02 = 0;
%A03 = 8*Afl*Kfl*Kfl/(4*Kfl+4*Kfl_in);
A03 = 4*Kfl/(4*Kfl+Kfl_in);
A04 = 0;
A05 = 0;
A10 = 4*Awa*Kwa/(1+4*Kwa/Kwa_in);
A11 = -(3*Awa*Kwa_in+4*Awa*Kwa)/(2+Kwa_in/(2*Kwa));
%A11 = 4*Awa*Kwa/(1+Kwa_in/(4*Kwa))-6*Kwa
A12 = 2*Awa*Kwa;
A13 = 0;
A14 = 0;
A15 = 0;
A20 = 0;
A21 = 2*Awa*Kwa;
A22 = -(3*Awa*Kwa_out+4*Awa*Kwa)/(2+Kwa_out/(2*Kwa));
A23 = 0;
A24 = 0;
A25 = 0;
A30 = 4*Afl*Kfl/(1+4*Kfl/Kfl_in);
A31 = 0;
A32 = 0;
A33 = -(3*Afl*Kfl_in+4*Afl*Kfl)/(2+Kfl_in/(2*Kfl));
A34 = 2*Afl*Kfl;
A35 = 0;
A40 = 0;
A41 = 0;
A42 = 0;
A43 = 2*Afl*Kfl;
A44 = -(3*Afl*Kfl_out+4*Afl*Kfl)/(2+Kfl_out/(2*Kfl));
A45 = 0;
A50 = 4*Kwa/(4*Kwa+Kwa_in)+Kwin*Awin+4*Kfl/(4*Kfl+Kfl_in); 
A51 = -4*Kwa/(4*Kwa+Kwa_in);
A52 = 0;
A53 = -4*Kfl/(4*Kfl+Kfl_in);
A54 = 0;
A55 = -Gsa*beita2;
A = [A00, A01, A02, A03, A04,A05;
    A10, A11, A12, A13, A14, A15;
    A20, A21, A22, A23, A24, A25;
    A30, A31, A32, A33, A34, A35;
    A40, A41, A42, A43, A44, A45;
    A50, A51, A52, A53, A54, A55
    ];

B00 = Kwin*Awin;
B01 = Ca*Gsa;
B02 = 1;
B03 = 0;
B10 = 0;
B11 = 0;
B12 = 0;
B13 = 0;
B20 = 4*Awa*Kwa/(1+4*Kwa/Kwa_in);
B21 = 0;
B22 = 0;
B23 = 0;
B30 = 0;
B31 = 0;
B32 = 0;
B33 = 0;
B40 = 4*Afl*Kfl/(1+4*Kfl/Kfl_in);
B41 = 0;
B42 = 0;
B43 = 0;
B50 = -Kwin*Awin;
B51 = 0;
B52 = -1;
B53 = Gsa*beita2;
B = [B00, B01, B02, B03;
    B10, B11, B12, B13;
    B20, B21, B22, B23;
    B30, B31, B32, B33;
    B40, B41, B42, B43;
    B50, B51, B52, B53
    ];

C00 = roua*V*Ca;
C01 = 0;
C02 = 0;
C03 = 0;
C04 = 0;
C05 = 0;
C10 = 0;
C11 = 1/2*rou_wa*delta_wa*Awa*Cwa;
C12 = 0;
C13 = 0;
C14 = 0;
C15 = 0;
C20 = 0;
C21 = 0;  
C22 = 1/2*rou_wa*delta_wa*Awa*Cwa;
C23 = 0;
C24 = 0;
C25 = 0;
C30 = 0;
C31 = 0;
C32 = 0;
C33 = 1/2*rou_fl*delta_fl*Afl*Cfl;
C34 = 0;
C35 = 0;
C40 = 0;
C41 = 0;
C42 = 0;
C43 = 0;
C44 = 1/2*rou_fl*delta_fl*Afl*Cfl;
C45 = 0;
C50 = 0;
C51 = 0;
C52 = 0;
C53 = 0;
C54 = 0;
C55 = roua*V*beita2;
C = [C00,C01,C02,C03,C04,C05;
    C10,C11,C12,C13,C14,C15;
    C20,C21,C22,C23,C24,C25;
    C30,C31,C32,C33,C34,C35;
    C40,C41,C42,C43,C44,C45;
    C50,C51,C52,C53,C54,C55
    ]

A = C\A
B = C\B

Ct = [1,0,0,0,0,0;                  %�������
      0,0,0,0,0,1000];


