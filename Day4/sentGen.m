a = cell(2,3);
a(1,:) = {'John','Emma','Steven'};
a(2,:) = {'great','interesting','fine'};
c = randi(3);
d = randi(3);
disp([a(1,c) 'is' a(2,d)]);

names = struct('name', {a(1,1),a(1,2),a(1,3)}, 'adj',{a(2,1),a(2,2),a(2,3)});
disp(names);
person = names(2);

disp(person.adj);