#!/usr/bin/env bash
########################################################################################################################
# NOTE:
#
# The demos settings file contains an array of plugins that need to be enabled to make the Next.js+WordPress Post Preview
#  functionality work, which are outlined in https://github.com/vercel/next.js/tree/canary/examples/cms-wordpress.
#
########################################################################################################################
printf "    ✔ Enabing plugins (see https://github.com/vercel/next.js/tree/canary/examples/cms-wordpress).\n"

# 1. Get the list of plugins and enable them.
for plugin in $(cat $ENV_SETTINGS | jq -r '.project.plugins []'); do
	printf "        * %s\n" "${plugin}"
	wp plugin activate "${plugin}"
done

