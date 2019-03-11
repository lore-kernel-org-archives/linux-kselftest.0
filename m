From: geert@linux-m68k.org (Geert Uytterhoeven)
Date: Mon, 11 Mar 2019 09:03:04 +0100
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
Message-ID:
 <CAMuHMdVw=b_oS70F1LhXV0b9fn_p6OuCo2RDUQC=49PdJVW7xA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190311080304.0Cj4ITBqboOFKxOojtKpFwkRKAZ6aqGQuu44BxaKuec@z>

Hi Karim,

On Sat, Mar 9, 2019 at 10:44 PM Karim Yaghmour
<karim.yaghmour@opersys.com> wrote:
> On 3/9/19 2:26 PM, Geert Uytterhoeven wrote:
> > So how does this work, with kernel images and kernel modules supplied
> > by separate parties, not "bound" by the same kernel headers/API, as they
> > can be replaced separately?
>
> The thing with Android is that there isn't a "one size fits all". Google
> provides guidance, policies and at least one example implementation
> through the Pixel lines.
>
> Each vendor however is allowed a great degree of latitude with regards
> to what they decide to do. Personally, if I was advising a team working
> on an Android device where Joel's patch was available as part of their
> kernel I would just recommend that they build it in -- i.e. not as a
> module. Hence, there would be no module chasing game.

OK, that makes sense, if kernel and modules are separate.
So kernel size increase due to including the headers does matter.

> With regards to Google's guidelines for manufacturers, though, Google
> states that CONFIG_MODVERSIONS needs to be enabled, see here:
> https://source.android.com/devices/architecture/kernel/modular-kernels
> FWIW, that doesn't mean that modules are actually used. Devices don't
> necessarily have to be using modules.

Personally, I had mixed experiences with CONFIG_MODVERSIONS.
But that was a looong time ago, before Android.
Things may have improved.

> > Isn't the need for kernel headers for user-space tools something different,
> > as this is limited to the uapi versions, which are less (almost not) subject
> > to change, compared to the kernel headers needed for compiling kernel
> > modules?
>
> Sorry, I should've been clearer. I'm including eBPF/BCC into the
> "user-space tools" here. That was in fact my prime motivation in
> encouraging Joel at the last LPC to look at this. I've been integrating
> the teaching of eBPF into my AOSP debugging and performance analysis
> class (see CC courseware here:
> http://www.opersys.com/training/android-debug-and-performance), and it
> was pretty messy trying to show people how to benefit from such tools
> under Android. Joel's present set of patches would obviate this problem.

OK.

Now about the actual solution: what is your opinion on embedding e.g.
a squashfs image in the kernel instead, which would be a more generic
solution, not adding more ABI to /proc?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert at linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
