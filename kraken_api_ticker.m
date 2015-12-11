function [ result ] = kraken_api_ticker( varargin )
%KRAKEN_API_TICKER Get ticker information
%   
% Input:
% 
% pair = comma delimited list of asset pairs to get info on
% 
% 
% Result: array of pair names and their ticker info
% 
% <pair_name> = pair name
%     a = ask array(<price>, <whole lot volume>, <lot volume>),
%     b = bid array(<price>, <whole lot volume>, <lot volume>),
%     c = last trade closed array(<price>, <lot volume>),
%     v = volume array(<today>, <last 24 hours>),
%     p = volume weighted average price array(<today>, <last 24 hours>),
%     t = number of trades array(<today>, <last 24 hours>),
%     l = low array(<today>, <last 24 hours>),
%     h = high array(<today>, <last 24 hours>),
%     o = today's opening price

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

i_p.parse(varargin{:});

arg = {'pair',i_p.Results.pair};

result = kraken_public_query('Ticker',arg);

end

