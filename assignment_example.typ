#import "template.typ": *
#let title = "Assignment #4"
#let author = "Alice Bob"
#let course_id = "CS101"
#let instructor = "Turing, Alan"
#let semester = "Spring 2023"
#let due_time = "April 3 at 23:59"
#set enum(numbering: "a)")
#show: assignment_class.with(title, author, course_id, instructor, semester, due_time)

#prob[
// + $A=mat(1,-1;-1,1;1,1)$
1. when $min(norm(bold(x))_2)$, $bold(x) = bold(x^*)$ is the solution to the problem, which is $x^*=vec(1/sqrt(3),1/sqrt(3),1/sqrt(3))$

2. We have a matrix $bold(A) = mat(1,1;1,1;1,0)$, the projection operator is $ bold(P) = bold(A)(bold(A)^T A)^(-1)bold(A)^T = mat(1/2,1/2,0;1/2,1/2,0;0,0,1), $ hence, $ bold(x^*) = bold(P) bold(v)  = vec(1/2,1/2,1). $ 

3. We have a  matrix $bold(A) = mat(1,-1;-1,1;2,2)$, the projection operator is $ bold(P) = bold(A)(bold(A)^T A)^(-1)bold(A)^T = mat(1/2,-1/2,0;-1/2,1/2,0;0,0,1), $ hence, $ bold(x^*) = bold(P) bold(v)  = vec(1/2,-1/2,0). $
]

#prob[
// + $ op("prox")_g (bold(y)) = arg min_(bold(x in RR ^n)) {1/2 norm(bold(x)-bold(y))^2 + g(bold(x))}. $ 
1. we know that:
$ prox_phi (z) = argmin_(x in RR) {1/2 norm(x-z)^2 + phi.alt(x-c)}. $ 
let $x prime =x-c$ $ op("prox")_phi (z) = argmin_(x in RR) {1/2 norm(x prime-(z-c))^2 + phi.alt(x'+c-c)}+c = op("prox")_phi.alt (z-c)+c. $

2. if we want to $ f(x) = 1/2 norm(x-z)^2 + phi.alt(x)$ to be minimized, we need to find the $x$ that makes the derivative of the function equal to zero.
we know 
$ diff f(x) =  cases(x-z + lambda "when " x>0, [x-z - lambda,x-z + lambda] "when" x=0, x-z - lambda "when" x<0)  $. 
Hence, let $ diff f(x) = 0 $, we have
$ prox_phi.alt(z) = x^* = cases(z-lambda "when " z>lambda,
[z-lambda,z+lambda] "when" z in [-lambda,lambda],
 z + lambda "when" z < -lambda) . $
 
3. if $phi(x) = lambda abs(x-c)$, where $c in RR$ and $lambda>0$. Use the result from part a. 
$ prox_phi(z) = prox_phi.alt(z-c)+c  = cases(z-lambda "when " z>lambda + c,
[z-lambda,z+lambda] "when" z in [-lambda+c,lambda+c],
 z + lambda "when" z < -lambda+c) $
]

#prob[
1. If we take the derivative of $1/2 norm(bold(x)-bold(x)^(t-1))^2 + gamma g(bold(x))$, we have
$ bold(x^t) = prox_(gamma g)(bold(x)^(t-1)) =  bold(x)^(t-1) - gamma nabla g(bold(x^t)) $

2. By the convexity of $g$, we know that $g(bold(x)^(t)) +nabla g(bold(x^(t)))^T (bold(x)^(t-1)-bold(x^t))<= g(bold(x^(t-1)))$. Hence, we have
$ g(bold(x)^(t)) <= g(bold(x^(t-1))) - nabla g(bold(x^(t)))^T (bold(x)^(t-1)-bold(x^t)) = g(bold(x^(t-1))) - gamma nabla norm(g(bold(x^(t))))^2_2 $

3. because $bold(x^t) =  bold(x)^(t-1) - gamma nabla g(bold(x^t))$ which is a gradient descent method, so
$ -oo<g(bold(x)^t)<=g(bold(x)^(t-1)) $ and we have $ g(bold(x)^(t)) <=  g(bold(x^(t-1))) - gamma nabla norm(g(bold(x^(t))))^2_2 $ hence $ 0<=gamma nabla norm(g(bold(x^(t))))^2_2<=0 $ if $ t arrow +oo $
]

