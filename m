From: nstange at suse.de (Nicolai Stange)
Date: Wed, 08 May 2019 11:41:19 +0200
Subject: [PATCH 0/3] x86_64/ftrace: Emulate calls from int3 when patching
 functions
In-Reply-To: <20190508015559.767152678@goodmis.org> (Steven Rostedt's message
 of "Tue, 07 May 2019 21:55:59 -0400")
References: <20190508015559.767152678@goodmis.org>
Message-ID: <87lfzhwaf4.fsf@suse.de>

Steven Rostedt <rostedt at goodmis.org> writes:

> [
>   This is the non-RFC version.
>
>   It went through and passed all my tests. If there's no objections
>   I'm going to include this in my pull request. I still have patches
>   in my INBOX that may still be included, so I need to run those through
>   my tests as well, so a pull request wont be immediate.
> ]

<snip />

> Josh Poimboeuf (1):
>       x86_64: Add gap to int3 to allow for call emulation
>
> Peter Zijlstra (2):
>       x86_64: Allow breakpoints to emulate call instructions
>       ftrace/x86_64: Emulate call function while updating in breakpoint handler

Reviewed-and-tested-by: Nicolai Stange <nstange at suse.de>

for the whole series. Many, many thanks to everybody involved!

I'll resend that live patching selftest once this fix here has been
merged.

Nicolai

-- 
SUSE Linux GmbH, GF: Felix Imendörffer, Mary Higgins, Sri Rasiah, HRB
21284 (AG Nürnberg)
