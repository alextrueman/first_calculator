@f = File.open('calc.rb', 'w')

first_el = "p 'enter first'
first = gets.chomp.to_i
p 'enter second'
second = gets.chomp.to_i
p 'enter action just: /, +, -, *'
action = gets.chomp"

last_el = "
case action
when '*' then p multiple(first, second)
when '/' then p devide(first, second)
when '-' then p minus(first, second)
when '+' then p plus(first, second)
else
  p 'error, wrong action'
end
"
@f.write first_el

def generator(action_name, action)
  (1..100).each do |first|
    (1..100).each do |second|
      act = first.method(action)
      @f.write "\n  return #{act.call(second)} if first == #{first} && second == #{second}"
    end
  end
end

{plus: '+', minus: '-', multiple: '*', devide: '/'}.each do |action_name, action|
  @f.write "\n\ndef #{action_name}(first, second)"
  generator action_name, action
  @f.write "\nend"
end

@f.write last_el
