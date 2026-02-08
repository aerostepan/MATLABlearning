function v = Fibbo3(n)
F = [1 1];

helper(n)
v=F(n);

function helper(n)
if numel(F) < n
    helper(n-1)
    F(n)=F(n-1)+F(n-1);
end

end
end

