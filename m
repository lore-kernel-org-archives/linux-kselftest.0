From: jpoimboe at redhat.com (Josh Poimboeuf)
Date: Tue, 10 Apr 2018 15:04:24 -0500
Subject: [PATCH v2] Add livepatch kselftests
In-Reply-To: <1523373354-10801-1-git-send-email-joe.lawrence@redhat.com>
References: <1523373354-10801-1-git-send-email-joe.lawrence@redhat.com>
Message-ID: <20180410200424.xlypsabmvjxrbe3q@treble>

On Tue, Apr 10, 2018 at 11:15:53AM -0400, Joe Lawrence wrote:
> Questions for v3:
> 
>   - Should we split off the atomic replace and shadow variable update
>     tests so that the this patchset could be merged before the ones
>     listed above?

Don't split it up on my account.  We can just merge this one shortly
after.

-- 
Josh
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
