function dirplot3(a, axLeft, axRight)
    if (nargin < 3)
        h = gca;
        subLeft = subplot(1,2,1,h);
        axLeft = axes('Parent',gcf,'Position',get(subLeft,'Position'));
        subRight = subplot(1,2,2,subLeft);
        axRight = axes('Parent',gcf,'Position',get(subRight,'Position'));
        h = subplot(1,1,1,subRight);
        axis(h,'off');
    end
    if (length(a) ~= 3)
        error('alpha vector must have length 3');
    end
    
    N = 20;
    t = linspace(0,1,N);
    x1 = zeros(N,N);
    x2 = zeros(N,N);

    for i = 1:N
        x1(i,:) = linspace(0,t(i),N);
        x2(i,:) = t(i)-x1(i,:);
    end
    x3 = 1 - (x1 + x2);

    X = [x1(:) x2(:) x3(:)];

    zz = reshape(dirpdf(X, a), [N,N]);


    % clear subplot and draw mesh
    axes(axLeft);
    axis('off');
    hold('off');
    mesh((x1+x2/2),x2,zz)
    zlim([0, 20])
    caxis([0,20]);
    
    % draw triangle
    hold('on');
    line([0,1], [0,0], 'Color', 'k');
    line([0,0.5], [0,1],'Color', 'k');
    line([0.5,1], [1,0],'Color', 'k');
    zlabel('PDF')
    
    % redraw background
    ax = gca;
    ax.XGrid = 'off';
    ax.YGrid = 'off';
    ax.Color = 'none';
    ax.XColor = 'none';
    ax.YColor = 'none';
        
    % draw labels 
    scatter3([0.5, 1, 0], [1, 0, 0], [0,0,0], 40, 'k', 'filled');
    text(0.9, -0.1, 'x2');
    text(0.4, 0.95, 'x1');
    text(-0.1, -0.1, 'x0');
    
    cameratoolbar('SetMode','orbit');
    axis('on');
    
    % clear subplot and draw contour plot
    axes(axRight);
    axis('off');
    hold('off');
    if (all(a==1.0))
        fill([0.5, 1, 0], [1, 0, 0], [0.1253, 0.3242, 0.8303]);
    else
        contourf((x1+x2/2),x2,zz);
    end
    colorbar();
    caxis([0,20]);
    hold('on');

    % redraw background
    ax = gca;
    ax.XGrid = 'off';
    ax.YGrid = 'off';
    ax.Color = 'none';
    ax.XColor = 'none';
    ax.YColor = 'none';
    
    % draw labels
    scatter3([0.5,1,0], [1,0,0], [0,0,0], 40, 'k', 'filled');
    text(1, -0.05, 'x2');
    text(0.4, 0.95, 'x1');
    text(-0.05, -0.05, 'x0');
    
    axis('on');
    
end