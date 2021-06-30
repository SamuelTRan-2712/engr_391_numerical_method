%ENGR 391 script
%Coded and tested on MATLAB version 2020A, use version 2020A in case of issues that can arise with older or newer versions. 
%Requires the symbolic math toolkit to run
%Provided free of charge. 

%creating script setting variables (can be modified through the script or main menu)
global precision;       %variable used to indicate the precision (how many digits in float numbers) in console outputs, default at 15. Higher = more accurate, at cost of cluttering display
precision = 15;
global resolution;      %variable used to indicate the resolution of numerical calculations. value must be greater than 0. Value closer to zero are more accurate (i.e. 0.001 better than 0.01). default at 0.01. Smaller = more accurate, at cost of computing time 
resolution = 0.01;
global clearConsole;    %variable used to indicate whether to clear the screen after each method is done running, set at 1 to clear console, 0 to keep console uncleared.      
clearConsole = 1;       

clc;            %clearing console
clear;          %clearing variables
main();         %executing script
clc;            %clearing console after script exit

% ================== MAIN MENU ==================
function main()
    %declaring global variable 
    global precision;
    global resolution;
    global clearConsole;
    
    %Starting main menu loop, stops after user exits
    while(true)
        
        %printing main menu
        disp("=========================== Main Menu ===========================");
        disp("[1]  Chapter 1 - Taylor Series");
        disp("[2]  Chapter 2 - Nonlinear Equations");
        disp("[3]  Chapter 3 - Linear System of Equations");
        disp("[4]  Chapter 4 - Regression and Interpolation");
        disp("[5]  Chapter 5 - Introduction to Machine learning");
        disp("[6]  Chapter 6 - Numerical Differentiation");
        disp("[7]  Chapter 7 - Numerical Integration");
        disp("[8]  Chapter 8 - Initial Value Problem");
        fprintf("[9]  Set script settings. Currently, precision = %d, resolution = %.16f, clearConsole = %d\n",precision,resolution,clearConsole);        
        disp("[10] Exit");
        
        %prompting user for option
        x = input("Select an option: ");
        
        %validating user input (checking if menu option given is valid, if not, prompting until valid option is selected)
        while(x < 1 || x > 10)
            x = input("Invalid option, please try again: ");
        end
        
        %execute option selected by user
        switch x
            case (1)
                if(clearConsole)
                    clc;            %clear main menu from console
                end
                Chapter1();     %run chapter 1 menu
                if(clearConsole)
                    clc;            %clear chapter 1 variable from console upon returning to main menu
                end
            case (2)
                if(clearConsole)
                    clc;            %clear main menu from console
                end
                Chapter2();     %run chapter 2 menu
                if(clearConsole)
                    clc;            %clear chapter 2 variable from console upon returning to main menu
                end
            case (3)
                if(clearConsole)
                    clc;            %clear main menu from console
                end
                Chapter3();     %run chapter 3 menu
                if(clearConsole)
                    clc;            %clear chapter 3 variable from console upon returning to main menu
                end
            case (4)
                if(clearConsole)
                    clc;            %clear main menu from console
                end
                Chapter4();     %run chapter 4 menu
                if(clearConsole)
                    clc;            %clear chapter 4 variable from console upon returning to main menu
                end
            case (5)
                if(clearConsole)
                    clc;            %clear main menu from console
                end
                Chapter5();     %run chapter 5 menu
                if(clearConsole)
                    clc;            %clear chapter 5 variable from console upon returning to main menu
                end
            case (6)
                if(clearConsole)
                    clc;            %clear main menu from console
                end
                Chapter6();     %run chapter 6 menu
                if(clearConsole)
                    clc;            %clear chapter 6 variable from console upon returning to main menu
                end
            case (7)
                if(clearConsole)
                    clc;            %clear main menu from console
                end
                Chapter7();     %run chapter 7 menu
                if(clearConsole)
                    clc;            %clear chapter 7 variable from console upon returning to main menu
                end
            case (8)
                if(clearConsole)
                    clc;            %clear main menu from console
                end
                Chapter8();     %run chapter 8 menu
                if(clearConsole)
                    clc;            %clear chapter 8 variable from console upon returning to main menu
                end
            case (9)
                if(clearConsole)
                    clc;            %clear main menu from console
                end
                SetSettings();  %prompt user to modify script settings
                if(clearConsole)
                    clc;            %clear precision function output from console upon returning to main menu
                end
            case (10)
                break;          %exit program
            otherwise
                if(clearConsole)
                    clc;            %clear main menu from console
                end
                continue;       %fail safe, default case: should the input be invalid, prompts again
        end
    end
    
    %clearing all variables upon exit
    clear;
    
    %END OF SCRIPT
end
function SetSettings()
    %declaring global "precision" variable 
    global precision;
    global resolution;
    global clearConsole;
    
    disp("Default value for precision is 15, resolution 0.01 and clearConsole is 1");
    
    %prompting uer for new precision value
    precision = input("Enter the amount of decimal digits to display for solutions (0-16), higher value is more precise: ");
    while~(-1<precision<17)
        precision = input("Invalid input, Enter the amount of decimal digits to display for solutions (0-16): ");
    end
    
    %prompting uer for new resolution value
    resolution = input("Enter the resolution to use for numerical calculations (greater than 0), values closer to 0 are more precise, i.e. 0.00001 more precise than 0.001: ");
    while(resolution<0)
        resolution = input("Invalid input, Enter the resolution to use for solutions (greater than 0), values closer to 0 are more precise, i.e. 0.00001 more precise than 0.001: ");
    end
        
    %prompting uer for new clearConsole value
    disp("Would you like the script to clear the console between function calls? This helps keep the console screen clean. Disabling this might be useful in cases where you need previous values to remain on screen.");
    clearConsole = input("Enter 1 to clear the console between function calls, 0 to keep history of all function calls: ");
    while((clearConsole ~= 0 && clearConsole ~= 1))
        clearConsole = input("Invalid input, Enter 1 to clear the console between function calls, 0 to keep history of all function calls: ");
    end
end

% ================== Chapter 1 - Taylor Series ==================
function Chapter1()
    %declaring global variable 
    global clearConsole;

    %Starting menu loop, returns to main menu after user exits
    while(true)
        
        %printing Chapter 1 menu
        disp("================= Chapter 1 - Taylor Series =================");
        disp("[1] Taylor's Series");
        disp("[2] Return to main menu");
        
        %prompting user for option
        x = input("Select an option: ");
        
        %validating user input (checking if menu option given is valid, if not, prompting until valid option is selected)
        while(x < 1 || x > 2)
            x = input("Invalid selection, please try again: ");
        end
        
        %execute option selected by user
        switch(x)
            case (1)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                taylor_series();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case (2)
                break;
            otherwise
                continue;
        end
    end
end
function taylor_series()
    %declaring global "precision" variable 
    global precision;
    
    %printing title
    disp("========================= TAYLOR SERIES =========================");
    
    %declaring symbolic variable
    syms x;
    
    %prompting user to enter a function to compute the taylor series of.
    func = input("Enter a function f(x) (use lowercase 'x' for the function's variable): ");         %prompting user for the function
    
    %prompting user to enter the point of approximation of the taylor series (point around which the series is centered)
    point_x = input("Enter the point of approximation x: ");                                         %prompting user for the point of approximation
    
    %prompting user to enter the AMOUNT of taylor series order to compute (not the order itself)
    count = input("How many DIFFERENT orders would you like to compute? (bigger than 0): ");         %prompting user for amount of taylor series order
    
    %validating user input (checking if the count is greater than 0, if not, prompting until valid count is entered)
    while (count < 1)
        count = input("Invalid amount, please try again: ");                                         %prompting user for amount of taylor series order again
    end
    
    %initializing an array to hold the order of each taylor series that is to be computed
    order = zeros(1,count);                                                                          %initializing an array to hold the taylor series order entered by the user
    taylor_func = sym(zeros(1,count));                                                               %initializing a symbolic array to hold the taylor series of each specific order entered by the user
    
    %prompting user to provide the order used to compute the taylor series and store it in the order array. Prompt the amount of orders the user specified earlier
    for k = 1:count
        order(k) = input("Enter the order for the taylor series #" + k + " (must be 0 or over): ");  %prompting user for the taylor series order
        
        %validating user input (checking if the order is 0 or greater, if not, prompting until a valid order is entered)
        while (order(k) < 0)
            order(k) = input("Invalid order, please try again: ");                                   %prompting user for the taylor series order again
        end
    end
    
    %computing taylor series for each order given
    for k = 1:count
        taylor_func(k) = taylor(func,x,point_x,'Order',order(k)+1);                                  %computing the order. Matlab's taylor() function starts its order at 1. Therefore Order 0 = 1, Order 1 = 2, etc.
    end
    
    %prompting user if they would like to plot the original function and the different orders of the taylor series computed
    prmt = input("Would you like to plot the original function and taylor series? [y/n]: ",'s');
    
    %validating user input (checking if y/n is entered)
    while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
        prmt = input("Invalid input, would you like to plot the original function and taylor series? [y/n]: ",'s');
    end
    
    %printing the taylor series on the screen
    fprintf("The taylor series for the function (%s) is: \n",func);
    %looping through each taylor series order
    for k = 1:count
        fprintf("#%d: Taylor series of Order %d: %s\n",k,order(k),taylor_func(k));                    %printing the order and taylor series
    end
    
    %plotting taylor series if user chose to
    if(prmt == "y" || prmt == "Y")
        
        %plotting the original function
        fplot(func,'DisplayName',"Original Function");                                                %plotting the original function
        hold on;                                                                                      %tells matlab to hold all further plots and not overwrite them on top of eachother
        
        %plotting taylor series
        for k = 1:count
            fplot(taylor_func(k),'DisplayName',"Order #" + num2str(order(k)));                        %looping through each taylor series order and plotting it on the graph
        end
        title('Taylor Series Approximaiton');                                                         %setting graph title
        xlabel('x');                                                                                  %setting x-axis label
        ylabel('f(x)');                                                                               %setting y-axis label
        axis auto;                                                                                    %setting axis range (auto) , use ([xmin xmax ymin ymax]) for manual range
        grid on;                                                                                      %setting major grid
        grid minor;                                                                                   %setting minor grid
        legend;                                                                                       %printing legend
        hold off;                                                                                     %tells matlab to stop holding further plots
    end
    
    %prompting user if they would like to compute the truncation error of the taylor series
    prmt = input("Would you like to compute the truncation error? [y/n]: ",'s');
    
    %validating user input (checking if y/n is entered)
    while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
        prmt = input("Invalid input, would you like to compute truncation error? [y/n]: ",'s');
    end
    
    %computing truncation error if user choses to
    if(prmt == "y" || prmt == "Y")
        point_h = input("Enter the point to evaluate the error at (h = ?): ");
        
        %displaying the true value of the function at the point given
        fprintf("The value of the original function (%s) at point h = %.*f is: %.*f\n",func,precision,point_h,precision,subs(func,x,point_h));

        %displaying the truncation error for each taylor series order
        fprintf("The truncation error of the taylor series of the function (%s) at point h = %.*f for the given order(s) is/are: \n",func,precision,point_h);
        for k = 1:count
            fprintf("#%d: Taylor series of Order %d evaluated at point h = %.*f is %.*f. The truncation error is: %.*f\n",k,order(k),precision,point_h,precision,subs(taylor_func(k),x,point_h),precision,abs(subs(func,x,point_h)-subs(taylor_func(k),x,point_h)));
        end
    end
end

% =============== Chapter 2 - Nonlinear Equations ===============
function Chapter2()
    %declaring global variable 
    global clearConsole;
    
    %Starting menu loop, returns to main menu after user exits
    while(true)
        disp("================ Chapter 2 - Nonlinear Equations ================");
        disp("[1] Bisection Method (Bracketing)");
        disp("[2] False Position Method (Bracketing)");
        disp("[3] Fixed Point Method (Open)");
        disp("[4] Newton's Method (Open)");
        disp("[5] Bisection iteration and tolerance");
        disp("[6] Root Multiplicity Calculator");
        disp("[7] Convergence");
        disp("[8] Forward and Backward Error");
        disp("[9] Return to main menu");
        
        %prompting user for option
        x = input("Choose an option: ");
        
        %validating user input (checking if menu option given is valid, if not, prompting until valid option is selected)
        while(x < 1 || x > 9)
            x = input("Invalid input, please try again: ");
        end
        
        %execute option selected by user
        switch(x)
            case(1)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                BisectionMethod();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(2)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                FalsePositionMethod();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(3)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                FixedPointMethod();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(4)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                NewtonMethod();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(5)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                BisectionIterationCount();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(6)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                MultiplicityCalculator();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(7)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                Convergence2();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(8)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                ForwardBackwardError2();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(9)
                break;
            otherwise
                continue;
        end
    end
end
function BisectionMethod()
    %declaring global "precision" variable
    global precision;
    
    %title
    disp("======================== BISECTION METHOD =======================");
    
    %declaring symbolic variable
    syms x;
    
    %prompting user to enter the function to approximate the root of
    func = input("Enter function f(x) = 0 (use lowercase 'x' for the function's variable): ");        %prompting for function
    
    %prompting user whether to plot the function, this helps to guess the initial interval by looking at it graphically
    prmt = input("Would you like to plot the function (helps with guessing interval)? [y/n]: ",'s');  %prompting on whether to plot the function or not
    
    %validating user input (checking if y/n is entered)
    while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
        prmt = input("Invalid input, would you like to plot the function? [y/n]: ",'s');
    end
    
    %plotting the graph if user chose to
    if(prmt == "y" || prmt == "Y")
        fplot(func,'DisplayName',"Original Function");                                                %plotting the original function
        title("Bisection Method");                                                                    %setting graph title
        xlabel("x");                                                                                  %setting x-axis label
        ylabel("f(x)");                                                                               %setting y-axis label
        axis auto;                                                                                    %setting axis range (auto) , use ([xmin xmax ymin ymax]) for manual range
        grid on;                                                                                      %setting major grid
        grid minor;                                                                                   %setting minor grid
        legend;                                                                                       %printing legend
    end
    
    %prompting and validating the starting interval
    while(true)
        pointA = input("Enter the start of the initial interval [a,b], a = : ");                      %prompting for interval start point x = a
        pointB = input("Enter the end of the initial interval [a,b], b = : ");                        %prompting for interval end point x = b
        
        %check if interval is valid, if the case, break out of loop
        if (subs(func,x,pointA)*subs(func,x,pointB) < 0 && pointA <= pointB)
            break;
        end
        
        prmt = input("Invalid guess interval, Would you like to try again? [y/n]: ",'s');
        
        %validating user input (checking if y/n is entered)
        while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
            prmt = input("Invalid input, would you like to try again? [y/n]: ",'s');
        end
        if(prmt == "y" || prmt == "Y")
            continue;
        else
            return;
        end
    end
    
    %storing interval in a and b for later use
    a = pointA;
    b = pointB;
    
    %prompting user for an iteration amount (used to compute the ith iteration of the solution) and validating it
    iteration = input("Enter the amount of iteration to compute to find the solution (-1 to skip): ");
    while (iteration < -1)
        iteration = input("Invalid iteration count, please try again: ");
    end
    
    %prompting user for an absolute tolerance (used to compute solution to ABS_TOL precision) and validating it
    ABS_TOL = input("Enter the absolute tolerance allowed in the solution (-1 to skip): ");
    while ~(ABS_TOL > 0)
        if(ABS_TOL == -1)
            break;
        end
        ABS_TOL = input("Invalid absolute tolerance, must be greater than 0, please try again: ");
    end
    
    %prompting user for a relative tolerance (used to compute solution to REL_TOL precision) and validating it
    REL_TOL = input("Enter the relative tolerance allowed in the solution (-1 to skip): ");
    while ~(REL_TOL > 0)
        if(REL_TOL == -1)
            break;
        end
        REL_TOL = input("Invalid relative tolerance, must be greater than 0, please try again: ");
    end
    
    %converting symbolic function to numerical to speed up computation
    funcderiv = diff(func,x);
    func = matlabFunction(func,'Vars',x);
    funcderiv = matlabFunction(funcderiv,'Vars',x);
    
    %computing bisection method for a specific iteration count
    disp("======= USING ITERATION:");
    for k = 0:iteration
        
        %printing iteration row for the table
        fprintf("iteration #%d: a_%d = %.*f, b_%d = %.*f, x_%d = %.*f, f(a_%d) = %.*f, f(b_%d) = %.*f, f(x_%d) = %.*f, Absolute Error <= +/- %.*f, Relative Error <= +/- %.*f\n",k,k,precision,pointA,k,precision,pointB,k,precision,((pointA + pointB)/2),k,precision,func(pointA),k,precision,func(pointB),k,precision,func((pointA + pointB)/2),precision,((pointB - pointA)/2),precision,abs(func(((pointA + pointB)/2))/(funcderiv(((pointA + pointB)/2))*((pointA + pointB)/2))));
        
        %if reached the last iteration, break out of loop
        if(k == iteration)
            break;
        end
        
        %searching for the new interval (breaks if exact solution is found)
        if ((func(pointA)*func((pointA + pointB)/2)) < 0)                                             %checking if mid point = b
            pointB = ((pointA + pointB)/2);
        elseif((func((pointA + pointB)/2)*func(pointB)) < 0)                                          %checking if mid point = a
            pointA = ((pointA + pointB)/2);
        else                                                                                          %else mid point is solution
            fprintf("Exact solution found after %d iteration\n",k);
            iteration = k;
            break;
        end
    end
    
    %printing the final solution of the bisection method if iteration given
    if(iteration > -1)
        fprintf("The estimated solution to the given function after %d iterations is x = %.*f\n",iteration,precision,((pointA + pointB)/2));
    else
        disp("Solution for iteration was skipped");
    end
    
    %computing bisection method for specified absolute tolerance
    k = 0;                                                                                          %setting iteration to 0
    pointA = a;                                                                                     %setting pointA to a given by user
    pointB = b;                                                                                     %setting pointB to b given by user
    
    disp("======= USING ABSOLUTE TOLERANCE:");
    if(ABS_TOL > 0)
        
        %loop running as long as absolute tolerance of the current iteration is above the absolute tolerance given.
        while((pointB-pointA)/2 > ABS_TOL)
            
            %printing table
            fprintf("iteration #%d: a_%d = %.*f, b_%d = %.*f, x_%d = %.*f, f(a_%d) = %.*f, f(b_%d) = %.*f, f(x_%d) = %.*f, Absolute Error <= +/- %.*f, Relative Error <= +/- %.*f\n",k,k,precision,pointA,k,precision,pointB,k,precision,((pointA + pointB)/2),k,precision,func(pointA),k,precision,func(pointB),k,precision,func((pointA + pointB)/2),precision,((pointB - pointA)/2),precision,abs(func(((pointA + pointB)/2))/(funcderiv(((pointA + pointB)/2))*((pointA + pointB)/2))));
            
            %searching for new interval
            if ((func(pointA)*func((pointA + pointB)/2)) < 0)                                        %checking if mid point = b
                pointB = ((pointA + pointB)/2);
            elseif((func((pointA + pointB)/2)*func(pointB)) < 0)                                     %checking if mid point = a
                pointA = ((pointA + pointB)/2);
            else                                                                                     %else midpoint is solution
                fprintf("Exact solution found after %d iteration\n",k);
                break
            end
            
            %incrementing iteration count
            k = k+1;
            
            %checking if last iteration reached
            if~((pointB-pointA)/2 > ABS_TOL)
                fprintf("iteration #%d: a_%d = %.*f, b_%d = %.*f, x_%d = %.*f, f(a_%d) = %.*f, f(b_%d) = %.*f, f(x_%d) = %.*f, Absolute Error <= +/- %.*f, Relative Error <= +/- %.*f\n",k,k,precision,pointA,k,precision,pointB,k,precision,((pointA + pointB)/2),k,precision,func(pointA),k,precision,func(pointB),k,precision,func((pointA + pointB)/2),precision,((pointB - pointA)/2),precision,abs(func(((pointA + pointB)/2))/(funcderiv(((pointA + pointB)/2))*((pointA + pointB)/2))));
            end
        end
        
        %printing the final solution of the bisection method if absolute tolerance given
        fprintf("The estimated solution to the given function within the absolute tolerance %.*f is x = %.*f after %d iterations\n",precision,ABS_TOL,precision,((pointA + pointB)/2),k);
        fprintf("The theoretical iterations needed for an absolute tolerance of %.*f is n = %d\n",precision,ABS_TOL,ceil(((log(b-a)-log(ABS_TOL))/(log(2)))-1));
    else
        disp("Solution for absolute tolerance was skipped");
    end
    
    %computing bisection method for specified relative tolerance
    k = 0;                                                                                          %setting iteration to 0
    pointA = a;                                                                                     %setting pointA to a given by user
    pointB = b;                                                                                     %setting pointB to b given by user
    
    disp("======= USING RELATIVE TOLERANCE:");
    if(REL_TOL > 0)
        
        %loop running as long as relative tolerance of the current iteration is above the relative tolerance given.
        while(abs(func(((pointA + pointB)/2))/(funcderiv(((pointA + pointB)/2))*((pointA + pointB)/2))) > REL_TOL)
            
            %printing table
            fprintf("iteration #%d: a_%d = %.*f, b_%d = %.*f, x_%d = %.*f, f(a_%d) = %.*f, f(b_%d) = %.*f, f(x_%d) = %.*f, Absolute Error <= +/- %.*f, Relative Error <= +/- %.*f\n",k,k,precision,pointA,k,precision,pointB,k,precision,((pointA + pointB)/2),k,precision,func(pointA),k,precision,func(pointB),k,precision,func((pointA + pointB)/2),precision,((pointB - pointA)/2),precision,abs(func(((pointA + pointB)/2))/(funcderiv(((pointA + pointB)/2))*((pointA + pointB)/2))));
            
            %searching for new interval
            if ((func(pointA)*func((pointA + pointB)/2)) < 0)                                        %checking if mid point = b
                pointB = ((pointA + pointB)/2);
            elseif((func((pointA + pointB)/2)*func(pointB)) < 0)                                     %checking if mid point = a
                pointA = ((pointA + pointB)/2);
            else                                                                                     %else midpoint is solution
                fprintf("Exact solution found after %d iteration\n",k);
                break
            end
            
            %incrementing iteration count
            k = k+1;
            
            %checking if last iteration reached
            if~(abs(((pointB-pointA)/2)/func((pointA+pointB)/2)) > REL_TOL)
                fprintf("iteration #%d: a_%d = %.*f, b_%d = %.*f, x_%d = %.*f, f(a_%d) = %.*f, f(b_%d) = %.*f, f(x_%d) = %.*f, Absolute Error <= +/- %.*f, Relative Error <= +/- %.*f\n",k,k,precision,pointA,k,precision,pointB,k,precision,((pointA + pointB)/2),k,precision,func(pointA),k,precision,func(pointB),k,precision,func((pointA + pointB)/2),precision,((pointB - pointA)/2),precision,abs(func(((pointA + pointB)/2))/(funcderiv(((pointA + pointB)/2))*((pointA + pointB)/2))));
            end
        end
        
        %printing the final solution of the bisection method if relative tolerance given
        fprintf("The estimated solution to the given function within the relative tolerance %.*f is x = %.*f after %d iterations\n",precision,REL_TOL,precision,((pointA + pointB)/2),k);
    else
        disp("Solution for relative tolerance was skipped");
    end
end
function FalsePositionMethod()
    %declaring global "precision" variable
    global precision;
    
    %title
    disp("===================== FALSE POSITION METHOD =====================");
    
    %declaring symbolic variable
    syms x;
    
    %prompting user to enter the function to approximate the root of
    func = input("Enter function f(x) = 0 (use lowercase 'x' for the function's variable): ");        %prompting for function
    
    %prompting user whether to plot the function, this helps to guess the initial interval by looking at it graphically
    prmt = input("Would you like to plot the function (helps with guessing interval)? [y/n]: ",'s');  %prompting on whether to plot the function or not
    
    %validating user input (checking if y/n is entered)
    while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
        prmt = input("Invalid input, would you like to plot the function? [y/n]: ",'s');
    end
    
    %plotting the graph if user chose to
    if(prmt == "y" || prmt == "Y")
        fplot(func,'DisplayName',"Original Function");                                                %plotting the original function
        title("False Position Method");                                                               %setting graph title
        xlabel("x");                                                                                  %setting x-axis label
        ylabel("f(x)");                                                                               %setting y-axis label
        axis auto;                                                                                    %setting axis range (auto) , use ([xmin xmax ymin ymax]) for manual range
        grid on;                                                                                      %setting major grid
        grid minor;                                                                                   %setting minor grid
        legend;                                                                                       %printing legend
    end
    
    %prompting and validating the starting interval
    while(true)
        pointA = input("Enter the start of the initial interval [a,b], a = : ");                      %prompting for interval start point x = a
        pointB = input("Enter the end of the initial interval [a,b], b = : ");                        %prompting for interval end point x = b
        
        %check if interval is valid, if the case, break out of loop
        if (subs(func,x,pointA)*subs(func,x,pointB) < 0 && pointA <= pointB)
            break;
        end
        
        prmt = input("Invalid guess interval, Would you like to try again? [y/n]: ",'s');
        
        %validating user input (checking if y/n is entered)
        while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
            prmt = input("Invalid input, would you like to try again? [y/n]: ",'s');
        end
        if(prmt == "y" || prmt == "Y")
            continue;
        else
            return;
        end
    end
    
    %storing interval in a and b for later use
    a = pointA;
    b = pointB;
    
    %prompting user for an iteration amount (used to compute the ith iteration of the solution) and validating it
    iteration = input("Enter the amount of iteration to compute to find the solution (-1 to skip): ");
    while (iteration < -1)
        iteration = input("Invalid iteration count, please try again: ");
    end
    
    %prompting user for an absolute tolerance (used to compute solution to ABS_TOL precision) and validating it
    ABS_TOL = input("Enter the absolute tolerance allowed in the solution (-1 to skip): ");
    while ~(ABS_TOL > 0)
        if(ABS_TOL == -1)
            break;
        end
        ABS_TOL = input("Invalid absolute tolerance, must be greater than 0, please try again: ");
    end
    
    %prompting user for a relative tolerance (used to compute solution to REL_TOL precision) and validating it
    REL_TOL = input("Enter the relative tolerance allowed in the solution (-1 to skip): ");
    while ~(REL_TOL > 0)
        if(REL_TOL == -1)
            break;
        end
        REL_TOL = input("Invalid relative tolerance, must be greater than 0, please try again: ");
    end
    
    %converting symbolic function to numerical to speed up computation
    funcderiv = diff(func,x);
    func = matlabFunction(func,'Vars',x);
    funcderiv = matlabFunction(funcderiv,'Vars',x);
    
    %computing false position method for specific iteration count
    disp("======= USING ITERATION:");
    for k = 0:iteration
        
        %computing x_i for the current iteration and storing it in x_iter
        x_iter = ((pointA*func(pointB)-pointB*func(pointA))/(func(pointB)-func(pointA)));             %computing x_i = [a_i*f(b_i)-b_i*f(a_i)]/[f(b_i)-f(a_i)]
        
        %printing iteration row for the table
        fprintf("iteration #%d: a_%d = %.*f, b_%d = %.*f, mid_%d = %.*f, x_%d = %.*f, f(a_%d) = %.*f, f(b_%d) = %.*f, f(mid_%d) = %.*f, f(x_%d) = %.*f, Absolute Error <= +/- %.*f, Relative Error <= +/- %.*f\n",k,k,precision,pointA,k,precision,pointB,k,precision,((pointA + pointB)/2),k,precision,x_iter,k,precision,func(pointA),k,precision,func(pointB),k,precision,func((pointA + pointB)/2),k,precision,func(x_iter),precision,((pointB - pointA)/2),precision,abs(func(x_iter)/(funcderiv(x_iter)*x_iter)));
        
        %if reached last iteration, break out of loop
        if(k == iteration)
            break
        end
        
        %searching for the new interval (breaks if exact solution is found)
        if (func(pointA)*func(x_iter) < 0)                                                            %checking if mid point = b
            pointB = x_iter;
        elseif(func(pointA)*func(x_iter) > 0)                                                         %checking if mid point = a
            pointA = x_iter;
        else                                                                                          %else mid point is solution
            fprintf("Exact solution found after %d iteration\n",k);
            iteration = k;
            break;
        end
    end
    
    %printing the final solution of the false position method if iteration given
    if(iteration > -1)
        fprintf("The estimated solution to the given function after %d iterations is x = %.*f\n",iteration,precision,x_iter);
    else
        disp("Solution for iteration was skipped");
    end
    
    %computing false position method for specified absolute tolerance
    k = 0;                                                                                          %setting iteration to 0
    pointA = a;                                                                                     %setting pointA to a given by user
    pointB = b;                                                                                     %setting pointB to b given by user
    
    disp("======= USING ABSOLUTE TOLERANCE:");
    if(ABS_TOL > 0)
        
        while((pointB-pointA)/2 > ABS_TOL)
            
            x_iter = (pointA*func(pointB)-pointB*func(pointA))/(func(pointB)-func(pointA));
            
            %printing table
            fprintf("iteration #%d: a_%d = %.*f, b_%d = %.*f, mid_%d = %.*f, x_%d = %.*f, f(a_%d) = %.*f, f(b_%d) = %.*f, f(mid_%d) = %.*f, f(x_%d) = %.*f, Absolute Error <= +/- %.*f, Relative Error <= +/- %.*f\n",k,k,precision,pointA,k,precision,pointB,k,precision,((pointA + pointB)/2),k,precision,x_iter,k,precision,func(pointA),k,precision,func(pointB),k,precision,func((pointA + pointB)/2),k,precision,func(x_iter),precision,((pointB - pointA)/2),precision,abs(func(x_iter)/(funcderiv(x_iter)*x_iter)));
            
            %searching for new interval (breaks if exact solution found)
            if (func(pointA)*func(x_iter) < 0)                                                      %checking if new point = b
                pointB = x_iter;
            elseif(func(x_iter)*func(pointB) < 0)                                                   %checking if new point = a
                pointA = x_iter;
            else                                                                                    %else midpoint is solution
                fprintf("Exact solution found after %d iteration\n",k);
                break
            end
            
            %incrementing iteration count
            k = k+1;
            
            %checking if last iteration reached
            if ~((pointB-pointA)/2 > ABS_TOL)
                x_iter = (pointA*func(pointB)-pointB*func(pointA))/(func(pointB)-func(pointA));
                fprintf("iteration #%d: a_%d = %.*f, b_%d = %.*f, mid_%d = %.*f, x_%d = %.*f, f(a_%d) = %.*f, f(b_%d) = %.*f, f(mid_%d) = %.*f, f(x_%d) = %.*f, Absolute Error <= +/- %.*f, Relative Error <= +/- %.*f\n",k,k,precision,pointA,k,precision,pointB,k,precision,((pointA + pointB)/2),k,precision,x_iter,k,precision,func(pointA),k,precision,func(pointB),k,precision,func((pointA + pointB)/2),k,precision,func(x_iter),precision,((pointB - pointA)/2),precision,abs(func(x_iter)/(funcderiv(x_iter)*x_iter)));
            end
        end
        fprintf("The estimated solution to the given function within the absolute tolerance %.*f is x = %.*f after %d iterations\n",precision,ABS_TOL,precision,x_iter,k);
        fprintf("The theoretical iterations needed for an absolute tolerance of %.*f is n ~= %d.\n",precision,ABS_TOL,ceil(((log(b-a)-log(ABS_TOL))/(log(2)))-1));
    else
        disp("Solution for absolute tolerance was skipped");
    end
    
    %computing false position method for specified relative tolerance
    k = 0;                                                                                          %setting iteration to 0
    pointA = a;                                                                                     %setting pointA to a given by user
    pointB = b;                                                                                     %setting pointB to b given by user
    
    disp("======= USING RELATIVE TOLERANCE:");
    if(REL_TOL > 0)
        %computing value of x_0
        x_iter = (pointA*func(pointB)-pointB*func(pointA))/(func(pointB)-func(pointA));
        
        while(abs(func(x_iter)/(funcderiv(x_iter)*x_iter)) > REL_TOL)
            
            x_iter = (pointA*func(pointB)-pointB*func(pointA))/(func(pointB)-func(pointA));
            
            %printing table
            fprintf("iteration #%d: a_%d = %.*f, b_%d = %.*f, mid_%d = %.*f, x_%d = %.*f, f(a_%d) = %.*f, f(b_%d) = %.*f, f(mid_%d) = %.*f, f(x_%d) = %.*f, Absolute Error <= +/- %.*f, Relative Error <= +/- %.*f\n",k,k,precision,pointA,k,precision,pointB,k,precision,((pointA + pointB)/2),k,precision,x_iter,k,precision,func(pointA),k,precision,func(pointB),k,precision,func((pointA + pointB)/2),k,precision,func(x_iter),precision,((pointB - pointA)/2),precision,abs(func(x_iter)/(funcderiv(x_iter)*x_iter)));
            
            %searching for new interval (breaks if exact solution found)
            if (func(pointA)*func(x_iter) < 0)                                                      %checking if new point = b
                pointB = x_iter;
            elseif(func(x_iter)*func(pointB) < 0)                                                   %checking if new point = a
                pointA = x_iter;
            else                                                                                    %else midpoint is solution
                fprintf("Exact solution found after %d iteration\n",k);
                break
            end
            
            %incrementing iteration count
            k = k+1;
            
            %checking if last iteration reached
            if ~(abs(((pointB-pointA)/2)/func((pointA*func(pointB)-pointB*func(pointA))/(func(pointB)-func(pointA)))) > REL_TOL)
                x_iter = (pointA*func(pointB)-pointB*func(pointA))/(func(pointB)-func(pointA));
                fprintf("iteration #%d: a_%d = %.*f, b_%d = %.*f, mid_%d = %.*f, x_%d = %.*f, f(a_%d) = %.*f, f(b_%d) = %.*f, f(mid_%d) = %.*f, f(x_%d) = %.*f, Absolute Error <= +/- %.*f, Relative Error <= +/- %.*f\n",k,k,precision,pointA,k,precision,pointB,k,precision,((pointA + pointB)/2),k,precision,x_iter,k,precision,func(pointA),k,precision,func(pointB),k,precision,func((pointA + pointB)/2),k,precision,func(x_iter),precision,((pointB - pointA)/2),precision,abs(func(x_iter)/(funcderiv(x_iter)*x_iter)));
            end
        end
        fprintf("The estimated solution to the given function within the relative tolerance %.*f is x = %.*f after %d iterations\n",precision,REL_TOL,precision,x_iter,k);
    else
        disp("Solution for relative tolerance was skipped");
    end
