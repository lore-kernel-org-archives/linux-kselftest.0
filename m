From: vincenzo.frascino@arm.com (Vincenzo Frascino)
Date: Mon, 18 Mar 2019 16:35:29 +0000
Subject: [PATCH v2 0/4] arm64 relaxed ABI
In-Reply-To: <cover.1552679409.git.andreyknvl@google.com>
References: <cover.1552679409.git.andreyknvl@google.com>
Message-ID: <20190318163533.26838-1-vincenzo.frascino@arm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190318163529.BRMm0cVxy2xCk3kfiTk7gOcl338GIFwgTGaoCJaT36w@z>

On arm64 the TCR_EL1.TBI0 bit has been always enabled in the Linux
kernel hence the userspace (EL0) is allowed to set a non-zero value
in the top byte but the resulting pointers are not allowed at the
user-kernel syscall ABI boundary.

This patchset proposes a relaxation of the ABI and a mechanism to
advertise it to the userspace via an AT_FLAGS.

The rationale behind the choice of AT_FLAGS is that the Unix System V
ABI defines AT_FLAGS as "flags", leaving some degree of freedom in
interpretation.
There are two previous attempts of using AT_FLAGS in the Linux Kernel
for different reasons: the first was more generic and was used to expose
the support for the GNU STACK NX feature [1] and the second was done for
the MIPS architecture and was used to expose the support of "MIPS ABI
Extension for IEEE Std 754 Non-Compliant Interlinking" [2].
Both the changes are currently _not_ merged in mainline.
The only architecture that reserves some of the bits in AT_FLAGS is
currently MIPS, which introduced the concept of platform specific ABI
(psABI) reserving the top-byte [3].

When ARM64_AT_FLAGS_SYSCALL_TBI is set the kernel is advertising
to the userspace that a relaxed ABI is supported hence this type
of pointers are now allowed to be passed to the syscalls when they are
in memory ranges obtained by anonymous mmap() or brk().

The userspace _must_ verify that the flag is set before passing tagged
pointers to the syscalls allowed by this relaxation.

More in general, exposing the ARM64_AT_FLAGS_SYSCALL_TBI flag and mandating
to the software to check that the feature is present, before using the
associated functionality, it provides a degree of control on the decision
of disabling such a feature in future without consequently breaking the
userspace.

The change required a modification of the elf common code, because in Linux
the AT_FLAGS are currently set to zero by default by the kernel.

The newly added flag has been verified on arm64 using the code below.
#include <stdio.h>
#include <stdbool.h>
#include <sys/auxv.h>

#define ARM64_AT_FLAGS_SYSCALL_TBI     (1 << 0)

bool arm64_syscall_tbi_is_present(void)
{
        unsigned long at_flags = getauxval(AT_FLAGS);
        if (at_flags & ARM64_AT_FLAGS_SYSCALL_TBI)
                return true;

        return false;
}

void main()
{
        if (arm64_syscall_tbi_is_present())
                printf("ARM64_AT_FLAGS_SYSCALL_TBI is present\n");
}

This patchset should be merged together with [4].

[1] https://patchwork.ozlabs.org/patch/579578/
[2] https://lore.kernel.org/patchwork/cover/618280/
[3] ftp://www.linux-mips.org/pub/linux/mips/doc/ABI/psABI_mips3.0.pdf
[4] https://patchwork.kernel.org/cover/10674351/

ABI References:
---------------
Sco SysV ABI: http://www.sco.com/developers/gabi/2003-12-17/contents.html
PowerPC AUXV: http://openpowerfoundation.org/wp-content/uploads/resources/leabi/content/dbdoclet.50655242_98651.html
AMD64 ABI: https://www.cs.tufts.edu/comp/40-2012f/readings/amd64-abi.pdf
x86 ABI: https://www.uclibc.org/docs/psABI-i386.pdf
MIPS ABI: ftp://www.linux-mips.org/pub/linux/mips/doc/ABI/psABI_mips3.0.pdf
ARM ABI: http://infocenter.arm.com/help/topic/com.arm.doc.ihi0044f/IHI0044F_aaelf.pdf
SPARC ABI: http://math-atlas.sourceforge.net/devel/assembly/abi_sysV_sparc.pdf

