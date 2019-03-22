From: catalin.marinas@arm.com (Catalin Marinas)
Date: Fri, 22 Mar 2019 10:48:40 +0000
Subject: [PATCH v2 2/4] arm64: Define Documentation/arm64/elf_at_flags.txt
In-Reply-To: <CADGdYn7HYcj4vxw2bCS6McdNRmWu7o13=VAQra5A1Z18JNPMXQ@mail.gmail.com>
References: <cover.1552679409.git.andreyknvl@google.com>
 <20190318163533.26838-1-vincenzo.frascino@arm.com>
 <20190318163533.26838-3-vincenzo.frascino@arm.com>
 <CADGdYn7HYcj4vxw2bCS6McdNRmWu7o13=VAQra5A1Z18JNPMXQ@mail.gmail.com>
Message-ID: <20190322104839.GA13384@arrakis.emea.arm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190322104840.FNnHHO34asmHFjkZiD25m-xio65adaXVpjxrmUpSBqc@z>

On Fri, Mar 22, 2019@11:52:37AM +0530, Amit Daniel Kachhap wrote:
> On Mon, Mar 18, 2019 at 10:06 PM Vincenzo Frascino
> <vincenzo.frascino@arm.com> wrote:
> > +Example of correct usage (pseudo-code) for a userspace application:
> > +
> > +bool arm64_syscall_tbi_is_present(void)
> > +{
> > +       unsigned long at_flags = getauxval(AT_FLAGS);
> > +       if (at_flags & ARM64_AT_FLAGS_SYSCALL_TBI)
> > +                       return true;
> > +
> > +       return false;
> > +}
> > +
> > +void main(void)
> > +{
> > +       char *addr = mmap(NULL, PAGE_SIZE, PROT_READ | PROT_WRITE,
> > +                         MAP_ANONYMOUS, -1, 0);
> > +
> > +       int fd = open("test.txt", O_WRONLY);
> > +
> > +       /* Check if the relaxed ABI is supported */
> > +       if (arm64_syscall_tbi_is_present()) {
> > +               /* Add a tag to the pointer */
> > +               addr = tag_pointer(addr);
> > +       }
> > +
> > +       strcpy("Hello World\n", addr);
> 
> Nit: s/strcpy("Hello World\n", addr)/strcpy(addr, "Hello World\n")

Not exactly a nit ;).

> > +
> > +       /* Write to a file */
> > +       write(fd, addr, sizeof(addr));

I presume this was supposed to write "Hello World\n" to a file but
sizeof(addr) is 1.

Since we already support tagged pointers in user space (as long as they
are not passed into the kernel), the above example could tag the pointer
unconditionally and only clear it before write() if
!arm64_syscall_tbi_is_present().

-- 
Catalin
