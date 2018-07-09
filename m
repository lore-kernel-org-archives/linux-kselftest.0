From: linus.walleij at linaro.org (Linus Walleij)
Date: Mon, 9 Jul 2018 16:08:57 +0200
Subject: [PATCH] selftests: gpio: gpio-mockup-chardev
 GPIOHANDLE_REQUEST_OUTPUT fix
In-Reply-To: <20180606174424.9630-1-rafael.tinoco@linaro.org>
References: <20180606174424.9630-1-rafael.tinoco@linaro.org>
Message-ID: <CACRpkdZny9ixvz8=dVXfLG04_5pSoHYJa01qeB+gXqpkPCoGpA@mail.gmail.com>

On Wed, Jun 6, 2018 at 7:44 PM Rafael David Tinoco
<rafael.tinoco at linaro.org> wrote:

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

Patch applied. Sorry for forgetting about it.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
