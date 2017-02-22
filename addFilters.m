% script for add filters to some pictures.

disp('Start config');
files = dir;
extension = 'png';
s = size(files);

% iterate the files
disp('Iterate files');
for j = 1:s(1)
    disp('...');
    name = files(j).name;
    
    if( verifyType(name, extension) == 1) % is a image
        disp('Is a image');
        for f=1:5 % iterate the filters
            disp('Apply filter - ');
           switch f
               case 1 %apply filter
                   img = gpuArray(imread(name));
                   h = fspecial('motion', 40, 35);
                   imgO = imfilter(img, h);
                   n = strcat(strtok(name, '.'), '_sample1.', extension); %name of output file
                   imwrite( gather(imgO),n); %save file
                   disp(1);
               case 2 %apply filter
                   img = gpuArray(imread(name));
                   h = fspecial('disk', 25);
                   imgO = imfilter(img, h);
                   n = strcat(strtok(name, '.'), '_sample2.', extension); %name of output file
                   imwrite( gather(imgO),n); %save file
                   disp(2);
               case 3 %apply filter
                   img = gpuArray(imread(name));
                   imgO = imnoise(img,'salt & pepper',0.75);
                   n = strcat(strtok(name, '.'), '_sample3.', extension); %name of output file
                   imwrite( gather(imgO),n); %save file
                   disp(3);
               case 4 %apply filter
                   img = gpuArray(imread(name));
                   imgO = imrotate(img,0.05);
                   n = strcat(strtok(name, '.'), '_sample4.', extension); %name of output file
                   imwrite( gather(imgO),n); %save file
                   disp(4);
               case 5 %apply filter
                   img = gpuArray(imread(name));
                   imgO = flipdim(img,1); %flip to top
                   n = strcat(strtok(name, '.'), '_sample5.', extension); %name of output file
                   imwrite( gather(imgO),n); %save file
                   disp(5);
           end
        end
    end
end