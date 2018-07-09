From: jhs at mojatatu.com (Jamal Hadi Salim)
Date: Mon, 9 Jul 2018 14:33:13 -0400
Subject: [PATCH net-next repost] tc-testing: flush gact actions on test
 teardown
In-Reply-To: <1531160689-17914-1-git-send-email-vladbu@mellanox.com>
References: <1531160689-17914-1-git-send-email-vladbu@mellanox.com>
Message-ID: <e7be829c-35d0-24ba-ed09-70f93952b382@mojatatu.com>

On 09/07/18 02:24 PM, Vlad Buslov wrote:
> Test 6fb4 creates one mirred and one pipe action, but only flushes mirred
> on teardown. Leaking pipe action causes failures in other tests.
> 
> Add additional teardown command to also flush gact actions.
> 
> Signed-off-by: Vlad Buslov <vladbu at mellanox.com>

Acked-by: Jamal Hadi Salim <jhs at mojatatu.com>

cheers,
jamal
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
