From: tycho@tycho.ws (Tycho Andersen)
Date: Fri, 12 Apr 2019 09:25:43 -0600
Subject: [PATCH] selftests/seccomp: Handle namespace failures gracefully
In-Reply-To: <20190411235631.GA31624@beast>
References: <20190411235631.GA31624@beast>
Message-ID: <20190412152543.GB25793@cisco>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190412152543.SYnYoMP4nK-czfwNFp76O5gm2QVY3X-xpEveqi9uUEg@z>

On Thu, Apr 11, 2019@04:56:31PM -0700, Kees Cook wrote:
> When running without USERNS or PIDNS the seccomp test would hang since
> it was waiting forever for the child to trigger the user notification
> since it seems the glibc() abort handler makes a call to getpid(),
> which would trap again. This changes the getpid filter to getppid, and
> makes sure ASSERTs execute to stop from spawning the listener.
> 
> Reported-by: Shuah Khan <shuah at kernel.org>
> Fixes: 6a21cc50f0c7 ("seccomp: add a return code to trap to userspace")
> Signed-off-by: Kees Cook <keescook at chromium.org>

Sorry for the delay, thanks for looking at this!

Reviewed-by: Tycho Andersen <tycho at tycho.ws>
