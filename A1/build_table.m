function table = build_table(filename)

[invited, first_name, last_name1, last_name2, last_name3] = textread(filename, '%c %s %s %s %s');
num_data = length(invited);
firstname = string(first_name);
lastname = strings(num_data,1);
for i = 1:num_data
    if ~cellfun(@isempty,(last_name3(i)))
        lastname(i) = last_name3(i);
    elseif ~cellfun(@isempty,(last_name2(i)))
        lastname(i) = last_name2(i);
    else
        lastname(i) = last_name1(i);
    end
end

feature_table = zeros(num_data, 7);

for i = 1:num_data
    % Convert '+' and '-' in invited into 1 & 0
    if invited(i) == '+'
        feature_table(i, 7) = 1;
    else
        feature_table(i, 7) = 0;
    end
    
    % 1. Is their first name longer than their last name?
    if strlength(firstname(i)) > strlength(lastname(i))
        feature_table(i, 1) = 1;
    end
    
    % 2. Do they have a middle name?
    if lastname(i) ~= last_name1(i)
        feature_table(i, 2) = 1;
    end
    
    % 3. Does their first name start and end with the same letter? (ie "Ada")
    firstname_char = char(firstname(i));
    if strncmpi(firstname_char(1), firstname_char(end), 1)
        feature_table(i, 3) = 1;
    end
    
    % 4. Does their first name come alphabetically before their last name? 
    % (ie "Dan Klein" because "d" comes before "k")
    temp_f = char(firstname(i));
    first_c = temp_f(1);
    temp_l = char(lastname(i));
    last_c = temp_l(1);
    if (last_c - first_c) > 0
        feature_table(i, 4) = 1;
    end
    
    % 5. Is the second letter of their first name a vowel (a,e,i,o,u)?firstname_char = char(firstname(i));
    if length(temp_f) == 1
        feature_table(i, 5) = 0;
    elseif strncmpi(firstname_char(2), 'a', 1) || strncmpi(firstname_char(2), 'e', 1)...
        || strncmpi(firstname_char(2), 'i', 1) || strncmpi(firstname_char(2), 'o', 1)...
        || strncmpi(firstname_char(2), 'u', 1)
        feature_table(i, 5) = 1;
    end
    
    % 6. Is the number of letters in their last name even?
    lastname_char = char(lastname(i));
    if mod(length(lastname_char), 2) == 0
        feature_table(i, 6) = 1;
    end
end

table = feature_table;

