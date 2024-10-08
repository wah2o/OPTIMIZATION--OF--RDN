
%
% Copyright (c) 2015, Mostapha Kalami Heris & Yarpiz (www.yarpiz.com)
% All rights reserved. Please read the "LICENSE" file for license terms.
%
% Project Code: YPEA111
% Project Title: Implementation of TLBO in MATLAB
% Publisher: Yarpiz (www.yarpiz.com)
% 
% Developer: Mostapha Kalami Heris (Member of Yarpiz Team)
% 
% Cite as:
% Mostapha Kalami Heris, Teaching-Learning-based Optimization in MATLAB (URL: https://yarpiz.com/83/ypea111-teaching-learning-based-optimization), Yarpiz, 2015.
% 
% Contact Info: sm.kalami@gmail.com, info@yarpiz.com
%

function [g_best,BestCosts]=tlbo 
format long;
%% Problem Definition

% Cost Function
%CostFunction = @(x) Sphere(x);

nVar = 2;          % Number of Unknown Variables
VarSize = [1 nVar]; % Unknown Variables Matrix Size

VarMin = [1000 2];       % Unknown Variables Lower Bound
VarMax = [2300 33];       % Unknown Variables Upper Bound

%% TLBO Parameters

MaxIt = 100;        % Maximum Number of Iterations

nPop = 50;           % Population Size

%% Initialization 

% Empty Structure for Individuals
empty_individual.Position = [];
empty_individual.Cost = [];

% Initialize Population Array
pop = repmat(empty_individual, nPop, 1);

% Initialize Best Solution
GlobalBest.Cost = inf;

% Initialize Population Members
for i = 1:nPop
    pop(i).Position = unifrnd(VarMin, VarMax, VarSize);
    pop(i).Cost = Load_Flow(pop(i).Position);
    
    if pop(i).Cost < GlobalBest.Cost
        GlobalBest = pop(i);
    end
end

% Initialize Best Cost Record
BestCosts = zeros(MaxIt, 1);

%% TLBO Main Loop

for it = 1:MaxIt
    
    % Calculate Population Mean
    Mean = 0;
    for i = 1:nPop
        Mean = Mean + pop(i).Position;
    end
    Mean = Mean/nPop;
    
    % Select Teacher
    Teacher = pop(1);
    for i = 2:nPop
        if pop(i).Cost < Teacher.Cost
            Teacher = pop(i);
        end
    end
    
    % Teacher Phase
    for i = 1:nPop
        % Create Empty Solution
        newsol = empty_individual;
        
        % Teaching Factor
        TF = randi([1 2]);
        
        % Teaching (moving towards teacher)
        newsol.Position = pop(i).Position ...
            + rand(VarSize).*(Teacher.Position - TF*Mean);
        
        % Clipping
        newsol.Position = max(newsol.Position, VarMin);
        newsol.Position = min(newsol.Position, VarMax);
        
        % Evaluation
        newsol.Cost = Load_Flow(newsol.Position);
        
        % Comparision
        if newsol.Cost<pop(i).Cost
            pop(i) = newsol;
            if pop(i).Cost < GlobalBest.Cost
                GlobalBest = pop(i);
            end
        end
    end
    
    % Learner Phase
    for i = 1:nPop
        
        A = 1:nPop;
        A(i) = [];
        j = A(randi(nPop-1));
        
        Step = pop(i).Position - pop(j).Position;
        if pop(j).Cost < pop(i).Cost
            Step = -Step;
        end
        
        % Create Empty Solution
        newsol = empty_individual;
        
        % Teaching (moving towards teacher)
        newsol.Position = pop(i).Position + rand(VarSize).*Step;
        
        % Clipping
        newsol.Position = max(newsol.Position, VarMin);
        newsol.Position = min(newsol.Position, VarMax);
        
        % Evaluation
        newsol.Cost = Load_Flow(newsol.Position);
        
        % Comparision
        if newsol.Cost<pop(i).Cost
            pop(i) = newsol;
            if pop(i).Cost < GlobalBest.Cost
                GlobalBest = pop(i);
            end
        end
    end
    
    % Store Record for Current Iteration
    BestCosts(it) = GlobalBest.Cost;
    
    % Show Iteration Information
    disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(BestCosts(it))]);
    
end
g_best=GlobalBest.Position;
%% Results


%endg_best=GlobalBest.Position;
%g_best=GlobalBest.Position;
%% --------------------------------------------------------
