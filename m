From: keescook@chromium.org (Kees Cook)
Date: Thu, 17 Jan 2019 08:12:50 -0800
Subject: Linux 5.0-rc2 seccomp_bpf user_notification_basic test hangs
In-Reply-To: <f665bb74-293b-d627-2605-5b8de7671743@kernel.org>
References: <7cd7d5bc-1d69-57f5-4a98-81b036f81682@kernel.org>
 <CAGXu5jLGqXstRCmM1_fxUxn4djs1YLUun2Fc8ExcaN4-CKyELQ@mail.gmail.com>
 <20190117004416.GA17449@cisco>
 <f665bb74-293b-d627-2605-5b8de7671743@kernel.org>
Message-ID:
 <CAGXu5jJ0VK4UiOeKTqv_TZSn5aZAVsXjUZgiXD=KFbZ-Ng_+KQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190117161250.1rlB8xHlSeVKiD3WYzpWqI7-gbo4PK2Xqwut_pta9Pw@z>

On Wed, Jan 16, 2019@5:26 PM shuah <shuah@kernel.org> wrote:
> I am running Linux 5.0-rc2 and not an older kernel.

Weird. I couldn't reproduce this on 5.0-rc2, but I did see it on a
kernel without seccomp user_notif. Does the patch I sent fix it for
you? (And if so, can you take it in your tree?)

Thanks!

-- 
Kees Cook
