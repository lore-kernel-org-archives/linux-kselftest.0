From: tj at kernel.org (Tejun Heo)
Date: Thu, 10 May 2018 11:32:24 -0700
Subject: [PATCH v2] selftests/cgroup: memory controller self-tests
In-Reply-To: <20180510163701.28936-1-guro@fb.com>
References: <20180510163701.28936-1-guro@fb.com>
Message-ID: <20180510183224.GP2368884@devbig577.frc2.facebook.com>

On Thu, May 10, 2018 at 05:37:01PM +0100, Roman Gushchin wrote:
> Cgroups are used for controlling the physical resource distribution
> (memory, CPU, io, etc) and often are used as basic building blocks
> for large distributed computing systems. Even small differences
> in the actual behavior may lead to significant incidents.
> 
> The codebase is under the active development, which will unlikely
> stop at any time soon. Also it's scattered over different
> kernel subsystems, which makes regressions more probable.
> 
> Given that, the lack of any tests is crying.
> 
> This patch implements some basic tests for the memory controller,
> as well as a minimal required framework.
> It doesn't pretend for a very good coverage, but pretends
> to be a starting point.
> 
> Hopefully, any following significant changes will
> include corresponding tests.
> 
> Tests for CPU and io controllers, as well as cgroup core
> are next in the todo list.

This is great.  Applying to cgroup/for-4.18.

Thanks a lot.

-- 
tejun
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
