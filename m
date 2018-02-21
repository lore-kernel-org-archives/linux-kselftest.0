From: daniel.diaz@linaro.org (=?UTF-8?Q?Daniel_D=c3=adaz?=)
Date: Wed, 21 Feb 2018 17:04:36 -0600
Subject: [PATCH 2/2] selftests/gpio: Fix OUTPUT directory in Makefile
In-Reply-To: <CAHp75VdMCaKnqbUPzU2QTxOk6gjyor69w+sVVoaKyjnO+zU=+A@mail.gmail.com>
References: <1519249964-1630-1-git-send-email-daniel.diaz@linaro.org>
 <1519249964-1630-2-git-send-email-daniel.diaz@linaro.org>
 <CAHp75VdMCaKnqbUPzU2QTxOk6gjyor69w+sVVoaKyjnO+zU=+A@mail.gmail.com>
Message-ID: <8e7b8d40-99ac-3f4f-a25d-e0df0dd104d5@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180221230436.l-vq7b9pmdVPL7wxEOQuG7iOPNUtfr6pYCYmSfTfiFA@z>

Hello!


On 02/21/2018 04:09 PM, Andy Shevchenko wrote:
> On Wed, Feb 21, 2018@11:52 PM, Daniel Díaz <daniel.diaz@linaro.org> wrote:
>> When simply running `make' from the selftests top dir, this
>> error shows up:
>>
>>   cc -O2 -g -std=gnu99 -Wall -I../../../../usr/include/ -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/uuid    gpio-mockup-chardev.c ../../../gpio/gpio-utils.o  -lmount -o gpio-mockup-chardev
>>   cc: error: ../../../gpio/gpio-utils.o: No such file or directory
>>   <builtin>: recipe for target 'gpio-mockup-chardev' failed
>>   make[1]: *** [gpio-mockup-chardev] Error 1
>>
>> because the output directory is set to "selftests/gpio" and
>> all binaries built from ../../../gpio/ end up there. In fact,
>> they appear as, exempli gratia:
>> * gpiogpio-event-mon
>> * gpiogpio-hammer
>> * gpioinclude/
>> * gpiolsgpio
>> which is wrong, as it's missing directory separator somewhere.
>>
>> This patch sets straight the output directory when building
>> ../../../gpio/ so that binaries don't cross paths.
> 
> This patch doesn't sound right like previous one.
> Does selftest infrastructure have it's own build system like tools?

Yes. See linux/Documentation/dev-tools/kselftest.rst § "Contributing new
tests (details)" or linux/tools/testing/selftests/lib.mk itself, which
starts saying:
# This mimics the top-level Makefile. We do it explicitly here so that this
# Makefile can operate with or without the kbuild infrastructure.


> Does it use tools' one?

No, as far as I can tell. If anything, it uses it only to build inside
tools/gpio/ whatever is needed.


> What's wrong with the current approach?

When building from the tools/testing/selftests/ directory, binaries end
up in the current directory (and with an improper name), which is
undesirable. The gpio/ selftest fails to build when make'ing from there.

This is with current master:
  /linux/tools/testing/selftests$ make
  make[1]: Entering directory '/linux/tools/testing/selftests/gpio'
  [...]
  gcc -O2 -g -std=gnu99 -Wall -I../../../../usr/include/
gpio-mockup-chardev.c ../../../gpio/gpio-utils.o
../../../../usr/include/linux/gpio.h  -lmount -I/usr/include/libmount -o
gpio-mockup-chardev
  gcc: error: ../../../gpio/gpio-utils.o: No such file or directory
  <builtin>: recipe for target 'gpio-mockup-chardev' failed
  make[1]: *** [gpio-mockup-chardev] Error 1
  make[1]: Leaving directory '/linux/tools/testing/selftests/gpio'
  Makefile:32: recipe for target 'all' failed
  make: *** [all] Error 2


> Why do you need tools in selftests?

I'll leave that to the test author to answer, as this is only a fix in
the Makefile, but the only part of tools needed here is tools/gpio/*,
for make'ing the object files this test will be built against.

Thanks and greetings!

Daniel Díaz
daniel.diaz at linaro.org

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
