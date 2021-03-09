A = rand(3);
fileID = fopen ('matrix.txt', 'w');
fprintf(fileID,"%4.4f %4.4f %4.4f\n", A');
fclose(fileID); 
