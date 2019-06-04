From: jgg@ziepe.ca (Jason Gunthorpe)
Date: Tue, 4 Jun 2019 10:02:07 -0300
Subject: [PATCH v16 12/16] IB, arm64: untag user pointers in
 ib_uverbs_(re)reg_mr()
In-Reply-To: <CAAeHK+xyqwuJyviGhvU7L1wPZQF7Mf9g2vgKSsYmML3fV6NrXg@mail.gmail.com>
References: <cover.1559580831.git.andreyknvl@google.com>
 <c829f93b19ad6af1b13be8935ce29baa8e58518f.1559580831.git.andreyknvl@google.com>
 <20190603174619.GC11474@ziepe.ca>
 <CAAeHK+xy-dx4dLDLLj9dRzRNSVG9H5nDPPnjpYF38qKZNNCh_g@mail.gmail.com>
 <20190604122714.GA15385@ziepe.ca>
 <CAAeHK+xyqwuJyviGhvU7L1wPZQF7Mf9g2vgKSsYmML3fV6NrXg@mail.gmail.com>
Message-ID: <20190604130207.GD15385@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190604130207.Ncw31XLHs1O3298PmXjywk2_KRooytGxyor0R5ZSyhk@z>

On Tue, Jun 04, 2019@02:45:32PM +0200, Andrey Konovalov wrote:
> On Tue, Jun 4, 2019@2:27 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Tue, Jun 04, 2019@02:18:19PM +0200, Andrey Konovalov wrote:
> > > On Mon, Jun 3, 2019@7:46 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > >
> > > > On Mon, Jun 03, 2019@06:55:14PM +0200, Andrey Konovalov wrote:
> > > > > This patch is a part of a series that extends arm64 kernel ABI to allow to
> > > > > pass tagged user pointers (with the top byte set to something else other
> > > > > than 0x00) as syscall arguments.
> > > > >
> > > > > ib_uverbs_(re)reg_mr() use provided user pointers for vma lookups (through
> > > > > e.g. mlx4_get_umem_mr()), which can only by done with untagged pointers.
> > > > >
> > > > > Untag user pointers in these functions.
> > > > >
> > > > > Signed-off-by: Andrey Konovalov <andreyknvl at google.com>
> > > > >  drivers/infiniband/core/uverbs_cmd.c | 4 ++++
> > > > >  1 file changed, 4 insertions(+)
> > > > >
> > > > > diff --git a/drivers/infiniband/core/uverbs_cmd.c b/drivers/infiniband/core/uverbs_cmd.c
> > > > > index 5a3a1780ceea..f88ee733e617 100644
> > > > > +++ b/drivers/infiniband/core/uverbs_cmd.c
> > > > > @@ -709,6 +709,8 @@ static int ib_uverbs_reg_mr(struct uverbs_attr_bundle *attrs)
> > > > >       if (ret)
> > > > >               return ret;
> > > > >
> > > > > +     cmd.start = untagged_addr(cmd.start);
> > > > > +
> > > > >       if ((cmd.start & ~PAGE_MASK) != (cmd.hca_va & ~PAGE_MASK))
> > > > >               return -EINVAL;
> > > >
> > > > I feel like we shouldn't thave to do this here, surely the cmd.start
> > > > should flow unmodified to get_user_pages, and gup should untag it?
> > > >
> > > > ie, this sort of direction for the IB code (this would be a giant
> > > > patch, so I didn't have time to write it all, but I think it is much
> > > > saner):
> > >
> > > Hi Jason,
> > >
> > > ib_uverbs_reg_mr() passes cmd.start to mlx4_get_umem_mr(), which calls
> > > find_vma(), which only accepts untagged addresses. Could you explain
> > > how your patch helps?
> >
> > That mlx4 is just a 'weird duck', it is not the normal flow, and I
> > don't think the core code should be making special consideration for
> > it.
> 
> How do you think we should do untagging (or something else) to deal
> with this 'weird duck' case?

mlx4 should handle it around the call to find_vma like other patches
do, ideally as part of the cast from a void __user * to the unsigned
long that find_vma needs

Jason
