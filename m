From: tycho at tycho.ws (Tycho Andersen)
Date: Thu, 17 Jan 2019 09:45:31 -0700
Subject: Linux 5.0-rc2 seccomp_bpf user_notification_basic test hangs
In-Reply-To: <CAGXu5jJOGO1UWdYdGmnnUEZOm-DaMUqR3UVSi+gnSc7q3KE8xA@mail.gmail.com>
References: <7cd7d5bc-1d69-57f5-4a98-81b036f81682@kernel.org>
 <CAGXu5jLGqXstRCmM1_fxUxn4djs1YLUun2Fc8ExcaN4-CKyELQ@mail.gmail.com>
 <20190117004416.GA17449@cisco>
 <f665bb74-293b-d627-2605-5b8de7671743@kernel.org>
 <CAGXu5jJ0VK4UiOeKTqv_TZSn5aZAVsXjUZgiXD=KFbZ-Ng_+KQ@mail.gmail.com>
 <20190117162703.GC17449@cisco>
 <CAGXu5jJOGO1UWdYdGmnnUEZOm-DaMUqR3UVSi+gnSc7q3KE8xA@mail.gmail.com>
Message-ID: <20190117164531.GD17449@cisco>

On Thu, Jan 17, 2019 at 08:41:59AM -0800, Kees Cook wrote:
> On Thu, Jan 17, 2019 at 8:27 AM Tycho Andersen <tycho at tycho.ws> wrote:
> >
> > On Thu, Jan 17, 2019 at 08:12:50AM -0800, Kees Cook wrote:
> > > On Wed, Jan 16, 2019 at 5:26 PM shuah <shuah at kernel.org> wrote:
> > > > I am running Linux 5.0-rc2 and not an older kernel.
> > >
> > > Weird. I couldn't reproduce this on 5.0-rc2, but I did see it on a
> > > kernel without seccomp user_notif. Does the patch I sent fix it for
> > > you? (And if so, can you take it in your tree?)
> >
> > I can reproduce it; you have to run it as non-root. I think your patch
> > is necessary to get it to at least fail. The question is: what should
> > we do about these tests that require real root? Skip them if we're not
> > real-root, I guess?
> 
> Hm, maybe use the XFAIL() bit of the harness?
> 
> Perhaps it's time to make it a root-only test and do internal
> priv-dropping to test the nnp-requiring parts? I'll add it to the TODO
> list...

Ok, I'll try to send a couple of patches soon to fix some of this up.
But at least yours should should stop things from hanging for now.

Thanks,

Tycho
