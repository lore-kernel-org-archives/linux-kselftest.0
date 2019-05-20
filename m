From: arnd@arndb.de (Arnd Bergmann)
Date: Mon, 20 May 2019 16:37:03 +0200
Subject: [PATCH v2 1/2] pid: add pidfd_open()
In-Reply-To: <20190520134605.29116-1-christian@brauner.io>
References: <20190520134605.29116-1-christian@brauner.io>
Message-ID:
 <CAK8P3a1cZZ6SQe5mGjhga=MgTvCGF6OKyjvosR8J6z6EpH+rVA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190520143703._uxF_w-HiLpeYqAa1GC1z73Wcqsb6lEACHWgLnglzms@z>

On Mon, May 20, 2019@3:46 PM Christian Brauner <christian@brauner.io> wrote:
>
> In line with Arnd's recent changes to consolidate syscall numbers across
> architectures, I have added the pidfd_open() syscall to all architectures
> at the same time.

Thanks! I've checked that the ones you have added are all
done correctly. However, double-checking that you got all of them,
I noticed that you missed mips-o32 and mips-n64. With those added:

Acked-by: Arnd Bergmann <arnd at arndb.de>
