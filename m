From: andreyknvl@google.com (Andrey Konovalov)
Date: Mon, 6 May 2019 15:53:01 +0200
Subject: [PATCH v14 08/17] mm,
 arm64: untag user pointers in get_vaddr_frames
In-Reply-To: <20190503165113.GJ55449@arrakis.emea.arm.com>
References: <cover.1556630205.git.andreyknvl@google.com>
 <8e20df035de677029b3f970744ba2d35e2df1db3.1556630205.git.andreyknvl@google.com>
 <20190503165113.GJ55449@arrakis.emea.arm.com>
Message-ID:
 <CAAeHK+wCyCa-5=bPNwfivP6sEODOXKE1bPjcjc2y_T4rN+-6gA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190506135301.kqehB-Gj8_vBmtyrGHt1vP-6-nGlN3zwZ3_u2v1uekg@z>

On Fri, May 3, 2019@6:51 PM Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> On Tue, Apr 30, 2019@03:25:04PM +0200, Andrey Konovalov wrote:
> > This patch is a part of a series that extends arm64 kernel ABI to allow to
> > pass tagged user pointers (with the top byte set to something else other
> > than 0x00) as syscall arguments.
> >
> > get_vaddr_frames uses provided user pointers for vma lookups, which can
> > only by done with untagged pointers. Instead of locating and changing
> > all callers of this function, perform untagging in it.
> >
> > Signed-off-by: Andrey Konovalov <andreyknvl at google.com>
> > ---
> >  mm/frame_vector.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/mm/frame_vector.c b/mm/frame_vector.c
> > index c64dca6e27c2..c431ca81dad5 100644
> > --- a/mm/frame_vector.c
> > +++ b/mm/frame_vector.c
> > @@ -46,6 +46,8 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
> >       if (WARN_ON_ONCE(nr_frames > vec->nr_allocated))
> >               nr_frames = vec->nr_allocated;
> >
> > +     start = untagged_addr(start);
> > +
> >       down_read(&mm->mmap_sem);
> >       locked = 1;
> >       vma = find_vma_intersection(mm, start, start + 1);
>
> Is this some buffer that the user may have malloc'ed? I got lost when
> trying to track down the provenience of this buffer.

The caller that I found when I was looking at this:

drivers/gpu/drm/exynos/exynos_drm_g2d.c:482
exynos_g2d_set_cmdlist_ioctl()->g2d_map_cmdlist_gem()->g2d_userptr_get_dma_addr()->get_vaddr_frames()

>
> --
> Catalin
