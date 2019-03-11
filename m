From: rostedt@goodmis.org (Steven Rostedt)
Date: Mon, 11 Mar 2019 19:36:12 -0400
Subject: [PATCH v4 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <3e84e1ef-e266-e983-5874-6c26ac7f38b8@opersys.com>
References: <20190301160856.129678-1-joel@joelfernandes.org>
 <CAMuHMdU77UyUs-LvRx-NN_k0Y7MZXQkBdgL2i83veCkvdzeeqA@mail.gmail.com>
 <20190307150343.GB258852@google.com>
 <CAMuHMdW_7BTZREsnz7uMTToCZ4HDOZboMJH8k8UZica2pB=Jew@mail.gmail.com>
 <CAEXW_YQUcA+bnav20tAFQPXYE=epMie4X85diudKs_s-TJ7dsw@mail.gmail.com>
 <20190308140251.GC25768@kroah.com>
 <CAMuHMdUmnrJtu8bBeUgtiU6y_TLHM27z1WxpPia4dXMpApeijw@mail.gmail.com>
 <20190309071648.GE3882@kroah.com>
 <CAMuHMdUT+UGt9p2QhOXzAtCUmqy-a8YN-ceDa-0qANJE53pWBA@mail.gmail.com>
 <20190309121141.GA30173@kroah.com>
 <b7296377-9e0c-aed7-61f0-93d24d1ceddd@opersys.com>
 <CAMuHMdV8+XTyGf1ZJ+gMf=zQpzqh3-+b7wgi+gAmXQ6HpUAw3A@mail.gmail.com>
 <3e84e1ef-e266-e983-5874-6c26ac7f38b8@opersys.com>
Message-ID: <20190311193612.4f09bf11@oasis.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190311233612.alQaHFF5FBOPJcV_3o5ocQgiBWFEtfKmF6vmQOIqbBw@z>

On Sat, 9 Mar 2019 16:44:31 -0500
Karim Yaghmour <karim.yaghmour@opersys.com> wrote:


> Sorry, I should've been clearer. I'm including eBPF/BCC into the 
> "user-space tools" here. That was in fact my prime motivation in 
> encouraging Joel at the last LPC to look at this. I've been integrating 
> the teaching of eBPF into my AOSP debugging and performance analysis 
> class (see CC courseware here: 
> http://www.opersys.com/training/android-debug-and-performance), and it 
> was pretty messy trying to show people how to benefit from such tools 
> under Android. Joel's present set of patches would obviate this problem.

I've been reading this thread and staying out for the most part. But I
was thinking about how I could use kernel headers for things like
kprobes, and I want to mention the pony that I would like to have :-)

Are headers really needed, and more importantly, are they enough? What
if userspace is 32bit and the kernel is 64bit. Can ebpf scripts handle
that?

What I would love, is a table that has all structures and their fields
with information about their types, size and signed types. Like the
format fields in the events directory. This way ebpf (and kprobes,
internally in the kernel) could access this table and be able to know
what the data structures of the kernel is).

If you need it for modules, it shouldn't be too hard to take this
information and turn it into headers that building modules could use.

Again, this is my pony, but I'd like to think outside the box here, and
not be so focused on "headers" and see if there's another solution,
that may be even more powerful.

-- Steve
