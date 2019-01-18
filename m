From: geert at linux-m68k.org (Geert Uytterhoeven)
Date: Fri, 18 Jan 2019 08:57:27 +0100
Subject: [PATCH 00/12] selftests: Miscellaneous fixes
In-Reply-To: <CAK7LNASdA+5_pdTjr1dY-cKGSDq804Huc_CX_8-Gg+ypFCmajQ@mail.gmail.com>
References: <20190114135144.26096-1-geert+renesas@glider.be>
 <CAK7LNASdA+5_pdTjr1dY-cKGSDq804Huc_CX_8-Gg+ypFCmajQ@mail.gmail.com>
Message-ID: <CAMuHMdWGbJwWXMK7f10n2zPSiMEj7EHJfiK0Pj4ABHHu3f4sdw@mail.gmail.com>

Hi Yamada-san,

On Fri, Jan 18, 2019 at 5:15 AM Masahiro Yamada
<yamada.masahiro at socionext.com> wrote:
> On Mon, Jan 14, 2019 at 10:52 PM Geert Uytterhoeven
> <geert+renesas at glider.be> wrote:
> > This patch series contains several build fixes and cleanups for issues I
> > encountered when trying to cross-build an rtctest binary in a separate
> > output directory (like I use for all my kernel builds).
>
> Geert,
> Thanks for working on this!
>
> My fundamental question is,
> why did tools/ opt out Kbuild?

Good question.  I think it originally started as a separate small project.

> I think lots of mess comes in
> in order to support
>   cd tools/gpio; make
>
> instead of
>
>   make tools/gpio/
>
> Lots of files are duplicated in tools/build/
> in order to invent a different build system for tools/

I agree switching to kbuild would be the best solution.
Unfortunately my kbuild foo is not strong enough...

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert at linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
