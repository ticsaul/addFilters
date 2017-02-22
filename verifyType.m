function response = verifyType( name, extension )
    response = 0;
    k = strfind(name, extension);
    
    if(k>0)
        response = 1;
    end
end