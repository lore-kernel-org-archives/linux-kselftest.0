From: guro at fb.com (Roman Gushchin)
Date: Fri, 7 Sep 2018 09:57:23 -0700
Subject: [PATCH 2/2] Add tests for memory.oom.group
In-Reply-To: <20180907164924.13789-3-jgkamat@fb.com>
References: <20180905010827.27743-1-jgkamat@fb.com>
 <20180907164924.13789-1-jgkamat@fb.com>
 <20180907164924.13789-3-jgkamat@fb.com>
Message-ID: <20180907165723.GB572@tower.DHCP.thefacebook.com>

On Fri, Sep 07, 2018 at 09:49:24AM -0700, jgkamat at fb.com wrote:
> From: Jay Kamat <jgkamat at fb.com>
> 
> Add tests for memory.oom.group for the following cases:
> - Killing all processes in a leaf cgroup, but leaving the
>   parent untouched
> - Killing all processes in a parent and leaf cgroup
> - Keeping processes marked by OOM_SCORE_ADJ_MIN alive when considered
>   for being killed by the group oom killer.
> 
> Signed-off-by: Jay Kamat <jgkamat at fb.com>

Acked-by: Roman Gushchin <guro at fb.com>
