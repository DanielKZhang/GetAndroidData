clc
clear 
Path = "C:\Users\15022\Documents\MATLAB\data";
file = dir(fullfile(Path, "*.txt"))
filenames = {file.name}
for i = 1 :  length(filenames)
    name =  filenames(i)
    name = name{1}
    if name(1) == 't'
        a1 = textread(name)
        figure()
        plot(a1)
        title(name)
    end
end