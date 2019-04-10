From: keescook@chromium.org (Kees Cook)
Date: Wed, 10 Apr 2019 12:54:35 -0700
Subject: secomp_bpf test hangs after
 global.user_notification_sibling_pid_ns
In-Reply-To: <eee08d39-7427-5c07-9efe-b5719b2232a4@kernel.org>
References: <eee08d39-7427-5c07-9efe-b5719b2232a4@kernel.org>
Message-ID:
 <CAGXu5jKOW_3YvABMZdPa0xAF4-tenQfymooynVssbt7keCv3SA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190410195435.EvMWc0FU-MGRqBkFbRkHq0ZAk3nZGolba-Sfcu36pOw@z>

On Tue, Apr 9, 2019@7:38 AM shuah <shuah@kernel.org> wrote:
>
> Hi Kees,
>
> secomp_bpf test hangs after global.user_notification_sibling_pid_ns
> when a non-root user runs it on 5.1-rc4
>
> I thought you fixed the problem with this commit:
>
> commit 3d244c192afeee7dd4f5fb1b916ea4e47420d401
> Author: Kees Cook <keescook at chromium.org>
> Date:   Wed Jan 16 16:35:25 2019 -0800
>
>      selftests/seccomp: Abort without user notification support

Weird! I'm looking at this now. I'm not sure what's changed yet, but
I'll keep digging.

Thanks for letting me know!

-Kees

-- 
Kees Cook
