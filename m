From: rostedt at goodmis.org (Steven Rostedt)
Date: Mon, 11 Mar 2019 21:28:23 -0400
Subject: [PATCH v4 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <20190312003912.GA170478@google.com>
References: <20190308140251.GC25768@kroah.com>
 <CAMuHMdUmnrJtu8bBeUgtiU6y_TLHM27z1WxpPia4dXMpApeijw@mail.gmail.com>
 <20190309071648.GE3882@kroah.com>
 <CAMuHMdUT+UGt9p2QhOXzAtCUmqy-a8YN-ceDa-0qANJE53pWBA@mail.gmail.com>
 <20190309121141.GA30173@kroah.com>
 <b7296377-9e0c-aed7-61f0-93d24d1ceddd@opersys.com>
 <CAMuHMdV8+XTyGf1ZJ+gMf=zQpzqh3-+b7wgi+gAmXQ6HpUAw3A@mail.gmail.com>
 <3e84e1ef-e266-e983-5874-6c26ac7f38b8@opersys.com>
 <20190311193612.4f09bf11@oasis.local.home>
 <CAKOZuetHG0O-CiO6h5tD7aht_MT70ebwWMMSPkRUHdiM3wVq0Q@mail.gmail.com>
 <20190312003912.GA170478@google.com>
Message-ID: <20190311212823.60684182@oasis.local.home>

On Mon, 11 Mar 2019 20:39:12 -0400
Joel Fernandes <joel at joelfernandes.org> wrote:

> I think even though the kernel-headers can't have information about all data
> structures, they do already contain a lot of data structure definitions we
> need already. And anything needed can/should arguably be moved to include/ if
> they are really needed for kernel extension by something "external" to the
> kernel such as kernel modules or eBPF, right?

That's not my worry. I would like to be able to easily walk data
structures from within the kernel, without having to do a lot of work
in userspace to get that information. The kprobe_events could then be
passed type casts or such to access data fields of arguments to
functions and such.

> 
> In any case, such a solution such as what Steve suggested, still cannot do
> what we can with headers - such as build kernel modules on the fly using the
> C-compiler without any auto-generation of C code from any debug artifiacts.
> Think systemtap working with the module-backend without any need for
> linux-headers package on the file system. So such a solution would still be a
> bit orthogonal in scope to what this proposed solution can solve IMO.
> 

With the information I would like to have, it would be trivial to read
the data to create the header files needed for modules.

-- Steve