CC: Alexander Viro <viro at zeniv.linux.org.uk>
Cc: Alexei Starovoitov <ast at kernel.org>
Cc: Andrew Morton <akpm at linux-foundation.org>
Cc: Andrey Konovalov <andreyknvl at google.com>
Cc: Arnaldo Carvalho de Melo <acme at kernel.org>
Cc: Branislav Rankov <Branislav.Rankov at arm.com>
Cc: Catalin Marinas <catalin.marinas at arm.com>
Cc: Chintan Pandya <cpandya at codeaurora.org>
Cc: Daniel Borkmann <daniel at iogearbox.net>
Cc: Dave Martin <Dave.Martin at arm.com>
Cc: "David S. Miller" <davem at davemloft.net>
Cc: Dmitry Vyukov <dvyukov at google.com>
Cc: Eric Dumazet <edumazet at google.com>
Cc: Evgeniy Stepanov <eugenis at google.com>
Cc: Graeme Barnes <Graeme.Barnes at arm.com>
Cc: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
Cc: Ingo Molnar <mingo at kernel.org>
Cc: Jacob Bramley <Jacob.Bramley at arm.com>
Cc: Kate Stewart <kstewart at linuxfoundation.org>
Cc: Kees Cook <keescook at chromium.org>
Cc: Kevin Brodsky <kevin.brodsky at arm.com>
Cc: "Kirill A . Shutemov" <kirill.shutemov at linux.intel.com>
Cc: Kostya Serebryany <kcc at google.com>
Cc: Lee Smith <Lee.Smith at arm.com>
Cc: Luc Van Oostenryck <luc.vanoostenryck at gmail.com>
Cc: Mark Rutland <mark.rutland at arm.com>
Cc: Peter Zijlstra <peterz at infradead.org>
Cc: Ramana Radhakrishnan <Ramana.Radhakrishnan at arm.com>
Cc: Robin Murphy <robin.murphy at arm.com>
Cc: Ruben Ayrapetyan <Ruben.Ayrapetyan at arm.com>
Cc: Shuah Khan <shuah at kernel.org>
Cc: Steven Rostedt <rostedt at goodmis.org>
Cc: Szabolcs Nagy <Szabolcs.Nagy at arm.com>
Cc: Will Deacon <will.deacon at arm.com>
Signed-off-by: Vincenzo Frascino <vincenzo.frascino at arm.com>

Changes:
--------
v2:
  - Rebased on 5.1-rc1
  - Addressed review comments
  - Modified tagged-pointers.txt to be compliant with the
    new ABI relaxation

Vincenzo Frascino (4):
  elf: Make AT_FLAGS arch configurable
  arm64: Define Documentation/arm64/elf_at_flags.txt
  arm64: Relax Documentation/arm64/tagged-pointers.txt
  arm64: elf: Advertise relaxed ABI

 Documentation/arm64/elf_at_flags.txt    | 133 ++++++++++++++++++++++++
 Documentation/arm64/tagged-pointers.txt |  23 ++--
 arch/arm64/include/asm/atflags.h        |   7 ++
 arch/arm64/include/asm/elf.h            |   5 +
 arch/arm64/include/uapi/asm/atflags.h   |   8 ++
 fs/binfmt_elf.c                         |   6 +-
 fs/binfmt_elf_fdpic.c                   |   6 +-
 fs/compat_binfmt_elf.c                  |   5 +
 8 files changed, 184 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/arm64/elf_at_flags.txt
 create mode 100644 arch/arm64/include/asm/atflags.h
 create mode 100644 arch/arm64/include/uapi/asm/atflags.h

-- 
2.21.0