end
function FixedPointMethod()
    %declaring global "precision" variable
    global precision;
    
    %title
    disp("======================= FIXED POINT METHOD ======================");
    
    %declaring symbolic variable
    syms x;
    
    %prompting user to enter the function to approximate the root of
    func = input("Enter function g(x), where g(x) = x (use lowercase 'x' for the function's variable): ");
    
    %converting symbolic function to numerical to speed up computation
    func = matlabFunction(func,'Vars',x);
    
    %prompting user whether to plot the function, this helps to guess the initial point by looking at it graphically
    prmt = input("Would you like to plot the function (helps with guessing point)? [y/n]: ",'s');
    
    %validating user input (checking if y/n is entered)
    while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
        prmt = input("Invalid input, would you like to plot the function? [y/n]: ",'s');
    end
    
    %plotting the graph if user chose to
    if(prmt == "y" || prmt == "Y")
        fplot(func,'DisplayName',"g(x)");
        hold on;
        fplot (x,'DisplayName',"x");
        title("Fixed Point Function");   %setting graph title
        xlabel("x");                     %setting x-axis label
        ylabel("f(x)");                  %setting y-axis label
        axis auto;                       %setting axis range (auto) , use ([xmin xmax ymin ymax]) for manual range
        grid on;                         %setting major grid
        grid minor;                      %setting minor grid
        legend;                          %printing legend
        hold off;
    end
    
    %prompting for starting point
    startPoint = input("Enter the starting point: ");                                                %initializing the starting point to the one given by the user
    
    %prompting whether to plot the first few iteration on the graph to see if algorithm converges or diverges.
    prmt = input("Would you like to plot the solution of the first few iterations (helps with determining if the method converges or not)? [y/n]: ",'s');
    
    %validating user input (checking if y/n is entered)
    while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
        prmt = input("Invalid input, would you like to plot the few iterations to see if the method converges? [y/n]: ",'s');
    end
    
    %plotting first few solutions if user chose to
    if(prmt == "y" || prmt == "Y")
        
        %iteration count
        iter = 25;
        
        %creating two arrays to hold points to plot
        x_array = 0:iter;
        sol_array = 0:iter;
        
        %computing few iterations and storing it in the solution array
        sol_array(1) = startPoint;                                                                                  %initializing the solution X_i to the starting point given by the user
        for k = 1:iter
            
            %computing solution for current iteration
            sol_array(k+1) = func(sol_array(k));                                                                    %computing the new solution for the current iteration
        end
        
        %plotting iterations
        plot(x_array,sol_array,'-o');
        title("Convergence of fixed point method");  %setting graph title
        xlabel("iteration i");                       %setting x-axis label
        ylabel("solution x_i");                      %setting y-axis label
        axis auto;                                   %setting axis range (auto) , use ([xmin xmax ymin ymax]) for manual range
        grid on;                                     %setting major grid
        grid minor;                                  %setting minor grid
        hold off;
    end
    
    %prompting user for an iteration amount (used to compute the ith iteration of the solution) and validating it
    iteration = input("Enter the amount of iteration to compute to find the solution (-1 to skip or if graph does not converge): ");
    while (iteration < -1)
        iteration = input("Invalid iteration count, please try again: ");
    end
    
    %prompting user for an absolute tolerance (used to compute solution to ABS_TOL precision) and validating it
    ABS_TOL = input("Enter the absolute tolerance allowed in the solution (-1 to skip or if graph does not converge): ");
    while ~(ABS_TOL > 0)
        if(ABS_TOL == -1)
            break;
        end
        ABS_TOL = input("Invalid absolute tolerance, must be greater than 0, please try again: ");
    end
    
    %prompting user for a relative tolerance (used to compute solution to REL_TOL precision) and validating it
    REL_TOL = input("Enter the relative tolerance allowed in the solution (-1 to skip or if graph does not converge): ");
    while ~(REL_TOL > 0)
        if(REL_TOL == -1)
            break;
        end
        REL_TOL = input("Invalid relative tolerance, must be greater than 0, please try again: ");
    end
    
    %computing fixed point method for specific iteration count
    disp("======= USING ITERATION:");
    sol = startPoint;                                                                                %initializing the solution X_i to the starting point given by the user
    prevSol = startPoint;                                                                            %initializing previous solution X_i-1 to the starting point given by the user
    for k = 0:iteration
        
        %printing iteration row for the table
        fprintf("Iteration #%d: x_%d = %.*f, f(x_%d) = %.*f, estimated absolute error = +/- %.*f, estimated relative error = +/- %.*f\n",k,k,precision,sol,k,precision,func(sol),precision,abs(sol-prevSol),precision,abs((sol-prevSol)/sol));
        
        %if exact solution found, break
        if(func(sol)==0)
            fprintf("Exact solution found after %d iteration(s)\n",k);
            break
        end
        
        %if reached end of iteration, break
        if(k == iteration)
            break;
        end
        
        prevSol = sol;                                                                               %setting the previous solution to the current solution
        sol = func(prevSol);                                                                         %computing the new solution for the current iteration
    end
    
    %printing the final solution of the fixed point method if iteration given
    if(iteration > -1)
        fprintf("The estimated solution to the given function after %d iterations is x = %.*f\n",k,precision,prevSol);
    else
        disp("Solution for iteration was skipped");
    end
    
    %computing fixed point method for specified absolute tolerance
    disp("======= USING ABSOLUTE TOLERANCE:");
    if(ABS_TOL > 0)
        sol = startPoint;                                                                            %initializing the solution X_i to the starting point given by the user
        prevSol = startPoint;                                                                        %initializing previous solution X_i-1 to the starting point given by the user
        k = 0;                                                                                       %initializing the iteration count to 0
        n = 0;                                                                                       %initializing the iteration count to 0 (used to break out in case of non-convergence)
        
        %running fixed point method until absolute tolerance reached
        while(true)
            
            %checking iteration count
            if(n > 100)
                %prompting user whether to stop iterations after reaching 100 iteration (could be sign of non-convergence)
                disp("Over 100 iterations have been performed so far. If the program is still running, it could be a sign that the method does not converge and should be manually stopped.");
                disp("Take a look at the error after each iteration, does it seem to get smaller? If it does become smaller, then you should run the method for another 100 iterations, otherwise you should stop.");
                prmt = input("Would you like to perform another 100 iterations? [y/n]: ",'s');
                
                %validating user input (checking if y/n is entered)
                while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
                    prmt = input("Invalid input, would you like to perform another 100 iterations? [y/n]: ",'s');
                end
                
                %if user chose to stop iteration, break out of the loop, else, reset the counter and do another 100 iteration
                if(prmt == "N" || prmt == "n")
                    disp("iteration manually stopped by the user.");
                    break;
                else
                    %resetting counter to 0 for another 100 iteration
                    n = 0;
                end
            end
            
            %checking if the current solution meets tolerance, if the case, print the final solution and breaking out of loop
            if(abs(sol-prevSol) < ABS_TOL && k ~= 0)
                fprintf("Iteration #%d: x_%d = %.*f, f(x_%d) = %.*f, estimated absolute error = +/- %.*f, estimated relative error = +/- %.*f\n",k,k,precision,sol,k,precision,func(sol),precision,abs(sol-prevSol),precision,abs((sol-prevSol)/sol));
                break;
            end
            
            %printing table
            fprintf("Iteration #%d: x_%d = %.*f, f(x_%d) = %.*f, estimated absolute error = +/- %.*f, estimated relative error = +/- %.*f\n",k,k,precision,sol,k,precision,func(sol),precision,abs(sol-prevSol),precision,abs((sol-prevSol)/sol));
            
            prevSol = sol;                                                                           %setting the previous solution to the current solution
            sol = func(prevSol);                                                                     %computing the new solution for the current iteration
            k = k+1;                                                                                 %incrementing iteration
            
            %if exact solution found, break
            if(func(sol) == 0)
                %printing last entry in the table and advising exact solution has been found
                fprintf("Iteration #%d: x_%d = %.*f, f(x_%d) = %.*f, estimated absolute error = +/- %.*f, estimated relative error = +/- %.*f\n",k,k,precision,sol,k,precision,func(sol),precision,abs(sol-prevSol),precision,abs((sol-prevSol)/sol));
                fprintf("Exact solution found after %d iteration(s)\n",k);
                break
            end
        end
        fprintf("The estimated solution to the given function within the absolute tolerance %.*f is x = %.*f after %d iterations\n",precision,ABS_TOL,precision,sol,k);
    else
        disp("Solution for absolute tolerance was skipped");
    end
    
    %computing fixed point method for specified relative tolerance
    disp("======= USING RELATIVE TOLERANCE:");
    if(REL_TOL > 0)
        sol = startPoint;                                                                            %initializing the solution X_i to the starting point given by the user
        prevSol = startPoint;                                                                        %initializing previous solution X_i-1 to the starting point given by the user
        k = 0;                                                                                       %initializing the iteration count to 0
        n = 0;                                                                                       %initializing the iteration count to 0 (used to break out in case of non-convergence)
        
        %running fixed point method until relative tolerance reached
        while(true)
            
            %checking iteration count
            if(n > 100)
                %prompting user whether to stop iterations after reaching 100 iteration (could be sign of non-convergence)
                disp("Over 100 iterations have been performed so far. If the program is still running, it could be a sign that the method does not converge and should be manually stopped.");
                disp("Take a look at the error after each iteration, does it seem to get smaller? If it does become smaller, then you should run the method for another 100 iterations, otherwise you should stop.");
                prmt = input("Would you like to perform another 100 iterations? [y/n]: ",'s');
                
                %validating user input (checking if y/n is entered)
                while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
                    prmt = input("Invalid input, would you like to perform another 100 iterations? [y/n]: ",'s');
                end
                
                %if user chose to stop iteration, break out of the loop, else, reset the counter and do another 100 iteration
                if(prmt == "N" || prmt == "n")
                    disp("iteration manually stopped by the user.");
                    break;
                else
                    %resetting counter to 0 for another 100 iteration
                    n = 0;
                end
            end
            
            %checking if the current solution meets tolerance, if the case, print the final solution and breaking out of loop
            if(abs(sol-prevSol) < REL_TOL && k ~= 0)
                fprintf("Iteration #%d: x_%d = %.*f, f(x_%d) = %.*f, estimated absolute error = +/- %.*f, estimated relative error = +/- %.*f\n",k,k,precision,sol,k,precision,func(sol),precision,abs(sol-prevSol),precision,abs((sol-prevSol)/sol));
                break;
            end
            
            %printing table
            fprintf("Iteration #%d: x_%d = %.*f, f(x_%d) = %.*f, estimated absolute error = +/- %.*f, estimated relative error = +/- %.*f\n",k,k,precision,sol,k,precision,func(sol),precision,abs(sol-prevSol),precision,abs((sol-prevSol)/sol));
            
            prevSol = sol;                                                                           %setting the previous solution to the current solution
            sol = func(prevSol);                                                                     %computing the new solution for the current iteration
            k = k+1;                                                                                 %incrementing iteration
            
            %if exact solution found, break
            if(func(sol) == 0)
                %printing last entry in the table and advising exact solution has been found
                fprintf("Iteration #%d: x_%d = %.*f, f(x_%d) = %.*f, estimated absolute error = +/- %.*f, estimated relative error = +/- %.*f\n",k,k,precision,sol,k,precision,func(sol),precision,abs(sol-prevSol),precision,abs((sol-prevSol)/sol));
                fprintf("Exact solution found after %d iteration(s)\n",k);
                break
            end
        end
        fprintf("The estimated solution to the given function within the relative tolerance %.*f is x = %.*f after %d iterations\n",precision,REL_TOL,precision,sol,k);
    else
        disp("Solution for relative tolerance was skipped");
    end
end
function NewtonMethod()
    %declaring global "precision" variable
    global precision;
    
    %title
    disp("======================== NEWTON'S METHOD ========================");
    
    %declaring symbolic variable
    syms x;
    
    %prompting user to enter the function to approximate the root of
    func = input("Enter function f(x), where f(x) = 0 (use lowercase 'x' for the function's variable): ");
    
    %converting symbolic function and it's derivative to numerical to speed up computation
    funcderiv = diff(func,x);                                                                        %deriving the function given by the user
    func = matlabFunction(func,'Vars',x);                                                            %converting the original function to numeric
    funcderiv = matlabFunction(funcderiv,'Vars',x);                                                  %converting the derived function to numeric
    
    %prompting user whether to plot the function, this helps to guess the initial point by looking at it graphically
    prmt = input("Would you like to plot the function (helps with guessing point)? [y/n]: ",'s');
    
    %validating user input (checking if y/n is entered)
    while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
        prmt = input("Invalid input, would you like to plot the function? [y/n]: ",'s');
    end
    
    %plotting the graph if user chose to
    if(prmt == "y" || prmt == "Y")
        fplot(func,'DisplayName',"f(x)");
        title("Newton's Function");      %setting graph title
        xlabel("x");                     %setting x-axis label
        ylabel("f(x)");                  %setting y-axis label
        axis auto;                       %setting axis range (auto) , use ([xmin xmax ymin ymax]) for manual range
        grid on;                         %setting major grid
        grid minor;                      %setting minor grid
        legend;                          %printing legend
        hold off;
    end
    
    %prompting for starting point
    startPoint = input("Enter the starting point: ");                                                %initializing the starting point to the one given by the user
    
    %prompting whether to plot the first few iteration on the graph to see if algorithm converges or diverges.
    prmt = input("Would you like to plot the solution of the first few iterations (helps with determining if the method converges or not)? [y/n]: ",'s');
    
    %validating user input (checking if y/n is entered)
    while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
        prmt = input("Invalid input, would you like to plot the few iterations to see if the method converges? [y/n]: ",'s');
    end
    
    %plotting first few solutions if user chose to
    if(prmt == "y" || prmt == "Y")
        
        %iteration count
        iter = 25;
        
        %creating two arrays to hold points to plot
        x_array = 0:iter;
        sol_array = 0:iter;
        
        %computing few iterations and storing it in the solution array
        sol_array(1) = startPoint;                                                                                  %initializing the solution X_i to the starting point given by the user
        for k = 1:iter
            
            %computing solution for current iteration
            sol_array(k+1) = sol_array(k)-(func(sol_array(k))/funcderiv(sol_array(k)));                             %computing the new solution for the current iteration
        end
        
        %plotting iterations
        plot(x_array,sol_array,'-o');
        title("Convergence of fixed point method");  %setting graph title
        xlabel("iteration i");                       %setting x-axis label
        ylabel("solution x_i");                      %setting y-axis label
        axis auto;                                   %setting axis range (auto) , use ([xmin xmax ymin ymax]) for manual range
        grid on;                                     %setting major grid
        grid minor;                                  %setting minor grid
        hold off;
    end
    
    %prompting user for an iteration amount (used to compute the ith iteration of the solution) and validating it
    iteration = input("Enter the amount of iteration to compute to find the solution (-1 to skip or if graph does not converge): ");
    while (iteration < -1)
        iteration = input("Invalid iteration count, please try again: ");
    end
    
    %prompting user for an absolute tolerance (used to compute solution to ABS_TOL precision) and validating it
    ABS_TOL = input("Enter the absolute tolerance allowed in the solution (-1 to skip or if graph does not converge): ");
    while ~(ABS_TOL > 0)
        if(ABS_TOL == -1)
            break;
        end
        ABS_TOL = input("Invalid absolute tolerance, must be greater than 0, please try again: ");
    end
    
    %prompting user for a relative tolerance (used to compute solution to REL_TOL precision) and validating it
    REL_TOL = input("Enter the relative tolerance allowed in the solution (-1 to skip or if graph does not converge): ");
    while ~(REL_TOL > 0)
        if(REL_TOL == -1)
            break;
        end
        REL_TOL = input("Invalid relative tolerance, must be greater than 0, please try again: ");
    end
    
    %computing newton's method for given iteration
    disp("======= USING ITERATION:");
    sol = startPoint;                                                                                %initializing the solution X_i to the starting point given by the user
    prevSol = startPoint;                                                                            %initializing previous solution X_i-1 to the starting point given by the user
    for k = 0:iteration
        
        %printing iteration row for the table
        fprintf("Iteration #%d: x_%d = %.*f, f(x_%d) = %.*f, f'(x_%d) = %.*f, estimated absolute error = +/- %.*f, estimated relative error = +/- %.*f\n",k,k,precision,sol,k,precision,func(sol),k,precision,funcderiv(sol),precision,abs(sol-prevSol),precision,abs((sol-prevSol)/sol));
        
        %if exact solution found, break
        if(func(sol) == 0)
            fprintf("Exact solution found after %d iteration(s)\n",k);
            break
        end
        
        %if reached end of iteration, break
        if(k == iteration)
            break;
        end
        
        %computing next iteration values
        prevSol = sol;                                                                               %setting the previous solution to the current solution
        sol = sol-(func(sol)/funcderiv(sol));                                                        %computing the new solution for the current iteration
    end
    
    %printing the solution of the false position method if iteration given
    if(iteration > -1)
        fprintf("The estimated solution to the given function after %d iterations is x = %.*f\n",k,precision,sol);
    else
        disp("Solution for iteration was skipped");
    end
    
    %computing newton's method for given absolute tolerance
    disp("======= USING ABSOLUTE TOLERANCE:");
    if(ABS_TOL > 0)
        sol = startPoint;                                                                            %initializing the solution X_i to the starting point given by the user
        prevSol = startPoint;                                                                        %initializing previous solution X_i-1 to the starting point given by the user
        k = 0;                                                                                       %initializing the iteration count to 0
        n = 0;                                                                                       %initializing the iteration count to 0 (used to break out in case of non-convergence)
        
        %running newton's method until absolute tolerance reached
        while(true)
            
            %checking iteration count
            if(n > 100)
                %prompting user whether to stop iterations after reaching 100 iteration (could be sign of non-convergence)
                disp("Over 100 iterations have been performed so far. If the program is still running, it could be a sign that the method does not converge and should be manually stopped.");
                disp("Take a look at the error after each iteration, does it seem to get smaller? If it does become smaller, then you should run the method for another 100 iterations, otherwise you should stop.");
                prmt = input("Would you like to perform another 100 iterations? [y/n]: ",'s');
                
                %validating user input (checking if y/n is entered)
                while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
                    prmt = input("Invalid input, would you like to perform another 100 iterations? [y/n]: ",'s');
                end
                
                %if user chose to stop iteration, break out of the loop, else, reset the counter and do another 100 iteration
                if(prmt == "N" || prmt == "n")
                    disp("iteration manually stopped by the user.");
                    break;
                else
                    %resetting counter to 0 for another 100 iteration
                    n = 0;
                end
            end
            
            %checking if the current solution meets absolute tolerance, if the case, print the final solution and breaking out of loop
            if(abs(sol-prevSol) < ABS_TOL && k ~= 0)
                fprintf("Iteration #%d: x_%d = %.*f, f(x_%d) = %.*f, f'(x_%d) = %.*f, estimated absolute error = +/- %.*f, estimated relative error = +/- %.*f\n",k,k,precision,sol,k,precision,func(sol),k,precision,funcderiv(sol),precision,abs(sol-prevSol),precision,abs((sol-prevSol)/sol));
                break;
            end
            
            %printing table
            fprintf("Iteration #%d: x_%d = %.*f, f(x_%d) = %.*f, f'(x_%d) = %.*f, estimated absolute error = +/- %.*f, estimated relative error = +/- %.*f\n",k,k,precision,sol,k,precision,func(sol),k,precision,funcderiv(sol),precision,abs(sol-prevSol),precision,abs((sol-prevSol)/sol));
            
            
            %computing next iteration values
            prevSol = sol;                                                                               %setting the previous solution to the current solution
            sol = sol-(func(sol)/funcderiv(sol));                                                        %computing the new solution for the current iteration
            k = k+1;                                                                                     %incrementing iteration
            
            %if exact solution found, break
            if(func(sol) == 0)
                fprintf("Iteration #%d: x_%d = %.*f, f(x_%d) = %.*f, f'(x_%d) = %.*f, estimated absolute error = +/- %.*f, estimated relative error = +/- %.*f\n",k,k,precision,sol,k,precision,subs(func,x,sol),k,precision,subs(diff(func,x),x,sol),precision,abs(sol-prevSol),precision,abs((sol-prevSol)/sol));
                fprintf("Exact solution found after %d iteration(s)\n",k);
                break
            end
        end
        fprintf("The estimated solution to the given function within the absolute tolerance %.*f is x = %.*f after %d iterations\n",precision,ABS_TOL,precision,sol,k);
    else
        disp("Solution for absolute tolerance was skipped");
    end
    
    %computing newton's method for given relative tolerance
    disp("======= USING RELATIVE TOLERANCE:");
    if(REL_TOL > 0)
        sol = startPoint;                                                                            %initializing the solution X_i to the starting point given by the user
        prevSol = startPoint;                                                                        %initializing previous solution X_i-1 to the starting point given by the user
        k = 0;                                                                                       %initializing the iteration count to 0
        n = 0;                                                                                       %initializing the iteration count to 0 (used to break out in case of non-convergence)
        
        %running newton's method until relative tolerance reached
        while(true)
            
            %checking iteration count
            if(n > 100)
                %prompting user whether to stop iterations after reaching 100 iteration (could be sign of non-convergence)
                disp("Over 100 iterations have been performed so far. If the program is still running, it could be a sign that the method does not converge and should be manually stopped.");
                disp("Take a look at the error after each iteration, does it seem to get smaller? If it does become smaller, then you should run the method for another 100 iterations, otherwise you should stop.");
                prmt = input("Would you like to perform another 100 iterations? [y/n]: ",'s');
                
                %validating user input (checking if y/n is entered)
                while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
                    prmt = input("Invalid input, would you like to perform another 100 iterations? [y/n]: ",'s');
                end
                
                %if user chose to stop iteration, break out of the loop, else, reset the counter and do another 100 iteration
                if(prmt == "N" || prmt == "n")
                    disp("iteration manually stopped by the user.");
                    break;
                else
                    %resetting counter to 0 for another 100 iteration
                    n = 0;
                end
            end
            
            %checking if the current solution meets relative tolerance, if the case, print the final solution and breaking out of loop
            if(abs(sol-prevSol) < REL_TOL && k ~= 0)
                fprintf("Iteration #%d: x_%d = %.*f, f(x_%d) = %.*f, f'(x_%d) = %.*f, estimated absolute error = +/- %.*f, estimated relative error = +/- %.*f\n",k,k,precision,sol,k,precision,func(sol),k,precision,funcderiv(sol),precision,abs(sol-prevSol),precision,abs((sol-prevSol)/sol));
                break;
            end
            
            %printing table
            fprintf("Iteration #%d: x_%d = %.*f, f(x_%d) = %.*f, f'(x_%d) = %.*f, estimated absolute error = +/- %.*f, estimated relative error = +/- %.*f\n",k,k,precision,sol,k,precision,func(sol),k,precision,funcderiv(sol),precision,abs(sol-prevSol),precision,abs((sol-prevSol)/sol));
            
            
            %computing next iteration values
            prevSol = sol;                                                                               %setting the previous solution to the current solution
            sol = sol-(func(sol)/funcderiv(sol));                                                        %computing the new solution for the current iteration
            k = k+1;                                                                                     %incrementing iteration
            
            %if exact solution found, break
            if(func(sol) == 0)
                fprintf("Iteration #%d: x_%d = %.*f, f(x_%d) = %.*f, f'(x_%d) = %.*f, estimated absolute error = +/- %.*f, estimated relative error = +/- %.*f\n",k,k,precision,sol,k,precision,subs(func,x,sol),k,precision,subs(diff(func,x),x,sol),precision,abs(sol-prevSol),precision,abs((sol-prevSol)/sol));
                fprintf("Exact solution found after %d iteration(s)\n",k);
                break
            end
        end
        fprintf("The estimated solution to the given function within the relative tolerance %.*f is x = %.*f after %d iterations\n",precision,REL_TOL,precision,sol,k);
    else
        disp("Solution for relative tolerance was skipped");
    end
end
function BisectionIterationCount()
    %declaring global "precision" variable
    global precision;
    
    %title
    disp("=============== Bisection iteration and tolerance ===============");
    
    %prompting and validating tolerance
    TOL = input("Enter an absolute tolerance to get the iteration required (-1 to skip): ");
    while ~(TOL > 0)
        if(TOL == -1)
            break
        end
        TOL = input("Invalid tolerance, must be greater than 0, please try again: ");
    end
    
    %prompting and validating iteration count
    iteration = input("Enter an iteration count to get absolute tolerance (-1 to skip): ");
    while (iteration < -1)
        iteration = input("Invalid iteration count, please try again: ");
    end
    
    %prompting and validating interval
    while(true)
        pointA = input("Enter the start of the initial interval [a,b], a = : ");     %prompting for x = a
        pointB = input("Enter the end of the initial interval [a,b], b = : ");       %prompting for x = b
        if (pointA <= pointB)
            break;
        end
        
        prmt = input("Invalid guess interval, Would you like to try again? [y/n]: ",'s');
        
        %validating input
        while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
            prmt = input("Invalid input, would you like to try again? [y/n]: ",'s');
        end
        if(prmt == "y" || prmt == "Y")
            continue;
        else
            return;
        end
    end
    
    %printing iteration needed for a specific tolerance
    if(TOL~=-1)
        fprintf("The theoretical iteration(s) needed for a tolerance of %.*f with a starting interval [a,b] = [%.*f, %.*f] is n ~= %d.\n",precision,TOL,precision,pointA,precision,pointB,ceil(((log(pointB-pointA)-log(TOL))/(log(2)))-1));
    end
    if(iteration~=-1)
        fprintf("The theoretical tolerance of %d iteration(s) with a starting interval [a,b] = [%.*f, %.*f] is TOL <= %.*f.\n",iteration,precision,pointA,precision,pointB,precision,(abs(pointB-pointA)/(2^(iteration+1))));
    end
