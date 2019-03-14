From: joel@joelfernandes.org (Joel Fernandes)
Date: Thu, 14 Mar 2019 08:27:48 -0400
Subject: [PATCH v4 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <20190313101843.800dd8d6a9babb635580ebdc@kernel.org>
References: <20190309121141.GA30173@kroah.com>
 <b7296377-9e0c-aed7-61f0-93d24d1ceddd@opersys.com>
 <CAMuHMdV8+XTyGf1ZJ+gMf=zQpzqh3-+b7wgi+gAmXQ6HpUAw3A@mail.gmail.com>
 <3e84e1ef-e266-e983-5874-6c26ac7f38b8@opersys.com>
 <20190311193612.4f09bf11@oasis.local.home>
 <CAKOZuetHG0O-CiO6h5tD7aht_MT70ebwWMMSPkRUHdiM3wVq0Q@mail.gmail.com>
 <20190312003912.GA170478@google.com>
 <20190311212823.60684182@oasis.local.home>
 <CAJWu+oqsD_wHGWfzj6POFowiY2qcu04auVzkA6Lu9R+LR4gkrQ@mail.gmail.com>
 <20190313101843.800dd8d6a9babb635580ebdc@kernel.org>
Message-ID: <20190314122748.GA101545@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190314122748.vc_12-go2NAPmUx_FAPHEsxLD5eaQBCRdGqz6rBj32c@z>

Hi Masami,
Sorry for late reply as I was traveling.

On Wed, Mar 13, 2019@10:18:43AM +0900, Masami Hiramatsu wrote:
> On Mon, 11 Mar 2019 18:38:49 -0700
> Joel Fernandes <joelaf@google.com> wrote:
> 
> > On Mon, Mar 11, 2019@6:28 PM Steven Rostedt <rostedt@goodmis.org> wrote:
> > >
> > > On Mon, 11 Mar 2019 20:39:12 -0400
> > > Joel Fernandes <joel@joelfernandes.org> wrote:
> > >
> > > > I think even though the kernel-headers can't have information about all data
> > > > structures, they do already contain a lot of data structure definitions we
> > > > need already. And anything needed can/should arguably be moved to include/ if
> > > > they are really needed for kernel extension by something "external" to the
> > > > kernel such as kernel modules or eBPF, right?
> > >
> > > That's not my worry. I would like to be able to easily walk data
> > > structures from within the kernel, without having to do a lot of work
> > > in userspace to get that information. The kprobe_events could then be
> > > passed type casts or such to access data fields of arguments to
> > > functions and such.
> > 
> > Ok.
> > 
> > > > In any case, such a solution such as what Steve suggested, still cannot do
> > > > what we can with headers - such as build kernel modules on the fly using the
> > > > C-compiler without any auto-generation of C code from any debug artifiacts.
> > > > Think systemtap working with the module-backend without any need for
> > > > linux-headers package on the file system. So such a solution would still be a
> > > > bit orthogonal in scope to what this proposed solution can solve IMO.
> > > >
> > >
> > > With the information I would like to have, it would be trivial to read
> > > the data to create the header files needed for modules.
> > 
> > But there are macros and other #define things too. We lose all of them
> > and can't recreate them from just DWARF (AFAIK). Including
> > include/generated/autoconf.h which #defines the CONFIG options. For
> > that we either need headers, or full kernel's sources with build
> > artifacts.
> 
> What kind of macros would you concern?
> 
> > I do see a use case for the debug info you are talking about as you
> > mentioned for the kprobe_events argument list types, and I already
> > thought about it. But it does not seem to work for all the use cases I
> > am referring to here.
> 
> But the eBPF is based on kprobe-events. What kind of usage would you
> expected? (with macros??)

eBPF C programs are compiled with kernel headers. They can execute inline
functions or refer to macros in the kernel headers. They are similar to
kernel modules where you build a C program that then later is executed in
kernel context. It goes through the whole compiler pipeline. This is slightly
different usage from pure kprobe-events.  Also eBPF kprobe programs need
LINUX_VERSION_CODE (or similarly named) macro which it provides to the bpf(2)
syscall when loading kprobe programs. This is because eBPF implementation in
the kernel checks if the eBPF programs that use kprobes are being loaded
against the right kernel.

thanks,

- Joel
