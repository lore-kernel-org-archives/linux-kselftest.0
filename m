From: cyphar at cyphar.com (Aleksa Sarai)
Date: Fri, 2 Nov 2018 15:37:33 +1100
Subject: [PATCH v3 1/2] kretprobe: produce sane stack traces
In-Reply-To: <20181102120441.d00af1b57e6a739d0e7c7a91@kernel.org>
References: <20181101083551.3805-1-cyphar@cyphar.com>
 <20181101083551.3805-2-cyphar@cyphar.com>
 <20181102002039.8f22c10fa47cae75fa709165@kernel.org>
 <20181101211343.yooxwqfnoloprb5h@yavin>
 <20181102120441.d00af1b57e6a739d0e7c7a91@kernel.org>
Message-ID: <20181102043733.qqimup5vuevjua5w@yavin>

On 2018-11-02, Masami Hiramatsu <mhiramat at kernel.org> wrote:
> On Fri, 2 Nov 2018 08:13:43 +1100
> Aleksa Sarai <cyphar at cyphar.com> wrote:
> 
> > On 2018-11-02, Masami Hiramatsu <mhiramat at kernel.org> wrote:
> > > Please split the test case as an independent patch.
> > 
> > Will do. Should the Documentation/ change also be a separate patch?
> 
> I think the Documentation change can be coupled with code change
> if the change is small. But selftests is different, that can be
> backported soon for testing the stable kernels.
> 
> 
> > > > new file mode 100644
> > > > index 000000000000..03146c6a1a3c
> > > > --- /dev/null
> > > > +++ b/tools/testing/selftests/ftrace/test.d/kprobe/kretprobe_stacktrace.tc
> > > > @@ -0,0 +1,25 @@
> > > > +#!/bin/sh
> > > > +# SPDX-License-Identifier: GPL-2.0+
> > > > +# description: Kretprobe dynamic event with a stacktrace
> > > > +
> > > > +[ -f kprobe_events ] || exit_unsupported # this is configurable
> > > > +
> > > > +echo 0 > events/enable
> > > > +echo 1 > options/stacktrace
> > > > +
> > > > +echo 'r:teststackprobe sched_fork $retval' > kprobe_events
> > > > +grep teststackprobe kprobe_events
> > > > +test -d events/kprobes/teststackprobe
> > > 
> > > Hmm, what happen if we have 2 or more kretprobes on same stack?
> > > It seems you just save stack in pre_handler, but that stack can already
> > > includes another kretprobe's trampline address...
> > 
> > Yeah, you're quite right...
> > 
> > My first instinct was to do something awful like iterate over the set of
> > "kretprobe_instance"s with ->task == current, and then correct
> > kretprobe_trampoline entries using ->ret_addr. (I think this would be
> > correct because each task can only be in one context at once, and in
> > order to get to a particular kretprobe all of your caller kretprobes
> > were inserted before you and any sibling or later kretprobe_instances
> > will have been removed. But I might be insanely wrong on this front.)
> 
> yeah, you are right. 
> 
> > 
> > However (as I noted in the other thread), there is a problem where
> > kretprobe_trampoline actually stops the unwinder in its tracks and thus
> > you only get the first kretprobe_trampoline. This is something I'm going
> > to look into some more (despite not having made progress on it last
> > time) since now it's something that actually needs to be fixed (and
> > as I mentioned in the other thread, show_stack() actually works on x86
> > in this context unlike the other stack_trace users).
> 
> I should read the unwinder code, but anyway, fixing it up in kretprobe
> handler context is not hard. Since each instance is on an hlist, so when
> we hit the kretprobe_trampoline, we can search it.

As in, find the stored stack and merge the two? Interesting idea, though
Steven has shot this down because of the associated cost (I was
considering making it a kprobe flag, but that felt far too dirty).

> However, the problem is the case where the out of kretprobe handler
> context. In that context we need to try to lock the hlist and search
> the list, which will be a costful operation.

I think the best solution would be to unify all of the kretprobe-like
things so that we don't need to handle non-kretprobe contexts for
basically the same underlying idea. If we wanted to do it like this.

I think a potentially better option would be to just fix the unwinder to
correctly handle kretprobes (like it handles ftrace today).

> On the other hand, func-graph tracer introduces a shadow return address
> stack for each task (thread), and when we hit its trampoline on the stack,
> we can easily search the entry from "current" task without locking the
> shadow stack (and we already did it). This may need to pay a cost (1 page)
> for each task, but smarter than kretprobe, which makes a system-wide 
> hash-table and need to search from hlist which has return addresses
> of other context coexist.

Probably a silly question (I've been staring at the function_graph code
trying to understand how it handles return addresses -- and I'm really
struggling), is this what ->ret_stack (and ->curr_ret_stack) do?

Can you explain how the .retp handling works, because I'm really missing
how the core arch/ hooks know to pass the correct retp value.

-- 
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20181102/6b344e18/attachment.sig>
