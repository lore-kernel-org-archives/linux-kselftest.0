From: cyphar@cyphar.com (Aleksa Sarai)
Date: Fri, 2 Nov 2018 08:13:43 +1100
Subject: [PATCH v3 1/2] kretprobe: produce sane stack traces
In-Reply-To: <20181102002039.8f22c10fa47cae75fa709165@kernel.org>
References: <20181101083551.3805-1-cyphar@cyphar.com>
 <20181101083551.3805-2-cyphar@cyphar.com>
 <20181102002039.8f22c10fa47cae75fa709165@kernel.org>
Message-ID: <20181101211343.yooxwqfnoloprb5h@yavin>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181101211343.mLVFztCwFYNbt0IjmSuzowJ8t7W8BeaP-2m10RN0S_g@z>

On 2018-11-02, Masami Hiramatsu <mhiramat@kernel.org> wrote:
> Please split the test case as an independent patch.

Will do. Should the Documentation/ change also be a separate patch?

> > new file mode 100644
> > index 000000000000..03146c6a1a3c
> > --- /dev/null
> > +++ b/tools/testing/selftests/ftrace/test.d/kprobe/kretprobe_stacktrace.tc
> > @@ -0,0 +1,25 @@
> > +#!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0+
> > +# description: Kretprobe dynamic event with a stacktrace
> > +
> > +[ -f kprobe_events ] || exit_unsupported # this is configurable
> > +
> > +echo 0 > events/enable
> > +echo 1 > options/stacktrace
> > +
> > +echo 'r:teststackprobe sched_fork $retval' > kprobe_events
> > +grep teststackprobe kprobe_events
> > +test -d events/kprobes/teststackprobe
> 
> Hmm, what happen if we have 2 or more kretprobes on same stack?
> It seems you just save stack in pre_handler, but that stack can already
> includes another kretprobe's trampline address...

Yeah, you're quite right...

My first instinct was to do something awful like iterate over the set of
"kretprobe_instance"s with ->task == current, and then correct
kretprobe_trampoline entries using ->ret_addr. (I think this would be
correct because each task can only be in one context at once, and in
order to get to a particular kretprobe all of your caller kretprobes
were inserted before you and any sibling or later kretprobe_instances
will have been removed. But I might be insanely wrong on this front.)

However (as I noted in the other thread), there is a problem where
kretprobe_trampoline actually stops the unwinder in its tracks and thus
you only get the first kretprobe_trampoline. This is something I'm going
to look into some more (despite not having made progress on it last
time) since now it's something that actually needs to be fixed (and
as I mentioned in the other thread, show_stack() actually works on x86
in this context unlike the other stack_trace users).

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
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20181102/44e034f2/attachment.sig>
