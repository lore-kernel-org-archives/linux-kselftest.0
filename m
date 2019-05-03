From: rostedt at goodmis.org (Steven Rostedt)
Date: Fri, 3 May 2019 10:33:15 -0400
Subject: [PATCH v7 resend 1/2] Provide in-kernel headers to make
 extending kernel easier
In-Reply-To: <20190429142425.GB29007@kroah.com>
References: <20190426190430.172543-1-joel@joelfernandes.org>
 <20190427133844.GA29366@kroah.com>
 <20190429132602.GA165075@google.com>
 <20190429135455.GA2412@kroah.com>
 <CAK7LNARkGLQ_P4LSuC69QN8XPN47W5ujkDE3EauLrwnBgygsSA@mail.gmail.com>
 <20190429142425.GB29007@kroah.com>
Message-ID: <20190503103315.0149ca71@gandalf.local.home>

On Mon, 29 Apr 2019 16:24:25 +0200
Greg KH <gregkh at linuxfoundation.org> wrote:

> Hah, ok, I'll be glad to queue this up in my tree.  I'll take it now,
> and if people who really object to this being in /proc/ and want it in
> /sys/, we can add a follow-on patch before 5.2-final is out to move the
> file to that location.

I really don't think putting it in /proc now is a good idea. Let's put
it in /sys now. If we don't do it now and it gets into a main release,
then that will become the permanent location for it.

-- Steve
