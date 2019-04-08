From: dave at stgolabs.net (Davidlohr Bueso)
Date: Mon, 8 Apr 2019 13:01:41 -0700
Subject: [PATCH] selftests/ipc: Fix msgque compiler warnings
In-Reply-To: <20190408171344.GA22803@beast>
References: <20190408171344.GA22803@beast>
Message-ID: <20190408200141.uusxqlqly6tab6h7@linux-r8p5>

On Mon, 08 Apr 2019, Kees Cook wrote:

>This fixes the various compiler warnings when building the msgque
>selftest. The primary change is using sys/msg.h instead of linux/msg.h
>directly to gain the API declarations.
>
>Fixes: 3a665531a3b7 ("selftests: IPC message queue copy feature test")
>Signed-off-by: Kees Cook <keescook at chromium.org>

(Not really related to this patch)

Given that the selftest/ipc/ only consists of this test, I wonder if
the test should just be moved to ltp, where the ipc tests are a lot
more complete and robust -- and which I've been using for years for
basic testing code changes.

Don't get me wrong, I'm all for having ipc tests in the kernel, but it
seems rather impractical to have them in both places considering the
relevance of ltp in the community and how long they have existed there.

I'm also speaking on the basis that by ipc we are referring only to
sysv and posix flavors.

Thanks,
Davidlohr
