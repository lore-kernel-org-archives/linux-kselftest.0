From: tycho@tycho.ws (Tycho Andersen)
Date: Wed, 16 Jan 2019 17:46:50 -0700
Subject: [PATCH] selftests/seccomp: Abort without user notification support
In-Reply-To: <20190117003525.GA37918@beast>
References: <20190117003525.GA37918@beast>
Message-ID: <20190117004650.GB17449@cisco>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190117004650.IVgRnQWBjQK2APJIq_Bz64O9lXX7vGcEbPc9kwaDOHE@z>

On Wed, Jan 16, 2019@04:35:25PM -0800, Kees Cook wrote:
> In the face of missing user notification support, the self test needs
> to stop executing a test (ASSERT_*) instead of just reporting and
> continuing (EXPECT_*). This adjusts the user notification tests to do
> that where needed.
> 
> Reported-by: Shuah Khan <shuah at kernel.org>
> Fixes: 6a21cc50f0c7 ("seccomp: add a return code to trap to userspace")

The gift that keeps on giving :)

Reviewed-by: Tycho Andersen <tycho at tycho.ws>

Thanks,

Tycho
