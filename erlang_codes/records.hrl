

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



-record(todo,{status = reminder,who = joe,text}).
