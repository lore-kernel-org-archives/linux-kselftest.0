From: torvalds at linux-foundation.org (Linus Torvalds)
Date: Thu, 2 May 2019 11:43:37 -0700
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <20190502181811.GY2623@hirez.programming.kicks-ass.net>
References: <20190501202830.347656894@goodmis.org>
 <20190501203152.397154664@goodmis.org>
 <20190501232412.1196ef18@oasis.local.home>
 <20190502162133.GX2623@hirez.programming.kicks-ass.net>
 <CAHk-=wijZ-MD4g3zMJ9W2r=h8LUWneiu29OWuxZEoSfAF=0bhQ@mail.gmail.com>
 <20190502181811.GY2623@hirez.programming.kicks-ass.net>
Message-ID: <CAHk-=wi6A9tgw=kkPh5Ywqt687VvsVEjYXVkAnq0jpt0u0tk6g@mail.gmail.com>

On Thu, May 2, 2019 at 11:18 AM Peter Zijlstra <peterz at infradead.org> wrote:
>
> We could fix this by not using the common exit path on int3; not sure we
> want to go there, but that is an option.

I don't think it's an option in general, because *some* int3
invocations will need all the usual error return.

But I guess we could make "int3 from kernel space" special.

I'm not sure how much that would help, but it might be worth looking into.

> ARGH; I knew it was too pretty :/ Yes, something like what you suggest
> will be needed, I'll go look at that once my brain recovers a bit from
> staring at entry code all day.

Looks like it works based on your other email.

What would it look like with the "int3-from-kernel is special" modification?

Because *if* we can make the "kernel int3" entirely special, that
would make the "Eww factor" much less of this whole thing.

I forget: is #BP _only_ for the "int3" instruction? I know we have
really nasty cases with #DB (int1) because of "pending exceptions
happen on the first instruction in kernel space", and that makes it
really really nasty to handle with all the stack switch and %cr3
handling etc.

But if "int3 from kernel space" _only_ happens on actual "int3"
instructions, then we really could just special-case that case. We'd
know that %cr3 has been switched, we'd know that we don't need to do
fsgs switching, we'd know we already have a good stack and percpu data
etc set up.

So then special casing #BP would actually allow us to have a simple
and straightforward kernel-int3-only sequence?

And then having that odd stack setup special case would be *much* more
palatable to me.

               Linus
