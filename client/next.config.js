module.exports = {
  images: {
    domains: [
	  // replace this with process.env.NEXT_IMAGE_DOMAIN
	  process.env.IMAGE_DOMAIN,
      //'api.main-bvxea6i-z6d5mdnrun4va.ca-1.platformsh.site',
      'secure.gravatar.com',
    ],
  },
  generateBuildId: async () => {
	  return process.env.PLATFORM_TREE_ID
  }
}
