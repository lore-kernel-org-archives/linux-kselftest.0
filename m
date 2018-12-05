From: linus.walleij at linaro.org (Linus Walleij)
Date: Wed, 5 Dec 2018 22:49:58 +0100
Subject: [PATCH] selftests: gpio: Find libmount with pkg-config if
 available
In-Reply-To: <20181016214659.22362-1-daniel.diaz@linaro.org>
References: <20181016214659.22362-1-daniel.diaz@linaro.org>
Message-ID: <CACRpkda1i_NDnBGgrEoY2ewdSvSnJFVLWWvmSGCu0sNS0hLyiQ@mail.gmail.com>

Sorry for top-posting,

I don't understand the selftest environment very well so I do not know
if this is the right thing to do.

I can merge the patch through the GPIO tree but I need a nod from
someone wise, like Shuah Khan or Anders Roxell (Anders has been
using the GPIO selftests) that this is the direction we want to go.

Yours,
Linus Walleij

On Tue, Oct 16, 2018 at 11:47 PM Daniel Díaz <daniel.diaz at linaro.org> wrote:

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
>
