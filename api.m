function output = api(path, varargin)
  % Parse input.
  p = inputParser;
  p = p.addRequired('path');
  p = p.addOptional('params',struct());
  p = p.addOptional('version','v1');
  p = p.addOptional('https','GET');
  p = p.parse(path,varargin{:});
  path = p.Results.path;
  version = p.Results.version;
  http = p.Results.http;
  params = p.Results.params;

  params.('request_source') = 'matlab';
  params.('request_version') = '1.0';
  
  url = strcat('https://www.quandl.com/api/', version, '/', path, '?');
  param_keys = fieldnames(params);
  for k = 1:numel(param_keys)
    param_values{k,1} = params.(param_keys{k,1});
  end

  for i = 1:length(param_keys)
    url = strcat(url, '&', param_keys{i}, '=', param_values{i});
  end
  if length(regexp(path, '.csv'))
    output = urlread(url);
  elseif length(regexp(path, '.xml'))
    output = xmlread(url);
  end
end