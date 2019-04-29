From: oleg at redhat.com (Oleg Nesterov)
Date: Mon, 29 Apr 2019 16:20:30 +0200
Subject: [PATCH v1 1/2] Add polling support to pidfd
In-Reply-To: <20190429140245.GB233442@google.com>
References: <20190425190010.46489-1-joel@joelfernandes.org>
 <20190425222359.sqhboc4x4daznr6r@brauner.io>
 <20190428162405.GA6757@redhat.com>
 <20190429140245.GB233442@google.com>
Message-ID: <20190429142030.GA17715@redhat.com>

On 04/29, Joel Fernandes wrote:
>
> However, in your code above, it is avoided because we get:
>
> Task A (poller)		Task B (exiting task being polled)
> ------------            ----------------
> poll() called
> add_wait_queue()
> 			exit_state is set to non-zero
> read exit_state
> remove_wait_queue()
> 			wake_up_all()

just to clarify... No, sys_poll() path doesn't do remove_wait_queue() until
it returns to user mode, and that is why we can't race with set-exit_code +
wake_up().

pidfd_poll() can race with the exiting task, miss exit_code != 0, and return
zero. However, do_poll() won't block after that and pidfd_poll() will be called
again.

Oleg.
