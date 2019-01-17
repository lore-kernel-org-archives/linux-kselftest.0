From: tycho@tycho.ws (Tycho Andersen)
Date: Thu, 17 Jan 2019 09:27:03 -0700
Subject: Linux 5.0-rc2 seccomp_bpf user_notification_basic test hangs
In-Reply-To: <CAGXu5jJ0VK4UiOeKTqv_TZSn5aZAVsXjUZgiXD=KFbZ-Ng_+KQ@mail.gmail.com>
References: <7cd7d5bc-1d69-57f5-4a98-81b036f81682@kernel.org>
 <CAGXu5jLGqXstRCmM1_fxUxn4djs1YLUun2Fc8ExcaN4-CKyELQ@mail.gmail.com>
 <20190117004416.GA17449@cisco>
 <f665bb74-293b-d627-2605-5b8de7671743@kernel.org>
 <CAGXu5jJ0VK4UiOeKTqv_TZSn5aZAVsXjUZgiXD=KFbZ-Ng_+KQ@mail.gmail.com>
Message-ID: <20190117162703.GC17449@cisco>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190117162703.PB4_4jWy5b1cdq1FDQyArjhVihRR9bWDY32hmJU7hLc@z>

On Thu, Jan 17, 2019@08:12:50AM -0800, Kees Cook wrote:
> On Wed, Jan 16, 2019@5:26 PM shuah <shuah@kernel.org> wrote:
> > I am running Linux 5.0-rc2 and not an older kernel.
> 
> Weird. I couldn't reproduce this on 5.0-rc2, but I did see it on a
> kernel without seccomp user_notif. Does the patch I sent fix it for
> you? (And if so, can you take it in your tree?)

I can reproduce it; you have to run it as non-root. I think your patch
is necessary to get it to at least fail. The question is: what should
we do about these tests that require real root? Skip them if we're not
real-root, I guess?

Tycho
