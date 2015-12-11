function [ result ] = kraken_api_assetpairs( varargin )
%KRAKEN_API_ASSETPAIRS Get tradable asset pairs
% Input:
% 
% info = info to retrieve (optional):
%     info = all info (default)
%     leverage = leverage info
%     fees = fees schedule
%     margin = margin info
% pair = comma delimited list of asset pairs to get info on (optional.  default = all)
%
%
% Result: array of pair names and their info
% 
% <pair_name> = pair name
%     altname = alternate pair name
%     aclass_base = asset class of base component
%     base = asset id of base component
%     aclass_quote = asset class of quote component
%     quote = asset id of quote component
%     lot = volume lot size
%     pair_decimals = scaling decimal places for pair
%     lot_decimals = scaling decimal places for volume
%     lot_multiplier = amount to multiply lot volume by to get currency volume
%     leverage_buy = array of leverage amounts available when buying
%     leverage_sell = array of leverage amounts available when selling
%     fees = fee schedule array in [volume, percent fee] tuples
%     fees_maker = maker fee schedule array in [volume, percent fee] tuples (if on maker/taker)
%     fee_volume_currency = volume discount currency
%     margin_call = margin call level
%     margin_stop = stop-out/liquidation margin level

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

i_p.addOptional('info','info',@(x) any(validatestring(x,{'info','leverage','fees','margin'} )));
i_p.addOptional('pair','',@ischar);

i_p.parse(varargin{:});

arg = {'info',i_p.Results.info};
if ~isempty(i_p.Results.pair)
    arg{end+1} = 'pair';
    arg{end+1} = i_p.Results.pair;
end

result = kraken_public_query('Assets',arg);

end

