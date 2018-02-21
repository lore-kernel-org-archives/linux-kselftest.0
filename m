From: andy.shevchenko at gmail.com (Andy Shevchenko)
Date: Thu, 22 Feb 2018 00:09:54 +0200
Subject: [PATCH 2/2] selftests/gpio: Fix OUTPUT directory in Makefile
In-Reply-To: <1519249964-1630-2-git-send-email-daniel.diaz@linaro.org>
References: <1519249964-1630-1-git-send-email-daniel.diaz@linaro.org>
 <1519249964-1630-2-git-send-email-daniel.diaz@linaro.org>
Message-ID: <CAHp75VdMCaKnqbUPzU2QTxOk6gjyor69w+sVVoaKyjnO+zU=+A@mail.gmail.com>

On Wed, Feb 21, 2018 at 11:52 PM, Daniel Díaz <daniel.diaz at linaro.org> wrote:
> When simply running `make' from the selftests top dir, this
> error shows up:
>
>   cc -O2 -g -std=gnu99 -Wall -I../../../../usr/include/ -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/uuid    gpio-mockup-chardev.c ../../../gpio/gpio-utils.o  -lmount -o gpio-mockup-chardev
>   cc: error: ../../../gpio/gpio-utils.o: No such file or directory
>   <builtin>: recipe for target 'gpio-mockup-chardev' failed
>   make[1]: *** [gpio-mockup-chardev] Error 1
>
> because the output directory is set to "selftests/gpio" and
> all binaries built from ../../../gpio/ end up there. In fact,
> they appear as, exempli gratia:
> * gpiogpio-event-mon
> * gpiogpio-hammer
> * gpioinclude/
> * gpiolsgpio
> which is wrong, as it's missing directory separator somewhere.
>
> This patch sets straight the output directory when building
> ../../../gpio/ so that binaries don't cross paths.

This patch doesn't sound right like previous one.
Does selftest infrastructure have it's own build system like tools?
Does it use tools' one?
What's wrong with the current approach?
Why do you need tools in selftests?

-- 
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
