From: nstange@suse.de (Nicolai Stange)
Date: Tue, 30 Apr 2019 11:24:23 +0200
Subject: [PATCH 3/4] x86/ftrace: make ftrace_int3_handler() not to skip
 fops invocation
In-Reply-To: <20190429180733.3f25d8b9@gandalf.local.home> (Steven Rostedt's
 message of "Mon, 29 Apr 2019 18:07:33 -0400")
References: <20190427100639.15074-1-nstange@suse.de>
 <20190427100639.15074-4-nstange@suse.de>
 <20190427102657.GF2623@hirez.programming.kicks-ass.net>
 <20190428133826.3e142cfd@oasis.local.home>
 <CAHk-=wh5OpheSU8Em_Q3Hg8qw_JtoijxOdPtHru6d+5K8TWM=A@mail.gmail.com>
 <20190429145250.1a5da6ed@gandalf.local.home>
 <CAHk-=wjm93jLtVxTX4HZs6K4k1Wqh3ujjmapqaYtcibVk_YnzQ@mail.gmail.com>
 <20190429150724.6e501d27@gandalf.local.home>
 <CAHk-=wgbC-wiSrdDYAh1ORF4EKmecY+MkNsJBF=BWf4W1bXXgA@mail.gmail.com>
 <20190429163043.535f4272@gandalf.local.home>
 <CAHk-=wjGquN7-kQCoa+LHCuiVTjefkk38qwaysd4wLLtoSZhpg@mail.gmail.com>
 <20190429180733.3f25d8b9@gandalf.local.home>
Message-ID: <87imuv977c.fsf@suse.de>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190430092423.qYVYYfsQ-1VhQSVc_7cyCgdHWCyWPM-qw0yN38EZiLw@z>

Steven Rostedt <rostedt at goodmis.org> writes:

> On Mon, 29 Apr 2019 14:38:35 -0700
> Linus Torvalds <torvalds@linux-foundation.org> wrote:
>
>> On Mon, Apr 29, 2019@1:30 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>> >
>> > The update from "call custom_trampoline" to "call iterator_trampoline"
>> > is where we have an issue.  
>> 
>> So it has never worked. Just tell people that they have two chocies:
>
> The custom call to iterator translation never worked. One option is to
> always call the iterator, and just take the hit. There's another
> solution to to make permanent updates that would handle the live
> patching case, but not for the tracing case. It is more critical for
> live patching than tracing (missed traced function is not as critical
> as running buggy code unexpectedly). I could look to work on that
> instead.

Making the live patching case permanent would disable tracing of live
patched functions though?

For unconditionally calling the iterator: I don't have numbers, but
would expect that always searching through something like 50-70 live
patching ftrace_ops from some hot path will be noticeable.


> If Nicolai has time, perhaps he can try out the method you suggest and
> see if we can move this forward.

You mean making ftrace handle call->call transitions one by one in
non-batch mode, right? Sure, I can do that.

Another question though: is there anything that prevents us from calling
ftrace_ops_list_func() directly from ftrace_int3_handler()? We don't
have parent_ip, but if that is used for reporting only, maybe setting it
to some ftrace_is_in_int3_and_doesnt_now_the_parent() will work?
Graph tracing entries would still be lost, but well...

Thanks,

Nicolai
