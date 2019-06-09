From: geert@linux-m68k.org (Geert Uytterhoeven)
Date: Sun, 9 Jun 2019 11:19:28 +0200
Subject: [PATCH v3 15/20] docs: move protection-keys.rst to the core-api
 book
In-Reply-To: <4948a096397bb86cebf489b8ac4f623797257fe7.1559933665.git.mchehab+samsung@kernel.org>
References: <ff457774d46d96e8fe56b45409aba39d87a8672a.1559933665.git.mchehab+samsung@kernel.org>
 <4948a096397bb86cebf489b8ac4f623797257fe7.1559933665.git.mchehab+samsung@kernel.org>
Message-ID:
 <CAMuHMdVnBP-CJ5S0+D_H4RedkHV5m8m8wGXy-PRzaFk0JWdW8Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190609091928.8Yi6pDTRVkEOxGdZ7shYz1wAyIKBWuNchJyWrXSLm64@z>

Hi Mauro,

On Fri, Jun 7, 2019 at 9:38 PM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:
> This document is used by multiple architectures:

Indeed it is...

>
>         $ echo $(git grep -l  pkey_mprotect arch|cut -d'/' -f 2|sort|uniq)
>         alpha arm arm64 ia64 m68k microblaze mips parisc powerpc s390 sh sparc x86 xtensa

... but not because we now have a unified space for new syscall numbers ;-)

$ git grep -w ARCH_HAS_PKEYS -- "*Kconf*"
arch/powerpc/Kconfig:   select ARCH_HAS_PKEYS
arch/x86/Kconfig:       select ARCH_HAS_PKEYS
mm/Kconfig:config ARCH_HAS_PKEYS

I.e. limited to x86 and powerpc.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert at linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