end
function MultiplicityCalculator()
    %declaring global "precision" variable
    global precision;
    
    %title
    disp("========================== MULTIPLICITY =========================");
    
    %declaring symbolic variable
    syms x
    
    %prompting user for function, point and order
    func = input("Enter function f(x) = 0 (use the variable x): ");
    
    %asking user if exact root is known
    prmt = input("Is exact root known? [y/n]: ",'s');
    
    %validating user input (checking if y/n is entered)
    while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
        prmt = input("Invalid input, is the exact root known? [y/n]: ",'s');
    end
    
    %computing multiplicity with exact root
    if(prmt == "y" || prmt == "Y")
        
        %prompting user for root
        root = input("Enter a root: ");
        
        %validating user input (checking if input is indeed a root)
        while(subs(func,x,root) ~= 0)
            root = input("Invalid input, the value given is not a root, please try again: ");
        end
        
        %computing multiplicity
        multiplicity = 0;                                                                            %initializing multiplicity at 0
        while(subs(func,x,root) == 0)
            fprintf("derivative #%d of f(x) at x = %.*f is f(x) = %.*f\n",multiplicity,precision,root,precision,subs(func,x,root));
            
            %computing next derivative
            func = diff(func,x);
            
            %incrementing multiplicity
            multiplicity = multiplicity+1;
        end
        
        %printing multiplicity
        fprintf("The exact multiplicity of the root x = %.*f is: %d\n",precision,root,multiplicity);
    else
        %printing hint
        disp("Since the exact root is unknown, we can determine multiplicity by graphing the original function and all it's derivatives and count");
        disp("how many subsequent derivatives intersect the original function at it's root. The following method will guide you through the process");
        
        %initializing multiplicity
        multiplicity = 1;
        
        %initializing iteration
        k = 1;
        
        %initializing derivative
        funcderiv = diff(func,x);
        
        while(true)
            
            %plotting original function
            fplot(func(1),'DisplayName',"Original Function");
            
            hold on;
            
            %plotting derivatives
            fplot(funcderiv,'DisplayName',"Derivative # " + num2str(k));
            
            %printing title, legend, labels, etc.
            title("Original Function & Derivatives");    %setting graph title
            xlabel("x");                                 %setting x-axis label
            ylabel("f(x)");                              %setting y-axis label
            axis auto;                                   %setting axis range (auto) , use ([xmin xmax ymin ymax]) for manual range
            grid on;                                     %setting major grid
            grid minor;                                  %setting minor grid
            legend;                                      %printing legend
            hold off;
            
            %prompting user whether the derivative intersects the original function at the root
            prmt = input(sprintf("Derivative #%d: does the derivative intersect the function at the root? [y/n]: ",k),'s');
            
            %validating user input (checking if y/n is entered)
            while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
                prmt = input("Invalid input, does the derivative intersect the function at the root? [y/n]: ",'s');
            end
            
            %if the derivative does not intersect the function, breaking out.
            if(prmt == "n" || prmt == "N")
                break;
            end
            
            %adding 1 to multiplicity if the derivative did intersect
            multiplicity = multiplicity+1;
            
            %computing the next derivative
            funcderiv = diff(funcderiv,x);
            
            %incrementing iteration count
            k = k+1;
            
        end
        
        %printing multiplicity
        fprintf("The estimated multiplicity of the funcion f(x) = %s is: %d\n",func, multiplicity);
    end
end
function Convergence2()
    %declaring global "precision" variable
    global precision;
    
    %title
    disp("========================== CONVERGENCE ========================== ");
    disp("The current and next iteration error depends on 3 values: λ, α and E_i, and is given by E_i+1 = λ*E_i^α");
    disp("-------------");
    
    %declaring symbolic variable
    syms x;
    
    %prompting user for α
    alpha = input("Enter α (order of convergence, 2 for newton's method, 1 otherwise): ");
    disp("-------------");
    
    %prompting λ, compute it if unknown
    prmt = input("Is λ (asymptotic error constant) known? [y/n]: ",'s');
    
    %validating input
    while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
        prmt = input("Invalid input, Is λ (asymptotic error constant) known? [y/n]: ",'s');
    end
    
    %prompting for initial error and lamba if it is known
    if(prmt == "y" || prmt == "Y")
        lambda = input("Enter λ (asymptotic error constant, 0.5 for bisection/false position, abs(g'(r)) for fixed point and abs[(f''(r))/(2*f'(r))] for newton): ");
        error1 = input("Enter E_i (error for iteration i, if true solution r and starting point x_0 given, input abs(r-x_0)): ");
        %computing lambda if it is unknown
    else
        func = input("Enter the f(x) or g(x) (use lowercase 'x' for the function's variable): ");
        sol = input("Enter the solution to the function f(x)=0 or g(x)=x :");
        fprintf("Newton's Method λ = %.*f, Fixed point method λ = %.*f, Bisection/False Position method λ = 0.5.\n",precision,abs(subs((diff(func,x,2)/(2*diff(func,x,1))),x,sol)),precision,abs(subs(diff(func,x,1),x,sol)));
        lambda = input("Enter the correct λ from the computed values above: ");
        error1 = input("Enter E_i (error for iteration i, if true solution r and starting point x_0 given, input abs(r-x_0)): ");
    end
    
    disp("-------------");
    
    %prompting and validating tolerance
    TOL = input("Enter the tolerance to compute amount of iterations needed to reach it(-1 to skip): ");
    while ~(TOL > 0)
        if(TOL == -1)
            break
        end
        TOL = input("Invalid tolerance, must be greater than 0, please try again: ");
    end
    
    %prompting and validating iteration count
    iteration = input("Enter the amount of iteration to find E_i+n (i.e. if E_i+20 required, enter 20, -1 to skip): ");
    while (iteration < -1)
        iteration = input("Invalid iteration count, please try again: ");
    end
    
    %printing the error for i+1, i+2, etc. given by the user
    disp("======= USING ITERATION:");
    
    %copying error in a working variable
    error2 = error1;
    
    %computing error for given iteration
    if(iteration == -1)
        disp("Solution for iteration was skipped.");
    else
        for k = 0:iteration
            fprintf("E_i+%d = %.*f\n",k,precision,error2);
            if(k == iteration)
                break;
            end
            error2 = lambda*error2^alpha;
        end
        fprintf("The error for E_i+%d is: %.*f\n",iteration,precision,error2);
    end
    
    %printing the error for i+1, i+2, etc. given by the user
    disp("======= USING TOLERANCE:");
    
    if(TOL > 0)
        k = 0;
        %copying error in a working variable
        error2 = error1;
        
        while(true)
            if(error2<TOL)
                fprintf("Iteration #%d: E_i+%d = %.*f\n",k,k,precision,error2);
                break;
            end
            
            fprintf("Iteration #%d: E_i+%d = %.*f\n",k,k,precision,error2);
            error2 = lambda*error2^alpha;
            k=k+1;
        end
        fprintf("The amount of iterations needed to obtain a tolerance of %.*f is n = %d\n",precision,TOL,k);
    else
        disp("Solution for tolerance was skipped");
    end
end
function ForwardBackwardError2()
    %declaring global "precision" variable
    global precision;
    
    %title
    disp("===================== FORWARD/BACKWARD ERROR ====================");
    
    %declaring symbolic variable
    syms x;
    
    %prompting user for function
    func = input("Enter function f(x) = 0 (use lowercase 'x' for the function's variable): ");
    
    %prompting whether to plot the function
    prmt = input("Would you like to plot the function and it's derivatives (helps with guessing root multiplicity)? [y/n]: ",'s');
    
    %validating input
    while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
        prmt = input("Invalid input, would you like to plot the function? [y/n]: ",'s');
    end
    
    %plotting the graph if user choses to
    if(prmt == "y" || prmt == "Y")
        derivativeCount = input("Enter the amount of derivatives to plot: ");
        while(derivativeCount < 0)
            derivativeCount = input("Invalid count, must be 0 or greater: ");
        end
        
        %creating symbolic array to hold the differential functions
        diff_func = sym(zeros(1,derivativeCount+1));
        diff_func(1) = func;
        
        for k = 1:derivativeCount
            diff_func(k+1) = diff(diff_func(k),x);
        end
        
        %plotting original function
        fplot(diff_func(1),'DisplayName',"Original Function");
        
        hold on;
        %plotting derivatives
        for k = 2:derivativeCount+1
            fplot(diff_func(k),'DisplayName',"Derivative # " + num2str(k-1));
        end
        title("Function & Derivatives"); %setting graph title
        xlabel("x");                     %setting x-axis label
        ylabel("f(x)");                  %setting y-axis label
        axis auto;                       %setting axis range (auto) , use ([xmin xmax ymin ymax]) for manual range
        grid on;                         %setting major grid
        grid minor;                      %setting minor grid
        legend;
        hold off;
    end
    
    %displaying tip to figure out multiplicity
    disp("Hint: If the function does not cross the x-axis at the root, the root must be of even multiplicity. If the function crosses the x-axis at the root, the root must be of odd multiplicity.");
    
    %prompting and validating root multiplicity
    multiplicity = input("Enter the multiplicity of the root (use 1 as default if unknown or error factor not required): ");
    while ~(multiplicity > 0)
        multiplicity = input("Invalid multiplicity, must be greater than 0, please try again: ");
    end
    
    %prompting user for estimated solution
    est_sol = input("Enter the estimated solution x_r: ");
    
    %prompting user for true soluton
    prmt = input("Is the true solution known? [y/n]: ",'s');
    
    %validating input
    while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
        prmt = input("Invalid input, is the true solution known? [y/n]: ",'s');
    end
    
    %plotting the graph if user choses to
    if(prmt == "y" || prmt == "Y")
        true_sol = input("Enter the true solution r: ");
    end
    
    %computing backward error
    backwardError = abs(subs(func,x,est_sol));
    
    %computing estimated forward error
    estimatedForwardError = abs((factorial(multiplicity)*subs(func,x,est_sol))/(subs(diff(func,x,multiplicity),x,est_sol)))^(1/multiplicity);
    
    %computing estimated error magnification factor
    estimatedErrorFactor = estimatedForwardError/backwardError;
    
    %printing the backward error
    fprintf("The backward error is: %.*f\n",precision,backwardError);
    
    %printing the estimated forward error
    fprintf("The ESTIMATED forward error is: %.*f\n",precision,estimatedForwardError);
    
    %printing the true forward error if user gave true solution
    if(prmt == "y" || prmt == "Y")
        fprintf("The TRUE forward error is: %.*f\n",precision,abs(true_sol-est_sol));
    else
        disp("The TRUE forward error is unavailable without knowing the true solution.");
    end
    
    %printing estimated error magnification factor
    fprintf("The ESTIMATED error magnification factor M = ForwardError/BackwardError is: %.*f\n",precision,estimatedErrorFactor);
    
    %printing the true error magnification factor
    if(prmt == "y" || prmt == "Y")
        fprintf("The TRUE error magnification factor M = ForwardError/BackwardError is: %.*f\n",precision,abs(true_sol-est_sol)/backwardError);
    else
        disp("The TRUE error magnification factor M = ForwardError/BackwardError is unavailable without knowing the true solution.");
    end
end

% ================= Chapter 3 - Linear Equations =================
function Chapter3()
    %declaring global variable
    global clearConsole;
        
    %Starting menu loop, returns to main menu after user exits
    while(true)
        disp("================== Chapter 3 - Linear Equation ==================");
        disp("[1] Naive Gauss Elimination");
        disp("[2] Naive Gauss Elimination with Partial Pivoting");
        disp("[3] A = LU decomposition");
        disp("[4] PA = LU decomposition");
        disp("[5] Vector Norms");
        disp("[6] Forward and Backward Error");
        disp("[7] Matrix Condition Number");
        disp("[8] Lost Digits due to error");
        disp("[9] Return to main menu");
        
        %prompt user for option
        x = input("Choose an option: ");
        
        %validating user input
        while(x < 1 || x > 9)
            x = input("Invalid input, please try again: ");
        end
        
        switch(x)
            case(1)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                NaiveGaussElimination();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(2)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                GaussEliminationPivot();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(3)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                ALU();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(4)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                PALU();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(5)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                Norm();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(6)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                ForwardBackwardError3();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(7)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                MatrixCondition();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(8)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                lostDigits();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(9)
                break;
            otherwise
                continue;
        end
    end
end
function NaiveGaussElimination()
    %declaring global "precision" variable
    global precision;
    
    %title
    disp("=================== NAIVE GAUSSIAN ELIMINATION ==================");
    
    %prompting user for coefficient matrix A (Ax = B)
    matrixA = input("Enter a coefficient matrix A, use [row1;row2;...rown]: ");
    
    %storing row and col values
    [row,col] = size(matrixA);
    
    %creating step counter
    step = 0;
    
    %prompting whether user wants to enter a solution matrix B
    prmt = input("Would you like to enter a solution matrix B (optional)? [y/n]: ",'s');
    
    %validating input
    while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
        prmt = input("Invalid input, would you like to enter a solution matrix B (optional)? [y/n]: ",'s');
    end
    
    %prompting for solution matrix and validating
    if(prmt == "y" || prmt == "Y")
        matrixB = input("Enter a solution matrix B, use [row1;row2;...rown]: ");
        while(size(matrixB,1) ~= size(matrixA,1) || size(matrixB,2) ~= 1)
            matrixB = input("Invalid matrix, solution matrix B must have 1 column and the same amount of rows as matrix A, please try again: ");
        end
    end
    
    %storing the given coefficient matrix in a temp matrix
    naiveGaussianElimination = matrixA;
    
    %printing original coefficient matrix
    disp("The coefficient matrix A given is: ");
    matrixA %#ok<NOPRT>
    if(prmt == "y" || prmt == "Y")
        disp("The solution matrix B given is: ");
        matrixB %#ok<NOPRT>
        naiveGaussianElimination = [matrixA matrixB];
        disp("The augmented matrix is: ");
        naiveGaussianElimination %#ok<NOPRT>
    end
    
    %performing naive guassian forward elimination
    for c = 1:col
        %performing required row operations
        for r = c+1:row
            %break out of naive gaussian elimination fails (division by 0)
            if (naiveGaussianElimination(c,c) == 0)
                disp("Naive gaussian elimination cannot be performed due to a division by zero, pivoting required.");
                return
            end
            
            if(naiveGaussianElimination(r,c) == 0)
                continue;
            end
            %printing step operation
            step = step+1;
            disp("==============================");
            fprintf("Step #%d: row%d <== row%d - (%.*f)*row%d\n",step,r,r,precision,(naiveGaussianElimination(r,c)/naiveGaussianElimination(c,c)),c);
            
            %performing row operation
            naiveGaussianElimination(r,:) = naiveGaussianElimination(r,:)- (naiveGaussianElimination(r,c)/naiveGaussianElimination(c,c))*naiveGaussianElimination(c,:) %#ok<NOPRT>
        end
    end
    disp("---> Naive Gaussian elimination completed!");
    
    if(prmt == "y" || prmt == "Y")
        disp("Attempting to back-substitute to find the solution...");
        
        %checking if system is inconsistent by looking for rows with all coefficients being 0 but solution column being non-zero
        for currentRow = 1:row
            for currentCol = 1:col
                if(naiveGaussianElimination(currentRow,currentCol) ~= 0)
                    break;
                end
                %check if last column on the row reached, if the case, check if the solution column is 0, if not matrix is inconsistent
                if(currentCol == col && naiveGaussianElimination(currentRow,currentCol+1)~=0)
                    disp("System is inconsistent, no solution exists");
                    return;
                end
                %check if the last column has been reached, if it is the case, row of 0s found, removing it
                if(currentCol == col)
                    naiveGaussianElimination(currentRow,:) = [];
                end
            end
        end
        
        %checking if system has less rows than columns, if the case, no unique solutions
        if(size(naiveGaussianElimination,1) < size(naiveGaussianElimination,2)-1)
            disp("System has infinitely many solutions, no unique solution available.");
            return;
        end
        
        disp("Starting with with the matrix");
        naiveGaussianElimination %#ok<NOPRT>
        disp("We take the following steps when back-substituing");
        %creating step counter
        step = 0;
        
        %saving matrix size
        [row, col] = size(naiveGaussianElimination);
        
        %back substituing
        for currentRow = row:-1:1
            %check if row pivot is 1, if not turn the pivot 1 by diving the entire row by pivot
            if(naiveGaussianElimination(currentRow,currentRow) ~=1)
                %printing step operation
                step = step+1;
                disp("==============================");
                fprintf("Step #%d: row%d <== (%.*f)*row%d (turning leading coefficient into a 1)",step,currentRow,precision,(1/naiveGaussianElimination(currentRow,currentRow)),currentRow);
                naiveGaussianElimination(currentRow,currentRow:col) =  naiveGaussianElimination(currentRow,currentRow:col)/naiveGaussianElimination(currentRow,currentRow) %#ok<NOPRT>
            end
            
            %printing step operation
            step = step+1;
            disp("==============================");
            fprintf("Step #%d: Backsubstituing in row %d",step,currentRow);
            naiveGaussianElimination(currentRow,col) =  naiveGaussianElimination(currentRow,col)-sum(naiveGaussianElimination(currentRow,currentRow+1:col-1)*naiveGaussianElimination(currentRow+1:row,col));
            naiveGaussianElimination(currentRow,currentRow+1:col-1) = 0 %#ok<NOPRT>
        end
    end
end
function GaussEliminationPivot()
    %declaring global "precision" variable
    global precision;
    
    %title
    disp("======== NAIVE GAUSSIAN ELIMINATION WITH PARTIAL PIVOTING =======");
    
    %prompting user for coefficient matrix A (Ax = B)
    matrixA = input("Enter a coefficient matrix A, use [row1;row2;...rown]: ");
    
    %storing row and col values
    [row,col] = size(matrixA);
    
    %creating step counter
    step = 0;
    
    %prompting whether user wants to enter a solution matrix B
    prmt = input("Would you like to enter a solution matrix B (optional)? [y/n]: ",'s');
    
    %validating input
    while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
        prmt = input("Invalid input, would you like to enter a solution matrix B (optional)? [y/n]: ",'s');
    end
    
    %prompting for solution matrix and validating
    if(prmt == "y" || prmt == "Y")
        matrixB = input("Enter a solution matrix B, use [row1;row2;...rown]: ");
        while(size(matrixB,1) ~= size(matrixA,1) || size(matrixB,2) ~= 1)
            matrixB = input("Invalid matrix, solution matrix B must have 1 column and the same amount of rows as matrix A, please try again: ");
        end
    end
    
    %storing the given coefficient matrix in a temp matrix
    naiveGaussianEliminationPivot = matrixA;
    
    %printing original coefficient matrix
    disp("The coefficient matrix A given is: ");
    matrixA %#ok<NOPRT>
    if(prmt == "y" || prmt == "Y")
        disp("The solution matrix B given is: ");
        matrixB %#ok<NOPRT>
        naiveGaussianEliminationPivot = [matrixA matrixB];
        disp("The augmented matrix is: ");
        naiveGaussianEliminationPivot %#ok<NOPRT>
    end
    
    %performing naive guassian elimination with partial pivoting
    for c = 1:col
        %Searching for row with largest element in column
        maxRow = c;
        for k = c+1:row
            if (abs(naiveGaussianEliminationPivot(maxRow,c)) < abs(naiveGaussianEliminationPivot(k,c)))
                maxRow = k;
            end
        end
        
        %pivoting along the largest element
        if(maxRow ~= c)
            step = step+1;
            disp("==============================");
            fprintf("Step #%d: row%d <==> row%d\n",step,c,maxRow);
            naiveGaussianEliminationPivot([c,maxRow],:) = naiveGaussianEliminationPivot([maxRow,c],:) %#ok<NOPRT>
        end
        
        %performing required row operations
        for r = c+1:row
            
            if(naiveGaussianEliminationPivot(r,c) == 0)
                continue;
            end
            
            %printing step operation
            step = step+1;
            disp("==============================");
            fprintf("Step #%d: row%d <== row%d - (%.*f)*row%d\n",step,r,r,precision,(naiveGaussianEliminationPivot(r,c)/naiveGaussianEliminationPivot(c,c)),c);
            
            %performing row operation
            naiveGaussianEliminationPivot(r,:) = naiveGaussianEliminationPivot(r,:)- (naiveGaussianEliminationPivot(r,c)/naiveGaussianEliminationPivot(c,c))*naiveGaussianEliminationPivot(c,:) %#ok<NOPRT>
        end
    end
    disp("---> Naive Gaussian elimination with partial pivoting completed!");
    
    if(prmt == "y" || prmt == "Y")
        disp("Attempting to back-substitute to find the solution...");
        
        %checking if system is inconsistent by looking for rows with all coefficients being 0 but solution column being non-zero
        for currentRow = 1:row
            for currentCol = 1:col
                if(naiveGaussianEliminationPivot(currentRow,currentCol) ~= 0)
                    break;
                end
                %check if last column on the row reached, if the case, check if the solution column is 0, if not matrix is inconsistent
                if(currentCol == col && naiveGaussianEliminationPivot(currentRow,currentCol+1)~=0)
                    disp("System is inconsistent, no solution exists");
                    return;
                end
                %check if the last column has been reached, if it is the case, row of 0s found, removing it
                if(currentCol == col)
                    naiveGaussianEliminationPivot(currentRow,:) = [];
                end
            end
        end
        
        %checking if system has less rows than columns, if the case, no unique solutions
        if(size(naiveGaussianEliminationPivot,1) < size(naiveGaussianEliminationPivot,2)-1)
            disp("System has infinitely many solutions, no unique solution available.");
            return;
        end
        
        disp("Starting with with the matrix");
        naiveGaussianEliminationPivot %#ok<NOPRT>
        disp("We take the following steps when back-substituing");
        
        %creating step counter
        step = 0;
        
        %saving matrix size
        [row, col] = size(naiveGaussianEliminationPivot);
        
        %back substituing
        for currentRow = row:-1:1
            %check if row pivot is 1, if not turn the pivot 1 by diving the entire row by pivot
            if(naiveGaussianEliminationPivot(currentRow,currentRow) ~=1)
                %printing step operation
                step = step+1;
                disp("==============================");
                fprintf("Step #%d: row%d <== (%.*f)*row%d (turning leading coefficient into a 1)",step,currentRow,precision,(1/naiveGaussianEliminationPivot(currentRow,currentRow)),currentRow);
                naiveGaussianEliminationPivot(currentRow,currentRow:col) =  naiveGaussianEliminationPivot(currentRow,currentRow:col)/naiveGaussianEliminationPivot(currentRow,currentRow) %#ok<NOPRT>
            end
            
            %printing step operation
            step = step+1;
            disp("==============================");
            fprintf("Step #%d: Backsubstituing in row %d",step,currentRow);
            naiveGaussianEliminationPivot(currentRow,col) =  naiveGaussianEliminationPivot(currentRow,col)-sum(naiveGaussianEliminationPivot(currentRow,currentRow+1:col-1)*naiveGaussianEliminationPivot(currentRow+1:row,col));
            naiveGaussianEliminationPivot(currentRow,currentRow+1:col-1) = 0 %#ok<NOPRT>
        end
    end
end
function ALU()
    %declaring global "precision" variable
    global precision;
    
    %title
    disp("======================== LU DECOMPOSITION =======================");
    
    %prompting user for coefficient matrix A (A = LU)
    matrixA = input("Enter coefficient matrix A, use [row1;row2;...rown]: ");
    while(size(matrixA,1) ~= size(matrixA,2))
        matrixA = input("Invalid input, matrix A must be square, please try again: ");
    end
    
    %storing row and col values
    [row,col] = size(matrixA);
    
    %creating step counter
    step = 0;
    
    %printing original coefficient matrix
    disp("The matrix A given is: ");
    matrixA %#ok<NOPRT>
    
    %storing the given matrix in temp matrix that will hold U
    matrixU = matrixA;
    
    %declaring identity matrix that will end up being matrix L
    matrixL = eye(size(matrixA));
    
    %performing naive guassian forward elimination to get the matrices L & U
    for c = 1:col
        %performing required row operations to find LU matrices
        for r = c+1:row
            %break out of naive gaussian elimination fails (division by 0)
            if (matrixU(c,c) == 0)
                disp("LU decomposition cannot be performed due to a division by zero, PA = LU decomposition required.");
                return
            end
            
            %printing step operation
            step = step+1;
            disp("==============================");
            fprintf("Step #%d: row%d <== row%d - (%.*f)*row%d\n",step,r,r,precision,(matrixU(r,c)/matrixU(c,c)),c);
            
            %storing coefficient in matrix L and displaying current matrix L
            matrixL(r,c) = (matrixU(r,c)/matrixU(c,c)) %#ok<NOPRT>
            
            %performing row operation on matrix U and displaying current matrix U
            matrixU(r,:) = matrixU(r,:)- (matrixU(r,c)/matrixU(c,c))*matrixU(c,:) %#ok<NOPRT>
        end
    end
    
    %printing results
    disp("==============================");
    disp("LU decomposition completed! The matrices A = LU are as follows:");
    matrixA %#ok<NOPRT>
    matrixL %#ok<NOPRT>
    matrixU %#ok<NOPRT>
    
    %computing determinant
    det = 1;
    for k = 1:col
        det = det*matrixU(k,k);
    end
    
    %printing determinant
    fprintf("The determinant of the matrix A is %.*f\n",precision,det)
    
    %prompting whether to solve system with A = LU decomposition method
    prmt = input("Would you like to solve a linear system using the A = LU method? [y/n]: ",'s');
    
    %validating input
    while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
        prmt = input("Invalid input, would you like to solve a linear system using the A = LU method? [y/n]: ",'s');
    end
    
    %if user want to solve a linear system, prompt for constant matrix.
    if(prmt == "Y" || prmt == "y")
        %prompting user for constant matrix B (Ax = B)
        matrixB = input("Enter coefficient matrix B, use [row1;row2;...rown]: ");
        
        %validating constant matrix B
        while(size(matrixB,1) ~= size(matrixA,1) || size(matrixB,2)~=1)
            matrixB = input("Invalid input, matrix B must have 1 column and same amount of rows as coefficient matrix, please try again: ");
        end
        
        %computing matrix D, where Ax = B, Ux = D, LU = LD = B, D = L^-1*B
        matrixD = matrixL\matrixB %#ok<NOPRT>
        
        %computing solution to the linear system
        disp("The solution to the linear system is: ");
        sol = matrixU\matrixD    %#ok<NASGU,NOPRT>
    end
end
function PALU()
    %declaring global "precision" variable
    global precision;
    
    %title
    disp("===================== PA = LU DECOMPOSITION =====================");
    
    %prompting user for coefficient matrix A (PA = LU)
    matrixA = input("Enter coefficient matrix A, use [row1;row2;...rown]: ");
    while(size(matrixA,1) ~= size(matrixA,2))
        matrixA = input("Invalid input, matrix A must be square, please try again: ");
    end
    
    %storing row and col values
    [row,col] = size(matrixA);
    
    %creating step counter
    step = 0;
    
    %creating row change counter
    rowChange = 1;
    
    %printing original coefficient matrix
    disp("The matrix A given is: ");
    matrixA %#ok<NOPRT>
    
    %storing the given matrix in temp matrix that will hold U
    matrixU = matrixA;
    
    %declaring identity matrix that will end up being matrix L
    matrixL = eye(size(matrixA));
    
    %declaring identity matrix that will end up being matrix P
    matrixP = eye(size(matrixA));
    
    %performing naive guassian forward elimination to get the matrices P,L & U
    for c = 1:col
        
        %Searching for row with largest element in column
        maxRow = c;
        for k = c+1:row
            if (abs(matrixU(maxRow,c)) < abs(matrixU(k,c)))
                maxRow = k;
            end
        end
        
        %pivoting along the largest element
        if(maxRow ~= c)
            step = step+1;
            rowChange = rowChange*(-1);
            disp("==============================");
            fprintf("Step #%d: row%d <==> row%d\n",step,c,maxRow);
            matrixP([c,maxRow],:) = matrixP([maxRow,c],:) %#ok<NOPRT>
            if(c-1 > 0)
                matrixL([c, maxRow],c-1) = matrixL([maxRow,c],c-1) %#ok<NOPRT>
            else
                matrixL %#ok<NOPRT>
            end
            matrixU([c,maxRow],:) = matrixU([maxRow,c],:) %#ok<NOPRT>
        end
        
        %performing required row operations to find LU matrices
        for r = c+1:row
            %break out of naive gaussian elimination fails (division by 0)
            if (matrixU(c,c) == 0)
                disp("LU decomposition cannot be performed due to a division by zero, PA = LU decomposition required.");
                return
            end
            
            %printing step operation
            step = step+1;
            disp("==============================");
            fprintf("Step #%d: row%d <== row%d - (%.*f)*row%d\n",step,r,r,precision,(matrixU(r,c)/matrixU(c,c)),c);
            
            %printing out matrix P
            matrixP %#ok<NOPRT>
            
            %storing coefficient in matrix L and displaying current matrix L
            matrixL(r,c) = (matrixU(r,c)/matrixU(c,c)) %#ok<NOPRT>
            
            %performing row operation on matrix U and displaying current matrix U
            matrixU(r,:) = matrixU(r,:)- (matrixU(r,c)/matrixU(c,c))*matrixU(c,:) %#ok<NOPRT>
        end
    end
    
    %printing results
    disp("==============================");
    disp("PA = LU decomposition completed! The matrices PA = LU are as follows:");
    matrixP %#ok<NOPRT>
    matrixA %#ok<NOPRT>
    matrixL %#ok<NOPRT>
    matrixU %#ok<NOPRT>
    
    %computing determinant
    det = 1;
    for k = 1:col
        det = det*matrixU(k,k);
    end
    det = rowChange*det;
    
    %printing determinant
    fprintf("The determinant of the matrix A is %.*f\n",precision,det)
    
    %prompting whether to solve system with A = LU decomposition method
    prmt = input("Would you like to solve a linear system using the PA = LU method? [y/n]: ",'s');
    
    %validating input
    while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
        prmt = input("Invalid input, would you like to solve a linear system using the PA = LU method? [y/n]: ",'s');
    end
    
    %if user want to solve a linear system, prompt for constant matrix.
    if(prmt == "Y" || prmt == "y")
        %prompting user for constant matrix B (Ax = B)
        matrixB = input("Enter coefficient matrix B, use [row1;row2;...rown]: ");
        
        %validating constant matrix B
        while(size(matrixB,1) ~= size(matrixA,1) || size(matrixB,2)~=1)
            matrixB = input("Invalid input, matrix B must have 1 column and same amount of rows as coefficient matrix, please try again: ");
        end
        
        %computing matrix D, where P*Ax = P*B, Ux = D, LUx = LD = PB, D = L^-1*P*B
        matrixD = matrixL\(matrixP*matrixB) %#ok<NOPRT>
        
        %computing solution to the linear system
        disp("The solution to the linear system is: ");
        sol = matrixU\matrixD    %#ok<NASGU,NOPRT>
    end
end
function Norm()
    %declaring global "precision" variable
    global precision;
    
    %title
    disp("========================== VECTOR NORM ==========================");
    
    %prompting user for coefficient matrix A (PA = LU)
    matrix = input("Enter a matrix, use [row1;row2;...rown]: ");
    dimension = input("Enter a dimension (p-norm value, use inf for infinity):");
    disp("The matrix given is:")
    matrix %#ok<NOPRT>
    fprintf("The %d-norm of the matrix is %.*f\n",dimension,precision,norm(matrix,dimension));
