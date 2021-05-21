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