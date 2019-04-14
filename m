From: torvalds@linux-foundation.org (Linus Torvalds)
Date: Sun, 14 Apr 2019 11:19:10 -0700
Subject: [PATCH RFC 1/2] Add polling support to pidfd
In-Reply-To: <CALCETrV7Hw50Bh=qQX86v_6euiGqX7eNboi50_7JmfQsyVR3_A@mail.gmail.com>
References: <20190411175043.31207-1-joel@joelfernandes.org>
 <CALCETrV7Hw50Bh=qQX86v_6euiGqX7eNboi50_7JmfQsyVR3_A@mail.gmail.com>
Message-ID:
 <CAHk-=wiL0GZn+kOyxzaS0igMRs95sipcc9r0ZgU2rRf=CR+fpw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190414181910.km6bPw4eotr4d_qHfIo9_1h8NSlZqneFw3BlGAHkhQg@z>

On Fri, Apr 12, 2019@2:33 PM Andy Lutomirski <luto@kernel.org> wrote:
>
> Are you sure?  I admit I'm not all that familiar with the innards of
> poll() on Linux, but I thought that the waitqueue only had to survive
> long enough to kick the polling thread and did *not* have to survive
> until poll() actually returned.

That is *not* true by default.

You can do that, but you need to make sure that your wakeup function
is one that removed itself from the wait queues. You can do that with
DEFINE_WAIT(name), which uses autoremove_wake_function(), or by using
your own auto-removing wakeup function together with
DEFINE_WAIT_FUNC() or init_waitqueue_func_entry().

But the default wake function does not remove on wakeup, and you'll
have to be around until poll() itself tears down all the tables.

In particular, the normal "poll_wait()" will use __pollwait, which does:

        init_waitqueue_func_entry(&entry->wait, pollwake);

and pollwake() (which is thus what gets called at wake time) will not
remove anything from the wait queue.

So no, by default your wait queue has to stay around for the duration
of poll() (ie the duration of the file descriptor, since poll() gets a
reference to it).

You *can* play games with pollwait functions (and with wait functions
in general), but by default you should consider the wait function to
stay around.

                 Linus
