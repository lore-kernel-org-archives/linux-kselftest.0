From: tj@kernel.org (Tejun Heo)
Date: Fri, 11 May 2018 07:32:28 -0700
Subject: [PATCH v2] selftests/cgroup: memory controller self-tests
In-Reply-To: <a652ce44-07f9-d229-70d4-4376bfbafa40@kernel.org>
References: <20180510163701.28936-1-guro@fb.com>
 <20180510183224.GP2368884@devbig577.frc2.facebook.com>
 <a652ce44-07f9-d229-70d4-4376bfbafa40@kernel.org>
Message-ID: <20180511143228.GU2368884@devbig577.frc2.facebook.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180511143228.BypE1YriFBTB9YqnsfoYcZap6UGQFbg4l7dbDwoSq0k@z>

Hello, Shuah.

On Thu, May 10, 2018@01:29:07PM -0600, Shuah Khan wrote:
> Don't pull them yet. If Roman can redo the patches on linux-kselftest next,
> he can pick up the SKIP changes.

So, what we can do is either fix that up during / after the merge
window or creating a separate branch which pulls from both cgroup and
kselftest.  Please let me know which way you wanna go and if the
latter which branch I should pull (it gotta be a stable branch).

Thanks.

-- 
tejun
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
