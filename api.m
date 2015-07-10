function output = api(path, varargin)
  % Parse input.
  p = inputParser;
  try # For Octave versions pre 4.0.0
    p = p.addRequired('path');
    p = p.addOptional('params',struct());
    p = p.addOptional('version','v1');
    p = p.addOptional('https','GET');
    p = p.parse(path,varargin{:});
  catch 
    p.addRequired('path');
    p.addOptional('params',struct());
    p.addOptional('version','v1');
    p.addOptional('https','GET');
    p.parse(path,varargin{:});
  end_try_catch
  path = p.Results.path;
  version = p.Results.version;
  http = p.Results.https;
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
    if ispc()  # Work-around until https for Windows is fixed
      output = pc_urlread(url);
    else
      output = urlread(url);
    endif
  elseif length(regexp(path, '.xml'))
    output = xmlread(url);
  end
end

function s=pc_urlread(url)
#-*- texinfo -*-
#@deftypefn {Function File} {@var{s}=pc_urlread(@var{url})
#Use curl command line tool to download a remote file specified by its 
#@var{url} and return its content in string @var{s}.
#@end deftypefn
  command=['curl --silent ','"',url,'"'];
  [output,s]=system(command);
endfunction
