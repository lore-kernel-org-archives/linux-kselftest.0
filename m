From: daniel.diaz at linaro.org (=?UTF-8?B?RGFuaWVsIETDrWF6?=)
Date: Tue, 20 Nov 2018 09:34:21 -0600
Subject: [PATCH] selftests: gpio: Find libmount with pkg-config if
 available
In-Reply-To: <20181016214659.22362-1-daniel.diaz@linaro.org>
References: <20181016214659.22362-1-daniel.diaz@linaro.org>
Message-ID: <CAEUSe7-6xWWMhb4qm5eNbTrXwC5FFSn9-QS8S0APk03tJLiSUQ@mail.gmail.com>

Hello!


On Tue, 16 Oct 2018 at 16:47, Daniel Díaz <daniel.diaz at linaro.org> wrote:
> If pkg-config is available, use it to define the CFLAGS and
> LDLIBS needed for libmount; else, use the current hard-coded
> paths and options.
>
> Using pkg-config is very helpful for cross-compilation
> environments, and is sometimes readily available on developer
> boxes to ensure we get the right compiler/linker options for
> the given package.
>
> Signed-off-by: Daniel Díaz <daniel.diaz at linaro.org>
> ---
>  tools/testing/selftests/gpio/Makefile | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/gpio/Makefile b/tools/testing/selftests/gpio/Makefile
> index 46648427d537..f22b22aef7bf 100644
> --- a/tools/testing/selftests/gpio/Makefile
> +++ b/tools/testing/selftests/gpio/Makefile
> @@ -1,7 +1,13 @@
>  # SPDX-License-Identifier: GPL-2.0
>
> -CFLAGS += -O2 -g -std=gnu99 -Wall -I../../../../usr/include/
> -LDLIBS += -lmount -I/usr/include/libmount
> +MOUNT_CFLAGS := $(shell pkg-config --cflags mount 2>/dev/null)
> +MOUNT_LDLIBS := $(shell pkg-config --libs mount 2>/dev/null)
> +ifeq ($(MOUNT_LDLIBS),)
> +MOUNT_LDLIBS := -lmount -I/usr/include/libmount
> +endif
> +
> +CFLAGS += -O2 -g -std=gnu99 -Wall -I../../../../usr/include/ $(MOUNT_CFLAGS)
> +LDLIBS += $(MOUNT_LDLIBS)
>
>  TEST_PROGS := gpio-mockup.sh
>  TEST_FILES := gpio-mockup-sysfs.sh
> --
> 2.17.1

Ping on this patch.

Greetings!

Daniel Díaz
daniel.diaz at linaro.org
