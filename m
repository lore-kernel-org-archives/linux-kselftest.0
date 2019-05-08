From: torvalds at linux-foundation.org (Linus Torvalds)
Date: Wed, 8 May 2019 13:58:42 -0700
Subject: [RFC][PATCH 4/4] x86_32: Provide consistent pt_regs
In-Reply-To: <20190508080612.832694080@infradead.org>
References: <20190508074901.982470324@infradead.org>
 <20190508080612.832694080@infradead.org>
Message-ID: <CAHk-=wh5EMx2vmLsFqLKmVtjFa6VnTs_MWfxX2N++CDd_UiOqw@mail.gmail.com>

On Wed, May 8, 2019 at 1:12 AM Peter Zijlstra <peterz at infradead.org> wrote:
>
> Hated-by: Linus Torvalds <torvalds at linux-foundation.org>

I can live with this cleaned-up version. I'm still not loving it, but
at least it now tries very hard to simplify other code. You can remote
the hated-by.

                  Linus
