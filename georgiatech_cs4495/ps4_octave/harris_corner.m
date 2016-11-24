function corners = harris_corner(R, varargin)
    %% threshold the R values and then do non-maximal suppression
    p = inputParser();
    p.addParamValue('Threshold', max(R(:)) * 0.8);
    p.parse(varargin{:});
    
    threshold = p.Results.Threshold;
    
    R(find(R < threshold)) = 0;
    corners = non_maximal_suppression(R);
end

