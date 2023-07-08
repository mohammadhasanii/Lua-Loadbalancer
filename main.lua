-- Load balancer configuration
local servers = { "10.0.0.1:8000", "10.0.0.2:8000", "10.0.0.3:8000" }--Servers List
local current_server_index = 1

-- Load balancer function
function balancer()
  -- Select the next server
  current_server_index = current_server_index + 1
  if current_server_index > #servers then current_server_index = 1 end
  
  -- Return the selected server
  return servers[current_server_index]
end

-- Sample usage
print(balancer()) -- Output: 10.0.0.1:8000 AND NEXT -- Output: 10.0.0.2:8000 AND NEXT Output: 10.0.0.3:8000 AND NEXT Output: 10.0.0.1:8000
