From: davem at davemloft.net (David Miller)
Date: Wed, 23 May 2018 15:24:40 -0400 (EDT)
Subject: [PATCH] selftests: uevent filtering
In-Reply-To: <20180522193421.7017-1-christian@brauner.io>
References: <20180522193421.7017-1-christian@brauner.io>
Message-ID: <20180523.152440.915264101771444714.davem@davemloft.net>

From: Christian Brauner <christianvanbrauner at gmail.com>
Date: Tue, 22 May 2018 21:34:21 +0200

> Recent discussions around uevent filtering (cf. net-next commit [1], [2],
> and [3] and discussions in [4], [5], and [6]) have shown that the semantics
> around uevent filtering where not well understood.
> Now that we have settled - at least for the moment - how uevent filtering
> should look like let's add some selftests to ensure we don't regress
> anything in the future.
> Note, the semantics of uevent filtering are described in detail in my
> commit message to [2] so I won't repeat them here.
> 
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=90d52d4fd82007005125d9a8d2d560a1ca059b9d
> [2]: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=a3498436b3a0f8ec289e6847e1de40b4123e1639
> [3]: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=26045a7b14bc7a5455e411d820110f66557d6589
> [4]: https://lkml.org/lkml/2018/4/4/739
> [5]: https://lkml.org/lkml/2018/4/26/767
> [6]: https://lkml.org/lkml/2018/4/26/738
> 
> Signed-off-by: Christian Brauner <christian at brauner.io>

Applied to net-next, thanks.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
