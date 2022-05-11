module.exports = {
  images: {
    domains: [
      'api.main-bvxea6i-z6d5mdnrun4va.ca-1.platformsh.site',
      'secure.gravatar.com',
    ],
  },
  generateBuildId: async () => {
	  return process.env.PLATFORM_TREE_ID
  }
}
