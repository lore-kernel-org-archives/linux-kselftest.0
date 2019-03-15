From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Fri, 15 Mar 2019 22:14:07 +0900
Subject: [PATCH v4 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <20190314122748.GA101545@google.com>
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
 <20190314122748.GA101545@google.com>
Message-ID: <20190315221407.790154f634fc5fc084d7bf15@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190315131407.2vxmZR2dJKLfS5hRvWTcWrp5NLxEbeNBws_wXWsl24Q@z>

On Thu, 14 Mar 2019 08:27:48 -0400
Joel Fernandes <joel@joelfernandes.org> wrote:

> > But the eBPF is based on kprobe-events. What kind of usage would you
> > expected? (with macros??)
> 
> eBPF C programs are compiled with kernel headers. They can execute inline
> functions or refer to macros in the kernel headers. They are similar to
> kernel modules where you build a C program that then later is executed in
> kernel context. It goes through the whole compiler pipeline. This is slightly
> different usage from pure kprobe-events.  Also eBPF kprobe programs need
> LINUX_VERSION_CODE (or similarly named) macro which it provides to the bpf(2)
> syscall when loading kprobe programs. This is because eBPF implementation in
> the kernel checks if the eBPF programs that use kprobes are being loaded
> against the right kernel.

Ah, I got it. It's similar to SystemTap. :)

Thank you,

-- 
Masami Hiramatsu <mhiramat at kernel.org>
