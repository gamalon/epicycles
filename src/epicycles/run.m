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

global CHIMPLE_TEST_DEMOS_RUNNING
if isempty(CHIMPLE_TEST_DEMOS_RUNNING)
    CHIMPLE_TEST_DEMOS_RUNNING = false;
end

tic

burnin = 100;
samples = 300;
spacing = 1;
data = [[0,1]', [1,0]', [-1,0]', [0,-1]', ...
    [1/sqrt(2), 1/sqrt(2)]', [-1/sqrt(2), 1/sqrt(2)]', ...
    [1/sqrt(2), -1/sqrt(2)]', [-1/sqrt(2), -1/sqrt(2)]']
[ results likelihoods ] = chimplify(@epicycles,burnin,samples,spacing, {data});

toc

%mat = cell2mat(results);
%both = reshape(mat,2,numel(mat)/2);
%xs = mat; %both(1,:);
xs = cell2mat(results); %reshape(cell2mat(results),1,samples);

if ~CHIMPLE_TEST_DEMOS_RUNNING
    %hist(xs);
    %hist(likelihoods);
end
