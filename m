From: tj@kernel.org (Tejun Heo)
Date: Tue, 15 May 2018 09:40:34 -0700
Subject: [PATCH] selftests: cgroup/memcontrol: add basic test for swap
 controls
In-Reply-To: <1526400353-12991-1-git-send-email-rppt@linux.vnet.ibm.com>
References: <1526400353-12991-1-git-send-email-rppt@linux.vnet.ibm.com>
Message-ID: <20180515164034.GF2368884@devbig577.frc2.facebook.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180515164034.jRsGJlmeMY0Tw54eaEljBQpePA8Oa7-Ke2nmztWRixE@z>

On Tue, May 15, 2018@07:05:53PM +0300, Mike Rapoport wrote:
> The new test verifies that memory.swap.max and memory.swap.current behave
> as expected for simple allocation scenarios
> 
> Signed-off-by: Mike Rapoport <rppt at linux.vnet.ibm.com>

Looks good to me.

Acked-by: Tejun Heo <tj at kernel.org>

Thanks.

-- 
tejun
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
