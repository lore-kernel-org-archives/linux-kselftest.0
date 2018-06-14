From: linus.walleij@linaro.org (Linus Walleij)
Date: Thu, 14 Jun 2018 16:42:23 +0200
Subject: [PATCH] selftests: gpio: gpio-mockup-chardev
 GPIOHANDLE_REQUEST_OUTPUT fix
In-Reply-To: <20180606174424.9630-1-rafael.tinoco@linaro.org>
References: <20180606174424.9630-1-rafael.tinoco@linaro.org>
Message-ID:
 <CACRpkdZ82RNta7LGp4OB=6TY_q3mdqGGDedayz-C4hB9m7WG9Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180614144223.UATzrv2wwj48q9tLFLl9tR9tthmXs8TyIO42vCED-xQ@z>

On Wed, Jun 6, 2018 at 7:44 PM, Rafael David Tinoco
<rafael.tinoco@linaro.org> wrote:

> Following logic from commit: 22f6592b23, GPIOHANDLE_REQUEST_OUTPUT
> should handle errors same way as GPIOHANDLE_REQUEST_INPUT does, or else
> the following error occurs:
>
> gpio-mockup-chardev: gpio<gpiochip1> line<0> test flag<0x2> value<0>: No
> such file or directory
>
> despite the real result of gpio_pin_test(), gpio_debugfs_get() and
> gpiotools_request_linehandle() functions.
>
> Signed-off-by: Rafael David Tinoco <rafael.tinoco at linaro.org>

Bartosz, does this look OK to you?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
