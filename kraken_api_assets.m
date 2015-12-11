function [ result ] = kraken_api_assets( varargin )
%KRAKEN_API_ASSETS Get asset info
% Input:
%
% info = info to retrieve (optional):
%     info = all info (default)
% aclass = asset class (optional):
%     currency (default)
% asset = comma delimited list of assets to get info on (optional.  default = all for given asset class)
%
%
% Result: array of asset names and their info
% 
% <asset_name> = asset name
%     altname = alternate name
%     aclass = asset class
%     decimals = scaling decimal places for record keeping
%     display_decimals = scaling decimal places for output display

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

i_p.addOptional('info','info',@ischar);
i_p.addOptional('aclass','currency',@ischar);
i_p.addOptional('asset','',@ischar); 

i_p.parse(varargin{:});

arg = {'info',i_p.Results.info,...
       'aclass',i_p.Results.aclass};
if ~isempty(i_p.Results.asset)
    arg{end+1} = 'asset';
    arg{end+1} = i_p.Results.asset;
end

result = kraken_public_query('Assets',arg);

end

