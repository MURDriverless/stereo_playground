# Timestamp in case EMC needs it
Header header

# acceleration_threshold goes from [-1, 1], where 
# -1 denotes max. braking and 1 denotes max. acceleration. 
# Anything > 0 is acceleration, while <= 0 should be treated as braking.
float32 acceleration_threshold

# steering is defined in terms of raw radians value, not threshold.
float32 steering