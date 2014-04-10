function [ArrowID]=plotvector(X,Y,Vel,Dir,arrowlength,userscale,ColorStr,FilltagStr,UVTagStr,ArrowLenModeStr,MaxVectorLen)
%--------------------------------------------------------------------------
%[ArrowID]=plotvector(X,Y,Vel,Dir,arrowlength,userscale,ColorStr,FilltagStr,UVTagStr,ArrowLenModeStr,MaxVectorLen)
%--------------------------------------------------------------------------
%    ������ʸͼ������ͬquiver�����ǿ��quiver����
%              ��Ϊ��, 2010.08.17
%             liweihua0903@163.com
%--------------------------------------------------------------------------
%�ŵ㣺
%1.�Զ����ݵ�ǰ��ͼ����x��yʵ�ʱ�������dx��dy����x��y���ͼ�ȳ߲�ͬʱ���ɱ�����ʸ���ȼ�����ʧ�����⣬
%   ��Ϊ�����ڻ�����ʱ��仯�Ķ������ٲ������
%2.�������ǰ��ͼ������x��y�޶���Χ�ڵ���ʸ���Լ�С��ͼ������ͼ�洢�ռ�
%3.��ͨ����ͷ�����趨��ʽ���趨�Ƿ����ʸ����ͷ����ͷ���ȴ�С������Խ�󣬼�ͷԽ�����Ϊƽ�����ٶ�Ӧ��ͷ��
%4.�ɲ�����������η�ʽ����ʸ����ͷ
%-----------------------------------------------
%����˵����
%X��Y��Vel��Dir�ֱ�Ϊx��y��������١���������Ϊ�㣬˳ʱ�뷽��
%arrowlength,��ͷ�����趨��������Բ�������ֵԽ�󣬼�ͷ���Խ��
%userscale,��ʸ���ȱȳߣ���Բ�������ֵԽ����ʸ����Խ��
%ColorStr,��ʸ��ɫ���ַ���������ֻ��Ϊ��ɫ���ã��� 'k'
%FilltagStr,�Ƿ�������������ʽ���Ƽ�ͷ��־��ȡֵΪ'fill'ʱ����������䣬ȡֵΪ'line'ʱ��ͷΪ����
%        �����ƴ��������ʹ�����ģʽ��ͼʱ����������ܻ���һ����Ӧ��ʱ�������ĵȴ�
%UVTagStr,ȡֵΪ"uv"ʱ�����������ı���Ϊu��v������ȡֵΪ��sd����������
%ArrowLenModeStr��ȡֵΪ"fix"ʱ�����м�ͷ���ȵȳ���ȡֵΪ"var"ʱ��ͷ������ʸ����С���仯
%MaxVectorLen�����ʸ�����ȣ����趨�������Ϊ5(m/s)������Ӧsqrt(x����^2+y����^2)/80*userscale����5m/s;
%              ���ɳ����Զ�����ʸ�����ȣ���ñ����ɲ�������趨Ϊһ������0����ֵ��
%         ע�⣺
%              ���ñ����趨��ֵС��max(Vel)ʱ�����ڸ��趨��ֵ��ʸ�����޶�Ϊ����ֵ���ȡ�
%-----------------------------------------------
%Example:
% [x,y] = meshgrid(-2:.2:2,-1:.15:1);
% z = x .* exp(-x.^2 - y.^2); [px,py] = gradient(z,.2,.15);
% figure(1);contour(x,y,z); hold on;
% a=get(gcf,'position');a(1)=a(1)-40;a(2)=a(2)-a(4);a(4)=a(4)*2;
% set(gcf,'position',a);
% quiver(x,y,px,py); set(gca,'xlim',[-2 2],'ylim',[-1 1]);
% hold off;title('quiver����Ч��(xy��ͬ����ʱ������ʧ��)');
% figure(2);contour(x,y,z); hold on;
% a=get(gcf,'position');a(2)=a(2)-a(4);a(4)=a(4)*2;
% set(gcf,'position',a); set(gca,'xlim',[-2 2],'ylim',[-1 1]);
% plotvector(x,y,px,py,1,1,'b','fill','uv','fix',1); hold off;title('xy��ͬ����ʱ��plotvector����Ч����������ʾ��');
% figure(3);contour(x,y,z); hold on;
% a=get(gcf,'position');a(2)=a(2)-a(4);a(3)=a(3)*2;
% set(gcf,'position',a);
% quiver(x,y,px,py);axis equal;
% plotvector(x,y,px,py,0.8,1,'r','line','uv','fix',1); hold
% off;title('������������ʾЧ�����ӣ�quiver��ɫ��plotvector��ɫ');
%--------------------------------------------------------------------------
Angle = pi / 18;  %��ͷ����ʸ�н�Ԥ��Ϊ10��
%--------------------------------------------------------------------------
%�����������
%--------------------------------------------------------------------------
if nargin<4
    error('����������Ϣ����');
