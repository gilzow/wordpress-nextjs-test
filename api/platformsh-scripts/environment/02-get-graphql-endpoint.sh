#!/usr/bin/env bash
########################################################################################################################
# NOTE:
#
# This script retrieves the graphql endpoint on the WordPress instance
#
########################################################################################################################

# retrieve our api (WordPress) URL. Includes the trailing slash
apiBase=$(jq -r '.environment.api.url.base' < "${ENV_SETTINGS}");

# The default endpoint for graphql of the wpgraphql plugin (at the time of writing, current version is 1.8.1) is
# site.com/graphql. However, this is configurable by the end user. Upon activation, the wpgraphql plugin sets an option
# with the key of "graphql_general_settings" but sets it as empty. Once the user visits the settings page, and saves the
# settings, they are saved as a serialized array.  Therefore, if we receive an empty string from the retrieval of the
# settings, we'll set it to what *SHOULD* be the default for the plugin; otherwise, retrieve the value the user has set
endPoint=$(wp option get graphql_general_settings --format=json | jq -r 'if . == "" then "graphql" else .graphql_endpoint end')

graphqlURL="${apiBase}${endPoint}"

UPDATED_SETTINGS=$(jq --arg GRAPHQLURL "${wpGraphqlUserID}" '.environment.api.url.graphql = $GRAPHQLURL' "${ENV_SETTINGS}")
echo "${UPDATED_SETTINGS}" > "${ENV_SETTINGS}"



