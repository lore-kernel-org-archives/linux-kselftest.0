From: leon at kernel.org (Leon Romanovsky)
Date: Tue, 7 May 2019 09:33:37 +0300
Subject: [PATCH v15 13/17] IB, arm64: untag user pointers in
 ib_uverbs_(re)reg_mr()
In-Reply-To: <20190506195020.GD6201@ziepe.ca>
References: <cover.1557160186.git.andreyknvl@google.com>
 <66d044ab9445dcf36a96205a109458ac23f38b73.1557160186.git.andreyknvl@google.com>
 <20190506195020.GD6201@ziepe.ca>
Message-ID: <20190507063337.GP6938@mtr-leonro.mtl.com>

On Mon, May 06, 2019 at 04:50:20PM -0300, Jason Gunthorpe wrote:
> On Mon, May 06, 2019 at 06:30:59PM +0200, Andrey Konovalov wrote:
> > This patch is a part of a series that extends arm64 kernel ABI to allow to
> > pass tagged user pointers (with the top byte set to something else other
> > than 0x00) as syscall arguments.
> >
> > ib_uverbs_(re)reg_mr() use provided user pointers for vma lookups (through
> > e.g. mlx4_get_umem_mr()), which can only by done with untagged pointers.
> >
> > Untag user pointers in these functions.
> >
> > Signed-off-by: Andrey Konovalov <andreyknvl at google.com>
> > ---
> >  drivers/infiniband/core/uverbs_cmd.c | 4 ++++
> >  1 file changed, 4 insertions(+)
>
> I think this is OK.. We should really get it tested though.. Leon?

It can be done after v5.2-rc1.

Thanks

>
> Jason
