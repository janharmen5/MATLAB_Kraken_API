function [ result ] = kraken_api_ohlc( varargin )
%KRAKEN_API_OHLC Get OHLC data
%   
% Input:
% 
% pair = asset pair to get OHLC data for
% interval = time frame interval in minutes (optional):
% 	1 (default), 5, 15, 30, 60, 240, 1440, 10080, 21600
% since = return committed OHLC data since given id (optional.  exclusive)
% 
% 
% Result: array of pair name and OHLC data
% 
% <pair_name> = pair name
%     array of array entries(<time>, <open>, <high>, <low>, <close>, <vwap>, <volume>, <count>)
% last = id to be used as since when polling for new, committed OHLC data

% MATLAB Kraken API
% Copyright (C) 2015  X. Raemy
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.
i_p = inputParser;
i_p.FunctionName = mfilename;

i_p.addRequired('pair',@ischar);
i_p.addOptional('interval','1',@(x) any(validatestring(x,{'1', '5', '15', '30', '60', '240', '1440', '10080', '21600'} )));
i_p.addOptional('since','',@ischar);

i_p.parse(varargin{:});

arg = {'pair',i_p.Results.pair};
if ~isempty(i_p.Results.interval)
    arg{end+1} = 'interval';
    arg{end+1} = i_p.Results.interval;
end
if ~isempty(i_p.Results.since)
    arg{end+1} = 'since';
    arg{end+1} = i_p.Results.since;
end

result = kraken_public_query('OHLC',arg);


end