elseif nargin==4
    arrowlength=1;
    userscale=1;
    ColorStr='b';
    FilltagStr='line';
    UVTag='uv';
    ArrowLenModeStr='fix';
    MaxVectorLen=-1;
elseif nargin==5
    userscale=1;
    ColorStr='b';
    FilltagStr='line';
    UVTag='uv';
    ArrowLenModeStr='fix';
    MaxVectorLen=-1;
elseif nargin==6
    ColorStr='b';
    FilltagStr='line';
    UVTag='uv';
    ArrowLenModeStr='fix';
    MaxVectorLen=-1;
elseif nargin==7
    FilltagStr='line';
    UVTag='uv';
    ArrowLenModeStr='fix';
    MaxVectorLen=-1;
elseif nargin==8
    UVTag='uv';
    ArrowLenModeStr='fix';
    MaxVectorLen=-1;
elseif nargin==9
    ArrowLenModeStr='fix';
    MaxVectorLen=-1;
elseif nargin==10
    ArrowLenModeStr='fix';
    MaxVectorLen=-1;
end

Filltag=strcmpi(FilltagStr,'fill');
UVTag=strcmpi(UVTagStr,'uv');
ArrowLenMode=strcmpi(ArrowLenModeStr,'fix');
%--------------------------------------------------------------------------
%�������������ֻ�ͼǰ�Ŀ��ȡ��߶ȡ����߱ȡ�xy����ʾ��Χ��hold״̬
%--------------------------------------------------------------------------
plotstatus=ishold; %��ǰhold״̬
tempvar1=get(gcf,'position');
tempvar2=get(gca,'position');
XAxisLimit=get(gca,'xlim');
YAxisLimit=get(gca,'ylim');
xwidth=tempvar1(3)*tempvar2(3); %��������
ywidth=tempvar1(4)*tempvar2(4); %�����߶�
if (XAxisLimit(1)==0)&(YAxisLimit(1)==0)&(XAxisLimit(2)==1)&(YAxisLimit(2)==1)
    IsNewPlot=1;
else
    IsNewPlot=0;
end
tempvar3=xwidth/(XAxisLimit(2)-XAxisLimit(1));
tempvar4=ywidth/(YAxisLimit(2)-YAxisLimit(1));
xscale=tempvar3/(tempvar3+tempvar4);
yscale=tempvar4/(tempvar3+tempvar4);
%--------------------------------------------------------------------------
%��ͼ���ݴ���
%--------------------------------------------------------------------------
if (IsNewPlot==0) %�޳����ڵ�ǰx��y����ʾ��Χ�ڵ����ݵ�
    Tag_Valid=find((X>=XAxisLimit(1))&(X<=XAxisLimit(2))&(Y>=YAxisLimit(1))&(Y<=YAxisLimit(2)));
    X=X(Tag_Valid);
    Y=Y(Tag_Valid);
    Vel=Vel(Tag_Valid);
    Dir=Dir(Tag_Valid);
end
%u��v���ݸ��ݵ�ǰ����x��y��������Ӧ�任���Ծ���xy�����߲�ͬ���µ�ʸ������
%������ʸ���������趨����
BaseVectorSize=sqrt((XAxisLimit(2)-XAxisLimit(1))^2+(YAxisLimit(2)-YAxisLimit(1))^2)./50;
n=length(X);
if UVTag==1
    dx=Vel;
    dy=Dir;
    [Vel,Dir]=EN2VD(dx,dy);
end
    if MaxVectorLen>0 %�趨�������Ƶ�ʸ������Ϊ���Ƴ���
        TempVar1=find(Vel>MaxVectorLen);
        if isempty(TempVar1)~=1
            Vel(TempVar1)=MaxVectorLen;
        end
    end
    Vel=Vel.*BaseVectorSize./max([Vel(:);MaxVectorLen]) .* userscale;  %����ʸ����λ����ͼ��λ
    dx=Vel.*sin(Dir.*pi./180); 
    dy=Vel.*cos(Dir.*pi./180);
%��ͷ���ȴ���
BaseArrowSize=sqrt((XAxisLimit(2)-XAxisLimit(1))^2+(YAxisLimit(2)-YAxisLimit(1))^2)./240;
if ArrowLenMode==1 %��ͷ��С�̶�
    L_Arrow=BaseArrowSize.*arrowlength;
end
%��ͷ��䷽ʽԤ����
if Filltag==0
    ArrowX=zeros(7*n,1);
    ArrowY=zeros(7*n,1);
