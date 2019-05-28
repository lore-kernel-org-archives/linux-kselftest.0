From: mpe at ellerman.id.au (Michael Ellerman)
Date: Tue, 28 May 2019 13:22:10 +1000
Subject: [PATCH v3 3/3] tests: add close_range() tests
In-Reply-To: <20190524111047.6892-4-christian@brauner.io>
References: <20190524111047.6892-1-christian@brauner.io>
 <20190524111047.6892-4-christian@brauner.io>
Message-ID: <87zhn7p8kd.fsf@concordia.ellerman.id.au>

Christian Brauner <christian at brauner.io> writes:
> This adds basic tests for the new close_range() syscall.
> - test that no invalid flags can be passed
> - test that a range of file descriptors is correctly closed
> - test that a range of file descriptors is correctly closed if there there
>   are already closed file descriptors in the range
> - test that max_fd is correctly capped to the current fdtable maximum
>
> Signed-off-by: Christian Brauner <christian at brauner.io>
> Cc: Arnd Bergmann <arnd at arndb.de>
> Cc: Jann Horn <jannh at google.com>
> Cc: David Howells <dhowells at redhat.com>
> Cc: Dmitry V. Levin <ldv at altlinux.org>
> Cc: Oleg Nesterov <oleg at redhat.com>
> Cc: Linus Torvalds <torvalds at linux-foundation.org>
> Cc: Florian Weimer <fweimer at redhat.com>
> Cc: Shuah Khan <shuah at kernel.org>
> Cc: linux-api at vger.kernel.org
> Cc: linux-kselftest at vger.kernel.org
> ---
> v1: unchanged
> v2:
> - Christian Brauner <christian at brauner.io>:
>   - verify that close_range() correctly closes a single file descriptor
> v3:
> - Christian Brauner <christian at brauner.io>:
>   - add missing Cc for Shuah
>   - add missing Cc for linux-kselftest

Sorry I replied to v2, but I think my comments still apply:

https://lore.kernel.org/lkml/8736kzqpdm.fsf at concordia.ellerman.id.au/

cheers
