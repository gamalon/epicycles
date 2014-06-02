%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Copyright 2012 Gamelan Labs, Inc.
%
%   Licensed under the Apache License, Version 2.0 (the "License");
%   you may not use this file except in compliance with the License.
%   You may obtain a copy of the License at
%
%       http://www.apache.org/licenses/LICENSE-2.0
%
%   Unless required by applicable law or agreed to in writing, software
%   distributed under the License is distributed on an "AS IS" BASIS,
%   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%   See the License for the specific language governing permissions and
%   limitations under the License.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [ results ] = epicycles( data )
%EPICYCLES Summary of this function goes here
%   Detailed explanation goes here
    r = chimpRandn('r',1,1);
    numpts = 8;
    for i = 1:numpts
        theta = chimpRand(['theta', num2str(i)]) * 2 * pi;
        pts(i,1) = r * cos(theta);
        pts(i,2) = r * sin(theta);
    end
    pts;
    data;
    xdata = reshape(data, 1, numel(data));
    xpts = reshape(pts', 1, numel(pts));
    pts;
    data;
    %(pts - data) * (pts - data)';
    addChimpCost((xpts - xdata) * (xpts - xdata)');
    figure(1);
    scatter(pts(:,1),pts(:,2), 'o');
    axis([-1,1,-1,1]);
    %keyboard;
    results = r;
end

