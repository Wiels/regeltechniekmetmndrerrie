function state = desired_state(theta, params)
    x = (params.Mc*params.Dt+params.Msw*params.Dc)*tan(theta)/params.Mc;
    state = [x, theta,0,0];
end

