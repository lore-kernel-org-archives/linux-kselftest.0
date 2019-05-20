From: geert at linux-m68k.org (Geert Uytterhoeven)
Date: Mon, 20 May 2019 16:00:44 +0200
Subject: [PATCH v2 1/2] pid: add pidfd_open()
In-Reply-To: <20190520134605.29116-1-christian@brauner.io>
References: <20190520134605.29116-1-christian@brauner.io>
Message-ID: <CAMuHMdVfy-fWVGzd8orLHbC=pOmUH-ocvhjj2DCZdEQRxctYQA@mail.gmail.com>

On Mon, May 20, 2019 at 3:46 PM Christian Brauner <christian at brauner.io> wrote:
> This adds the pidfd_open() syscall. It allows a caller to retrieve pollable
> pidfds for a process which did not get created via CLONE_PIDFD, i.e. for a
> process that is created via traditional fork()/clone() calls that is only
> referenced by a PID:
>
> int pidfd = pidfd_open(1234, 0);
> ret = pidfd_send_signal(pidfd, SIGSTOP, NULL, 0);
>
> With the introduction of pidfds through CLONE_PIDFD it is possible to
> created pidfds at process creation time.
> However, a lot of processes get created with traditional PID-based calls
> such as fork() or clone() (without CLONE_PIDFD). For these processes a
> caller can currently not create a pollable pidfd. This is a problem for
> Android's low memory killer (LMK) and service managers such as systemd.
> Both are examples of tools that want to make use of pidfds to get reliable
> notification of process exit for non-parents (pidfd polling) and race-free
> signal sending (pidfd_send_signal()). They intend to switch to this API for
> process supervision/management as soon as possible. Having no way to get
> pollable pidfds from PID-only processes is one of the biggest blockers for
> them in adopting this api. With pidfd_open() making it possible to retrieve
> pidfds for PID-based processes we enable them to adopt this api.
>
> In line with Arnd's recent changes to consolidate syscall numbers across
> architectures, I have added the pidfd_open() syscall to all architectures
> at the same time.
>
> Signed-off-by: Christian Brauner <christian at brauner.io>
> Reviewed-by: Oleg Nesterov <oleg at redhat.com>

>  arch/m68k/kernel/syscalls/syscall.tbl       |  1 +

Acked-by: Geert Uytterhoeven <geert at linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert at linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
