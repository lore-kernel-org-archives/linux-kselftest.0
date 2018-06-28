From: rafael.tinoco@linaro.org (Rafael Tinoco)
Date: Wed, 27 Jun 2018 22:15:37 -0300
Subject: [PATCH] selftests: gpio: gpio-mockup-chardev
 GPIOHANDLE_REQUEST_OUTPUT fix
In-Reply-To: <CACRpkdZ82RNta7LGp4OB=6TY_q3mdqGGDedayz-C4hB9m7WG9Q@mail.gmail.com>
References: <20180606174424.9630-1-rafael.tinoco@linaro.org>
 <CACRpkdZ82RNta7LGp4OB=6TY_q3mdqGGDedayz-C4hB9m7WG9Q@mail.gmail.com>
Message-ID:
 <CADtBP2CzQ7_ad53ZnC_5w5gmaQdSeB8VxDEtW13fZye_OGWzug@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180628011537.hWCR_IDhhKrtmKntXuTzIg1cVcBtqhVf64gjp6_JBB8@z>

Linus, Bartosz,

This was discovered during our investigations of a functional tests
regression/error:

https://bugs.linaro.org/show_bug.cgi?id=3769

Which turned out to be related to missing CONFIG_ARM{64}_MODULE_PLTS
config in our builds.

However, during investigations, we realized the functional test had
the issues best described in comment:

https://bugs.linaro.org/show_bug.cgi?id=3769#c3

Related to errno variable being considered outside the error scope.

Thank you
Rafael

On Thu, 14 Jun 2018@11:42, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, Jun 6, 2018 at 7:44 PM, Rafael David Tinoco
> <rafael.tinoco@linaro.org> wrote:
>
> > Following logic from commit: 22f6592b23, GPIOHANDLE_REQUEST_OUTPUT
> > should handle errors same way as GPIOHANDLE_REQUEST_INPUT does, or else
> > the following error occurs:
> >
> > gpio-mockup-chardev: gpio<gpiochip1> line<0> test flag<0x2> value<0>: No
> > such file or directory
> >
> > despite the real result of gpio_pin_test(), gpio_debugfs_get() and
> > gpiotools_request_linehandle() functions.
> >
> > Signed-off-by: Rafael David Tinoco <rafael.tinoco at linaro.org>
>
> Bartosz, does this look OK to you?
>
> Yours,
> Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
