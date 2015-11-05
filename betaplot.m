function betaplot(a, h)
    if (nargin < 3)
        h = gca;
        axis(h,'off');
    end
    if (length(a) ~= 2)
        error('alpha vector must have length 2');
    end
    
    N = 20;
    x1 = linspace(0,1,N);
    x2 = 1 - x1;

    X = [x1(:) x2(:)];
    Y = betapdf(X, a);


    % clear subplot and draw mesh
    axes(h);
    axis('off');
    hold('off');
    plot(x1,Y, 'LineWidth', 2);
    ylim([0,5]);
    caxis([0,10]);
    
    ylabel('PDF')
    
    % redraw background
    ax = gca;
    ax.XGrid = 'off';
    set(ax,'XTickLabel',[]);
    
    % draw labels 
    hold('on');
    scatter([0, 1], [0, 0], 40, 'k', 'filled');
    text(0.01, -0.5, 'x0');
    text(0.98, -0.5, 'x1');
    
    axis('on');
     
end