From: peterz at infradead.org (Peter Zijlstra)
Date: Fri, 10 May 2019 14:17:20 +0200
Subject: [PATCH 2/4] x86/kprobes: Fix frame pointer annotations
In-Reply-To: <20190510122103.5a7bc5416b7af96b27d4fab4@kernel.org>
References: <20190508115416.nblx7c2kocidpytm@treble>
 <20190508120416.GL2589@hirez.programming.kicks-ass.net>
 <20190508124248.u5ukpbhnh4wpiccq@treble>
 <20190508153907.GM2589@hirez.programming.kicks-ass.net>
 <20190508184848.qerg3flv3ej3xsev@treble>
 <20190509102030.dfa62e058f09d0d8cbdd6053@kernel.org>
 <20190509081431.GO2589@hirez.programming.kicks-ass.net>
 <81170F0B-A2BB-4CD6-A1B5-5E7E0DDBC282@amacapital.net>
 <20190509174316.pzuakeu657g3fnlm@home.goodmis.org>
 <20190510122103.5a7bc5416b7af96b27d4fab4@kernel.org>
Message-ID: <20190510121720.GT2589@hirez.programming.kicks-ass.net>

On Fri, May 10, 2019 at 12:21:03PM +0900, Masami Hiramatsu wrote:
> Yes, optprobe also has to save and restore the flags.
> Above trampline is for kretprobe, which is placed at the function return, so
> we don't have to care about flags.

Sure, optprobe is actually special here, because it branches out at
'random' places and does indeed need to preserve flags.

But both ftrace and retprobes are at C function call boundaries.
Preserving flags doesn't make sense.
