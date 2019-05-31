From: catalin.marinas@arm.com (Catalin Marinas)
Date: Fri, 31 May 2019 17:19:55 +0100
Subject: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
In-Reply-To: <CAAeHK+y34+SNz3Vf+_378bOxrPaj_3GaLCeC2Y2rHAczuaSz1A@mail.gmail.com>
References: <20190521182932.sm4vxweuwo5ermyd@mbp>
 <201905211633.6C0BF0C2@keescook>
 <6049844a-65f5-f513-5b58-7141588fef2b@oracle.com>
 <20190523201105.oifkksus4rzcwqt4@mbp>
 <ffe58af3-7c70-d559-69f6-1f6ebcb0fec6@oracle.com>
 <20190524101139.36yre4af22bkvatx@mbp>
 <c6dd53d8-142b-3d8d-6a40-d21c5ee9d272@oracle.com>
 <CAAeHK+yAUsZWhp6xPAbWewX5Nbw+-G3svUyPmhXu5MVeEDKYvA@mail.gmail.com>
 <20190530171540.GD35418@arrakis.emea.arm.com>
 <CAAeHK+y34+SNz3Vf+_378bOxrPaj_3GaLCeC2Y2rHAczuaSz1A@mail.gmail.com>
Message-ID: <20190531161954.GA3568@arrakis.emea.arm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190531161955.-W8JGaaGNrQLpb-7w721kWRGeWuaNEhBISiF7HXST_g@z>

On Fri, May 31, 2019@04:29:10PM +0200, Andrey Konovalov wrote:
> On Thu, May 30, 2019@7:15 PM Catalin Marinas <catalin.marinas@arm.com> wrote:
> > On Tue, May 28, 2019@04:14:45PM +0200, Andrey Konovalov wrote:
> > > Thanks for a lot of valuable input! I've read through all the replies
> > > and got somewhat lost. What are the changes I need to do to this
> > > series?
> > >
> > > 1. Should I move untagging for memory syscalls back to the generic
> > > code so other arches would make use of it as well, or should I keep
> > > the arm64 specific memory syscalls wrappers and address the comments
> > > on that patch?
> >
> > Keep them generic again but make sure we get agreement with Khalid on
> > the actual ABI implications for sparc.
> 
> OK, will do. I find it hard to understand what the ABI implications
> are. I'll post the next version without untagging in brk, mmap,
> munmap, mremap (for new_address), mmap_pgoff, remap_file_pages, shmat
> and shmdt.

It's more about not relaxing the ABI to accept non-zero top-byte unless
we have a use-case for it. For mmap() etc., I don't think that's needed
but if you think otherwise, please raise it.

> > > 2. Should I make untagging opt-in and controlled by a command line argument?
> >
> > Opt-in, yes, but per task rather than kernel command line option.
> > prctl() is a possibility of opting in.
> 
> OK. Should I store a flag somewhere in task_struct? Should it be
> inheritable on clone?

A TIF flag would do but I'd say leave it out for now (default opted in)
until we figure out the best way to do this (can be a patch on top of
this series).

Thanks.

-- 
Catalin
