From: catalin.marinas at arm.com (Catalin Marinas)
Date: Fri, 1 Mar 2019 16:59:08 +0000
Subject: [PATCH v10 07/12] fs, arm64: untag user pointers in
 fs/userfaultfd.c
In-Reply-To: <CAAeHK+yQU8khtOoyDKqmHterCa16P7oWe9AMiPnrxE+Gyb_7aw@mail.gmail.com>
References: <cover.1550839937.git.andreyknvl@google.com>
 <8343cd77ca301df15839796f3b446b75ce5ffbbf.1550839937.git.andreyknvl@google.com>
 <73f2f3fe-9a66-22a1-5aae-c282779a75f5@intel.com>
 <CAAeHK+yQU8khtOoyDKqmHterCa16P7oWe9AMiPnrxE+Gyb_7aw@mail.gmail.com>
Message-ID: <20190301165908.GA130541@arrakis.emea.arm.com>

On Tue, Feb 26, 2019 at 03:39:08PM +0100, Andrey Konovalov wrote:
> On Sat, Feb 23, 2019 at 12:06 AM Dave Hansen <dave.hansen at intel.com> wrote:
> >
> > On 2/22/19 4:53 AM, Andrey Konovalov wrote:
> > > userfaultfd_register() and userfaultfd_unregister() use provided user
> > > pointers for vma lookups, which can only by done with untagged pointers.
> >
> > So, we have to patch all these sites before the tagged values get to the
> > point of hitting the vma lookup functions.  Dumb question: Why don't we
> > just patch the vma lookup functions themselves instead of all of these
> > callers?
> 
> That might be a working approach as well. We'll still need to fix up
> places where the vma fields are accessed directly. Catalin, what do
> you think?

Most callers of find_vma*() always follow it by a check of
vma->vma_start against some tagged address ('end' in the
userfaultfd_(un)register()) case. So it's not sufficient to untag it in
find_vma().

-- 
Catalin
