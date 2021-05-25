%% %Задание 1
clear;
filename = 'fileExcel.xlsx';
[num,txt] = xlsread(filename, 'A2:B6');
answer1 = "";
answer2 = "";
c=1;
d=1;
for a=1:1:5
    if txt(a,2)=="Руководитель"
        answer1(c) = string(txt(a,1))
        c = c+1;
    else
        answer2(d) = string(txt(a,1))
        d=d+1;
    end
end
answer1 = join(answer1, '; ');
answer2 = join(answer2, '; ');
answerTable = array2table(["Руководитель" answer1; "Исполнитель" answer2]);
writetable(answerTable,'OutFile.xlsx');
%% %Задание 2
clear;
filename = 'fileExcel.xlsx';
outFileName = 'OutFile.xlsx';
fileRange = 'A2:B6';

[num,txt] = xlsread(filename, fileRange);

posts = unique(txt(:,2));
postsSize = size(posts);
answers = "";
for b = 1:1:postsSize(1)
    i = 1;
    for a=1:1:5
        if string(txt(a,2))==string(posts(b))
            answers(b,i) = string(txt(a,1));
            i=i+1;
        end
    end
end
answersStr ="";
for b = 1:1:postsSize(1)
    answersStr(b) = "";
end
for a =1:1:postsSize(1)
    answersStr(a) = join(answers(:,a), '; ');
end
answerMass=[posts(1) answersStr(1)];
for a =2:1:postsSize(1)
    answerMass = [answerMass; posts(a) answersStr(a)];
end

answerTable = array2table(answerMass);
writetable(answerTable, outFileName);
%% %Задание 3
clear;
filename = 'Data_18032020.xlsx';
fileRange = 'A1:H32';
[num,txt,k] = xlsread(filename, fileRange);
outFileName = 'New_Data_18032020.xlsx';
k{1,9} = "Возраст";
now = clock;
for a = 2:1:32
    c = datevec(datetime(k{a,3},'InputFormat','dd.mm.yyyy'));
    k{a,9} = (now - c);
    k{a,9} = k{a,9}(1);
end
k{1,10} = "Длина id1 и id2 = 11";
for a = 2:1:32
    if ~isnan(k{a, 4})
        t = strlength(string((k{a, 4})));
        if t ==11
            k{a,10} = t ==11;
        end
    end
    if ~isnan(k{a, 5})
        t = strlength(string((k{a, 5})));
        if t ==11
            k{a,10} = t ==11;
        end
    end
    if size(k{a, 10}) == 0
        k{a, 10} = false;
    end
end
k{1,11} = "K(авт)";
k{1,12} = "Значение по K(авт)";
for a = 2:1:32
    k{a,11} = k{a,6}/k{a,7};
    if k{a,11}>0.5
        k{a,12} = 1;
    elseif k{a,11}<=0.5 && k{a,11}>0.4
        k{a,12} = 0.8;
    elseif k{a,11}<=0.4 && k{a,11}>0.3
        k{a,12} = 0.6;
    elseif k{a,11}<=0.3 && k{a,11}>0.2
        k{a,12} = 0.4;
    elseif k{a,11}<=0.2 && k{a,11}>0.1
        k{a,12} = 0.2;
    elseif k{a,11}<=0.1
        k{a,12} = 0.1;
    end
end
answerTable = cell2table(k);
writetable(answerTable, outFileName);