From: guro at fb.com (Roman Gushchin)
Date: Tue, 15 May 2018 17:57:08 +0100
Subject: [PATCH] selftests: cgroup/memcontrol: add basic test for swap
 controls
In-Reply-To: <1526400353-12991-1-git-send-email-rppt@linux.vnet.ibm.com>
References: <1526400353-12991-1-git-send-email-rppt@linux.vnet.ibm.com>
Message-ID: <20180515165702.GA26711@castle.DHCP.thefacebook.com>

On Tue, May 15, 2018 at 07:05:53PM +0300, Mike Rapoport wrote:
> The new test verifies that memory.swap.max and memory.swap.current behave
> as expected for simple allocation scenarios
> 
> Signed-off-by: Mike Rapoport <rppt at linux.vnet.ibm.com>
> ---
> 
> The patch is against kselftest/next branch

Hi Mike!

Looks good to me, thank you for working on it!

Acked-by: Roman Gushchin <guro at fb.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
