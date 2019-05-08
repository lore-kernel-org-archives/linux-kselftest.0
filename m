From: peterz at infradead.org (Peter Zijlstra)
Date: Wed, 08 May 2019 09:49:01 +0200
Subject: [PATCH 0/4] x86: int3 fallout
Message-ID: <20190508074901.982470324@infradead.org>

So the first 3 patches are cleanups and fixes and should probably just go in.

The last patch however is the one Linus hates, it converts i386 to always have
a complete pt_regs. Both Josh and me did a bunch of cleanups and the patch is
now a net reduction in lines.

I still think it is the right thing to do; it removes a whole lot of magic from
the C code (and avoids future surprises), but if this cannot convince Linus,
I'll not pursue this further.