#prob[
1. because
$ 
diff f(bold(x)) =  {bold(v) in RR^n : f(bold(y))>= f(bold(x))+ bold(v)^T (bold(y)-bold(x)),forall bold(y) in RR^n}
$
if $g(bold(x)) = theta f(bold(x))$, 
$ 
diff g(bold(x)) =  {bold(v) in RR^n : g(bold(y))>= g(bold(x))+ bold(v)^T (bold(y)-bold(x)),forall bold(y) in RR^n} $
$ diff g(bold(x))={bold(v) in RR^n : theta f(bold(y))>= theta f(bold(x))+ bold(v)^T (bold(y)-bold(x)),forall bold(y) in RR^n}
$
$ diff g(bold(x))={bold(v) in RR^n : f(bold(y))>= f(bold(x))+ bold(v)^T/theta (bold(y)-bold(x)),forall bold(y) in RR^n}
$
$ diff g(bold(x))=theta {bold(v) in RR^n : f(bold(y))>= f(bold(x))+ bold(v)^T (bold(y)-bold(x)),forall bold(y) in RR^n} = theta diff f(bold(x))
$

2. 
$ 
diff h(bold(x)) =  {bold(v) in RR^n : f(bold(y))+g(bold(y))>= f(bold(x))+g(bold(x))+ bold(v)^T (bold(y)-bold(x)),forall bold(y) in RR^n} $
all of the elements that satisfy $ f(bold(y))>= f(bold(x))+ bold(v)^T (bold(y)-bold(x)),forall bold(y) in RR^n $ and $ g(bold(y))>= g(bold(x))+ bold(v)^T (bold(y)-bold(x)),forall bold(y) in RR^n $  are in the set $ diff h(bold(x)) $ hence $ diff f(bold(x)) + diff g(bold(x)) subset.eq diff h(bold(x)) $ 

3. we know that $ diff norm(x)_1 =  cases(1 "when " x>0, [-1,1] "when" x=0, -1 "when" x<0)  $. 
hence $op("sgn")(x) in diff norm(x)_1$.
]

#prob[

2. Not differentiable at $bold(x)=bold(0)$, and $h$ is convex.

3. $ nabla [1/2 norm(bold(x)-bold(y))_2^2 + gamma lambda norm(x)_1 ] =  cases(x-y + gamma lambda "when " x>0, [x-y - gamma lambda,x-y +gamma lambda] "when" x=0, x-y - gamma lambda "when" x<0)  $. 
let it be $0$,  we have
$ prox_(gamma g(y)) = x^* = cases(y-gamma lambda "when " y>lambda ,
[y-gamma lambda,y+gamma lambda] "when" y in [-gamma lambda,gamma lambda],
 y + gamma lambda "when" y < -gamma lambda) . $

```matlab 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% load the variables of the optimization problem
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load('dataset.mat');

[p, n] = size(A);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% set up the function and its gradient
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

evaluate_f = @(x) (1/n)*sum(log(1+exp(-b.*(A'*x))));
evaluate_gradf = @(x) (1/n)*A*(-b.*exp(-b.*(A'*x))./(1+exp(-b.*(A'*x))));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% parameters of the gradient method
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

xInit = zeros(p, 1); % zero initialization
stepSize = 1; % step-size of the gradient method
maxIter = 1000; % maximum number of iterations

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% optimize
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% initialize
x = xInit;

% keep track of cost function values
objVals = zeros(maxIter, 1);

% iterate
for iter = 1:maxIter
    
    % update
    xNext = x - stepSize*evaluate_gradf(x);
    
    % evaluate the objective
    funcNext = evaluate_f(xNext);
    
    % store the objective and the classification error
    objVals(iter) = funcNext;
    
    fprintf('[%d/%d] [step: %.1e] [objective: %.1e]\n',...
        iter, maxIter, stepSize, objVals(iter));
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % begin visualize data
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % plot the evolution
    figure(1);
    set(gcf, 'Color', 'w');
    semilogy(1:iter, objVals(1:iter), 'b-',...
        iter, objVals(iter), 'b*', 'LineWidth', 2);
    grid on;
    axis tight;
    xlabel('iteration');
    ylabel('objective');
    title(sprintf('GM (f = %.2e)', objVals(iter)));
    xlim([1 maxIter]);
    set(gca, 'FontSize', 16);
    drawnow;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % end visualize data
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % update w
    x = xNext;
end
```
]