end
function ForwardBackwardError3()
    %declaring global "precision" variable
    global precision;
    
    %title
    disp("===================== FORWARD/BACKWARD ERROR ====================");

    %prompting user for coefficient matrix A
    matrixA = input("Enter the coefficient matrix A, use [row1;row2;...rown]: ");
    
    %prompting user for constant coefficient matrix B
    matrixB = input("Enter the constant matrix B, use [row1;row2;...rown]: ");
    
    %validating constant matrix B
    while(size(matrixB,1) ~= size(matrixA,1) || size(matrixB,2)~=1)
        matrixB = input("Invalid input, constant matrix B must have 1 column and same amount of rows as coefficient matrix A, please try again: ");
    end
    
    %prompting user for approximated solution matrix
    X_r = input("Enter the approximated solution matrix X_r, use [row1;row2;...rown]: ");
    while(size(X_r,1) ~= size(matrixA,1) || size(X_r,2)~=1)
        X_r = input("Invalid input, approximated solution matrix X_r must have 1 column and same amount of rows as coefficient matrix A, please try again: ");
    end
    
    %prompting whether user knows exact matrix solution
    prmt = input("Do you know the exact solution matrix (optional)? [y/n]: ",'s');
    
    %validating input
    while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
        prmt = input("Invalid input, do you know the exact solution matrix (optional)? [y/n]: ",'s');
    end
    %prompting for exact solution matrix and validating
    if(prmt == "y" || prmt == "Y")
        R = input("Enter the exact solution matrix r, use [row1;row2;...rown]: ");
        while(size(R,1) ~= size(matrixA,1) || size(R,2)~=1)
            R = input("Invalid input, exact solution matrix R must have 1 column and same amount of rows as coefficient matrix A, please try again: ");
        end
    end
    
    %printing given matrices
    if(prmt == "y" || prmt == "Y")
        disp("Given the following matrices A, B, X_r and R :");
    else
        disp("Given the following matrices A, B, X_r and R (calculated automatically) :");
        R = matrixA\matrixB;
    end
    matrixA %#ok<NOPRT>
    matrixB %#ok<NOPRT>
    X_r %#ok<NOPRT>
    R %#ok<NOPRT>
    
    
    %computing true error
    disp("============ true error ");
    %computing true error
    trueAbsoluteForwardError = norm(R - X_r,inf);
    trueAbsoluteBackwardError = norm(matrixA*X_r-matrixB,inf);
    trueRelativeForwardError = norm(R - X_r,inf)/norm(R,inf);
    trueRelativeBackwardError = norm(matrixA*X_r-matrixB,inf)/norm(matrixB,inf);
    trueAbsoluteMagnificationFactor = trueAbsoluteForwardError/trueAbsoluteBackwardError;
    trueRelativeMagnificationFactor = trueRelativeForwardError/trueRelativeBackwardError;
    
    %displaying true error
    fprintf("The true absolute forward error is: %.*f\n",precision,trueAbsoluteForwardError);
    fprintf("The true absolute backward error is: %.*f\n",precision,trueAbsoluteBackwardError);
    fprintf("The true absolute error magnification factor is: %.*f\n",precision,trueAbsoluteMagnificationFactor);
    disp("----------");
    fprintf("The true relative forward error is: %.*f\n",precision,trueRelativeForwardError);
    fprintf("The true relative backward error is: %.*f\n",precision,trueRelativeBackwardError);
    fprintf("The true relative error magnification factor is: %.*f\n",precision,trueRelativeMagnificationFactor);
    
    
    %computing estimated error
    estimatedRelativeMagnificationFactor = cond(matrixA,inf);
    estimatedRelativeBackwardError = norm(matrixA*X_r-matrixB,inf)/norm(matrixB,inf);
    estimatedRelativeForwardError = estimatedRelativeBackwardError*estimatedRelativeMagnificationFactor;
    
    
    %displaying estimated error
    disp("============ estimated error ");
    fprintf("The estimated relative forward error is: %.*f\n",precision,estimatedRelativeForwardError);
    fprintf("The estimated relative backward error is: %.*f\n",precision,estimatedRelativeBackwardError);
    fprintf("The estimated relative error magnification factor is: %.*f\n",precision,estimatedRelativeMagnificationFactor);
    
    %displaying norm error
    disp("============ norm error ");
    fprintf("The 1-norm is: %.*f\n",precision,norm(R-X_r,1));
    fprintf("The 2-norm is: %.*f\n",precision,norm(R-X_r,2));
    fprintf("The infinity-norm is: %.*f\n",precision,norm(R-X_r,inf));
    fprintf("The fro-norm is: %.*f\n",precision,norm(R-X_r,'fro'));
    
    %prompting user to compute a different p-norm
    prmt = input("Would you like to compute a different p-norm? [y/n]: ",'s');
    
    %validating input
    while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
        prmt = input("Would you like to compute a different p-norm? [y/n]: ",'s');
    end
    
    %prompting for p-norm and computing the norm error.
    if(prmt == "y" || prmt == "Y")
        
        %prompting for p norm
        p = input("Enter the p-norm to compute (greater than 0): ");
        
        %validating p norm entered
        while(p < 1)
            p = input("Invalid input, Enter the p-norm to compute (greater than 0): ");
        end
        
        %printing the norm error
        fprintf("The %d-norm is: %.*f\n",p,precision,norm(R-X_r,p));
    end
end
function MatrixCondition()
    %declaring global "precision" variable
    global precision;
    
    %title
    disp("======================== MATRIX CONDITION =======================");

    %prompting user for coefficient matrix A
    matrixA = input("Enter the coefficient matrix A, use [row1;row2;...rown]: ");
    disp("The matrix A given is: ");
    matrixA %#ok<NOPRT>
    fprintf("The condition of matrix a Cond(A) = %.*f\n",precision,norm(matrixA,inf)*norm(inv(matrixA),inf)); %alternatively, use cond(a,inf)
end
function lostDigits()
    %declaring global "precision" variable
    global precision;
    
    %title
    disp("========================== LOST DIGITS ==========================");
 
    %prompting user for coefficient matrix A
    matrixA = input("Enter the coefficient matrix A, use [row1;row2;...rown]: ");
    disp("The matrix A given is: ");
    matrixA %#ok<NOPRT>
    fprintf("The amount of digits lost (precision) due to error is = %.*f or approximately %d digits.\n",precision,log10(cond(matrixA)),ceil(log10(cond(matrixA)))); %alternatively, use cond(a,inf)
    fprintf("Therefore, should you wish to have a precision of X digits in your solution, you need to start with X+%d digits.\n",ceil(log10(cond(matrixA))))
    fprintf("Should you start with a precision of X digits in your input, you will end up with a precision of X-%d digits.\n",ceil(log10(cond(matrixA))))
end

% =========== Chapter 4 - Regression and Interpolation ===========
function Chapter4()
    %declaring global variable
    global clearConsole;
        
    %Starting menu loop, returns to main menu after user exits
    while(true)
        disp("=========== Chapter 4 - Regression and Interpolation ============");
        disp("[1]  Error of known regression models");
        disp("[2]  Linear Regression (least square fitting)");
        disp("[3]  Non-Linear Regression (Exponential)");
        disp("[4]  Non-Linear Regression (Power)");
        disp("[5]  Normal Polynomial Equations Regression");
        disp("[6]  Normal Equations Regression");
        disp("[7]  Vandermonde Interpolation");
        disp("[8]  Newton's Interpolation");
        disp("[9]  Lagrange's Interpolation");
        disp("[10] Linear Piecewise/Spline Interpolation");
        disp("[11] Cubic Piecewise/Spline Interpolation");
        disp("[12] Interpolation Error");
        disp("[13] Return to main menu");
        
        %prompt user for option
        x = input("Choose an option: ");
        
        %validating user input
        while(x < 1 || x > 13)
            x = input("Invalid input, please try again: ");
        end
        
        switch(x)
            case(1)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                RegressionError();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(2)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                LinearRegression();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(3)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                NonLinearRegressionExponential();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(4)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                NonLinearRegressionPower();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(5)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                NormalPolynomialRegression();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(6)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                NormalRegression();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(7)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                VandermondeInterpolation();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(8)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                NewtonInterpolation();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(9)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                LagrangeInterpolation();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(10)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                LinearPiecewiseInterpolation();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(11)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                CubicPiecewiseInterpolation();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(12)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                InterpolationError();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(13)
                break;
            otherwise
                continue;
        end
    end
end
function RegressionError()
    %declaring global "precision" variable
    global precision;
    
    %title
    disp("======================== REGRESSION ERROR =======================");
    
    %declaring symbolic variable
    syms x;
    
    %prompting user for data set
    while(true)
        %prompting for x_i
        x_i = input("Enter the x_i dataset (use [x1, x2, x3 ... xi]): ");
        %prompting for y_i
        y_i = input("Enter the y_i dataset (use [y1, y2, y3 ... yi]): ");
        if(size(x_i) == size(y_i))
            if(size(x_i,1) == 1)
                break;
            end
        end
        disp("Invalid input, x_i and y_i must be a vector of the same size, please try again.");
    end
    
    %sorting data set
    conc = [x_i;y_i];
    [~ ,order] = sort(conc(1,:));
    conc = conc(:,order);
    x_i = conc(1,:);
    y_i = conc(2,:);
    
    %prompting user to enter the AMOUNT of models to compute
    count = input("How many DIFFERENT models would you like to compute the error of? (bigger than 0): ");         %prompting user for amount of models to analyze
    
    %validating user input (checking if the count is greater than 0, if not, prompting until valid count is entered)
    while (count < 1)
        count = input("Invalid amount, please try again: ");                                                      %prompting user for amount of models again
    end
    
    %initializing an array to hold each model that is to be analyzed
    model_func = sym(zeros(count));                                                                               %initializing symbolic array to hold the models entered by the user
    model = zeros(count,size(x_i,2));                                                                             %initializing array that holds the output value of each x_i in each of the model entered by the user
    residual = zeros(count,size(x_i,2));                                                                          %initializing array that holds the residual value of each x_i in each of the model entered by the user
    SE = zeros(count,size(x_i,2));                                                                                %initializing array that holds the square error of each model entered by the user
    MSE = zeros(count,size(x_i,2));                                                                               %initializing array that holds the mean square error of each model entered by the user
    RMSE = zeros(count,size(x_i,2));                                                                              %initializing array that holds the root mean square error of each model entered by the user
    
    %prompting for model and computing model value, residuals, square error, MSE and RMSE for each model
    for k = 1:count
        %prompting user for model
        func = input(sprintf("MODEL #%d: Please enter the model and it's coefficients (e.g. for y = a0+a1*x, with a0=1 and a1=2, enter 1+2*x). y = ?: ",k));
        
        %storing model in the model_func array
        model_func(k) = func;
        
        %converting model to numerical to improve performance
        func = matlabFunction(func,'Vars',x);
        
        %evaluating output of model given input x_i
        model(k,:) = func(x_i);
        
        %computing residuals
        residual(k,:) = y_i-model(k,:);
        
        %computing square error
        SE(k,:) = sum(residual(k,:).^2);
        
        %computing mean square error
        MSE(k,:) = SE(k,:)/size(x_i,2);
        
        %computing root mean square error
        RMSE(k,:) = sqrt(MSE(k,:));
    end
    
    %Displaying model and residual
    for l = 1:count
        fprintf("======= MODEL #%d: %s \n",l,model_func(l))
        
        %printing the SE, MSE and RMSE for current model
        fprintf("The Square Error is %.*f\n",precision,SE(l));
        fprintf("The Mean Square Error is %.*f\n",precision,MSE(l));
        fprintf("The Root Mean Square Error is %.*f\n",precision,RMSE(l));
        
        %printing residual for each point in x_i
        for k = 1:size(x_i,2)
            fprintf("For x_%d = %.*f, we have y_%d = %.*f, y_mod_%d = %.*f, residual_%d = %.*f\n",k,precision,x_i(1,k),k,precision,y_i(1,k),k,precision,model(l,k),k,precision,residual(l,k))
        end
    end
end
function LinearRegression()
    %declaring global "precision" variable
    global precision;
    
    %title
    disp("============ LINEAR REGRESSION (LEAST SQUARE FITTING) ===========");
    
    %prompting user for data set
    while(true)
        %prompting for x_i
        x_i = input("Enter the x_i dataset (use [x1, x2, x3 ... xi]): ");
        %prompting for y_i
        y_i = input("Enter the y_i dataset (use [y1, y2, y3 ... yi]): ");
        if(size(x_i) == size(y_i))
            if(size(x_i,1) == 1)
                break;
            end
        end
        disp("Invalid input, x_i and y_i must be a vector of the same size, please try again.");
    end
    
    %sorting data set
    conc = [x_i;y_i];
    [~ ,order] = sort(conc(1,:));
    conc = conc(:,order);
    x_i = conc(1,:);
    y_i = conc(2,:);
    
    %computing coefficients
    m = size(x_i,2);
    a1 = (m*sum(x_i.*y_i)-sum(x_i)*sum(y_i))/(m*sum(x_i.^2)-sum(x_i)^2);
    a0 = (sum(y_i)-a1*sum(x_i))/m;
    
    %computing residual
    residual = a0+a1.*x_i;
    
    %printing solution
    fprintf("The coefficients to the linear equation y = a0+a1*x are: \na0 = %.*f \na1 = %.*f\n",precision,a0,precision,a1);
    
    %prompting user if he wants to plot original data set points and regression line
    prmt2 = input("Would you like to plot the regression line and the original data set point? [y/n]: ",'s');
    
    %validating input
    while (prmt2 ~= "N" && prmt2 ~= "n" && prmt2 ~= "Y" && prmt2 ~= "y")
        prmt2 = input("Invalid input, would you like to plot the regression line and the original data set point? [y/n]: ",'s');
    end
    
    %plotting interpolation function and data set series if user choosed to
    if(prmt2 == "y" || prmt2 == "Y")
        
        %declaring symbolic variable and function
        syms x;
        func = a1*x+a0;
        
        %creating third subplot and plotting on it
        subplot(2,1,1);
        
        %plotting the regression function
        fplot(func,'DisplayName',"Linear Regression Function");  %plotting the original function
        hold on;                                                 %tells matlab to hold all plots below
        
        %plotting the original data set xi and yi
        scatter(x_i,y_i,'DisplayName',"Original Data");
        
        %legend and axis
        title('Linear Regression (Least Square fitting)');    %setting graph title
        xlabel('x');                                         %setting x-axis label
        ylabel('P(x)');                                      %setting y-axis label
        axis auto;                                           %setting axis range (auto) , use ([xmin xmax ymin ymax]) for manual range
        grid on;                                             %setting major grid
        grid minor;                                          %setting minor grid
        legend;
        hold off;                                            %tells matlab to stop holding further plots
        
        %creating second subplot and plotting on it
        subplot(2,1,2);
        
        %plotting the residual of data set
        scatter(x_i,residual,'DisplayName',"Residual of linear regression");
        
        %legend and axis
        title('Residual of linear regression function');          %setting graph title
        xlabel('x');                                              %setting x-axis label
        ylabel('P(x)');                                           %setting y-axis label
        axis auto;                                                %setting axis range (auto) , use ([xmin xmax ymin ymax]) for manual range
        grid on;                                                  %setting major grid
        grid minor;                                               %setting minor grid
        legend;
        hold off;                                                 %tells matlab to stop holding further plot
    end
end
function NonLinearRegressionExponential()
    %declaring global "precision" variable
    global precision;
    
    %title
    disp("============== NON-LINEAR REGRESSION (EXPONENTIAL) ==============");
    
    %prompting user for data set
    while(true)
        %prompting for x_i
        x_i = input("Enter the x_i dataset (use [x1, x2, x3 ... xi]): ");
        %prompting for y_i
        y_i = input("Enter the y_i dataset (use [y1, y2, y3 ... yi]): ");
        if(size(x_i) == size(y_i))
            if(size(x_i,1) == 1)
                break;
            end
        end
        disp("Invalid input, x_i and y_i must be a vector of the same size, please try again.");
    end
    
    %sorting data set
    conc = [x_i;y_i];
    [~ ,order] = sort(conc(1,:));
    conc = conc(:,order);
    x_i = conc(1,:);
    y_i = conc(2,:);
    
    %computing coefficients
    m = size(x_i,2);
    lny_i = log(y_i);
    
    %computing linearized exponential coefficient
    a1 = (m*sum(x_i.*lny_i)-sum(x_i)*sum(lny_i))/(m*sum(x_i.^2)-sum(x_i)^2);
    a0 = (sum(lny_i)-a1*sum(x_i))/m;
    
    %computing residual
    residual = exp(a0).*exp(a1.*x_i);
    
    %printing solution
    fprintf("The coefficients to the linearized equation ln(y) = ln(a0)+a1*x are: \nln(a0) = %.*f \nln(a1) = %.*f\n",precision,a0,precision,a1);
    fprintf("The coefficients to the exponential equation y = a0*e^(a1*x) are: \na0 = %.*f \na1 = %.*f\n",precision,exp(a0),precision,a1);
    
    %prompting user if he wants to plot original data set points and regression line
    prmt2 = input("Would you like to plot the regression line and the original data set point? [y/n]: ",'s');
    
    %validating input
    while (prmt2 ~= "N" && prmt2 ~= "n" && prmt2 ~= "Y" && prmt2 ~= "y")
        prmt2 = input("Invalid input, would you like to plot the regression line and the original data set point? [y/n]: ",'s');
    end
    
    %plotting interpolation function and data set series if user choosed to
    if(prmt2 == "y" || prmt2 == "Y")
        
        %declaring symbolic variable and function
        syms x;
        linfunc = a1*x+a0;
        expfunc = exp(a0)*exp(a1*x);
        
        %creating first suplot and plotting on it
        subplot(3,1,1);
        
        %plotting the linearized regression function
        fplot(linfunc,'DisplayName',"Linearized Exponential Regression");  %plotting the original function
        hold on;                                                           %tells matlab to hold all plots below
        
        %plotting the linearized data set xi and yi
        scatter(x_i,lny_i,'DisplayName',"linearized Data");
        
        %legend and axis
        title('Linearized Exponential Regression');          %setting graph title
        xlabel('x');                                         %setting x-axis label
        ylabel('P(x)');                                      %setting y-axis label
        axis auto;                                           %setting axis range (auto) , use ([xmin xmax ymin ymax]) for manual range
        grid on;                                             %setting major grid
        grid minor;                                          %setting minor grid
        legend;
        hold off;                                            %tells matlab to stop holding further plots
        
        %creating second subplot and plotting on it
        subplot(3,1,2);
        
        %plotting exponential regression function
        fplot(expfunc,'DisplayName',"Exponential Regression Function");   %plotting the original function
        hold on
        
        %plotting the original data set xi and yi
        scatter(x_i,y_i,'DisplayName',"Original Data");
        
        %legend and axis
        title('Exponential Regression');                     %setting graph title
        xlabel('x');                                         %setting x-axis label
        ylabel('P(x)');                                      %setting y-axis label
        axis auto;                                           %setting axis range (auto) , use ([xmin xmax ymin ymax]) for manual range
        grid on;                                             %setting major grid
        grid minor;                                          %setting minor grid
        legend;
        hold off;                                            %tells matlab to stop holding further plots
        
        %creating third subplot and plotting on it
        subplot(3,1,3);
        
        %plotting the residual of data set
        scatter(x_i,residual,'DisplayName',"Residual of exponential regression");
        
        %legend and axis
        title('Residual of exponential regression function');     %setting graph title
        xlabel('x');                                              %setting x-axis label
        ylabel('P(x)');                                           %setting y-axis label
        axis auto;                                                %setting axis range (auto) , use ([xmin xmax ymin ymax]) for manual range
        grid on;                                                  %setting major grid
        grid minor;                                               %setting minor grid
        legend;
        hold off;                                                 %tells matlab to stop holding further plot
    end
end
function NonLinearRegressionPower()
    %declaring global "precision" variable
    global precision;
    
    %title
    disp("================= NON-LINEAR REGRESSION (POWER) =================");
    
    %prompting user for data set
    while(true)
        %prompting for x_i
        x_i = input("Enter the x_i dataset (use [x1, x2, x3 ... xi]): ");
        %prompting for y_i
        y_i = input("Enter the y_i dataset (use [y1, y2, y3 ... yi]): ");
        if(size(x_i) == size(y_i))
            if(size(x_i,1) == 1)
                break;
            end
        end
        disp("Invalid input, x_i and y_i must be a vector of the same size, please try again.");
    end
    
    %sorting data set
    conc = [x_i;y_i];
    [~ ,order] = sort(conc(1,:));
    conc = conc(:,order);
    x_i = conc(1,:);
    y_i = conc(2,:);
    
    %computing coefficients
    m = size(x_i,2);
    lnx_i = log(x_i);
    lny_i = log(y_i);
    
    %computing linearized exponential coefficient
    a1 = (m*sum(lnx_i.*lny_i)-sum(lnx_i)*sum(lny_i))/(m*sum(lnx_i.^2)-sum(lnx_i)^2);
    a0 = (sum(lny_i)-a1*sum(lnx_i))/m;
    
    %computing residual
    residual = exp(a0).*(x_i.^a1);
    
    %printing solution
    fprintf("The coefficients to the linearized equation ln(y) = ln(a0)+a1*ln(x) are: \nln(a0) = %.*f \nln(a1) = %.*f\n",precision,a0,precision,a1);
    fprintf("The coefficients to the power equation y = a0*x^(a1) are: \na0 = %.*f \na1 = %.*f\n",precision,exp(a0),precision,a1);
    
    %prompting user if he wants to plot original data set points and regression line
    prmt2 = input("Would you like to plot the regression line and the original data set point? [y/n]: ",'s');
    
    %validating input
    while (prmt2 ~= "N" && prmt2 ~= "n" && prmt2 ~= "Y" && prmt2 ~= "y")
        prmt2 = input("Invalid input, would you like to plot the regression line and the original data set point? [y/n]: ",'s');
    end
    
    %plotting interpolation function and data set series if user choosed to
    if(prmt2 == "y" || prmt2 == "Y")
        
        %declaring symbolic variable and function
        syms x;
        linfunc = a1*x+a0;
        powfunc = exp(a0)*x^a1;
        
        %creating first suplot and plotting on it
        subplot(3,1,1);
        
        %plotting the linearized regression function
        fplot(linfunc,'DisplayName',"Linearized Power Regression ");        %plotting the original function
        hold on;                                                            %tells matlab to hold all plots below
        
        %plotting the linearized data set xi and yi
        scatter(lnx_i,lny_i,'DisplayName',"linearized Data");
        
        %legend and axis
        title('Linearized Power Regression');                %setting graph title
        xlabel('x');                                         %setting x-axis label
        ylabel('P(x)');                                      %setting y-axis label
        axis auto;                                           %setting axis range (auto) , use ([xmin xmax ymin ymax]) for manual range
        grid on;                                             %setting major grid
        grid minor;                                          %setting minor grid
        legend;
        hold off;                                            %tells matlab to stop holding further plots
        
        %creating second subplot and plotting on it
        subplot(3,1,2);
        
        %plotting power regression function
        fplot(powfunc,'DisplayName',"Power Regression Function");   %plotting the original function
        hold on
        
        %plotting the original data set xi and yi
        scatter(x_i,y_i,'DisplayName',"Original Data");
        
        %legend and axis
        title('Power Regression');                           %setting graph title
        xlabel('x');                                         %setting x-axis label
        ylabel('P(x)');                                      %setting y-axis label
        axis auto;                                           %setting axis range (auto) , use ([xmin xmax ymin ymax]) for manual range
        grid on;                                             %setting major grid
        grid minor;                                          %setting minor grid
        legend;
        hold off;                                            %tells matlab to stop holding further plots
        
        %creating third subplot and plotting on it
        subplot(3,1,3);
        
        %plotting the residual of data set
        scatter(x_i,residual,'DisplayName',"Residual");
        
        %legend and axis
        title('Residual of power regression function');           %setting graph title
        xlabel('x');                                              %setting x-axis label
        ylabel('P(x)');                                           %setting y-axis label
        axis auto;                                                %setting axis range (auto) , use ([xmin xmax ymin ymax]) for manual range
        grid on;                                                  %setting major grid
        grid minor;                                               %setting minor grid
        legend;
        hold off;                                                 %tells matlab to stop holding further plot
    end
end
function NormalPolynomialRegression()
    %declaring global "precision" variable
    global precision;
    
    %title
    disp("================== NORMAL POLYNOMIAL REGRESSION =================");
    
    %prompting user for data set
    while(true)
        %prompting for x_i
        x_i = input("Enter the x_i dataset (use [x1, x2, x3 ... xi]): ");
        %prompting for y_i
        y_i = input("Enter the y_i dataset (use [y1, y2, y3 ... yi]): ");
        if(size(x_i) == size(y_i))
            if(size(x_i,1) == 1)
                break;
            end
        end
        disp("Invalid input, x_i and y_i must be a vector of the same size, please try again.");
    end
    
    %prompting user for amount of coefficients
    n = input("Enter the order of the regression polynomial a0 + a1*x + a2*x^2 ... + an*x^n (a0,a1,a2...an, enter n): ");
    
    %sorting data set - not required
    conc = [x_i;y_i];
    [~ ,order] = sort(conc(1,:));
    conc = conc(:,order);
    x_i = conc(1,:);
    y_i = conc(2,:);
    
    %transposing x & y to get colum matrix
    x_i = transpose(x_i);
    y_i = transpose(y_i);
    
    %creating coefficient matrix A
    m = size(x_i,1);
    A = zeros(m,n+1);
    for row = 1:m
        for col = 1:n+1
            A(row,col) = x_i(row,1)^(col-1);
        end
    end
    
    %printing the coefficient matrix
    disp("The normal matrix is: ");
    A %#ok<NOPRT>
    
    %printing the transpose of the coefficient matrix
    disp("The transpose of the normal matrix is: ");
    AT = transpose(A) %#ok<NOPRT>
    
    %computing and printing the coefficients matrix
    disp("The coefficient matrix is: ");
    a = AT*A\AT*y_i %#ok<NOPRT>
    
    %computing and printing the residual
    disp("The residual matrix is: ");
    residual = (A*a)-y_i %#ok<NOPRT>
    
    %computing RMSE
    RMSE = norm(residual,2)/sqrt(length(x_i));
    fprintf("The Root Mean Square Error is: %.*f\n",precision,RMSE);
    
    %printing solution
    disp("The coefficients of the polynomial regression a0 + a1*x + a2*x^2 + ... an*x^n are:");
    for k = 1:n+1
        fprintf("a%d = %.*f\n",k-1,precision,a(k,1));
    end
    
    %prompting user if he wants to plot original data set points and regression line
    prmt2 = input("Would you like to plot the regression line and the original data set point? [y/n]: ",'s');
    
    %validating input
    while (prmt2 ~= "N" && prmt2 ~= "n" && prmt2 ~= "Y" && prmt2 ~= "y")
        prmt2 = input("Invalid input, would you like to plot the regression line and the original data set point? [y/n]: ",'s');
    end
    
    %plotting interpolation function and data set series if user choosed to
    if(prmt2 == "y" || prmt2 == "Y")
        
        %declaring symbolic variable and function
        syms x;
        func = 0;
        for col = 1:n+1
            func = func + a(col,1)*x^(col-1);
        end
        
        %creating first subplot for regression function and original dataset
        subplot(2,1,1);
        
        %plotting the regression function
        fplot(func,'DisplayName',"Polynomial Regression Function");  %plotting the original function
        hold on;                                                     %tells matlab to hold all plots below
        
        %plotting the original data set xi and yi
        scatter(x_i,y_i,'DisplayName',"Original Data");
        
        %legend and axis
        title('Polynomial Regression (Least Square fitting)');    %setting graph title
        xlabel('x');                                              %setting x-axis label
        ylabel('P(x)');                                           %setting y-axis label
        axis auto;                                                %setting axis range (auto) , use ([xmin xmax ymin ymax]) for manual range
        grid on;                                                  %setting major grid
        grid minor;                                               %setting minor grid
        legend;
        hold off;                                            %tells matlab to stop holding further plots
        
        %creating second subplot for the residual
        subplot(2,1,2)
        
        %plotting the residual of data set
        scatter(x_i,residual,'DisplayName',"Residual");
        
        %legend and axis
        title('Residual of polynomial regression function');      %setting graph title
        xlabel('x');                                              %setting x-axis label
        ylabel('P(x)');                                           %setting y-axis label
        axis auto;                                                %setting axis range (auto) , use ([xmin xmax ymin ymax]) for manual range
        grid on;                                                  %setting major grid
        grid minor;                                               %setting minor grid
        legend;
        hold off;                                                 %tells matlab to stop holding further plot
        
    end
end
function NormalRegression()
    %declaring global "precision" variable
    global precision;
    
    %title
    disp("======================= NORMAL REGRESSION =======================");
    
    %declaring symbolic variable
    syms x;
    
    %prompting user for data set
    while(true)
        %prompting for x_i
        x_i = input("Enter the x_i dataset (use [x1, x2, x3 ... xi]): ");
        %prompting for y_i
        y_i = input("Enter the y_i dataset (use [y1, y2, y3 ... yi]): ");
        if(size(x_i) == size(y_i))
            if(size(x_i,1) == 1)
                break;
            end
        end
        disp("Invalid input, x_i and y_i must be a vector of the same size, please try again.");
    end
    
    %prompting user to enter equation model
    symmodel = input("Enter the equation model (e.g. if model is a0 + a1*x + a2*x^2 + a3*sin(x) + a4*exp(x) ..., enter [1,x,x^2,sin(x),exp(x),...]): ");
    
    %converting symbolic model to numerical model
    model = matlabFunction(symmodel,'Vars',x);
    
    %sorting data set - not required
    conc = [x_i;y_i];
    [~ ,order] = sort(conc(1,:));
    conc = conc(:,order);
    x_i = conc(1,:);
    y_i = conc(2,:);
    
    %creating coefficient matrix A
    m = size(x_i,2);
    n = size(symmodel,2);
    A = zeros(m,n);
    for row = 1:m
        A(row,:) = model(x_i(1,row));
    end
    
    %transposing x & y to get colum matrix
    x_i = transpose(x_i);
    y_i = transpose(y_i);
    
    %printing the coefficient matrix
    disp("The normal matrix is: ");
    A %#ok<NOPRT>
    
    %printing the tranpose of the coefficient matrix
    disp("The transpose of the normal matrix is: ");
    AT = transpose(A) %#ok<NOPRT>
    
    %computing and printing the coefficients matrix
    disp("The coefficient matrix is: ");
    a = AT*A\AT*y_i %#ok<NOPRT>
    
    %computing and printing the residual
    disp("The residual matrix is: ");
    residual = (A*a)-y_i %#ok<NOPRT>
    
    %computing RMSE
    RMSE = norm(residual,2)/sqrt(size(x_i,1));
    fprintf("The Root Mean Square Error is: %.*f\n",precision,RMSE);
    
    %printing solution
    disp("The coefficients of the model y = %s are:");
    for k = 1:n
        fprintf("a%d = %.*f\n",k-1,precision,a(k,1));
    end
    
    %prompting user if he wants to plot original data set points and regression line
    prmt2 = input("Would you like to plot the regression line and the original data set point? [y/n]: ",'s');
    
    %validating input
    while (prmt2 ~= "N" && prmt2 ~= "n" && prmt2 ~= "Y" && prmt2 ~= "y")
        prmt2 = input("Invalid input, would you like to plot the regression line and the original data set point? [y/n]: ",'s');
    end
    
    %plotting interpolation function and data set series if user choosed to
    if(prmt2 == "y" || prmt2 == "Y")
        
        %defining function
        func = 0;
        for row = 1:n
            func = func + a(row,1)*symmodel(1,row);
        end
        
        %creating first subplot for regression function and original dataset
        subplot(2,1,1);
        
        %plotting the regression function
        fplot(func,'DisplayName',"Normal Regression Function");      %plotting the original function
        hold on;                                                     %tells matlab to hold all plots below
        
        %plotting the original data set xi and yi
        scatter(x_i,y_i,'DisplayName',"Original Data");
        
        %legend and axis
        title('Normal Regression (Least Square fitting)');        %setting graph title
        xlabel('x');                                              %setting x-axis label
        ylabel('P(x)');                                           %setting y-axis label
        axis auto;                                                %setting axis range (auto) , use ([xmin xmax ymin ymax]) for manual range
        grid on;                                                  %setting major grid
        grid minor;                                               %setting minor grid
        legend;
        hold off;                                            %tells matlab to stop holding further plots
        
        %creating second subplot for the residual
        subplot(2,1,2)
        
        %plotting the residual of data set
        scatter(x_i,residual,'DisplayName',"Residual");
        
        %legend and axis
        title('Residual of normal regression function');          %setting graph title
        xlabel('x');                                              %setting x-axis label
        ylabel('P(x)');                                           %setting y-axis label
        axis auto;                                                %setting axis range (auto) , use ([xmin xmax ymin ymax]) for manual range
        grid on;                                                  %setting major grid
        grid minor;                                               %setting minor grid
        legend;
        hold off;                                                 %tells matlab to stop holding further plot
    end
