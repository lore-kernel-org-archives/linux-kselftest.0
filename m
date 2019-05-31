From: catalin.marinas@arm.com (Catalin Marinas)
Date: Fri, 31 May 2019 17:22:06 +0100
Subject: [PATCH v15 17/17] selftests, arm64: add a selftest for passing
 tagged pointers to kernel
In-Reply-To: <CAAeHK+wUerHQOV2PuaTwTxcCucZHZodLwg48228SB+ymxEqT2A@mail.gmail.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <e31d9364eb0c2eba8ce246a558422e811d82d21b.1557160186.git.andreyknvl@google.com>
 <20190522141612.GA28122@arrakis.emea.arm.com>
 <CAAeHK+wUerHQOV2PuaTwTxcCucZHZodLwg48228SB+ymxEqT2A@mail.gmail.com>
Message-ID: <20190531162206.GB3568@arrakis.emea.arm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190531162206.fhxfl8I7MVjTEKkgOE4spdutTteD82WS7z1MxLOCyVU@z>

On Fri, May 31, 2019@04:21:48PM +0200, Andrey Konovalov wrote:
> On Wed, May 22, 2019@4:16 PM Catalin Marinas <catalin.marinas@arm.com> wrote:
> > On Mon, May 06, 2019@06:31:03PM +0200, Andrey Konovalov wrote:
> > > This patch is a part of a series that extends arm64 kernel ABI to allow to
> > > pass tagged user pointers (with the top byte set to something else other
> > > than 0x00) as syscall arguments.
> > >
> > > This patch adds a simple test, that calls the uname syscall with a
> > > tagged user pointer as an argument. Without the kernel accepting tagged
> > > user pointers the test fails with EFAULT.
> >
> > That's probably sufficient for a simple example. Something we could add
> > to Documentation maybe is a small library that can be LD_PRELOAD'ed so
> > that you can run a lot more tests like LTP.
> 
> Should I add this into this series, or should this go into Vincenzo's patchset?

If you can tweak the selftest Makefile to build a library and force it
with LD_PRELOAD, you can keep it with this patch. It would be easier to
extend to other syscall tests, signal handling etc.

-- 
Catalin
