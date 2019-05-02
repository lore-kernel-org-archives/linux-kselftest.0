From: peterz@infradead.org (Peter Zijlstra)
Date: Thu, 2 May 2019 18:29:35 +0200
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <20190502162133.GX2623@hirez.programming.kicks-ass.net>
References: <20190501202830.347656894@goodmis.org>
 <20190501203152.397154664@goodmis.org>
 <20190501232412.1196ef18@oasis.local.home>
 <20190502162133.GX2623@hirez.programming.kicks-ass.net>
Message-ID: <20190502162935.GC2650@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190502162935.9h0DdWz_dw5SsoScrPZ9E54VR44z-AxZyIsuPlzR7nc@z>

On Thu, May 02, 2019@06:21:33PM +0200, Peter Zijlstra wrote:
> Much thanks to Joerg Roedel for talking entry_32.S with me.
> 
> TL;DR, on x86_32 kernel->kernel IRET frames are only 3 entries and do
> not include ESP/SS, so not only wasn't regs->sp setup, if you changed it
> it wouldn't be effective and corrupt random stack state.

Also, i386 is bloody insane...