end
function VandermondeInterpolation()
    %declaring global "precision" variable
    global precision;
    
    %title
    disp("=================== VANDERMONDE INTERPOLATION ===================");
    
    %declaring symbolic variable
    syms x;
    
    %prompting user for data set
    while(true)
        %prompting for x_i
        x_i = input("Enter the x_i dataset (use [x1, x2, x3 ... xi]): ");
        
        %asking user  whether the data set comes from a known function (he's performing function interpolation)
        prmt3 = input("Does the y_i data set come from a known function (function interpolation)? [y/n]: ",'s');
        %validating input
        while (prmt3 ~= "N" && prmt3 ~= "n" && prmt3 ~= "Y" && prmt3 ~= "y")
            prmt3 = input("Invalid input, does the y_i data set come from a known function (function interpolation)? [y/n]: ",'s');
        end
        
        %if data set does come from a known function, prompting user for function
        if(prmt3 == "y" || prmt3 == "Y")
            original_func = input("Please enter the function f(x), y_i will be automatically generated (use x as variable): ");
            y_i = double(subs(original_func,x,x_i));
            disp("The y_i data set has been computed as follows: ");
            y_i %#ok<NOPRT>
            break;
        else
            y_i = input("Enter the y_i dataset (use [y1, y2, y3 ... yi]): ");
            if(size(x_i) == size(y_i))
                if(size(x_i,1) == 1)
                    break;
                end
            end
            disp("Invalid input, x_i and y_i must be a vector of the same size, please try again.");
        end
    end
    
    %sorting data set
    conc = [x_i;y_i];
    [~ ,order] = sort(conc(1,:));
    conc = conc(:,order);
    x_i = conc(1,:);
    y_i = conc(2,:);
    
    %storing amount of data set
    m = size(x_i,2);
    
    %generating vandermonde matrix
    vanderMondeMatrix = zeros(m,m);
    for col = 1:m
        for row = 1:m
            vanderMondeMatrix(row,col) = x_i(1,row)^(col-1);
        end
    end
    disp("The vandermonde matrix is: ");
    vanderMondeMatrix %#ok<NOPRT>
    
    %solving vandermonde matrix
    solution = vanderMondeMatrix\transpose(y_i);
    
    %displaying the solution
    disp("The solution is: ");
    
    
    for k = 0:m-1
        fprintf("a%d = %.*f\n",k,precision,solution(k+1,1));
    end
    
    fprintf("P_%d(x) = (%.*f) ",m-1,precision,solution(1,1));
    for k = 1:m-1
        fprintf("+ (%.*f)*x^%d ",precision,solution(k+1,1),k);
    end
    fprintf("\n");
    
    %defining interpolation function
    func = 0;
    for k = 1:m
        func = func+solution(k,1)*x^(k-1);
    end
    
    %prompting user on whether he would like to interpolate points
    prmt = input("\nWould you like to evaluate a point or set of points using the interpolating polynomial? [y/n]: ",'s');
    
    %validating input
    while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
        prmt = input("Invalid input, evaluate a point or set of points using the interpolating polynomial? [y/n]: ",'s');
    end
    
    %prompting for points
    if(prmt == "y" || prmt == "Y")
        %prompting user for points
        point = input("Enter the point or set of points to evalute (use [x1,x2,...xn] for multiple points or simply enter x1 value for one point): ");
        
        %evaluating points
        temp = matlabFunction(func,'Vars',x);
        eval_sol = temp(point);
        
        %printing out evaluated points
        for k = 1:size(point,2)
            fprintf("P_%d(x_%d) = P_%d(%.*f) = %.*f\n",m-1,k,m-1,precision,point(1,k),precision,eval_sol(1,k));
        end
    end
    
    %finding error interpolation if function is given
    if(prmt3 == "y" || prmt3 == "Y")
        temp = 1;
        for k = 1:m
            temp = temp*(x-x_i(1,k));
        end
        errorfunc = matlabFunction((temp/factorial(m))*subs(diff(original_func,x,m),x,(max(x_i)-min(x_i))/2),'Vars',x);
        
        disp("The interpolation error on the original data set is: ");
        [x_i; errorfunc(x_i)] %#ok<NOPRT>
        if(prmt3 == "y" || prmt3 == "Y")
            disp("The interpolation error on the interpolated data set is:");
            [point; errorfunc(point)] %#ok<NOPRT>
        end
    end
    
    %prompting user if he wants to plot original data set points, interpolation function and interpolated points
    prmt2 = input("Would you like to plot the interpolation function and the original (and interpolated) data set point? [y/n]: ",'s');
    
    %validating input
    while (prmt2 ~= "N" && prmt2 ~= "n" && prmt2 ~= "Y" && prmt2 ~= "y")
        prmt2 = input("Invalid input, would you like to plot the interpolation function and the original (and interpolated) data set point? [y/n]: ",'s');
    end
    
    %plotting interpolation function and data set series if user choosed to
    if(prmt2 == "y" || prmt2 == "Y")
        
        %plotting the interpolating function
        fplot(func,'DisplayName',"Vandermonde Interpolation Function");  %plotting the original function
        hold on;                                             %tells matlab to hold all plots below
        
        %plotting original function (if given)
        if(prmt3 == "y" || prmt3 == "Y")
            fplot(original_func,'DisplayName',"Original Function");
        end
        
        %plotting the original data set xi and yi
        scatter(x_i,y_i,'DisplayName',"Original Data");
        
        %plotting the interpolated data set if given
        if(prmt == "y" || prmt == "Y")
            scatter(point,eval_sol,'*','DisplayName',"Interpolated Data");
        end
        
        %legend and axis
        title('Vandermonde Interpolation');     %setting graph title
        xlabel('x');                %setting x-axis label
        ylabel('P(x)');             %setting y-axis label
        axis auto;                  %setting axis range (auto) , use ([xmin xmax ymin ymax]) for manual range
        grid on;                    %setting major grid
        grid minor;                 %setting minor grid
        legend;
        hold off;                   %tells matlab to stop holding further plots
    end
end
function NewtonInterpolation()
    %declaring global "precision" variable
    global precision;
    
    %title
    disp("====================== NEWTON INTERPOLATION =====================");
    
    %declaring symbolic variable
    syms x;
    
    %prompting user for data set
    while(true)
        %prompting for x_i
        x_i = input("Enter the x_i dataset (use [x1, x2, x3 ... xi]): ");
        
        %asking user  whether the data set comes from a known function (he's performing function interpolation)
        prmt3 = input("Does the y_i data set come from a known function (function interpolation)? [y/n]: ",'s');
        %validating input
        while (prmt3 ~= "N" && prmt3 ~= "n" && prmt3 ~= "Y" && prmt3 ~= "y")
            prmt3 = input("Invalid input, does the y_i data set come from a known function (function interpolation)? [y/n]: ",'s');
        end
        
        %if data set does come from a known function, prompting user for function
        if(prmt3 == "y" || prmt3 == "Y")
            original_func = input("Please enter the function f(x), y_i will be automatically generated (use x as variable): ");
            y_i = double(subs(original_func,x,x_i));
            disp("The y_i data set has been computed as follows: ");
            y_i %#ok<NOPRT>
            break;
        else
            y_i = input("Enter the y_i dataset (use [y1, y2, y3 ... yi]): ");
            if(size(x_i) == size(y_i))
                if(size(x_i,1) == 1)
                    break;
                end
            end
            disp("Invalid input, x_i and y_i must be a vector of the same size, please try again.");
        end
    end
    
    %sorting data set
    conc = [x_i;y_i];
    [~ ,order] = sort(conc(1,:));
    conc = conc(:,order);
    x_i = conc(1,:);
    y_i = conc(2,:);
    
    %storing amount of data set
    m = size(x_i,2);
    
    %creating newton coefficient matrix
    newtonCoefficientMatrix = zeros(m,m);
    
    %computing first level (storing y_i in first column)
    for row = 1:m
        newtonCoefficientMatrix(row,1) = y_i(1,row);
    end
    
    %computing higher level (storing (col_i+1 - col_i)/(x_i+1 - x_i) in next column's i row)
    for col = 2: m
        for row = 1 : m +  1 - col
            newtonCoefficientMatrix(row,col) = (newtonCoefficientMatrix(row+1,col-1) - newtonCoefficientMatrix(row,col-1))/(x_i(1,row+col-1) - x_i(1,row));
        end
    end
    
    %displaying the solution
    disp("The solution is: ");
    for k = 1:m
        fprintf("b%d = %.*f\n",k-1,precision,newtonCoefficientMatrix(1,k));
    end
    
    %printing the newton interpolation function with unknown x_i
    fprintf("P_%d(x) = (%.*f)",m-1,precision,newtonCoefficientMatrix(1,1));
    for k = 2:m
        fprintf(" + (%.*f)",precision,newtonCoefficientMatrix(1,k));
        for l = 2:k
            fprintf("*(x-x%d)",l-1);
        end
    end
    fprintf("\n");
    
    %printing the newton interpolation function with correct x_i
    syms x;                                                          %creating symbolic variable
    func = newtonCoefficientMatrix(1,1);                             %declaring func which will hold the value of the newton interpolation function and adding first term b0
    temp = 1;                                                        %declaring a temp variable which will hold a part necessary to computer the value of the newton interpolation function
    fprintf("P_%d(x) = (%.*f)",m-1,precision,newtonCoefficientMatrix(1,1));
    for k = 2:m
        fprintf(" + (%.*f)",precision,newtonCoefficientMatrix(1,k));
        for l = 2:k
            fprintf("*(x%+f)",x_i(l-1));
            temp= temp*(x-x_i(l-1));                                  %adding factor to temp
        end
        func = func + newtonCoefficientMatrix(1,k)*temp;              %adding term bn(x-xn)*(x-xn-1)*...*(x-x2)*(x-x1) to func
        temp = 1;                                                     %resetting temp variable for next iteration
    end
    fprintf("\n");
    
    %prompting user on whether he would like to interpolate points
    prmt = input("\nWould you like to evaluate a point or set of points using the interpolating polynomial? [y/n]: ",'s');
    
    %validating input
    while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
        prmt = input("Invalid input, evaluate a point or set of points using the interpolating polynomial? [y/n]: ",'s');
    end
    
    %prompting for points
    if(prmt == "y" || prmt == "Y")
        %prompting user for points
        point = input("Enter the point or set of points to evalute (use [x1,x2,...xn] for multiple points or simply enter x1 value for one point): ");
        
        %evaluating the points given
        temp = matlabFunction(func,'Vars',x);
        eval_sol = temp(point);
        
        %printing out evaluated points
        for k = 1:size(point,2)
            fprintf("P_%d(x_%d) = P_%d(%.*f) = %.*f\n",m-1,k,m-1,precision,point(1,k),precision,eval_sol(1,k));
        end
    end
    
    %finding error interpolation if function is given
    if(prmt3 == "y" || prmt3 == "Y")
        temp = 1;
        for k = 1:m
            temp = temp*(x-x_i(1,k));
        end
        errorfunc = matlabFunction((temp/factorial(m))*subs(diff(original_func,x,m),x,(max(x_i)-min(x_i))/2),'Vars',x);
        
        disp("The interpolation error on the original data set is: ");
        [x_i; errorfunc(x_i)] %#ok<NOPRT>
        if(prmt3 == "y" || prmt3 == "Y")
            disp("The interpolation error on the interpolated data set is:");
            [point; errorfunc(point)] %#ok<NOPRT>
        end
    end
    
    %prompting user if he wants to original data set points, interpolation function and interpolated points
    prmt2 = input("Would you like to plot the interpolation function and the original (and interpolated) data set point? [y/n]: ",'s');
    
    %validating input
    while (prmt2 ~= "N" && prmt2 ~= "n" && prmt2 ~= "Y" && prmt2 ~= "y")
        prmt2 = input("Invalid input, would you like to plot the interpolation function and the original (and interpolated) data set point? [y/n]: ",'s');
    end
    
    %plotting interpolation function and data set series if user choosed to
    if(prmt2 == "y" || prmt2 == "Y")
        
        %plotting the interpolating function
        fplot(func,'DisplayName',"Newton Interpolation Function");  %plotting the original function
        hold on;                                                    %tells matlab to hold all plots below
        
        %plotting original function (if given)
        if(prmt3 == "y" || prmt3 == "Y")
            fplot(original_func,'DisplayName',"Original Function");
        end
        
        %plotting the original data set xi and yi
        scatter(x_i,y_i,'DisplayName',"Original Data");
        
        %plotting the interpolated data set if given
        if(prmt == "y" || prmt == "Y")
            scatter(point,eval_sol,'*','DisplayName',"Interpolated Data");
        end
        
        %legend and axis
        title('Newton Interpolation');    %setting graph title
        xlabel('x');                      %setting x-axis label
        ylabel('P(x)');                   %setting y-axis label
        axis auto;                        %setting axis range (auto) , use ([xmin xmax ymin ymax]) for manual range
        grid on;                          %setting major grid
        grid minor;                       %setting minor grid
        legend;
        hold off;                         %tells matlab to stop holding further plots
    end
end
function LagrangeInterpolation()
    %declaring global "precision" variable
    global precision;
    
    %title
    disp("===================== LAGRANGE INTERPOLATION ====================");
    
    %declaring symbolic variable
    syms x;
    
    %prompting user for data set
    while(true)
        %prompting for x_i
        x_i = input("Enter the x_i dataset (use [x1, x2, x3 ... xi]): ");
        
        %asking user  whether the data set comes from a known function (he's performing function interpolation)
        prmt3 = input("Does the y_i data set come from a known function (function interpolation)? [y/n]: ",'s');
        %validating input
        while (prmt3 ~= "N" && prmt3 ~= "n" && prmt3 ~= "Y" && prmt3 ~= "y")
            prmt3 = input("Invalid input, does the y_i data set come from a known function (function interpolation)? [y/n]: ",'s');
        end
        
        %if data set does come from a known function, prompting user for function
        if(prmt3 == "y" || prmt3 == "Y")
            original_func = input("Please enter the function f(x), y_i will be automatically generated (use x as variable): ");
            y_i = double(subs(original_func,x,x_i));
            disp("The y_i data set has been computed as follows: ");
            y_i %#ok<NOPRT>
            break;
        else
            y_i = input("Enter the y_i dataset (use [y1, y2, y3 ... yi]): ");
            if(size(x_i) == size(y_i))
                if(size(x_i,1) == 1)
                    break;
                end
            end
            disp("Invalid input, x_i and y_i must be a vector of the same size, please try again.");
        end
    end
    
    %sorting data set
    conc = [x_i;y_i];
    [~ ,order] = sort(conc(1,:));
    conc = conc(:,order);
    x_i = conc(1,:);
    y_i = conc(2,:);
    
    %storing amount of data set
    m = size(x_i,2);
    
    %creating lagrange coefficient matrix
    lagrangeCoefficient = ones(m,m);
    
    %computing lagrange coefficient
    for row = 1:m
        for col = 1:m
            if(row == col)
                continue;
            end
            lagrangeCoefficient(row,row) =  lagrangeCoefficient(row,row)*(1/(x_i(1,row) - x_i(1,col)));
            lagrangeCoefficient(row,col) = 0-x_i(1,col);
        end
    end
    
    
    %displaying the solution
    disp("The solution is: ");
    for k = 1:m
        fprintf("L%d(x) = (%.*f)",k-1,precision,lagrangeCoefficient(k,k));
        for col = 1:m
            if(k == col)
                continue;
            end
            fprintf("*(x%+f)",lagrangeCoefficient(k,col))
        end
        fprintf("\n");
    end
    
    %printing the full equation
    fprintf("P_%d(x) = L_0(x)*y_0 + L_1(x)*y_1+...+L_(m-1)(x)*y_n, where L_n(x) is given above, y_n is the value entered previously for y_i at position n. The equation is therefore: ",m-1);
    fprintf("P_%d(x) = ",m-1);
    func = 0;
    temp = 1;
    for k = 1:m
        fprintf("(%.*f)",precision,lagrangeCoefficient(k,k));
        for col = 1:m
            if(k == col)
                continue;
            end
            fprintf("*(x%+f)",lagrangeCoefficient(k,col))
            temp = temp*(x+lagrangeCoefficient(k,col));
        end
        func = func+lagrangeCoefficient(k,k)*temp*y_i(1,k);
        temp = 1;
        if(k == m)
            fprintf("*(%.*f)",precision,y_i(1,k));
        else
            fprintf("*(%.*f) + ",precision,y_i(1,k));
        end
    end
    fprintf("\n");
    
    %prompting user on whether he would like to interpolate points
    prmt = input("\nWould you like to evaluate a point or set of points using the interpolating polynomial? [y/n]: ",'s');
    
    %validating input
    while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
        prmt = input("Invalid input, evaluate a point or set of points using the interpolating polynomial? [y/n]: ",'s');
    end
    
    %prompting for points
    if(prmt == "y" || prmt == "Y")
        %prompting user for points
        point = input("Enter the point or set of points to evalute (use [x1,x2,...xn] for multiple points or simply enter x1 value for one point): ");
        
        %evaluating the points given
        temp = matlabFunction(func,'Vars',x);
        eval_sol = temp(point);
        
        %printing out evaluated points
        for k = 1:size(point,2)
            fprintf("P_%d(x_%d) = P_%d(%.*f) = %.*f\n",m-1,k,m-1,precision,point(1,k),precision,eval_sol(1,k));
        end
    end
    
    %finding error interpolation if function is given
    if(prmt3 == "y" || prmt3 == "Y")
        temp = 1;
        for k = 1:m
            temp = temp*(x-x_i(1,k));
        end
        errorfunc = matlabFunction((temp/factorial(m))*subs(diff(original_func,x,m),x,(max(x_i)-min(x_i))/2),'Vars',x);
        
        disp("The interpolation error on the original data set is: ");
        [x_i; errorfunc(x_i)] %#ok<NOPRT>
        if(prmt3 == "y" || prmt3 == "Y")
            disp("The interpolation error on the interpolated data set is:");
            [point; errorfunc(point)] %#ok<NOPRT>
        end
    end
    
    %prompting user if he wants to original data set points, interpolation function and interpolated points
    prmt2 = input("Would you like to plot the interpolation function and the original (and interpolated) data set point? [y/n]: ",'s');
    
    %validating input
    while (prmt2 ~= "N" && prmt2 ~= "n" && prmt2 ~= "Y" && prmt2 ~= "y")
        prmt2 = input("Invalid input, would you like to plot the interpolation function and the original (and interpolated) data set point? [y/n]: ",'s');
    end
    
    %plotting interpolation function and data set series if user choosed to
    if(prmt2 == "y" || prmt2 == "Y")
        
        %plotting the interpolating function
        fplot(func,'DisplayName',"Lagrange Interpolation Function");  %plotting the original function
        hold on;                                                      %tells matlab to hold all plots below
        
        %plotting original function (if given)
        if(prmt3 == "y" || prmt3 == "Y")
            fplot(original_func,'DisplayName',"Original Function");
        end
        
        %plotting the original data set xi and yi
        scatter(x_i,y_i,'DisplayName',"Original Data");
        
        %plotting the interpolated data set if given
        if(prmt == "y" || prmt == "Y")
            scatter(point,eval_sol,'*','DisplayName',"Interpolated Data");
        end
        
        %legend and axis
        title('Lagrange Interpolation');  %setting graph title
        xlabel('x');                      %setting x-axis label
        ylabel('P(x)');                   %setting y-axis label
        axis auto;                        %setting axis range (auto) , use ([xmin xmax ymin ymax]) for manual range
        grid on;                          %setting major grid
        grid minor;                       %setting minor grid
        legend;
        hold off;                         %tells matlab to stop holding further plots
    end
end
function LinearPiecewiseInterpolation()
    %declaring global "precision" variable
    global precision;
    
    %title
    disp("============= LINEAR PIECEWISE/SPLINE INTERPOLATION =============");
    
    %declaring symbolic variable
    syms x;
    
    %prompting user for data set
    while(true)
        %prompting for x_i
        x_i = input("Enter at least 2 points for the x_i dataset (use [x1, x2, x3 ... xi]): ");
        %prompting for y_i
        y_i = input("Enter at least 2 points for the y_i dataset (use [y1, y2, y3 ... yi]): ");
        
        %validating input
        if(size(x_i) == size(y_i))
            if(size(x_i,1) == 1 && size(x_i,2) > 1)
                break;
            end
        end
        disp("Invalid input, x_i and y_i must be a vector of the same size with at least 2 points, please try again.");
    end
    
    %sorting data set
    conc = [x_i;y_i];
    [~ ,order] = sort(conc(1,:));
    conc = conc(:,order);
    x_i = conc(1,:);
    y_i = conc(2,:);
    
    %storing amount of dataset
    m = size(x_i,2);
    
    %creating matrix that holds the line for each interval
    interval_func = zeros(m,4);
    interval_func(1:m,1) = x_i(1:m);     %storing x_i in first col matrix
    interval_func(1:m,2) = y_i(1:m);     %storing y_i in second col matrix
    interval_func(1,3) = 0;              %initializing first slope to 0 in case only 1 input was entered
    interval_func(1,3) = y_i(1,1);       %initializing first constant to y_i in case only 1 input was entered
    
    %computing a and b in a*x + b
    for row = 1:m-1
        %computing slope for each interval using y2-y1 = x2-x1 
        interval_func(row,3) = (interval_func(row+1,2)-interval_func(row,2))/(interval_func(row+1,1)-interval_func(row,1));
        
        %computing b using b1 = y1-a1*x1
        interval_func(row,4) = interval_func(row,2)-interval_func(row,3)*interval_func(row,1);
    end
    
    %displaying the solution
    disp("The solution is: ");
    for row = 1:m-1
        fprintf("Interval [%.*f,%.*f] = a*x + b = (%.*f)*x + (%.*f)\n",precision,interval_func(row,1),precision,interval_func(row+1,1),precision,interval_func(row,3),precision,interval_func(row,4));
    end
    
    %prompting user on whether he would like to interpolate points
    prmt = input("\nWould you like to evaluate a point or set of points using linear piecewise interpolation? [y/n]: ",'s');
    
    %validating input
    while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
        prmt = input("Invalid input, evaluate a point or set of points using the interpolating polynomial? [y/n]: ",'s');
    end
    
    %prompting for points
    if(prmt == "y" || prmt == "Y")
        %prompting user for points
        point = input("Enter the point or set of points to evalute (use [x1,x2,...xn] for multiple points or simply enter x1 value for one point): ");
        
        %creating cell to hold the points, given interval to use for each points and solution.
        n = size(point,2);
        eval_sol = cell(n,3);
        
        %initializing cell's first column
        for col = 1:n
            eval_sol{col,1} = point(1,col);
        end
        
        %finding the correct interval
        for k = 1:n
            %starting at lowest interval
            eval_sol{k,2} = 1;
            for row = 1:m-1
                if(eval_sol{k,1}<interval_func(row,1))
                    break;
                else
                    eval_sol{k,2} = row;
                end
            end
        end
        
        %evaluating the interpolation at the specific point
        for row = 1:n
            eval_sol{row,3} = (interval_func(eval_sol{row,2},3)*eval_sol{row,1})+interval_func(eval_sol{row,2},4);
        end
        
        %creating solution matrix
        sol = zeros(1,n);
        
        %printing evaluation
        for row = 1:n
            fprintf("For x_%d = %.*f, the linear piecewise interpolation is y_%d = %.*f\n",row,precision,eval_sol{row,1},row,precision,eval_sol{row,3});
            sol(1,row) = eval_sol{row,3};
        end
    end
    
    %prompting user if he wants to plot original data set points, interpolation function and interpolated points
    prmt2 = input("Would you like to plot the linear piecewise interpolation function and the original (and interpolated) data set point? [y/n]: ",'s');
    
    %validating input
    while (prmt2 ~= "N" && prmt2 ~= "n" && prmt2 ~= "Y" && prmt2 ~= "y")
        prmt2 = input("Invalid input, would you like to plot the piecewise interpolation function and the original (and interpolated) data set point? [y/n]: ",'s');
    end
    
    %generating piecewise function
    last = size(interval_func,1);
    func = piecewise(x<interval_func(1,1),(interval_func(1,3)*x+interval_func(1,4)),x>interval_func(last,1),(interval_func(last-1,3)*x+interval_func(last-1,4)));
    
    %plotting interpolation function and data set series if user choosed to
    if(prmt2 == "y" || prmt2 == "Y")
        
        %plotting the interpolating function
        fplot(func,'b','HandleVisibility','off');                     %plotting the original function
        hold on;                                                      %tells matlab to hold all plots below
        
        %plotting the original data set xi and yi
        plot(x_i,y_i,'b','DisplayName',"Piecewise interpolation");
        scatter(x_i,y_i,'DisplayName',"Original Data");
        
        %plotting the interpolated data set if given
        if(prmt == "y" || prmt == "Y")
            scatter(point,sol,'*','DisplayName',"Interpolated Data");
        end
        
        %legend and axis
        title('Piecewise Interpolation'); %setting graph title
        xlabel('x');                      %setting x-axis label
        ylabel('P(x)');                   %setting y-axis label
        axis auto;                        %setting axis range (auto) , use ([xmin xmax ymin ymax]) for manual range
        grid on;                          %setting major grid
        grid minor;                       %setting minor grid
        legend;
        hold off;                         %tells matlab to stop holding further plots
    end
end
function CubicPiecewiseInterpolation()
    %declaring global "precision" and "resolution" variable
    global precision;
    global resolution;
    
    %title
    disp("============== CUBIC PIECEWISE/SPLINE INTERPOLATION =============");
    
    %declaring symbolic variable
    syms x;
    
    %prompting user for data set
    while(true)
        %prompting for x_i
        x_i = input("Enter at least 2 points for the x_i dataset (use [x1, x2, x3 ... xi]): ");
        %prompting for y_i
        y_i = input("Enter at least 2 points for the y_i dataset (use [y1, y2, y3 ... yi]): ");
        
        %validating input
        if(size(x_i) == size(y_i))
            if(size(x_i,1) == 1 && size(x_i,2) > 1)
                break;
            end
        end
        disp("Invalid input, x_i and y_i must be a vector of the same size with at least 2 points, please try again.");
    end
    
    %sorting data set
    conc = [x_i;y_i];
    [~ ,order] = sort(conc(1,:));
    conc = conc(:,order);
    x_i = conc(1,:);
    y_i = conc(2,:);
    
    %storing amount of dataset
    m = size(x_i,2);
    n = m-1;
    
    %creating matrix that holds the cubic function for each interval
    interval_func = zeros(m,6);
    interval_func(1:m,1) = x_i(1:m);                                                                                        %storing x_i in first col matrix
    interval_func(1:m,2) = y_i(1:m);                                                                                        %storing y_i in second col matrix
    coefficientMatrix1 = zeros(n+1,4*n);
    coefficientMatrix2 = zeros(n-1,4*n+1);
    coefficientMatrix3 = zeros(n-1,4*n+1);
    coefficientMatrix4 = zeros(n-1,4*n+1);
    coefficientMatrix5 = zeros(2,4*n+1);
    
    %computing first set of equations (S_i(x_i) = y_i)
    for row = 1:n
        coefficientMatrix1(row,4*(row-1)+1) = x_i(row)^3;
        coefficientMatrix1(row,4*(row-1)+2) = x_i(row)^2;
        coefficientMatrix1(row,4*(row-1)+3) = x_i(row);
        coefficientMatrix1(row,4*(row-1)+4) = 1;
        coefficientMatrix1(row,4*n+1) = y_i(row);
    end
    
    %computing second set of equations (S_i(x_(i+1)) = S_(i+1)(x_(i+1))) 
    for row = 1:n-1
        coefficientMatrix2(row,4*(row-1)+1) = x_i(row+1)^3;
        coefficientMatrix2(row,4*(row-1)+2) = x_i(row+1)^2;
        coefficientMatrix2(row,4*(row-1)+3) = x_i(row+1)^1;
        coefficientMatrix2(row,4*(row-1)+4) = 1;        
        coefficientMatrix2(row,4*(row-1)+5) = -1*x_i(row+1)^3;
        coefficientMatrix2(row,4*(row-1)+6) = -1*x_i(row+1)^2;
        coefficientMatrix2(row,4*(row-1)+7) = -1*x_i(row+1)^1;
        coefficientMatrix2(row,4*(row-1)+8) = -1;
    end
   
    %computing third matrix equation (S'_i(x_(i+1)) = S'_(i+1)(x_(i+1))) 
    for row = 1:n-1
        coefficientMatrix3(row,4*(row-1)+1) = 3*x_i(row+1)^2;
        coefficientMatrix3(row,4*(row-1)+2) = 2*x_i(row+1);
        coefficientMatrix3(row,4*(row-1)+3) = 1;
        coefficientMatrix3(row,4*(row-1)+5) = -3*x_i(row+1)^2;
        coefficientMatrix3(row,4*(row-1)+6) = -2*x_i(row+1);
        coefficientMatrix3(row,4*(row-1)+7) = -1;
    end
    
    %computing  fourth matrix equation
    for row = 1:n-1
        coefficientMatrix4(row,4*(row-1)+1) = 6*x_i(row+1);
        coefficientMatrix4(row,4*(row-1)+2) = 2;
        coefficientMatrix4(row,4*(row-1)+5) = -6*x_i(row+1);
        coefficientMatrix4(row,4*(row-1)+6) = -2;
    end
    
    %computing fifth matrix equation
    coefficientMatrix5(1,1) = 6*x_i(1);
    coefficientMatrix5(1,2) = 2;
    coefficientMatrix5(2,4*n-3) = 6*x_i(n);
    coefficientMatrix5(2,4*n-2) = 2;
    
    %concatenating all the equations together
    coefficientMatrix = [coefficientMatrix1;coefficientMatrix2;coefficientMatrix3;coefficientMatrix4;coefficientMatrix5];
    
    %solving the system of linear equation
    coefficientMatrix = rref(coefficientMatrix);
   
    %storing the coefficients in the cell
    for row = 1:n
        interval_func(row,3) = coefficientMatrix(4*(row-1)+1,4*n+1);
        interval_func(row,4) = coefficientMatrix(4*(row-1)+2,4*n+1);
        interval_func(row,5) = coefficientMatrix(4*(row-1)+3,4*n+1);
        interval_func(row,6) = coefficientMatrix(4*(row-1)+4,4*n+1);
    end
    
    %displaying the solution
    disp("The solution is: ");
    for row = 1:m-1
        fprintf("Interval [%.*f,%.*f] = a*x^3 + b*x^2 + c*x + d = (%.*f)*x^3 + (%.*f)*x^2 + (%.*f)*x + (%.*f)\n",precision,interval_func(row,1),precision,interval_func(row+1,1),precision,interval_func(row,6),precision,interval_func(row,5),precision,interval_func(row,4),precision,interval_func(row,3));
    end
    
    %prompting user on whether he would like to interpolate points
    prmt = input("\nWould you like to evaluate a point or set of points using cubic piecewise interpolation? [y/n]: ",'s');
    
    %validating input
    while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
        prmt = input("Invalid input, evaluate a point or set of points using the interpolating polynomial? [y/n]: ",'s');
    end
    
    %prompting for points
    if(prmt == "y" || prmt == "Y")
        %prompting user for points
        point = input("Enter the point or set of points to evalute (use [x1,x2,...xn] for multiple points or simply enter x1 value for one point): ");
        
        %creating cell to hold the points, given interval to use for each points and solution.
        z = size(point,2);
        eval_sol = cell(z,3);
        
        %initializing cell's first column
        for col = 1:z
            eval_sol{col,1} = point(1,col);
        end
        
        %finding the correct interval
        for k = 1:z
            %starting at lowest interval
            eval_sol{k,2} = 1;
            for row = 1:m-1
                if(eval_sol{k,1}<interval_func(row,1))
                    break;
                else
                    eval_sol{k,2} = row;
                end
            end
        end
        
        %evaluating the interpolation at the specific point
        for row = 1:z
            eval_sol{row,3} = interval_func(eval_sol{row,2},3)*eval_sol{row,1}^3+interval_func(eval_sol{row,2},4)*eval_sol{row,1}^2+interval_func(eval_sol{row,2},5)*eval_sol{row,1}+interval_func(eval_sol{row,2},6);
        end
        
        %creating solution matrix
        sol = zeros(1,z);
        
        %printing evaluation
        for row = 1:z
            fprintf("For x_%d = %.*f, the cubic piecewise interpolation is y_%d = %.*f\n",row,precision,eval_sol{row,1},row,precision,eval_sol{row,3});
            sol(1,row) = eval_sol{row,3};
        end
    end
    
    %prompting user if he wants to plot original data set points, interpolation function and interpolated points
    prmt2 = input("Would you like to plot the cubic piecewise interpolation function and the original (and interpolated) data set point? [y/n]: ",'s');
    
    %validating input
    while (prmt2 ~= "N" && prmt2 ~= "n" && prmt2 ~= "Y" && prmt2 ~= "y")
        prmt2 = input("Invalid input, would you like to plot the piecewise interpolation function and the original (and interpolated) data set point? [y/n]: ",'s');
    end
    
    %generating piecewise function
    last = size(interval_func,1);
    func = piecewise(x<interval_func(1,1),(interval_func(1,3)*x^3+interval_func(1,4)*x^2+interval_func(1,5)*x+interval_func(1,6)),x>interval_func(last,1),((interval_func(last-1,3)*x^3+interval_func(last-1,4)*x^2+interval_func(last-1,5)*x+interval_func(last-1,6))));
    
    %plotting interpolation function and data set series if user choosed to
    if(prmt2 == "y" || prmt2 == "Y")
        
        %plotting the interpolating function
        fplot(func,'b');                                              %plotting the original function
        hold on;                                                      %tells matlab to hold all plots below
        
        %printing cubic splines
        for k = 1:n
            t = interval_func(k,1):resolution:interval_func(k+1,1);
            f_x = interval_func(k,3).*t.^3+interval_func(k,4).*t.^2+interval_func(k,5).*t+interval_func(k,6);
            plot(t,f_x,'DisplayName',sprintf("Interval #%d",k));
        end
        
        %plotting the original data set xi and yi
        scatter(x_i,y_i,'DisplayName',"Original Data");
        
        %plotting the interpolated data set if given
        if(prmt == "y" || prmt == "Y")
            scatter(point,sol,'*','DisplayName',"Interpolated Data");
        end
        
        %legend and axis
        title('Piecewise Interpolation'); %setting graph title
        xlabel('x');                      %setting x-axis label
        ylabel('P(x)');                   %setting y-axis label
        axis auto;                        %setting axis range (auto) , use ([xmin xmax ymin ymax]) for manual range
        grid on;                          %setting major grid
        grid minor;                       %setting minor grid
        legend;
        hold off;                         %tells matlab to stop holding further plots
    end
end
function InterpolationError()
    %title
    disp("====================== INTERPOLATION ERROR ======================= ");
    
    %declaring symbolic variable
    syms x;
    
    %prompting for x_i
    x_i = input("Enter the x_i dataset (use [x1, x2, x3 ... xi]): ");
    
    %sorting x_i
    x_i = sort(x_i);
    
    %prompting user for function
    original_func = input("Please enter the function f(x) (use x as variable): ");
    
    %prompting for custom c
    prmt = input("Would you like to input a custom c value (using midpoint between min and max of x_i otherwise)? [y/n]: ",'s');
    
    %validating input
    while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
        prmt = input("Invalid input, would you like to input a custom c value (using midpoint between min and max of x_i otherwise)? [y/n]: ",'s');
    end
    
    %prompting for c if user chooses to
    if(prmt == "y" || prmt == "Y")
        c = input("Please enter a value for c (should be a value between min(x_i) and max(x_i): ");
    end
    
    %computing error function
    m = size(x_i,2);
    temp = 1;
    for k = 1:m
        temp = temp*(x-x_i(1,k));
    end
    
    if(prmt == "y" || prmt == "Y")
        errorfunc = matlabFunction((temp/factorial(m))*subs(diff(original_func,x,m),x,c),'Vars',x);
    else
        errorfunc = matlabFunction((temp/factorial(m))*subs(diff(original_func,x,m),x,(max(x_i)-min(x_i))/2),'Vars',x);
    end
    
    point = input("Enter the point or set of points to evalute interpolation error (use [x1,x2,...xn] for multiple points or simply enter x1 value for one point): ");
    disp("The interpolation error on the points given is: ");
    [point; errorfunc(point)] %#ok<NOPRT>
end

% ========= Chapter 5 - Introduction to Machine learning =========
function Chapter5()
        
    %Starting menu loop, returns to main menu after user exits
    while(true)
        disp("========= Chapter 5 - Introduction to Machine Learning -- SKIPPED ==========");
        disp("[1] Return to main menu");
        
        %prompt user for option
        x = input("Choose an option: ");
        
        %validating user input
        while(x ~= 1)
            x = input("Invalid input, please try again: ");
        end
        
        switch(x)
            case(1)
                break;
            otherwise
                continue;
        end
    end
end

% ============ Chapter 6 - Numerical Differentiation ============
function Chapter6()
    %declaring global variable
    global clearConsole;
    
    %Starting menu loop, returns to main menu after user exits
    while(true)
        disp("============= Chapter 6 - Numerical Differentiation --INCOMPLETE =============");
        disp("[1] Differentiation using derivative definition");
        disp("[2] Differentiation using two-point formula");
        disp("[3] Differentiation using three-point formula");
        disp("[4] Differentiation using n-point formula");
        disp("[5] Return to main menu");
        
        %prompt user for option
        x = input("Choose an option: ");
        
        %validating user input
        while(x < 1 || x > 5)
            x = input("Invalid input, please try again: ");
        end
        
        switch(x)
            case(1)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                FunctionDerivativeDefinition();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(2)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                TwoPointFormula();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(3)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                ThreePointFormula();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(4)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                NPointFormula();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(5)
                break;
            otherwise
                continue;
        end
    end
end
function FunctionDerivativeDefinition()
    %declaring global "precision" variable
    global precision;
    
    %title
    disp("================= APPROXIMATION USING DEFINITION ================");
    disp("The following method will approximate the derivative of a function f(x) at a point x using (f(x-h)-f(x))/h for a specified h");
    disp("-------------------------") ;
    %declaring symbolic variable
    syms x;
    
    %prompting user to enter the function to approximate the derivative of
    func = input("Enter a function f(x) to find the derivative of (use lowercase 'x' for the function's variable): ");     
    
    %converting symbolic function to numerical
    func_num = matlabFunction(func,'Vars',x);
    
    %prompting user for point to derivate at
    x_point = input("Enter a point to derivate the function f(x) at (x = ?): ");
    
    %prompting user for h
    h_point = input("Enter a value for h");
    
    %computing the derivative approximation
    approx_derivative = (func_num(x_point-h_point)-func_num(x_point))/h_point;
    
    %computing the true solution
    derivative = subs(diff(func,x),x,x_point);
    
    %printing the solution
    fprintf("The derivative of the function f(x) = %s at point x = %.*f using the approximation (f(x-h)-f(x))/h with h = %.*f is:\nf'(%.*f) = %.*f",func,precision,x_point,precision,h_point,precision,x_point,precision,approx_derivative);
    fprintf("The actual value of the derivative is f'(%.*f) = %.*f",precision,x_point,precision,derivative);
    fprintf("The absolute approximation error is %.*f",abs(precision,derivative-approx_derivative));
end
function TwoPointFormula()
    %declaring global "precision" variable
    global precision;
    
    %title
    disp("============= APPROXIMATION USING TWO POINT FORMULA =============");
    disp("The following method will approximate the derivative of a function f(x) at a point x using f'(x) = (f(x+h)-f(x))/h for a specified h");
    disp("-------------------------") ;
    
    %declaring symbolic variable
    syms x;
    
    %prompting user to enter the function to approximate the derivative of
    func = input("Enter a function f(x) to find the derivative of (use lowercase 'x' for the function's variable): ");     
    
    %converting symbolic function to numerical
    func_num = matlabFunction(func,'Vars',x);
    
    %prompting user for point to derivate at
    x_point = input("Enter a point to derivate the function f(x) at (x = ?): ");
    
    %prompting user for h
    h_point = input("Enter a value for h");
    
    %computing the derivative approximation
    approx_derivative = (func_num(x_point+h_point)-func_num(x_point))/h_point;
    
    %computing the true solution
    derivative = subs(diff(func,x),x,x_point);
    
    %printing the solution
    fprintf("The derivative of the function f(x) = %s at point x = %.*f using the approximation (f(x-h)-f(x))/h with h = %.*f is:\nf'(%.*f) = %.*f",func,precision,x_point,precision,h_point,precision,x_point,precision,approx_derivative);
    fprintf("The actual value of the derivative is f'(%.*f) = %.*f",precision,x_point,precision,derivative);
    fprintf("The absolute approximation error is %.*f",abs(precision,derivative-approx_derivative));
end
function ThreePointFormula()
    %declaring global "precision" variable
    global precision;
    
    %title
    disp("================= APPROXIMATION USING DEFINITION ================");
    disp("The following method will approximate the derivative of a function f(x) at a point x using (f(x-h)-f(x))/h for a specified h");
    disp("-------------------------") ;
    %declaring symbolic variable
    syms x;
    
    %prompting user to enter the function to approximate the derivative of
    func = input("Enter a function f(x) to find the derivative of (use lowercase 'x' for the function's variable): ");     
    
    %converting symbolic function to numerical
    func_num = matlabFunction(func,'Vars',x);
    
    %prompting user for point to derivate at
    x_point = input("Enter a point to derivate the function f(x) at (x = ?): ");
    
    %prompting user for h
    h_point = input("Enter a value for h");
    
    %computing the derivative approximation
    approx_derivative = (func_num(x_point-h_point)-func_num(x_point))/h_point;
    
    %computing the true solution
    derivative = subs(diff(func,x),x,x_point);
    
    %printing the solution
    fprintf("The derivative of the function f(x) = %s at point x = %.*f using the approximation (f(x-h)-f(x))/h with h = %.*f is:\nf'(%.*f) = %.*f",func,precision,x_point,precision,h_point,precision,x_point,precision,approx_derivative);
    fprintf("The actual value of the derivative is f'(%.*f) = %.*f",precision,x_point,precision,derivative);
    fprintf("The absolute approximation error is %.*f",abs(precision,derivative-approx_derivative));
end

% ============== Chapter 7 - Numerical Integration ==============
function Chapter7()
    %declaring global variable
    global clearConsole;
        
    %Starting menu loop, returns to main menu after user exits
    while(true)
        disp("=============== Chapter 7 - Numerical Integration -- INCOMPLETE===============");
        disp("[1]  Mid-point Rule (1-point open Newton-Cotes formula)");
        disp("[2]  Trapezoid Rule (2-point closed Newton-Cotes formula)");
        disp("[3]  Simpson's Rule (3-point closed Newton-Cotes formula)");
        disp("[4]  Mid-point Composite Rule (1-point open composite Newton-Cotes formula)");
        disp("[5]  Trapezoid Composite Rule (2-point closed composite Newton-Cotes formula)");
        disp("[6]  Simpson's Composite Rule (3-point closed composite Newton-Cotes formula)");
        disp("[7]  Romberg Trapezoid Integration");
        disp("[8]  Gauss Quadrature Integration using Standardized interval (-1 to 1)");
        disp("[9]  Gauss Quadrature Integration using Non-Standardized interval (a to b)");
        disp("[10] Adaptive Gauss Quadrature Integration using tolerance");
        disp("[11] Richardson Error");
        disp("[12] Return to main menu");
        
        %prompt user for option
        x = input("Choose an option: ");
        
        %validating user input
        while(x < 1 || x > 12)
            x = input("Invalid input, please try again: ");
        end
        
        switch(x)
            case(1)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                MidPoint();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(2)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                Trapezoid();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(3)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                Simpson();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(4)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                MidPointComposite();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(5)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                TrapezoidComposite();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(6)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                SimpsonComposite();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(7)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                RombergTrapezoid();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(8)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                GaussQuadratureStandarized();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(9)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                GaussQuadrature();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(10)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                AdaptiveGaussQuadrature();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(11)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                RichardsonError7();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(12)
                break;
            otherwise
                continue;
        end
    end
end
function MidPoint()
    %declaring global "precision" and "resolution" variable
    global precision;
    global resolution;
    
    %title
    disp("=========== OPEN 1-POINT NEWTON-COTES MIDPOINT RULE ==========");

    %declaring symbolic variable
    syms x;
    
    %prompting user to enter the function to approximate the integral of
    func = input("Enter a function f(x) to find the integral of (use lowercase 'x' for the function's variable): ");     
     
    %computing function derivative for truncation error
    deriv_func = diff(func,x,2);
    
    %converting symbolic function to numerical
    func = matlabFunction(func,'Vars',x);
    deriv_func = matlabFunction(deriv_func,'Vars',x);
    
    %prompting user for integration interval 
    a = input("Enter the integral's lower bound a: ");
    b = input("Enter the integral's upper bound b: ");
       
    %validating integral bounds
    while(a >= b)
        disp("Invalid bounds, lower bound must be lower than upper bound, please try again.");
        a = input("Enter the integral's lower bound a: ");
        b = input("Enter the integral's upper bound b: ");
    end
    
    %computing open 1-point Newton-Cotes integral using the midpoint rule
    f_mid = func((a+b)/2);
    integral = (b-a)*f_mid;
    
    %computing truncation error
    error_interval = deriv_func(a:resolution:b);
    trunc_error = (((b-a)^3)/24)*max(abs(error_interval));
    
    %prompting whether to plot function, integral points and trapezoid
    prmt = input("Would you like to plot the graph of the function, integral region and midpoint? [y/n]: ",'s');
       
    %validating user input (checking if y/n is entered)
    while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
        prmt = input("Invalid input, would you like to plot the function, integral region and midpoint? [y/n]: ",'s');
    end
    
    %plotting the graph if user chose to
    if(prmt == "y" || prmt == "Y")
        %initalizing data set to draw the midpoint line
        point = (a+b)/2;                                  %x-axis data
        p_val = func(point);                              %y-axis data
        
        %plotting graph
        fplot(func,'DisplayName',"Original Function");                                                %plotting the original function
        hold on;                                                                                      %telling matlab to hold the plots
        stem(a,func(a),'DisplayName',"Lower Bound of integral");                                      %plotting lower bound integral point
        stem(b,func(b),'DisplayName',"Upper Bound of integral");                                      %plotting upper bound integral point
        stem(point,func(point),'DisplayName',"midpoint interval");                                    %plotting midpoint 
        plot([a,b],[p_val,p_val],'DisplayName',"Midpoint line");                                      %plotting midpoint line
        area([a,b],[p_val,p_val],'EdgeColor','none','FaceAlpha',0.1,'DisplayName',"Area under curve");%plotting area under trapezoid curve
        title("Midpoint Rule Integration");                                                           %setting graph title
        xlabel("x");                                                                                  %setting x-axis label
        ylabel("f(x)");                                                                               %setting y-axis label
        axis auto;                                                                                    %setting axis range (auto) , use ([xmin xmax ymin ymax]) for manual range
        grid on;                                                                                      %setting major grid
        grid minor;                                                                                   %setting minor grid
        legend;                                                                                       %printing legend
        hold off;
    end
    
    %printing solution
    fprintf("f((a+b)/2) = f(%.*f) = %.*f\n",precision,(a+b)/2,precision,f_mid); 
    fprintf("The open 1-point Newton-Cotes formula using the trapezoid rule (b-a)*f((a+b)/2) is: %.*f, Truncation Error: +/- %.*f\n",precision,integral,precision,trunc_error);    
end
function Trapezoid()
    %declaring global "precision" and "resolution" variable
    global precision;
    global resolution;
    
    %title
    disp("=========== CLOSED 2-POINT NEWTON-COTES TRAPEZOID RULE ==========");

    %declaring symbolic variable
    syms x;
    
    %prompting user to enter the function to approximate the integral of
    func = input("Enter a function f(x) to find the integral of (use lowercase 'x' for the function's variable): ");     
     
    %computing function derivative for truncation error
    deriv_func = diff(func,x,2);
    
    %converting symbolic function to numerical
    func = matlabFunction(func,'Vars',x);
    deriv_func = matlabFunction(deriv_func,'Vars',x);
    
    %prompting user for integration interval 
    a = input("Enter the integral's lower bound a: ");
    b = input("Enter the integral's upper bound b: ");
       
    %validating integral bounds
    while(a >= b)
        disp("Invalid bounds, lower bound must be lower than upper bound, please try again.");
        a = input("Enter the integral's lower bound a: ");
        b = input("Enter the integral's upper bound b: ");
    end
    
    %computing closed 2-point Newton-Cotes integral using the trapezoid rule
    f_a = func(a);
    f_b = func(b);
    integral = (b-a)*(f_a+f_b)/2;
    
    %computing truncation error
    error_interval = deriv_func(a:resolution:b);
    trunc_error = (((b-a)^3)/12)*max(abs(error_interval));
    
    %prompting whether to plot function, integral points and trapezoid
    prmt = input("Would you like to plot the graph of the function, integral region and trapezoid? [y/n]: ",'s');
       
    %validating user input (checking if y/n is entered)
    while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
        prmt = input("Invalid input, would you like to plot the function, integral region and trapezoid? [y/n]: ",'s');
    end
    
    %plotting the graph if user chose to
    if(prmt == "y" || prmt == "Y")
        %initalizing data set to draw the tapezoid line
        point = [a,b];                                  %x-axis data
        point_val = func(point);                        %y-axis data
        
        %plotting graph
        fplot(func,'DisplayName',"Original Function");                                                %plotting the original function
        hold on;                                                                                      %telling matlab to hold the plots
        stem(a,func(a),'DisplayName',"Lower Bound of integral");                                      %plotting lower bound integral point
        stem(b,func(b),'DisplayName',"Upper Bound of integral");                                      %plotting upper bound integral point
        plot(point,point_val,'DisplayName',"Trapezoid line");                                         %plotting trapezoid line
        area(point,point_val,'EdgeColor','none','FaceAlpha',0.1,'DisplayName',"Area under curve");    %plotting area under trapezoid curve
        title("Trapezoid Rule Integration");                                                          %setting graph title
        xlabel("x");                                                                                  %setting x-axis label
        ylabel("f(x)");                                                                               %setting y-axis label
        axis auto;                                                                                    %setting axis range (auto) , use ([xmin xmax ymin ymax]) for manual range
        grid on;                                                                                      %setting major grid
        grid minor;                                                                                   %setting minor grid
        legend;                                                                                       %printing legend
        hold off;
    end
    
    %printing solution
    fprintf("f(a) = f(%.*f) = %.*f, f(b) = f(%.*f) = %.*f\n",precision,a,precision,f_a,precision,b,precision,f_b); 
    fprintf("The closed 2-point Newton-Cotes formula using the trapezoid rule (b-a)*((f_a+f_b)/2) is: %.*f, Truncation Error: +/- %.*f\n",precision,integral,precision,trunc_error);
end
function Simpson()
    %declaring global "precision" and "resolution" variable
    global precision;
    global resolution;
    
    %title
    disp("========= CLOSED 3-POINT NEWTON-COTES 1/3 SIMPSON'S RULE ========");

    %declaring symbolic variable
    syms x;
    
    %prompting user to enter the function to approximate the integral of
    func = input("Enter a function f(x) to find the integral of (use lowercase 'x' for the function's variable): ");     
     
    %computing function derivative for truncation error
    deriv_func = diff(func,x,4);

    %converting symbolic function to numerical
    func = matlabFunction(func,'Vars',x);
    deriv_func = matlabFunction(deriv_func,'Vars',x);
    
    %prompting user for integration interval 
    a = input("Enter the integral's lower bound a: ");
    b = input("Enter the integral's upper bound b: ");
        
    %validating integral bounds
    while(a >= b)
        disp("Invalid bounds, lower bound must be lower than upper bound, please try again.");
        a = input("Enter the integral's lower bound a: ");
        b = input("Enter the integral's upper bound b: ");
    end
    
    %computing  midpoint
    mid = (a+b)/2;
    
    %computing closed 2-point Newton-Cotes integral using the trapezoid rule
    f_a = func(a);
    f_b = func(b);
    f_mid = func(mid);
    integral = ((b-a)/6)*(f_a+f_b+4*f_mid);
        
    %computing truncation error
    error_interval = deriv_func(a:resolution:b);
    trunc_error = ((((b-a)/2)^5)/90)*max(abs(error_interval));
    
    %prompting whether to plot function, integral points and simpson's trapezoid curve
    prmt = input("Would you like to plot the graph of the function, integral region and simpson's curve? [y/n]: ",'s');
       
    %validating user input (checking if y/n is entered)
    while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
        prmt = input("Invalid input, would you like to plot the function, integral region and simpson's curve? [y/n]: ",'s');
    end
    
    %plotting the graph if user chose to
    if(prmt == "y" || prmt == "Y")
        %initalizing data set to draw the simpson's line
        point = [a,mid,b];                              %x-axis data
        point_val = func(point);                        %y-axis data
        
        %plotting graph
        fplot(func,'DisplayName',"Original Function");                                                %plotting the original function
        hold on;                                                                                      %telling matlab to hold the plots
        stem(a,func(a),'DisplayName',"Lower Bound of integral");                                      %plotting lower bound integral point
        stem(mid,func(mid),'DisplayName',"Mid Bound of integral");                                    %plotting mid bound integral point
        stem(b,func(b),'DisplayName',"Upper Bound of integral");                                      %plotting upper bound integral point
        plot(point,point_val,'DisplayName',"Simpson's line");                                         %plotting trapezoid line
        area(point,point_val,'EdgeColor','none','FaceAlpha',0.1,'DisplayName',"Area under curve");    %plotting area under trapezoid curve
        title("Simpson's Rule Integration");                                                          %setting graph title
        xlabel("x");                                                                                  %setting x-axis label
        ylabel("f(x)");                                                                               %setting y-axis label
        axis auto;                                                                                    %setting axis range (auto) , use ([xmin xmax ymin ymax]) for manual range
        grid on;                                                                                      %setting major grid
        grid minor;                                                                                   %setting minor grid
        legend;                                                                                       %printing legend
        hold off;
    end

    %printing solution
    fprintf("f(a) = f(%.*f) = %.*f, f(b) = f(%.*f) = %.*f, f(mid) = f(%.*f) = %.*f\n",precision,a,precision,f_a,precision,b,precision,f_b,precision,mid,precision,f_mid); 
    fprintf("The closed 3-point Newton-Cotes formula using the 1/3 simpson rule ((b-a)/6)*((f_a+4*f_mid+f_b) is: %.*f, Truncation error: +/- %.*f\n",precision,integral,precision,trunc_error);    
end
function MidPointComposite()
    %declaring global "precision" and "resolution" variable
    global precision;
    global resolution;
    
    %title
    disp("========== MIDPOINT COMPOSITE OPEN 1-POINT NEWTON-COTES =========");

    %declaring symbolic variable
    syms x;
    
    %prompting user to enter the function to approximate the integral of
    func = input("Enter a function f(x) to find the integral of (use lowercase 'x' for the function's variable): ");     
    deriv_func = diff(func,x,2); 
    
    %converting symbolic function to numerical
    func = matlabFunction(func,'Vars',x);
    deriv_func = matlabFunction(deriv_func,'Vars',x);
    
    %prompting user for integration interval 
    a = input("Enter the integral's lower bound a: ");
    b = input("Enter the integral's upper bound b: ");
    
    %validating integral bounds
    while(a >= b)
        disp("Invalid bounds, lower bound must be lower than upper bound, please try again.");
        a = input("Enter the integral's lower bound a: ");
        b = input("Enter the integral's upper bound b: ");
    end
    
    %prompting user for amount of intervals
    count = round(input("Enter the amount of intervals m to use (greater than 0). If h is given instead of m, enter (b-a)/h : "));
    while(count < 1)
       count = round(input("Invalid input, Enter the amount of intervals m to use (greater than 0). If h is given instead of m, enter (b-a)/h : "));
    end
    
    %creating matrix that will store the intervals
    matrix = zeros(count+1,7);
    
    %initializing first and last interval points
    matrix(1,1)= a;                                                                                             %initializing first point
    matrix(1,2)= a;                                                                                             %initializing first mid point
    matrix(1,3) = func(matrix(1,1));                                                                            %initializing first point function value
    matrix(1,4) = func(matrix(1,2));                                                                            %initializing first mid point function value
    matrix(1,5) = 0;                                                                                            %initializing area
    matrix(1,6) = 0;                                                                                            %initializing cummulative area
    matrix(1,7) = 0;                                                                                            %initializing current truncation error at 0
    matrix(count+1,1) = b;                                                                                      %initializing last point
    matrix(count+1,2) = (matrix(1,1)+matrix(count+1,1))/2;                                                      %initializing last mid point
    matrix(count+1,3) = func(matrix(count+1,1));                                                                %initializing last point function value
    matrix(count+1,4) = func(matrix(count+1,2));                                                                %initializing last mid point function value
    matrix(count+1,5) = (matrix(count+1,1)-matrix(1,1))*matrix(count+1,4);                                      %initializing area on interval [a,b]
    matrix(count+1,6) = matrix(count+1,5);                                                                      %initializing cumulative area to total interval [a,b]
    
    %initializing truncation error
    error_interval = deriv_func(a:resolution:b);
    matrix(count+1,7) = (((b-a)^3)/24)*max(abs(error_interval));                                                %initializing truncation error to total interval [a,b]

    %computing interval size
    interval_size = (b-a)/count;
        
    %computing total error of the composite method
    error1 = (((b-a)*(interval_size^2))/24)*max(abs(error_interval));

    %computing interval points and evaluating the function at the point
    for k = 2:count+1
        matrix(k,1) = matrix(k-1,1)+interval_size;                                              %computing first interval point for current interval and storing it in first col
        matrix(k,2) = matrix(k-1,1)+(interval_size/2);                                          %computing mid point for current interval and storing it in second col
        matrix(k,3) = func(matrix(k,1));                                                        %computing first interval point value for current interval and storing it in third col
        matrix(k,4) = func(matrix(k,2));                                                        %computing mid point value for current interval and storing it in fourth col       
        matrix(k,5) = (matrix(k,1)-matrix(k-1,1))*func(matrix(k,2));                            %computing (b-a)*f((a+b)/2) for current interval (area of rectangle centered around mid-point) and storing it in third col
        matrix(k,6) = matrix(k-1,6)+matrix(k,5);                                                %computing total area of current and previous interval so far and storing it in fourth col
        
        %computing truncation error
        error_interval = deriv_func(matrix(k-1,1):resolution:matrix(k,1));
        matrix(k,7) = (((matrix(k,1)-matrix(k-1,1))^3)/24)*max(abs(error_interval));            %computing truncation error for current interval
    end
    
    %computing closed n-point Newton-Cotes integral using the composite rule
    integral = matrix(count+1,6);
    
    %prompting whether to plot function, integral points and trapezoid
    prmt = input("Would you like to plot the graph of the function, integral region and midpoints? [y/n]: ",'s');
       
    %validating user input (checking if y/n is entered)
    while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
        prmt = input("Invalid input, would you like to plot the function, integral region and midpoints? [y/n]: ",'s');
    end
 
    %plotting the graph if user chose to
    if(prmt == "y" || prmt == "Y")
        %initalizing data set to draw the tapezoid line
        point_inter = transpose(matrix(:,1));                 %x-axis data for interval points
        point_mid = transpose(matrix(2:end,2));               %x-axis data for midpoints
          
        %plotting graph
        fplot(func,'DisplayName',"Original Function");                                                                    %plotting the original function
        hold on;                                                                                                          %telling matlab to hold the plots
        stem(point_inter,func(point_inter),'Filled','DisplayName',"Interval points");                                     %plotting interval point
        stem(point_mid,func(point_mid),'LineStyle','-.','DisplayName',"Mid points");                                      %plotting interval mid point
        for k = 1:size(matrix,1)-1
            p = [point_inter(1,k),point_mid(1,k),point_inter(1,k+1)];
            plot([p(1),p(3)],[func(p(2)),func(p(2))],'DisplayName',sprintf("Midpoint's line #%d",k));                     %plotting trapezoid line
            area([p(1),p(3)],[func(p(2)),func(p(2))],'EdgeColor','none','FaceAlpha',0.1,'DisplayName',sprintf("Area under interval #%d",k));     %plotting area under trapezoid curve
        end
        stem(a,func(a),'Filled','DisplayName',"Lower Bound of integral");                                                 %plotting lower bound integral point
        stem(b,func(b),'Filled','DisplayName',"Upper Bound of integral");                                                 %plotting upper bound integral point
        title("Midpoint Composite Rule Integration");                                                                     %setting graph title
        xlabel("x");                                                                                                      %setting x-axis label
        ylabel("f(x)");                                                                                                   %setting y-axis label
        axis auto;                                                                                                        %setting axis range (auto) , use ([xmin xmax ymin ymax]) for manual range
        grid on;                                                                                                          %setting major grid
        grid minor;                                                                                                       %setting minor grid
        legend;                                                                                                           %printing legend
        hold off;
    end
    
    %printing solution
    for k = 2:count+1
        fprintf("#%d: interval [x%d,mid%d,x%d] = [%.*f,%.*f,%.*f], f(x%d) = f(%.*f) = %.*f, f(x%d) = f(%.*f) = %.*f, f(mid%d) = f(%.*f) = %.*f, interval area I%d= %.*f, cummulative interval area = %.*f, current interval truncation error = +/- %.*f\n",k-1,k-1,k-1,k,precision,matrix(k-1,1),precision,matrix(k,2),precision,matrix(k,1),k-1,precision,matrix(k-1,1),precision,matrix(k-1,3),k,precision,matrix(k,1),precision,matrix(k,3),k-1,precision,matrix(k,2),precision,func(matrix(k,2)),k-1,precision,matrix(k,5),precision,matrix(k,6),precision,matrix(k,7));
    end
    fprintf("The open 1-point Newton-Cotes formula using the midpoint composite rule with %d intervals and %d interval points is: %.*f, truncation error: %.*f\n",count,count+1,precision,integral,precision,error1);    
end
function TrapezoidComposite()
    %declaring global "precision" and "resolution" variable
    global precision;
    global resolution;
    
    %title
    disp("======== TRAPEZOID COMPOSITE CLOSED 2-POINT NEWTON-COTES ========");

    %declaring symbolic variable
    syms x;
    
    %prompting user to enter the function to approximate the integral of
    func = input("Enter a function f(x) to find the integral of (use lowercase 'x' for the function's variable): ");     
    deriv_func = diff(func,x,2); 
    
    %converting symbolic function to numerical
    func = matlabFunction(func,'Vars',x);
    deriv_func = matlabFunction(deriv_func,'Vars',x);
    
    %prompting user for integration interval 
    a = input("Enter the integral's lower bound a: ");
    b = input("Enter the integral's upper bound b: ");
    
    %validating integral bounds
    while(a >= b)
        disp("Invalid bounds, lower bound must be lower than upper bound, please try again.");
        a = input("Enter the integral's lower bound a: ");
        b = input("Enter the integral's upper bound b: ");
    end
    
    %prompting user for amount of intervals
    count = round(input("Enter the amount of intervals m to use (greater than 0). If h is given instead of m, enter (b-a)/h : "));
    while(count < 1)
       count = round(input("Invalid input, Enter the amount of intervals m to use (greater than 0). If h is given instead of m, enter (b-a)/h : "));
    end
    
    %creating matrix that will store the intervals
    matrix = zeros(count+1,5);
    
    %initializing first and last interval points
    matrix(1,1)= a;                                                                                     %initializing first point
    matrix(1,2) = func(matrix(1,1));                                                                    %initializing first point function value
    matrix(1,3) = 0;                                                                                    %initializing area
    matrix(1,4) = 0;                                                                                    %initializing cummulative area
    matrix(1,5) = 0;                                                                                    %initializing truncation error at 0
    matrix(count+1,1) = b;                                                                              %initializing last point
    matrix(count+1,2) = func(matrix(count+1,1));                                                        %initializing last point function value
    matrix(count+1,3) = (matrix(count+1,1)-matrix(1,1))*(matrix(1,2)+matrix(count+1,2))/2;              %initializing area to 1 interval [a,b]
    matrix(count+1,4) = func(matrix(count+1,3));                                                        %initializing cumulative area to total interval [a,b]
    
    %initializing truncation error
    error_interval = deriv_func(a:resolution:b);
    matrix(count+1,5) = (((b-a)^3)/12)*max(abs(error_interval));                                        %initializing truncation error to total interval [a,b]

    %computing interval size
    interval_size = (b-a)/count;
        
    %computing total error of the composite method
    error1 = (((b-a)*interval_size^2)/12)*max(abs(error_interval));

    %computing interval points and evaluating the function at the point
    for k = 2:count+1
        matrix(k,1) = matrix(k-1,1)+interval_size;                                              %computing interval point and storing it in first col
        matrix(k,2) = func(matrix(k,1));                                                        %computing f(x) for current interval point and storing it in second col
        matrix(k,3) = (matrix(k,1)-matrix(k-1,1))*(matrix(k-1,2)+matrix(k,2))/2;                %computing (b-a)*(f(a)+f(b))/2 for current interval (area trapezoid) and storing it in third col
        matrix(k,4) = matrix(k-1,4)+matrix(k,3);                                                %computing total area of current and previous interval so far and storing it in fourth col
        
        %computing truncation error
        error_interval = deriv_func(matrix(k-1,1):resolution:matrix(k,1));
        matrix(k,5) = (((matrix(k,1)-matrix(k-1,1))^3)/12)*max(abs(error_interval));            %computing truncation error for current interval
    end
    
    %computing closed n-point Newton-Cotes integral using the composite rule
    integral = matrix(count+1,4);
    
    %prompting whether to plot function, integral points and trapezoid
    prmt = input("Would you like to plot the graph of the function, integral region and trapezoid? [y/n]: ",'s');
       
    %validating user input (checking if y/n is entered)
    while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
        prmt = input("Invalid input, would you like to plot the function, integral region and trapezoid? [y/n]: ",'s');
    end
    
    %plotting the graph if user chose to
    if(prmt == "y" || prmt == "Y")
        %initalizing data set to draw the tapezoid line
        point = transpose(matrix(:,1));                 %x-axis data
        
        %plotting graph
        fplot(func,'DisplayName',"Original Function");                                                              %plotting the original function
        hold on;                                                                                                    %telling matlab to hold the plots
        stem(point(1,2:size(point,2)-1),func(point(1,2:size(point,2)-1)),'DisplayName',"Interval points");          %plotting interval points excluding start and end point of integral        
        for k = 1:size(point,2)-1
            p = [point(1,k),point(1,k+1)];
            area(p,func(p),'EdgeColor','none','FaceAlpha',0.1,'DisplayName',sprintf("Area under interval #%d",k));  %plotting area under trapezoid curve
            plot(p,func(p),'DisplayName',sprintf("Trapezoid line #%d",k));                                          %plotting trapezoid line
        end
        stem(a,func(a),'Filled','DisplayName',"Lower Bound of integral");                                           %plotting lower bound integral point
        stem(b,func(b),'Filled','DisplayName',"Upper Bound of integral");                                           %plotting upper bound integral point
        title("Trapezoid Composite Rule Integration");                                                              %setting graph title
        xlabel("x");                                                                                                %setting x-axis label
        ylabel("f(x)");                                                                                             %setting y-axis label
        axis auto;                                                                                                  %setting axis range (auto) , use ([xmin xmax ymin ymax]) for manual range
        grid on;                                                                                                    %setting major grid
        grid minor;                                                                                                 %setting minor grid
        legend;                                                                                                     %printing legend
        hold off;
    end
     
    %printing solution
    for k = 2:count+1
        fprintf("#%d: interval [x%d,x%d] = [%.*f,%.*f], f(x%d) = f(%.*f) = %.*f, f(x%d) = f(%.*f) = %.*f, interval area I%d= %.*f, cummulative interval area = %.*f, current interval truncation error = +/- %.*f\n",k-1,k-1,k,precision,matrix(k-1,1),precision,matrix(k,1),k-1,precision,matrix(k-1,1),precision,matrix(k-1,2),k,precision,matrix(k,1),precision,matrix(k,2),k-1,precision,matrix(k,3),precision,matrix(k,4),precision,matrix(k,5));
    end
    fprintf("The closed 2-point Newton-Cotes formula using the trapezoid composite rule with %d intervals and %d interval points is: %.*f, truncation error: %.*f\n",count,count+1,precision,integral,precision,error1);
end
function SimpsonComposite()
    %declaring global "precision" and "resolution" variable
    global precision;
    global resolution;
    
    %title
    disp("========= SIMPSON COMPOSITE CLOSED 3-POINT NEWTON-COTES =========");

    %declaring symbolic variable
    syms x;
    
    %prompting user to enter the function to approximate the integral of
    func = input("Enter a function f(x) to find the integral of (use lowercase 'x' for the function's variable): ");     
    deriv_func = diff(func,x,4);

    %converting symbolic function to numerical
    func = matlabFunction(func,'Vars',x);
    deriv_func = matlabFunction(deriv_func,'Vars',x);

    %prompting user for integration interval 
    a = input("Enter the integral's lower bound a: ");
    b = input("Enter the integral's upper bound b: ");
    
    %validating integral bounds
    while(a >= b)
        disp("Invalid bounds, lower bound must be lower than upper bound, please try again.");
        a = input("Enter the integral's lower bound a: ");
        b = input("Enter the integral's upper bound b: ");
    end
    
    %prompting user for amount of intervals
    count = round(input("Enter the amount of intervals m to use (greater than 0). If h is given instead of m, enter (b-a)/h : "));
    while(count < 1)
       count = round(input("Enter the amount of intervals m to use (greater than 0). If h is given instead of m, enter (b-a)/h : "));
    end
    
    %creating matrix that will store the intervals
    matrix = zeros(count+1,7);
    
    %initializing first and last interval points
    matrix(1,1)= a;                                                                                             %initializing first point
    matrix(1,2)= a;                                                                                             %initializing first mid point
    matrix(1,3) = func(matrix(1,1));                                                                            %initializing first point function value
    matrix(1,4) = func(matrix(1,2));                                                                            %initializing first mid point function value
    matrix(1,5) = 0;                                                                                            %initializing area
    matrix(1,6) = 0;                                                                                            %initializing cummulative area
    matrix(1,7) = 0;                                                                                            %initializing current truncation error at 0
    matrix(count+1,1) = b;                                                                                      %initializing last point
    matrix(count+1,2) = (matrix(1,1)+matrix(count+1,1))/2;                                                      %initializing last mid point
    matrix(count+1,3) = func(matrix(count+1,1));                                                                %initializing last point function value
    matrix(count+1,4) = func(matrix(count+1,2));                                                                %initializing last mid point function value
    matrix(count+1,5) = (matrix(count+1,1)-matrix(1,1))*(matrix(1,3)+matrix(count+1,3)+4*matrix(count+1,4))/6;  %initializing area on interval [a,b]
    matrix(count+1,6) = func(matrix(count+1,3));                                                                %initializing cumulative area to total interval [a,b]
    
    %initializing truncation error
    error_interval = deriv_func(a:resolution:b);
    matrix(count+1,7) = ((((b-a)/2)^5)/90)*max(abs(error_interval));                                            %initializing truncation error to total interval [a,b]
    
    %computing interval size
    interval_size = (b-a)/count;
    
    %computing total error of the composite method
    error1 = (((b-a)*(interval_size/2)^4)/180)*max(abs(error_interval));

    %computing interval points and evaluating the function at the point
    for k = 2:count+1
        matrix(k,1) = matrix(k-1,1)+interval_size;                                                %computing interval point and storing it in 1st col
        matrix(k,2) = (matrix(k-1,1)+matrix(k,1))/2;                                              %computing interval mid point and storing it in 2nd col
        matrix(k,3) = func(matrix(k,1));                                                          %computing f(x) for current interval point and storing it in 3rd col
        matrix(k,4) = func(matrix(k,2));                                                          %computing f(x) for current interval point and storing it in 4rd col
        matrix(k,5) = (matrix(k,1)-matrix(k-1,1))*(matrix(k-1,3)+matrix(k,3)+4*matrix(k,4))/6;    %computing (b-a)*(f(a)+f(b)+4*f(mid))/6 for current interval (area trapezoid) and storing it in 5th col
        matrix(k,6) = matrix(k-1,6)+matrix(k,5);                                                  %computing total area of current and previous intervals so far and storing it in 6th col
        
        %initializing truncation error
        error_interval = deriv_func(matrix(k-1,1):resolution:matrix(k,1));
        matrix(k,7) = ((((matrix(k,1)-matrix(k-1,1))/2)^5)/90)*max(abs(error_interval));    %computing truncation error for current interval
    end
    
    %computing closed n-point Newton-Cotes integral using the composite rule
    integral = matrix(count+1,6);
   
    %prompting whether to plot function, integral points and simpson's trapezoid curve
    prmt = input("Would you like to plot the graph of the function, integral region and simpson's curve? [y/n]: ",'s');
       
    %validating user input (checking if y/n is entered)
    while (prmt ~= "N" && prmt ~= "n" && prmt ~= "Y" && prmt ~= "y")
        prmt = input("Invalid input, would you like to plot the function, integral region and simpson's curve? [y/n]: ",'s');
    end
      
    %plotting the graph if user chose to
    if(prmt == "y" || prmt == "Y")
        %initalizing data set to draw the simpson line
        point_mid = transpose(matrix(:,2));             %storing mid points
        point_inter = transpose(matrix(:,1));           %storing interval point
        
        %plotting graph
        fplot(func,'DisplayName',"Original Function");                                                              %plotting the original function
        hold on;                                                                                                    %telling matlab to hold the plots
        stem(point_inter,func(point_inter),'Filled','DisplayName',"Interval points");                               %plotting interval point        
        stem(point_mid,func(point_mid),'LineStyle','-.','DisplayName',"Mid points");                                %plotting interval mid point         
        for k = 1:size(matrix,1)-1
            p = [point_inter(1,k),point_mid(1,k+1),point_inter(1,k+1)];
            plot(p,func(p),'DisplayName',sprintf("Simpson's line #%d",k));                                          %plotting trapezoid line
            area(p,func(p),'EdgeColor','none','FaceAlpha',0.1,'DisplayName',sprintf("Area under interval #%d",k));  %plotting area under trapezoid curve
        end
        stem(a,func(a),'Filled','DisplayName',"Lower Bound of integral");               %plotting lower bound integral point
        stem(b,func(b),'Filled','DisplayName',"Upper Bound of integral");               %plotting upper bound integral point
        title("Simpson's Composite Rule Integration");                                                              %setting graph title
        xlabel("x");                                                                                                %setting x-axis label
        ylabel("f(x)");                                                                                             %setting y-axis label
        axis auto;                                                                                                  %setting axis range (auto) , use ([xmin xmax ymin ymax]) for manual range
        grid on;                                                                                                    %setting major grid
        grid minor;                                                                                                 %setting minor grid
        legend;                                                                                                     %printing legend
        hold off;
    end
   
    %printing solution
    for k = 2:count+1
        fprintf("#%d: interval [x%d,mid%d,x%d] = [%.*f,%.*f,%.*f], f(x%d) = f(%.*f) = %.*f, f(x%d) = f(%.*f) = %.*f, f(mid%d) = f(%.*f) = %.*f, interval area I%d= %.*f, cummulative interval area = %.*f, current interval truncation error = +/- %.*f\n",k-1,k-1,k-1,k,precision,matrix(k-1,1),precision,matrix(k,2),precision,matrix(k,1),k-1,precision,matrix(k-1,1),precision,matrix(k-1,3),k,precision,matrix(k,1),precision,matrix(k,3),k-1,precision,matrix(k,2),precision,func(matrix(k,2)),k-1,precision,matrix(k,5),precision,matrix(k,6),precision,matrix(k,7));
    end
    fprintf("The closed 3-point Newton-Cotes formula using the simpson composite rule with %d intervals and %d interval points is: %.*f, truncation error: %.*f\n",count, 2*count+1,precision,integral,precision,error1);    
end
function RombergTrapezoid()    
    %declaring global "precision" variable
    global precision;
    
    %title
    disp("==== ROMBERG'S INTEGRAL USING TRAPEZOID RULE FOR FIRST STEP =====");

    %declaring symbolic variable
    syms x;
    
    %prompting user to enter the function to approximate the integral of
    func = input("Enter a function f(x) to find the integral of (use lowercase 'x' for the function's variable): ");     
    
    %converting symbolic function to numberical
    func = matlabFunction(func,'Vars',x);
    
    %prompting user for integration interval 
    a = input("Enter the integral's lower bound a: ");
    b = input("Enter the integral's upper bound b: ");
    
    %validating integral bounds
    while(a >= b)
        disp("Invalid bounds, lower bound must be lower than upper bound, please try again.");
        a = input("Enter the integral's lower bound a: ");
        b = input("Enter the integral's upper bound b: ");
    end
    
    %prompting user for step size h
    step = input("Enter the starting step size h to use (greater than 0, smaller than bounds). If m is given instead of h, enter (b-a)/m : ");
    while(step <= 0 || step > (b-a))
       step = input("Invalid input, Enter the starting step size h to use (greater than 0, smaller than bounds). If m is given instead of h, enter (b-a)/m : ");
    end
    
    %prompting user for amount of romberg iterations, 1 iteration simply computes the integral value using trapezoid method with given step value
    iteration = ceil(input("Enter the amount of Romberg iterations to compute (greater than 0), if order is given, enter order/2: "));
    while(iteration < 1)
       iteration = ceil(input("Invalid input, Enter the amount of Romberg iteratons to compute (greater than 0), if order is given, enter order/2: "));
    end
    
    %initializing romberg matrix
    RombergMatrix = zeros(iteration,iteration);
    
    %computing romberg matrix
    for iter = 1:iteration
        
        %computing amount of intervals
        count = (b-a)/step;
        
        %initializing first interval point
        first_point = a;                                                                                    %initializing first point
        area = 0;                                                                                           %initializing area
                       
        %computing interval points and evaluating the function at the point
        for k = 1:count
            last_point = first_point+step;                                                                  %computing end interval point 
            area = area+((last_point-first_point)*(func(first_point)+func(last_point)))/2;                  %computing (b-a)*(f(a)+f(b))/2 for current interval (area trapezoid) and storing it in third col
            first_point = last_point;                                                                       %incrementing the first point to the first point of next interval
        end
        
        %storing value of integral in the correct row of the romberg matrix first column
        RombergMatrix(iter,1) = area;
        
        %changing step size (default is dividing by 2)
        step = step/2;
    end
    
    %computing romberg matrix
    for col = 2:iteration
        for row = col:iteration
            RombergMatrix(row,col) = ((2^(2*(col-1)))*RombergMatrix(row,col-1)-RombergMatrix(row-1,col-1))/(2^(2*(col-1))-1); 
        end
    end
    
    %printing out the matrix
    disp("The romberg matrix is: ");
    for row = 1:size(RombergMatrix,1)
        for col = 1:size(RombergMatrix,2)
            fprintf("R(%d,%d) = %.*f \t",row,col,precision,RombergMatrix(row,col));
        end
        fprintf("\n");
    end
    
    %computing error
    RombergOrderError = zeros(1,iteration);
    for col = 1:iteration-1
        RombergOrderError(1,col) = abs((RombergMatrix(iteration,col)-RombergMatrix(iteration-1,col))/(2^(2*(col))-1)); 
        if(col == iteration-1)
           RombergOrderError(1,col+1) = RombergOrderError(1,col);
        end
    end
    
    %printing error
    disp("The error on the Romberg estimation for each order is: ");
    for col = 1:size(RombergMatrix,2)
        fprintf("E(%d,%d) = %.*f \t",iteration,col,precision,RombergOrderError(1,col));
    end
    fprintf("\n");
end
function GaussQuadratureStandarized()
    %declaring global "precision" variable
    global precision;
    
    %title
    disp("=========== STANDARDIZED GAUSS QUADRATURE INTEGRATION ===========");
    disp("Use default values below or enter different ones if provided at the prompt (you can copy paste):");
    
    %c_i values for selected point interpolation
    C1 = [2 0 0 0 0 0];                                                                                             %for 1-point interpolation
    C2 = [1, 1, 0, 0, 0, 0];                                                                                        %for 2-point interpolation
    C3 = [0.5555555555555556, 0.8888888888888888, 0.5555555555555556, 0, 0, 0];                                     %for 3-point interpolation
    C4 = [0.3478548451374538, 0.6521451548625461, 0.6521451548625461,0.3478548451374538, 0, 0];                     %for 4-point interpolation
    C5 = [0.2369268850561891, 0.4786286704993665, 0.5688888888888889, 0.4786286704993665,0.2369268850561891, 0];    %for 5-point interpolation
    C6 = [0.1713245, 0.3607616, 0.4679139, 0.4679139, 0.3607616, 0.1713245];                                        %for 6-point interpolation
    Ci = [C1;C2;C3;C4;C5;C6];
    %x_i values for selected point interpolation
    X1 = [0 0 0 0 0 0];                                                                                             %for 1-point interpolation
    X2 = [-0.5773502691896257, 0.5773502691896257, 0, 0, 0, 0];                                                     %for 2-point interpolation
    X3 = [-0.7745966692414834, 0, 0.7745966692414834, 0, 0, 0];                                                     %for 3-point interpolation
    X4 = [-0.8611363115940526, -0.3399810435848563, 0.3399810435848563, 0.8611363115940526, 0, 0];                  %for 4-point interpolation
    X5 = [-0.9061798459386640, -0.5384693101056831, 0, 0.5384693101056831, 0.9061798459386640, 0];                  %for 5-point interpolation
    X6 = [-0.93246951, -0.66120938, -0.23861919, 0.23861919, 0.66120938, 0.93246951];                               %for 6-point interpolation
    Xi = [X1;X2;X3;X4;X5;X6];
    for row=1:5
        fprintf("****** For %d-point interpolation use the following: ******\nc_i = [",row);
        fprintf("%.*f",precision,Ci(row,1));
        for col=2:6
            fprintf(", %.*f",precision,Ci(row,col));
        end
        fprintf("] \nx_i = [");
        fprintf("%.*f",precision,Xi(row,1));
        for col=2:6
            fprintf(", %.*f",precision,Xi(row,col));
        end
        fprintf("]\n");
    end     
    disp("----------------");

    %declaring symbolic variable
    syms x;
    syms t;
    
    %prompting user to enter the function to approximate the integral of
    func = input("Enter the function f(x) to find the integral of (use lowercase 'x' for the function's variable): ");  
        
    %prompting user for integration interval 
    a = input("Enter the integral's lower bound a: ");
    b = input("Enter the integral's upper bound b: ");
    
    %validating integral bounds
    while(a >= b)
        disp("Invalid bounds, lower bound must be lower than upper bound, please try again.");
        a = input("Enter the integral's lower bound a: ");
        b = input("Enter the integral's upper bound b: ");
    end
    
    %changing variables
    ta = -1;                                    %new lower bound
    tb = 1;                                     %new upper bound
    x = ((b-a)/2)*t+((b+a)/2);                  %new variable
    derivx = diff(x);                           %new dx
    standardized_func = subs(func,'x',x)*derivx;%new standardized function
    
    %converting symbolic function to numerical
    standardized_func = matlabFunction(standardized_func,'Vars',t);

    %prompting user for coefficients and points data set
    while(true)
        %prompting for coefficients c_i
        c_i = input("Enter the coefficients c_i dataset (use [c1, c2, c3 ... ci]): ");
        %prompting for points x_i
        x_i = input("Enter the x_i dataset (use [x1, x2, x3 ... xi]): ");
        if(size(c_i) == size(x_i))
            if(size(x_i,1) == 1)
                break;
            end
        end
        disp("Invalid input, c_i and x_i must be vectors of the same size, please try again.");
    end    
 
    %printing solution
    disp("-------------");
    fprintf("The gauss quadrature integral is I = %.*f\n",precision,sum(c_i.*standardized_func(x_i))); 
    fprintf("The new interval is a = %d to b = %d, using the conversion x = %.*f*t + %.*f and dx = %.*f\n",ta,tb,precision,((b-a)/2),precision,((b+a)/2),precision,derivx);
end
function GaussQuadrature()
    %declaring global "precision" variable
    global precision;
    
    %title
    disp("========= NON-STANDARDIZED GAUSS QUADRATURE INTEGRATION =========");
    disp("Requires the set of C_i and X_i!!!!!");
    disp("----------------");
    
    
    %declaring symbolic variable
    syms x;
    
    %prompting user to enter the function to approximate the integral of
    func = input("Enter the function f(x) to find the integral of (use lowercase 'x' for the function's variable): ");
    
    %prompting user for integration interval
    a = input("Enter the integral's lower bound a: ");
    b = input("Enter the integral's upper bound b: ");
    
    %validating integral bounds
    while(a >= b)
        disp("Invalid bounds, lower bound must be lower than upper bound, please try again.");
        a = input("Enter the integral's lower bound a: ");
        b = input("Enter the integral's upper bound b: ");
    end
    
    %converting symbolic function to numerical
    func = matlabFunction(func,'Vars',x);
    
    %prompting user for coefficients and points data set
    while(true)
        %prompting for coefficients c_i
        c_i = input("Enter the coefficients c_i dataset (use [c1, c2, c3 ... ci]): ");
        %prompting for points x_i
        x_i = input("Enter the x_i dataset (use [x1, x2, x3 ... xi]): ");
        if(size(c_i) == size(x_i))
            if(size(x_i,1) == 1)
                break;
            end
        end
        disp("Invalid input, c_i and x_i must be vectors of the same size, please try again.");
    end
    
    %printing solution
    disp("-------------");
    fprintf("The gauss quadrature integral using %d points is I = %.*f\n",size(x_i,2),precision,sum(c_i.*func(x_i)));
end
function AdaptiveGaussQuadrature
    %declaring global "precision" variable
    global precision;
    
    %title
    disp("========= ADAPTIVE GAUSS QUADRATURE INTEGRATION =========");    
    
    %declaring symbolic variable
    syms x;
    
    %prompting user to enter the function to approximate the integral of
    func = input("Enter the function f(x) to find the integral of (use lowercase 'x' for the function's variable): ");  
        
    %prompting user for integration interval 
    a = input("Enter the integral's lower bound a: ");
    b = input("Enter the integral's upper bound b: ");
    
    %validating integral bounds
    while(a >= b)
        disp("Invalid bounds, lower bound must be lower than upper bound, please try again.");
        a = input("Enter the integral's lower bound a: ");
        b = input("Enter the integral's upper bound b: ");
    end
    
    %converting symbolic function to numerical
    func = matlabFunction(func,'Vars',x);

    %prompting for tolerance
    tol = input("Enter a tolerance: ");
    while ~(tol>0)
        tol = input("Invalid input, tolerance must be greater than 0, please try again: ");
    end
    fprintf("The gauss quadrature integral using the adaptive method is I = %.*f\n",precision,adapquad(func,a,b,tol));
end
function RichardsonError7()
    %declaring global "precision" variable
    global precision;
    
    %title
    disp("======================= Richardson's Error ======================");
    disp("* The Richardson Error formula is given by E(h2) = abs([I(h2)-I(h1)]/[(h1/h2)^q - 1])");
    disp("* Which is derived from the the equality I(h1) + E(h1) = I(h2) + E(h2), where I(h) is the integral using the step size h");
    disp("* and where E(h) ~= C*h^q, where h is the step size, q is the order of the method and C a certain constant");
    disp("* which can be rewritten as E(h1)/E(h2) ~= (h1/h2)^q");
    disp("-------------");
    disp("For the trapezoid method q = 2, simpson's 1/3 method q = 4, for midpoint method q = 2"); 
    disp("-------------");
    
    %declaring symbolic variable
    syms x;
    
    %prompting user for h1 and h2
    disp("If a ratio is given (i.e. 2, enter h1 and h2 such that h1/h2 = 2, else enter the given values below");
    h1 = input("Enter h1 (if the amount of interval m1 is given, enter (b-a)/m1), if h1 is unknown, enter h2/2: ");
    h2 = input("Enter h2 (if the amount of interval m2 is given, enter (b-a)/m2), if h2 is unknown, enter h1*2: ");
    
    %prompting user for order q
    orderQ = input("Enter the truncation error order q: ");
    
    %prompting user for I1 and I2
    I1 = input("Enter I1 (value of integral using h1, if unknown, compute it using the other options in script): ");
    I2 = input("Enter I2 (value of integral using h2, if unknown, compute it using the other options in script): ");
    
    %displaying error
    fprintf("The error E(h2) = %.*f\n", precision, abs((I2-I1)/((h1/h2)^orderQ-1)));
    fprintf("The constant C = %.*f\n", precision, (abs((I2-I1)/((h1/h2)^orderQ-1)))/(h2^orderQ));   
end
function int=adapquad(f,a0,b0,tol0) %taken from textbook cuz fuck this shit
    %initializing variables
    int=0;                              %integral value
    n=1;                                %amount of interval points
    a(1)=a0;                            %array holding start point of intervals
    b(1)=b0;                            %array holding end point of intervals
    tol(1)=tol0;                        %tolerance of answer required
    app(1)=trap(f,a,b);                 %applying trapezoid method to interval
    
    while n>0 % n is current position at end of the list (interval currently breaking down)
        c=(a(n)+b(n))/2;                %finding midpoint
        oldapp=app(n);                  %storing temporarly the old criteria value
        app(n)=trap(f,a(n),c);          %      
        app(n+1)=trap(f,c,b(n));
        if abs(oldapp-(app(n)+app(n+1)))<3*tol(n)
            int=int+app(n)+app(n+1);    % success
            n=n-1;                      % done with interval
        else                            % divide into two intervals
            b(n+1)=b(n); b(n)=c;        % set up new intervals
            a(n+1)=c;
            tol(n)=tol(n)/2; tol(n+1)=tol(n);
            n=n+1; % go to end of list, repeat
        end
    end
end
function s=trap(f,a,b)
    s=(f(a)+f(b))*(b-a)/2;
end

% ============== Chapter 8 - Initial Value Problem -- incomplete ==============
function Chapter8()
    %declaring global variable
    global clearConsole;
        
    %Starting menu loop, returns to main menu after user exits
    while(true)
        disp("=============== Chapter 8 - Initial Value Problem ===============");
        disp("[1]  Euler's Method (first order ODE of form dy/dt = ...)");
        disp("[2]  Runge-Kutta Trapezoid (RK2Trap) Method (first order ODE of form dy/dt = ...)");
        disp("[3]  Runge-Kutta Midpoint (RK2Mid) Method (first order ODE of form dy/dt = ...)");
        disp("[4]  Runge-Kutta RK4 Method (first order ODE of form dy/dt = ...)");
        disp("[5]  SYSTEMS of IVP ODE using Euler's Method");
        disp("[6]  SYSTEMS of IVP ODE using Ruge-Kutta Trapezoid (RK2Trap) Method");
        disp("[7]  SYSTEMS of IVP ODE using Ruge-Kutta Midpoint (RK2TrapMid) Method");
        disp("[8]  SYSTEMS of IVP ODE using Ruge-Kutta RK4 Method");
        disp("[9]  Richardson Error");
        disp("[10] Return to main menu");
        
        %prompt user for option
        x = input("Choose an option: ");
        
        %validating user input
        while(x < 1 || x > 11)
            x = input("Invalid input, please try again: ");
        end
        
        switch(x)
            case(1)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                EulerMethod();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(2)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                RK2Trap();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(3)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                RK2Mid();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(4)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                RK4();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(5)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                EulerMethodSystem();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(6)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                RK2TrapSystem();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(7)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                RK2MidSystem();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(8)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                RK4System();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(9)
                if(clearConsole)
                    clc;            %clear secondary menu from console
                end
                RichardsonError8();
                if(clearConsole)
                    disp("Press any key to continue...");
                    pause;
                    clc;            %clear calculations from console
                end
            case(10)
                break;
            otherwise
                continue;
        end
    end
end
function EulerMethod()
    %declaring global "precision" and "resolution" variable
    global precision;
    
    %title
    disp("=========================== EULER'S METHOD ==========================");    
    
    %declaring symbolic variable
    syms y;
    syms t;
    
    %prompting user to enter ODE function to approximate the solution of
    ODE = input("Enter the ODE. For example, given dy/dt = t*y, enter ""t*y"" (use the variable t for the independent variable and y for the dependent variable) dy/dt = ");     
    
    %prompting user for initial value t0
    t0 = input("Enter the initial value t0: ");
    
    %prompting user for the initial value y(t0)
    y0 = input("Enter the initial value for y(t0)/w0: ");
    
    %prompting user for setup size
    step = input("Enter the step size h: ");
    
    %prompting user for iteration count
    iteration = round(input("Enter the amount of iteration to compute (if interval [a,b] given, enter (b-a)/h, if point t given, enter (t-t0)/h): "));
        
    %converting symbolic function to numerical
    ODE = matlabFunction(ODE,'Vars',[t y]);

    %computing iterations
    prevW = y0;
    prevT = t0;
    prevW2 = y0;
    prevT2 = t0;
    step2 = step/2;
    fprintf("Iteration #0: t0 = %.*f, w0 = %.*f, Global Error = +/-0\n",precision,prevT,precision,prevW);
    for k = 1:iteration
        %computing iteration for step h 
        prevW = prevW+step*ODE(prevT,prevW);
        prevT = prevT+step;
        
        %computing iteration for step h/2 (used for error)
        for count = 1:2
            prevW2 = prevW2+step2*ODE(prevT2,prevW2);
            prevT2 = prevT2+step2;
        end
        gError = richerr8(prevW,prevW2,step,step2,1);
        
        %printing solution
        fprintf("Iteration #%d: t%d = %.*f, w%d = %.*f, Global Error = +/- %.*f\n",k,k,precision,prevT,k,precision,prevW,precision,gError);
    end
end
function RK2Trap()
    %declaring global "precision" and "resolution" variable
    global precision;
    
    %title
    disp("================= RUNGE-KUTTA'S TRAPEZOID METHOD ================");    

    %declaring symbolic variable
    syms y;
    syms t;
    
    %prompting user to enter ODE function to approximate the solution of
    ODE = input("Enter the ODE. For example, given dy/dt = t*y, enter ""t*y"" (use the variable t for the independent variable and y for the dependent variable) dy/dt = ");     
    
    %prompting user for initial value t0
    t0 = input("Enter the initial value t0: ");
    
    %prompting user for the initial value y(t0)
    y0 = input("Enter the initial value for y(t0)/w0: ");
    
    %prompting user for setup size
    step = input("Enter the step size h: ");
    
    %prompting user for iteration count
    iteration = round(input("Enter the amount of iteration to compute (if interval [a,b] given, enter (b-a)/h, if point t given, enter (t-t0)/h): "));
        
    %converting symbolic function to numerical
    ODE = matlabFunction(ODE,'Vars',[t y]);

    %computing iterations
    prevW = y0;
    prevT = t0;
    prevW2 = y0;
    prevT2 = t0;
    step2 = step/2;
    fprintf("Iteration #0: t0 = %.*f, w0 = %.*f, k1_0 = N/A, k2_0 = N/A, Global Error = N/A\n",precision,prevT,precision,prevW);
    for k = 1:iteration
        %computing iteration for step h
        k1 = ODE(prevT,prevW);
        k2 = ODE(prevT+step,prevW+k1*step);
        prevW = prevW+step*(0.5*k1+0.5*k2);
        prevT = prevT+step;
                
        %computing iteration for step h/2 (used for error)
        for count = 1:2
            k12 = ODE(prevT2,prevW2);
            k22 = ODE(prevT2+step2,prevW2+k12*step2);
            prevW2 = prevW2+step2*(0.5*k12+0.5*k22);
            prevT2 = prevT2+step2;
        end
        gError = richerr8(prevW,prevW2,step,step2,2);
        
        %printing solution
        fprintf("Iteration #%d: t%d = %.*f, w%d = %.*f, k1_%d = %.*f, k2_%d =  %.*f, Global Error = +/- %.*f\n",k,k,precision,prevT,k,precision,prevW,k,precision,k1,k,precision,k2,precision,gError);
    end    
end
function RK2Mid()
    %declaring global "precision" and "resolution" variable
    global precision;
    
    %title
    disp("================= RUNGE-KUTTA'S MIDPOINT METHOD =================");

    %declaring symbolic variable
    syms y;
    syms t;
    
    %prompting user to enter ODE function to approximate the solution of
    ODE = input("Enter the ODE. For example, given dy/dt = t*y, enter ""t*y"" (use the variable t for the independent variable and y for the dependent variable) dy/dt = ");     
    
    %prompting user for initial value t0
    t0 = input("Enter the initial value t0: ");
    
    %prompting user for the initial value y(t0)
    y0 = input("Enter the initial value for y(t0)/w0: ");
    
    %prompting user for setup size
    step = input("Enter the step size h: ");
    
    %prompting user for iteration count
    iteration = round(input("Enter the amount of iteration to compute (if interval [a,b] given, enter (b-a)/h, if point t given, enter (t-t0)/h): "));
        
    %converting symbolic function to numerical
    ODE = matlabFunction(ODE,'Vars',[t y]);

    %computing iterations
    prevW = y0;
    prevT = t0;
    prevW2 = y0;
    prevT2 = t0;
    step2 = step/2;
    fprintf("Iteration #0: t0 = %.*f, w0 = %.*f, k1_0 = N/A, k2_0 = N/A, Global Error = N/A\n",precision,prevT,precision,prevW);
    for k = 1:iteration
        %computing iteration for step h
        k1 = ODE(prevT,prevW);
        k2 = ODE(prevT+0.5*step,prevW+0.5*k1*step);
        prevW = prevW+step*k2;
        prevT = prevT+step;
                
        %computing iteration for step h/2 (used for error)
        for count = 1:2
            k12 = ODE(prevT2,prevW2);
            k22 = ODE(prevT2+0.5*step2,prevW2+0.5*k12*step2);
            prevW2 = prevW2+step2*k22;
            prevT2 = prevT2+step2;
        end
        gError = richerr8(prevW,prevW2,step,step2,2);
        
        %printing solution
        fprintf("Iteration #%d: t%d = %.*f, w%d = %.*f, k1_%d = %.*f, k2_%d =  %.*f, Global Error = +/- %.*f\n",k,k,precision,prevT,k,precision,prevW,k,precision,k1,k,precision,k2,precision,gError);
    end    
end
function RK4
    %declaring global "precision" and "resolution" variable
    global precision;
    
    %title
    disp("==================== RUNGE-KUTTA'S RK4 METHOD ===================");

    %declaring symbolic variable
    syms y;
    syms t;
    
    %prompting user to enter ODE function to approximate the solution of
    ODE = input("Enter the ODE. For example, given dy/dt = t*y, enter ""t*y"" (use the variable t for the independent variable and y for the dependent variable) dy/dt = ");     
    
    %prompting user for initial value t0
    t0 = input("Enter the initial value t0: ");
    
    %prompting user for the initial value y(t0)
    y0 = input("Enter the initial value for y(t0)/w0: ");
    
    %prompting user for setup size
    step = input("Enter the step size h: ");
    
    %prompting user for iteration count
    iteration = round(input("Enter the amount of iteration to compute (if interval [a,b] given, enter (b-a)/h, if point t given, enter (t-t0)/h): "));
        
    %converting symbolic function to numerical
    ODE = matlabFunction(ODE,'Vars',[t y]);

    %computing iterations
    prevW = y0;
    prevT = t0;
    prevW2 = y0;
    prevT2 = t0;
    step2 = step/2;
    fprintf("Iteration #0: t0 = %.*f, w0 = %.*f, k1_0 = N/A, k2_0 = N/A, k3_0 = N/A, k4_0 = N/A, Global Error = N/A\n",precision,prevT,precision,prevW);
    for k = 1:iteration
        %computing iteration for step h
        k1 = ODE(prevT,prevW);
        k2 = ODE(prevT+0.5*step,prevW+0.5*k1*step);
        k3 = ODE(prevT+0.5*step,prevW+0.5*k2*step);
        k4 = ODE(prevT+step,prevW+k3*step);
        prevW = prevW+(step/6)*(k1+2*k2+2*k3+k4);
        prevT = prevT+step;
        gError = 0;
        
        %computing iteration for step h/2 (used for error)
        for count = 1:2
            k12 = ODE(prevT2,prevW2);
            k22 = ODE(prevT2+0.5*step2,prevW2+0.5*k12*step2);
            k32 = ODE(prevT2+0.5*step2,prevW2+0.5*k22*step2);
            k42 = ODE(prevT2+step2,prevW2+k32*step2);
            prevW2 = prevW2+(step2/6)*(k12+2*k22+2*k32+k42);
            prevT2 = prevT2+step2;
            gError = richerr8(prevW,prevW2,step,step2,4);
        end
        
        %printing solution
        fprintf("Iteration #%d: t%d = %.*f, w%d = %.*f, k1_%d = %.*f, k2_%d =  %.*f, k3_%d =  %.*f, k4_%d =  %.*f, Global Error = +/- %.*f\n",k,k,precision,prevT,k,precision,prevW,k,precision,k1,k,precision,k2,k,precision,k3,k,precision,k4,precision,gError);
    end        
end
function EulerMethodSystem()
    %declaring global "precision" and "resolution" variable
    global precision;
    
    %title
    disp("=================== EULER'S METHOD FOR SYSTEMS ==================");    
    
    %Printing important instructions
    disp("***********************************************************************************************************************************************************");
    disp("******************************************************** READ THE FOLLOWING INSTRUCTIONS CAREFULLY ********************************************************");
    disp("***********************************************************************************************************************************************************");
    disp("---> Unlike previously where functions were entered using symbolic expression, for this specific method, you must enter them using anonymous functions:");
    disp("---> For those who don't know how anonymous functions work, there are three parts: @(list of variables)(expression)");
    disp("---> For the first part, the function starts with a ""@""");
    disp("---> For the second part, following right after the ""@"", you enter a list of variables, each one delimited by a comma. Use a parenthesis to group them all together");
    disp("---> For the third part, following right after the ""(list of variables)"", you enter the expression or group of expressions the function evaluates. Use a parenthesis to group them");
    disp("***********************************************************************************************************************************************************");
    disp("---> Entering a system of ODE functions are tricky. Do the following:");
    disp("1. use only the letter t for the INDEPENDENT and use y for any number of y1,y2,y3,...yn for the DEPENDENT variables.");
    disp("2. To represent the variables y1, y2, y3... yn, use y(1),y(2),y(3),...y(n), to represent the variable t, use t");    
    disp("3. For each function (f1, f2, f3...) use anonymous functions. For example, if f1 is [dy1/dt = y1*t + y2^2 + t^3], you end up with @(t,y)(y(1).*t + y(2).^2 + t.^3)");
    disp("4. Be careful! Previously you would just write t*y if you want to multiply t and y. For anonymous functions, you must enter t.*y. The same applies for divison and power (./,.^)");
    disp("5. Remember to put all the parenthesis and multiplication signs as before!");
    disp("5. If there is more than one expression, use @(variable)([expr1,expr2,expr3,...exprn])");
    disp("***********************************************************************************************************************************************************");
    disp("For Example, for the following system of ODE:");
    disp("d(y1)/dt = t");
    disp("d(y2)/dt = t^2*y1");
    disp("d(y3)/dt = t^3*y3 + y2");
    disp("You must enter on the line prompting you for the ODE the following: @(t,y)([(t),(t.^2.*y(1)),(t.^3.*y(3) + y(2))])");
    disp("***********************************************************************************************************************************************************");

    %prompting user to enter system of ODE function to approximate the solution of
    func = input("Enter YOUR system of ODEs as explained above: ");     
    
    %prompting user for initial value t0
    t0 = input("Enter the initial value t0: ");
    
    %prompting user for the initial value y(t0)
    y0 = input("Enter the initial value for y(t0)/w0 (use [w01,w02,w03...w0n] for y1,y2,...yn): ");
    
    %prompting user for setup size
    step = input("Enter the step size h: ");
    
    %prompting user for iteration count
    iteration = round(input("Enter the amount of iteration to compute (if interval [a,b] given, enter (b-a)/h, if point t given, enter (t-t0)/h): "));
        
    %computing iterations for h
    w = y0;
    t = t0;
    h = step;
    f = func;
    n = iteration;
    for k = 1:n
        w=[w ; w(k,:)+h*f(t(k),w(k,:))];
        t=[t ; t(k)+h];
    end
    w1 = w;
    h1 = h;
    t1 = t;
    
    %computing iterations for h/2
    w = y0;
    t = t0;
    h = step/2;
    f = func;
    n = iteration*2;
    for k = 1:n
        w=[w ; w(k,:)+h*f(t(k),w(k,:))];
        t=[t ; t(k)+h];
    end
    %matching values
    for row = 1:iteration+1
        w2(row,:) = w((2*row-1),:);
    end
    h2 = h;
    size(w2)
    size(w1)
    %computing error
    error = richerr8(w1,w2,h1,h2,1);
        
    %printing out solution
    disp("The solution matrix [t(i), w(1,i),E(1,i),w(2,i),E(2,i),...w(n,i),E(n,i)] is :");
    %loop going through each iteration
    for row = 1:iteration+1
        %printing first column (t(i))
        fprintf("Iteration #%d: t(%d) = %.*f, ",row-1,row-1,precision,t1(row,1));
        
        %printing respective w(n,i) columns
        for col = 1:size(y0,2)
            fprintf("w(%d,%d) = %.*f, E(%d,%d) = %.*f, ",col,row-1,precision,w1(row,col),col,row-1,precision,error(row,col));
        end
        fprintf("\n");
    end
end
function RK2TrapSystem()
    %declaring global "precision" and "resolution" variable
    global precision;
    
    %title
    disp("=========== RUNGE-KUTTA'S TRAPEZOID METHOD FOR SYSTEMS ==========");    
    
    %Printing important instructions
    disp("***********************************************************************************************************************************************************");
    disp("******************************************************** READ THE FOLLOWING INSTRUCTIONS CAREFULLY ********************************************************");
    disp("***********************************************************************************************************************************************************");
    disp("---> Unlike previously where functions were entered using symbolic expression, for this specific method, you must enter them using anonymous functions:");
    disp("---> For those who don't know how anonymous functions work, there are three parts: @(list of variables)(expression)");
    disp("---> For the first part, the function starts with a ""@""");
    disp("---> For the second part, following right after the ""@"", you enter a list of variables, each one delimited by a comma. Use a parenthesis to group them all together");
    disp("---> For the third part, following right after the ""(list of variables)"", you enter the expression or group of expressions the function evaluates. Use a parenthesis to group them");
    disp("***********************************************************************************************************************************************************");
    disp("---> Entering a system of ODE functions are tricky. Do the following:");
    disp("1. use only the letter t for the INDEPENDENT and use y for any number of y1,y2,y3,...yn for the DEPENDENT variables.");
    disp("2. To represent the variables y1, y2, y3... yn, use y(1),y(2),y(3),...y(n), to represent the variable t, use t");    
    disp("3. For each function (f1, f2, f3...) use anonymous functions. For example, if f1 is [dy1/dt = y1*t + y2^2 + t^3], you end up with @(t,y)(y(1).*t + y(2).^2 + t.^3)");
    disp("4. Be careful! Previously you would just write t*y if you want to multiply t and y. For anonymous functions, you must enter t.*y. The same applies for divison and power (./,.^)");
    disp("5. Remember to put all the parenthesis and multiplication signs as before!");
    disp("5. If there is more than one expression, use @(variable)([expr1,expr2,expr3,...exprn])");
    disp("***********************************************************************************************************************************************************");
    disp("For Example, for the following system of ODE:");
    disp("d(y1)/dt = t");
    disp("d(y2)/dt = t^2*y1");
    disp("d(y3)/dt = t^3*y3 + y2");
    disp("You must enter on the line prompting you for the ODE the following: @(t,y)([(t),(t.^2.*y(1)),(t.^3.*y(3) + y(2))])");
    disp("***********************************************************************************************************************************************************");

    %prompting user to enter system of ODE function to approximate the solution of
    func = input("Enter YOUR system of ODEs as explained above: ");     
    
    %prompting user for initial value t0
    t0 = input("Enter the initial value t0: ");
    
    %prompting user for the initial value y(t0)
    y0 = input("Enter the initial value for y(t0)/w0 (use [w01,w02,w03...w0n] for y1,y2,...yn): ");
    
    %prompting user for setup size
    step = input("Enter the step size h: ");
    
    %prompting user for iteration count
    iteration = round(input("Enter the amount of iteration to compute (if interval [a,b] given, enter (b-a)/h, if point t given, enter (t-t0)/h): "));
        
    %computing iterations for h
    w = y0;
    t = t0;
    h = step;
    f = func;
    n = iteration;
    for k = 1:n
        k1=f(t(k), w(k,:));
        k2=f(t(k)+h, w(k,:)+k1*h);
        w=[w ; w(k,:)+h/2*(k1+k2)];
        t=[t ; t(k)+h];
    end
    w1 = w;
    h1 = h;
    t1 = t;
    
    %computing iterations for h/2
    w = y0;
    t = t0;
    h = step/2;
    f = func;
    n = iteration*2;
    for k = 1:n
        k1=f(t(k), w(k,:));
        k2=f(t(k)+h, w(k,:)+k1*h);
        w=[w ; w(k,:)+h/2*(k1+k2)];
        t=[t ; t(k)+h];
    end
    %matching values
    for row = 1:iteration+1
        w2(row,:) = w((2*row-1),:);
    end
    h2 = h;
    
    %computing error
    error = richerr8(w1,w2,h1,h2,2);
     
    %printing out solution
    disp("The solution matrix [t(i), w(1,i),E(1,i),w(2,i),E(2,i),...w(n,i),E(n,i)] is :");
    %loop going through each iteration
    for row = 1:iteration+1
        %printing first column (t(i))
        fprintf("Iteration #%d: t(%d) = %.*f, ",row-1,row-1,precision,t1(row,1));
        
        %printing respective w(n,i) columns
        for col = 1:size(y0,2)
            fprintf("w(%d,%d) = %.*f, E(%d,%d) = %.*f, ",col,row-1,precision,w1(row,col),col,row-1,precision,error(row,col));
        end
        fprintf("\n");
    end
end
function RK2MidSystem()
    %declaring global "precision" and "resolution" variable
    global precision;
    
    %title
    disp("=========== RUNGE-KUTTA'S MIDPOINT METHOD FOR SYSTEMS ===========");    
    
    %Printing important instructions
    disp("***********************************************************************************************************************************************************");
    disp("******************************************************** READ THE FOLLOWING INSTRUCTIONS CAREFULLY ********************************************************");
    disp("***********************************************************************************************************************************************************");
    disp("---> Unlike previously where functions were entered using symbolic expression, for this specific method, you must enter them using anonymous functions:");
    disp("---> For those who don't know how anonymous functions work, there are three parts: @(list of variables)(expression)");
    disp("---> For the first part, the function starts with a ""@""");
    disp("---> For the second part, following right after the ""@"", you enter a list of variables, each one delimited by a comma. Use a parenthesis to group them all together");
    disp("---> For the third part, following right after the ""(list of variables)"", you enter the expression or group of expressions the function evaluates. Use a parenthesis to group them");
    disp("***********************************************************************************************************************************************************");
    disp("---> Entering a system of ODE functions are tricky. Do the following:");
    disp("1. use only the letter t for the INDEPENDENT and use y for any number of y1,y2,y3,...yn for the DEPENDENT variables.");
    disp("2. To represent the variables y1, y2, y3... yn, use y(1),y(2),y(3),...y(n), to represent the variable t, use t");    
    disp("3. For each function (f1, f2, f3...) use anonymous functions. For example, if f1 is [dy1/dt = y1*t + y2^2 + t^3], you end up with @(t,y)(y(1).*t + y(2).^2 + t.^3)");
    disp("4. Be careful! Previously you would just write t*y if you want to multiply t and y. For anonymous functions, you must enter t.*y. The same applies for divison and power (./,.^)");
    disp("5. Remember to put all the parenthesis and multiplication signs as before!");
    disp("5. If there is more than one expression, use @(variable)([expr1,expr2,expr3,...exprn])");
    disp("***********************************************************************************************************************************************************");
    disp("For Example, for the following system of ODE:");
    disp("d(y1)/dt = t");
    disp("d(y2)/dt = t^2*y1");
    disp("d(y3)/dt = t^3*y3 + y2");
    disp("You must enter on the line prompting you for the ODE the following: @(t,y)([(t),(t.^2.*y(1)),(t.^3.*y(3) + y(2))])");
    disp("***********************************************************************************************************************************************************");

    %prompting user to enter system of ODE function to approximate the solution of
    func = input("Enter YOUR system of ODEs as explained above: ");     
    
    %prompting user for initial value t0
    t0 = input("Enter the initial value t0: ");
    
    %prompting user for the initial value y(t0)
    y0 = input("Enter the initial value for y(t0)/w0 (use [w01,w02,w03...w0n] for y1,y2,...yn): ");
    
    %prompting user for setup size
    step = input("Enter the step size h: ");
    
    %prompting user for iteration count
    iteration = round(input("Enter the amount of iteration to compute (if interval [a,b] given, enter (b-a)/h, if point t given, enter (t-t0)/h): "));
        
    %computing iterations for h
    w = y0;
    t = t0;
    h = step;
    f = func;
    n = iteration;
    for k = 1:n
        k1=f(t(k), w(k,:));
        k2=f(t(k)+h/2, w(k,:)+k1*(h/2));
        w=[w ; w(k,:)+h*k2];
        t=[t ; t(k)+h];
    end
    w1 = w;
    h1 = h;
    t1 = t;
    
    %computing iterations for h/2
    w = y0;
    t = t0;
    h = step/2;
    f = func;
    n = iteration*2;
    for k = 1:n
        k1=f(t(k), w(k,:));
        k2=f(t(k)+h/2, w(k,:)+k1*(h/2));
        w=[w ; w(k,:)+h*k2];
        t=[t ; t(k)+h];
    end
    %matching values
    for row = 1:iteration+1
        w2(row,:) = w((2*row-1),:);
    end
    h2 = h;
    
    %computing error
    error = richerr8(w1,w2,h1,h2,2);
 
    %printing out solution
    disp("The solution matrix [t(i), w(1,i),E(1,i),w(2,i),E(2,i),...w(n,i),E(n,i)] is :");
    %loop going through each iteration
    for row = 1:iteration+1
        %printing first column (t(i))
        fprintf("Iteration #%d: t(%d) = %.*f, ",row-1,row-1,precision,t1(row,1));
        
        %printing respective w(n,i) columns
        for col = 1:size(y0,2)
            fprintf("w(%d,%d) = %.*f, E(%d,%d) = %.*f, ",col,row-1,precision,w1(row,col),col,row-1,precision,error(row,col));
        end
        fprintf("\n");
    end
end
function RK4System
    %declaring global "precision" and "resolution" variable
    global precision;
    
    %title
    disp("============== RUNGE-KUTTA'S RK4 METHOD FOR SYSTEMS =============");    
    
    %Printing important instructions
    disp("***********************************************************************************************************************************************************");
    disp("******************************************************** READ THE FOLLOWING INSTRUCTIONS CAREFULLY ********************************************************");
    disp("***********************************************************************************************************************************************************");
    disp("---> Unlike previously where functions were entered using symbolic expression, for this specific method, you must enter them using anonymous functions:");
    disp("---> For those who don't know how anonymous functions work, there are three parts: @(list of variables)(expression)");
    disp("---> For the first part, the function starts with a ""@""");
    disp("---> For the second part, following right after the ""@"", you enter a list of variables, each one delimited by a comma. Use a parenthesis to group them all together");
    disp("---> For the third part, following right after the ""(list of variables)"", you enter the expression or group of expressions the function evaluates. Use a parenthesis to group them");
    disp("***********************************************************************************************************************************************************");
    disp("---> Entering a system of ODE functions are tricky. Do the following:");
    disp("1. use only the letter t for the INDEPENDENT and use y for any number of y1,y2,y3,...yn for the DEPENDENT variables.");
    disp("2. To represent the variables y1, y2, y3... yn, use y(1),y(2),y(3),...y(n), to represent the variable t, use t");    
    disp("3. For each function (f1, f2, f3...) use anonymous functions. For example, if f1 is [dy1/dt = y1*t + y2^2 + t^3], you end up with @(t,y)(y(1).*t + y(2).^2 + t.^3)");
    disp("4. Be careful! Previously you would just write t*y if you want to multiply t and y. For anonymous functions, you must enter t.*y. The same applies for divison and power (./,.^)");
    disp("5. Remember to put all the parenthesis and multiplication signs as before!");
    disp("5. If there is more than one expression, use @(variable)([expr1,expr2,expr3,...exprn])");
    disp("***********************************************************************************************************************************************************");
    disp("For Example, for the following system of ODE:");
    disp("d(y1)/dt = t");
    disp("d(y2)/dt = t^2*y1");
    disp("d(y3)/dt = t^3*y3 + y2");
    disp("You must enter on the line prompting you for the ODE the following: @(t,y)([(t),(t.^2.*y(1)),(t.^3.*y(3) + y(2))])");
    disp("***********************************************************************************************************************************************************");

    %prompting user to enter system of ODE function to approximate the solution of
    func = input("Enter YOUR system of ODEs as explained above: ");     
    
    %prompting user for initial value t0
    t0 = input("Enter the initial value t0: ");
    
    %prompting user for the initial value y(t0)
    y0 = input("Enter the initial value for y(t0)/w0 (use [w01,w02,w03...w0n] for y1,y2,...yn): ");
    
    %prompting user for setup size
    step = input("Enter the step size h: ");
    
    %prompting user for iteration count
    iteration = round(input("Enter the amount of iteration to compute (if interval [a,b] given, enter (b-a)/h, if point t given, enter (t-t0)/h): "));
        
    %computing iterations for h
    w = y0;
    t = t0;
    h = step;
    f = func;
    n = iteration;
    for k = 1:n
        k1=f(t(k), w(k,:));
        k2=f(t(k)+h/2, w(k,:)+k1*(h/2));
        k3=f(t(k)+h/2, w(k,:)+k2*(h/2));
        k4=f(t(k)+h, w(k,:)+k3*h);
        w=[w ; w(k,:)+(h/6)*(k1+2*k2+2*k3+k4)];
        t=[t ; t(k)+h];
    end
    w1 = w;
    h1 = h;
    t1 = t;
    
    %computing iterations for h/2
    w = y0;
    t = t0;
    h = step/2;
    f = func;
    n = iteration*2;
    for k = 1:n
        k1=f(t(k), w(k,:));
        k2=f(t(k)+h/2, w(k,:)+k1*(h/2));
        k3=f(t(k)+h/2, w(k,:)+k2*(h/2));
        k4=f(t(k)+h, w(k,:)+k3*h);
        w=[w ; w(k,:)+(h/6)*(k1+2*k2+2*k3+k4)];
        t=[t ; t(k)+h];
    end
    %matching values
    for row = 1:iteration+1
        w2(row,:) = w((2*row-1),:);
    end
    h2 = h;
    
    %computing error
    error = richerr8(w1,w2,h1,h2,4);
     
    %printing out solution
    disp("The solution matrix [t(i), w(1,i),E(1,i),w(2,i),E(2,i),...w(n,i),E(n,i)] is :");
    %loop going through each iteration
    for row = 1:iteration+1
        %printing first column (t(i))
        fprintf("Iteration #%d: t(%d) = %.*f, ",row-1,row-1,precision,t1(row,1));
        
        %printing respective w(n,i) columns
        for col = 1:size(y0,2)
            fprintf("w(%d,%d) = %.*f, E(%d,%d) = %.*f, ",col,row-1,precision,w1(row,col),col,row-1,precision,error(row,col));
        end
        fprintf("\n");
    end
end
function RichardsonError8()
    %declaring global "precision" variable
    global precision;
    
    %title
    disp("======================= Richardson's Error ======================");
    disp("* The Richardson Error formula is given by E(h2) = abs([Wi(h2)-Wi(h1)]/[(h1/h2)^q - 1])");
    disp("* Which is derived from the the equality Wi(h1) + E(h1) = Wi(h2) + E(h2), where Wi(h) is the IVP solution using the step size h");
    disp("* and where E(h) ~= C*h^q, where h is the step size, q is the order of the IVP solver method and C a certain constant");
    disp("* which can be rewritten as E(h1)/E(h2) ~= (h1/h2)^q");
    disp("-------------");
    disp("Euler's method q = 1 |----| RK2 trapezoid method q = 2 |----| RK2 midpoint method q = 2 |----| RK4 method q = 4"); 
    disp("-------------");
    
    %declaring symbolic variable
    syms x;
    
    %prompting user for h1 and h2
    disp("If a ratio is given (i.e. 2, enter h1 and h2 such that h1/h2 = 2, else enter the given values below");
    h1 = input("Enter h1 (if the an interval [a,b] and iteration is given, enter (b-a)/iter), if h1 is unknown, enter h2/2: ");
    h2 = input("Enter h2 (if the an interval [a,b] and iteration is given, enter (b-a)/iter), if h2 is unknown, enter h1*2: ");
    
    %prompting user for order q
    orderQ = input("Enter the truncation error order q: ");
    
    %prompting user for I1 and I2
    w1 = input("Enter W1 (value of IVP solution using h1, if unknown, compute it using the other options in script): ");
    w2 = input("Enter w2 (value of IVP solution using h2, if unknown, compute it using the other options in script): ");
    
    %displaying error
    fprintf("The error E(h2) = %.*f\n", precision, abs((w2-w1)/((h1/h2)^orderQ-1)));
    fprintf("The constant C = %.*f\n", precision, (abs((w2-w1)/((h1/h2)^orderQ-1)))/(h2^orderQ));   
end
function error = richerr8(w1,w2,h1,h2,q)
    error = abs((w2-w1)/(1-((h2/h1)^q)));
end



