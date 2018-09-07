From: guro@fb.com (Roman Gushchin)
Date: Fri, 7 Sep 2018 09:56:44 -0700
Subject: [PATCH 1/2] Fix cg_read_strcmp()
In-Reply-To: <20180907164924.13789-2-jgkamat@fb.com>
References: <20180905010827.27743-1-jgkamat@fb.com>
 <20180907164924.13789-1-jgkamat@fb.com>
 <20180907164924.13789-2-jgkamat@fb.com>
Message-ID: <20180907165642.GA572@tower.DHCP.thefacebook.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180907165644.w-oZ6YR2uM7Qu3yR-YCpV_4AaE04SA7ROp2fzDaLeXs@z>

On Fri, Sep 07, 2018@09:49:23AM -0700, jgkamat@fb.com wrote:
> From: Jay Kamat <jgkamat at fb.com>
> 
> Fix a couple issues with cg_read_strcmp(), to improve correctness of
> cgroup tests
> - Fix cg_read_strcmp() always returning 0 for empty "needle" strings
> - Fix a memory leak in cg_read_strcmp()
> 
> Fixes: 84092dbcf901 ("selftests: cgroup: add memory controller self-tests")

Hi Jay!

Thank you for working on this!

Acked-by: Roman Gushchin <guro at fb.com>
