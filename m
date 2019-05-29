From: catalin.marinas@arm.com (Catalin Marinas)
Date: Wed, 29 May 2019 13:12:25 +0100
Subject: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
In-Reply-To: <20190529061126.GA18124@infradead.org>
References: <CAFKCwrj6JEtp4BzhqO178LFJepmepoMx=G+YdC8sqZ3bcBp3EQ@mail.gmail.com>
 <20190521182932.sm4vxweuwo5ermyd@mbp>
 <201905211633.6C0BF0C2@keescook>
 <6049844a-65f5-f513-5b58-7141588fef2b@oracle.com>
 <20190523201105.oifkksus4rzcwqt4@mbp>
 <ffe58af3-7c70-d559-69f6-1f6ebcb0fec6@oracle.com>
 <20190524101139.36yre4af22bkvatx@mbp>
 <c6dd53d8-142b-3d8d-6a40-d21c5ee9d272@oracle.com>
 <CAAeHK+yAUsZWhp6xPAbWewX5Nbw+-G3svUyPmhXu5MVeEDKYvA@mail.gmail.com>
 <20190529061126.GA18124@infradead.org>
Message-ID: <20190529121225.q2zjgurxqnohvmkg@mbp>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190529121225.mWVyThyeCnx_7qujoET7WlMBrEUQLx7FPV4qleGnZuM@z>

On Tue, May 28, 2019@11:11:26PM -0700, Christoph Hellwig wrote:
> On Tue, May 28, 2019@04:14:45PM +0200, Andrey Konovalov wrote:
> > Thanks for a lot of valuable input! I've read through all the replies
> > and got somewhat lost. What are the changes I need to do to this
> > series?
> > 
> > 1. Should I move untagging for memory syscalls back to the generic
> > code so other arches would make use of it as well, or should I keep
> > the arm64 specific memory syscalls wrappers and address the comments
> > on that patch?
> 
> It absolutely needs to move to common code.  Having arch code leads
> to pointless (often unintentional) semantic difference between
> architectures, and lots of boilerplate code.

That's fine by me as long as we agree on the semantics (which shouldn't
be hard; Khalid already following up). We should probably also move the
proposed ABI document [1] into a common place (or part of since we'll
have arm64-specifics like prctl() calls to explicitly opt in to memory
tagging).

[1] https://lore.kernel.org/lkml/20190318163533.26838-1-vincenzo.frascino at arm.com/T/#u

-- 
Catalin
