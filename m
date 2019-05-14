From: christian@brauner.io (Christian Brauner)
Date: Tue, 14 May 2019 17:17:08 +0200
Subject: [PATCH v2 2/2] Add selftests for pidfd polling
In-Reply-To: <20190430162154.61314-2-joel@joelfernandes.org>
References: <20190430162154.61314-1-joel@joelfernandes.org>
 <20190430162154.61314-2-joel@joelfernandes.org>
Message-ID: <20190514151706.fu7ehba6hsxnvfaf@brauner.io>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190514151708.EdL8aDnZJftPWvJXAHsVH4y6kGv6O7SYHZb2iOF0SLE@z>

On Tue, Apr 30, 2019@12:21:54PM -0400, Joel Fernandes (Google) wrote:
> Other than verifying pidfd based polling, the tests make sure that
> wait semantics are preserved with the pidfd poll. Notably the 2 cases:
> 1. If a thread group leader exits while threads still there, then no
>    pidfd poll notifcation should happen.
> 2. If a non-thread group leader does an execve, then the thread group
>    leader is signaled to exit and is replaced with the execing thread
>    as the new leader, however the parent is not notified in this case.
> 
> Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>

Applied to 

https://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git/log/?h=for-next

and targeted for the 5.3 merge window.

Thank you all!
Christian
