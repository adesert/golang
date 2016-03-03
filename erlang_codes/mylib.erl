
%  my erlang lib codes

-module(mylib).
-export ([for/3,sum/1,map/2]).

%  自定义for循环
%  调用：for:for(1,10,fun(X)->X end).
for(Max,Max,F) -> [F(Max)];
for(I,Max,F) -> [F(I)|for(I+1,Max,F)].


% 关于列表的操作
% 求和
sum([H|T]) -> H+sum(T);
sum([]) -> 0.


% map 定义, map(F,L) 应用函数F对列表L中每个元素运算
% map(_,[]) -> [];
% map(F, [H|T]) -> [F(H)|map(F,T)].
% 使用列表解析写map
map(F,L) -> [F(X) || X <- L].



% 列表解析
% [2*X || X <- L].
% 记号[F(X) || X <- L]  结果 由 F(X) 组成的列表，其中X取值于列表L
%  || 叫做： 记号


% 快速排序 ++ （中缀添加操作符）
qsort([]) -> [];
qsort(Pivot|T) -> 
	qsort([X || X <- T], X < Pivot)
	++ [Pivot] ++
	qsort([X || X <- T, X >= Pivot]).

%  毕达哥拉斯三元组：是一个整数集合{A,B,C} ,它使
%  得 A^2+B^2 = C^2


% 阶乘
fac(0) -> 0;
fac(N) -> N*(N-1).


%% 常用语法，表达式
% +，-，*，/
% div(取整)，rem(求余)
% bnot X 对X按位取反
% X band Y 对X和Y按位取与
% X bor Y 对X和Y按位进行异或
% X bsl N 对X按位左移N位
% X bsr N 对X按位右移N位

% 断言
% max(X,Y) when X > Y -> X;
% max(X,Y) -> Y.


% 断言谓词
% is_atom(X) x 是原子
% is_binary(X) 二进制
% is_constant(X) 常数
% is_float(X)	浮点数
% is_function(X) 函数
% is_function(X,N) X 是有N个参数的函数

% is_integer(X) 整数
% is_list(X) 列表
% is_number(X) 整数或浮点数
% is_pid(X) 进程标示符
% is_port(X) X 端口
% is_reference(X) 引用

% is_tuple(X) 元组
% is_record(X,Tag) X 是 标记为Tag的记录
% is_record(X,Tag,N) X是标记为Tag大小为N的记录


% abs(X) 绝对值
% element(N,X) 元组X的第N个元素
% float(X) 将数字X转换为浮点数
% hd(X) 列表X的头部
% length(X) 列表X的长度
% node() 当前节点
% node(X)		创建X的节点，X可以是进程标示符、引用或端口
% round(X)	将数字X转换为整数（四舍五入）
% self()		当前进程的进程标示符
% size(X)		X的大小，X为元组或二进制数据
% trunc(X)	将数字X转换为整数（截取）
% tl(X)		列表X的尾部

% 断言关键字有：when , ",",";",or,orelse,and,true

% 记录：就是更好的操作元组，记录的定义可以包含在Erlang源代码或以.hrl为扩展名的文件中

% -record(todo,{key1 = value1,key2=value2})  todo 记录的名字，key1,key2,字段名



%  定义记录


% 2> rr("records.hrl").   读取记录
% [todo]
% 3> 
% 3> X = #todo{}.
% #todo{status = reminder,who = joe,text = undefined}
% 4> X1 = #todo{status = urgent,text = "hello world"}.
% #todo{status = urgent,who = joe,text = "hello world"}
% 5> X2 = X1#todo{status = done}.   复制一个存在的记录（创建一个X1的副本）
% #todo{status = done,who = joe,text = "hello world"}
% 6> X1.
% #todo{status = urgent,who = joe,text = "hello world"}
% 7> X2.

% 语法#todo{key1 = Value1,...,keyN = ValN} 用于创建类型为todo的新纪录

% 模式匹配 、 使用“.” 提取记录之中某个字段的值
% X2#todo.text.

%  记录只是元组的伪装
%  记录就是元组，在shell中释放掉记录，之后就是元组，在系统内部只有元组


%  定义记录
% -record(todo,{status = reminder,who = joe,text}).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%% case 表达式
% case Expression of
% 	Pattern1 [when Guard1] -> Expr_seq1;
% 	pattern2 [when Guard2] -> Expr_seq2;
% 	...
% end

%  if 语句
% if
% 	guard ->
% 		body;
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% try catch 结构
% try expression of
% 	pattern when guard ->
% 		body
% catch
% 	pattern when guard ->
% 		body
% after
% 	body
% end

%  记住erlang 中的任何东西是表达式，而所有的表达式都有值

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% bif 内建函数 不是用erlang代码编写，通常用来完成不能用erlang代码完成的事儿
%  tuple_to_list({}) 元组转化为列表
% <<1,2,3>> 二进制数据（0-255）
% @spec list_to_binary(tolist) ->binary() 列表转化为二进制数据
% term_to_binary(Term) - >Bin可以将任何erlang值转化为二进制数据
%  binary_to_term(Bin) -> Term 同上逆方向
% ............................
% 比特语法
%  M = <<X:3,Y:7,Z:6>>. X 占3个字节，Y占7个字节，Z占6个字节

% ============================ 函数引用
% 当前模块的引用 ； 外部模块的引用
% fun LocalFunc/Arity 当前模块的引用
% fun Mod:RemoteFunc/Arity 外部模块的引用

%  列表操作符号
% A++B A列表和B列表合并（B附加到A上）
% A--B 从A中删除B列表

% ==================== 进程字典 ========
% Erlang 的每一个进程豆油自己的私有数据存储，叫做进程字典。进程字典是由一系列键值对组成的关联数组
%  put(Key,Value) -> OldValue . 向进程字典加入一个Key Value 键值对，返回的时前一个关联值，如果之前没有关联过值，则返回原子undefined
% get(Key) -> Value. 
%  get() -> [{Key,Value}] 以{Key,Value} 元组列表的形式返回整个字典
%  get_keys(Value) -> [Key]. 返回字典中值为Value的键的列表
%  erase(Key) -> Value . 如果字典中存在键Key对应的值，那么返回对应的值，
%  否则返回原子undefine 最后，删除与键Key相关的值
%  erase() -> [{Key,Value}] 删除整个进程字典


% ---------------- 短路布尔表达式
% Expr1 orelse Expr2  expr1 为true不运算Expr2
% Expr1 andalso Expr2 expr1 为true运算Expr2

% ---- 并发编程
%  RPC ( remote procedure call) 远程过程调用 ： 用来封装发送请求和等待回应
%  erlang:system_info(process_limit). 用来检查系统允许的创建的进程上线

%  注册进程
%  register(AnAtom,Pid) 将一个进程Pid注册一个名为AnAtom的原子
%  unregister(AnAtom) 移除注册进程消息
%  ps: 如果一个注册进程死亡，那么它也会被自动取消注册
%  whereis(AnAtom) -> Pid | undefined 判断AnAtom是否已经被其他进程注册。
% 		如果成功，则返回进程标示符 Pid.如果AnAtom没有与之对应的进程，那么返回原子undefined.
%  registered() -> [AnAtom::atom()] 返回一个系统中所有已经注册的名称列表
%  for example
% Pid = spawn(fun area_server0:loop/0).
% register(area,Pid).
% % 使用
% area ! {rectangle,4,5}.

% ----------------------------------------
%  使用MFA启动进程 对于热更新有很大好处
%  spawn(Mod,FuncName,Args) 
%  新进程会从函数Mod:FuncName(Arg1,Arg2,Arg3,...,ArgN) 开始执行