else
    ArrowX=zeros(3*n,1);
    ArrowY=zeros(3*n,1);
    FillX=zeros(3,1);
    FillY=zeros(3,1);
end
%������ʸ��ͼ����
for i=1:n
    cosA = dx(i) / sqrt(dx(i) ^ 2 + dy(i) ^ 2);
    sinA = dy(i) / sqrt(dx(i) ^ 2 + dy(i) ^ 2);
    if ArrowLenMode==0 %��ͷ��С����ʸ���ȱ仯���仯
        L_Arrow = Vel(i) * arrowlength;
    end
    if (L_Arrow>Vel(i))&(ArrowLenMode==1)
        TempLen_Arrow=Vel(i).*0.7;
    else
        TempLen_Arrow=L_Arrow;
    end
    arowx_up =  TempLen_Arrow * (cosA * cos(-Angle) - sinA * sin(-Angle));
    arowy_up =  TempLen_Arrow * (sinA * cos(-Angle) + cosA * sin(-Angle));
    arowx_down = TempLen_Arrow * (cosA * cos(Angle) - sinA * sin(Angle));
    arowy_down = TempLen_Arrow * (sinA * cos(Angle) + cosA * sin(Angle));
    if Filltag==0
        ArrowX((i-1)*7+1,1)=X(i);
        ArrowY((i-1)*7+1,1)=Y(i);
        ArrowX((i-1)*7+2,1)=X(i)+dx(i)./ xscale;
        ArrowY((i-1)*7+2,1)=Y(i)+dy(i)./ yscale;
        ArrowX((i-1)*7+3,1)=nan;
        ArrowY((i-1)*7+3,1)=nan;
        ArrowX((i-1)*7+4,1)=X(i)+(dx(i) - arowx_up)./ xscale;
        ArrowY((i-1)*7+4,1)=Y(i)+(dy(i) - arowy_up)./ yscale;
        ArrowX((i-1)*7+5,1)=X(i)+dx(i)./ xscale;
        ArrowY((i-1)*7+5,1)=Y(i)+dy(i)./ yscale;
        ArrowX((i-1)*7+6,1)=X(i)+(dx(i) - arowx_down)./ xscale;
        ArrowY((i-1)*7+6,1)=Y(i)+(dy(i) - arowy_down)./ yscale;
        ArrowX((i-1)*7+7,1)=nan;
        ArrowY((i-1)*7+7,1)=nan;
    else
        ArrowX((i-1)*3+1,1)=X(i);
        ArrowY((i-1)*3+1,1)=Y(i);
        ArrowX((i-1)*3+2,1)=X(i)+dx(i)./ xscale;
        ArrowY((i-1)*3+2,1)=Y(i)+dy(i)./ yscale;
        ArrowX((i-1)*3+3,1)=nan;
        ArrowY((i-1)*3+3,1)=nan;
        
        FillX(1,1)=X(i)+(dx(i) - arowx_up)./ xscale;
        FillY(1,1)=Y(i)+(dy(i) - arowy_up)./ yscale;
        FillX(2,1)=X(i)+dx(i)./ xscale;
        FillY(2,1)=Y(i)+dy(i)./ yscale;
        FillX(3,1)=X(i)+(dx(i) - arowx_down)./ xscale;
        FillY(3,1)=Y(i)+(dy(i) - arowy_down)./ yscale;
        if i==2
            hold on;
        end
        FillID=fill(FillX,FillY,ColorStr);
        set(FillID,'edgecolor',ColorStr);
    end
end
%--------------------------------------------------------------------------
%��ͼ
%--------------------------------------------------------------------------
ArrowID=plot(ArrowX,ArrowY,ColorStr);
if IsNewPlot==0
    set(gca,'xlim',XAxisLimit,'ylim',YAxisLimit);
    if plotstatus==0
        hold off; 
    end
end
% end of plotvector
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [V,D]=EN2VD(V_E,V_N)
%�����ٵĶ�/������������������
V=sqrt(V_E.^2+V_N.^2);
c2=find((V_E>=0)&(V_N>=0));  %��һ����������
D(c2)=asin(abs(V_E(c2))./V(c2)).*180./pi;
clear c2;
c2=find((V_E>=0)&(V_N<0));  %��������������
D(c2)=180-asin(abs(V_E(c2))./V(c2)).*180./pi;
clear c2;
c2=find((V_E<0)&(V_N>=0));  %�ڶ�����������
D(c2)=360-asin(abs(V_E(c2))./V(c2)).*180./pi;
clear c2;
c2=find((V_E<0)&(V_N<0));  %��������������
D(c2)=180+asin(abs(V_E(c2))./V(c2)).*180./pi;
clear c2;
D=D';