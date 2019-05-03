From: joel@joelfernandes.org (Joel Fernandes)
Date: Fri, 3 May 2019 11:08:25 -0400
Subject: [PATCH v7 resend 1/2] Provide in-kernel headers to make
 extending kernel easier
In-Reply-To: <20190503103315.0149ca71@gandalf.local.home>
References: <20190426190430.172543-1-joel@joelfernandes.org>
 <20190427133844.GA29366@kroah.com>
 <20190429132602.GA165075@google.com>
 <20190429135455.GA2412@kroah.com>
 <CAK7LNARkGLQ_P4LSuC69QN8XPN47W5ujkDE3EauLrwnBgygsSA@mail.gmail.com>
 <20190429142425.GB29007@kroah.com>
 <20190503103315.0149ca71@gandalf.local.home>
Message-ID: <20190503150825.GC253329@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190503150825.BpjkN8jNCG7juX9zr850UC51SSfWDRxYFnPIx4Urwko@z>

On Fri, May 03, 2019@10:33:15AM -0400, Steven Rostedt wrote:
> On Mon, 29 Apr 2019 16:24:25 +0200
> Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> > Hah, ok, I'll be glad to queue this up in my tree.  I'll take it now,
> > and if people who really object to this being in /proc/ and want it in
> > /sys/, we can add a follow-on patch before 5.2-final is out to move the
> > file to that location.
> 
> I really don't think putting it in /proc now is a good idea. Let's put
> it in /sys now. If we don't do it now and it gets into a main release,
> then that will become the permanent location for it.

I will send a patch to move it into /sys/kernel on top of this. Hope everyone
else is also Ok with that as the location.

thanks,

 - Joel
