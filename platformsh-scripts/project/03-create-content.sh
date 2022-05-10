#!/usr/bin/env bash
########################################################################################################################
# NOTE:
# Generates dummy content sourced from NASA.
########################################################################################################################
demoPostsLink="https://github.com/vercel/next.js/tree/canary/examples/cms-wordpress#step-2-populate-content"
# 1. Create some dummy content.
if [ -z ${CREATE_DEMO_CONTENT+x} ]; then
    printf "    ✔ Skipping content generation.\n"
else
    if [[ "$CREATE_DEMO_CONTENT" == true ]]; then
        printf "    ✔ Generating demo posts (see %s).\n" "${demoPostsLink}"
        NUM_POSTS=$(cat "$ENV_SETTINGS" | jq -r '.project.posts.demo.num_posts')
        POST_DATA=$(cat "$ENV_SETTINGS" | jq -r '.project.posts.demo.data')
        printf "        * Post data:       %s\n" "${POST_DATA}"
        printf "        * Number of posts: %d\n" "${NUM_POSTS}"
        printf "        ! Get some coffee, this will take a moment...\n"
        php ${WP_SETUP}/project/03-create-posts.php "${POST_DATA}" "${NUM_POSTS}"
    else
        printf "    ✔ Skipping content generation.\n"
    fi
fi
