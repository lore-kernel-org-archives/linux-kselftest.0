From: rostedt@goodmis.org (Steven Rostedt)
Date: Thu, 2 May 2019 16:48:19 -0400
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <CAHk-=wijZ-MD4g3zMJ9W2r=h8LUWneiu29OWuxZEoSfAF=0bhQ@mail.gmail.com>
References: <20190501202830.347656894@goodmis.org>
 <20190501203152.397154664@goodmis.org>
 <20190501232412.1196ef18@oasis.local.home>
 <20190502162133.GX2623@hirez.programming.kicks-ass.net>
 <CAHk-=wijZ-MD4g3zMJ9W2r=h8LUWneiu29OWuxZEoSfAF=0bhQ@mail.gmail.com>
Message-ID: <20190502164819.24a818a1@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190502204819.4LmRQsp4zf4NSf5HKLJGxhVFyPfdpJy87cbj-MN746E@z>

On Thu, 2 May 2019 11:02:40 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> Indeed, the 32-bit case for same-RPL exceptions/iret is entirely
> different, and I'd forgotten about that.
> 
> And honestly, this makes the 32-bit case much worse. Now the entry
> stack modifications of int3 suddenly affect not just the entry, but
> every exit too.
> 
> This is _exactly_ the kind of subtle kernel entry/exit code I wanted
> us to avoid.

I just want to point out that I never got the trampoline version
working on i386. I didn't have the time to debug why it would crash
when stressed.

-- Steve
