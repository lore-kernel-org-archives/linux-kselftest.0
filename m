Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDDB3B1BD
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 09:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783935921; cv=none; b=TVmNQAVS61Unm+l4uxCOUBmqWLwLx6q6AhhN9K1ghrAhx8jizmmYGhjVwybwp6KPFTvqqpPtTlzO0xb3Aa/fjgp6L5Jg3dw4iEyl4xoWH6C5Z9N0AoD1TVoP4vwG+gW5Mb8EoJmG4/maXjCe9j9ENoac7Eba9JcosNz4flvs0fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783935921; c=relaxed/simple;
	bh=ouuxFsl/C/GRvSsCa/RAzwrn+V4qnHZ4qWG5NdgGvn4=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UPxyDEmUrowZUV9fETxkYCm11pM9xcFuEPebkwi/DymAvr/OdCP/vNYzSEXA3V80nHqYGzbsSm2Tl04p8dXf6xZ3Px9ljbv63BCedXTAOf3F41XCAp2ReTYkK2j2E66zi3hMFoRFB9gBC0SIqqAxBzu4PUoQWC5EhwfeO+0APV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DI0ePzf7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DI0ePzf7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66C051F01559
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 09:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783935920;
	bh=DnRuzPMU2XYhVlhKrVQWCQjUZH4SWa17UwUD0HEYcFM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=DI0ePzf7r9OluhomKWRCs8fWlNMI7NWyPvEezI1JDCBeclDNCE+K+CYd3DSGiyWf5
	 Ma8ZZae/0yb62BM/zkdMJBQ1RfDpIVgbCtQp8f4wq2xRQowJAsizxQDNE+ncB0sv/1
	 9M3dPmnjS2OQjGZcIuqG0GZV6jl6j+Yo6zR4sJc2I4sqQZDk3H+O4qwbazZM5qiaEU
	 dZKwjsvdrjpqNLBUKMucKfjZREnXdf1jmW8RtP+WiO0juEyWu17jPPy7HmT4LWraag
	 jE2To8b0qeG+EqE7bSLj1e19kTcY/2bFNEjOteM2IaevLSdX2vgS7bTEPjFZtD8vbD
	 qx3CW6TeTNBVQ==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39c9452244aso27984601fa.3
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 02:45:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr8e4insBn2srF2+Z9irvy3aLsGoCVPp8FNVK83YF4+umI9MNuRxMK8+e/qMHm2sqBWDUqAqNjASMM2E3ndDVI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7NYr3Czi5BQ1P2jz9/+vbzHW8QHirfnWxVSWNhivo1jDWfoP8
	fgeD19X9TzgU/3LqZpc7c8wYbGeIAVPXE0IacHO9RPSOYmbsmhZU34EvP+QhuX9JrzmqGI7ViJ5
	WXKTWC2Wi64tYIs5TksKOGQ39Xo29L7fKXSvKWZI7nA==
X-Received: by 2002:a05:651c:154d:b0:39c:7200:b9b9 with SMTP id
 38308e7fff4ca-39caa7feec7mr18650561fa.13.1783935919044; Mon, 13 Jul 2026
 02:45:19 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Jul 2026 02:45:17 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Jul 2026 02:45:17 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <DJWR3RYAWYAI.LQC41HSN2I94@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710-swnode-fw-devlink-v3-0-993f31874e40@oss.qualcomm.com> <DJWR3RYAWYAI.LQC41HSN2I94@kernel.org>
Date: Mon, 13 Jul 2026 02:45:17 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeW_pjczz-5L+p2tqPw4TfgVPmB7t_hXdtb9cX0BDSHuA@mail.gmail.com>
X-Gm-Features: AVVi8CdMA5ntkCzUjXOel5q6wno_jfrPVuwP-CefgxTNanHUX3nTYq61gbKoPlU
Message-ID: <CAMRc=MeW_pjczz-5L+p2tqPw4TfgVPmB7t_hXdtb9cX0BDSHuA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] software node: provide support for fw_devlink
To: Danilo Krummrich <dakr@kernel.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 12 Jul 2026 18:59:04 +0200, Danilo Krummrich <dakr@kernel.org> said:
> On Fri Jul 10, 2026 at 3:51 PM CEST, Bartosz Golaszewski wrote:
>> Bartosz Golaszewski (5):
>>       kunit: provide a set of fwnode-oriented helpers
>>       software node: add fw_devlink support
>>       software node: add kunit tests for fw_devlink support
>>       MAINTAINERS: add myself as reviewer of software node support
>>       gpio: kunit: add test cases verifying swnode devlink support
>
> Overall looks good, but I think the two issues pointed out by Sashiko are valid.
> In addition, I also found a memory leak in the gpiolib kunit test:
>
> 	unreferenced object 0xffff88810296b2c0 (size 32):
> 	  comm "kunit_try_catch", pid 1096, jiffies 4294694235
> 	  hex dump (first 32 bytes):
> 	    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> 	    66 6f 6f 00 00 00 00 00 00 00 00 00 00 00 00 00  foo.............
> 	  backtrace (crc a62f59c2):
> 	    __kmalloc_noprof+0x216/0x510
> 	    desc_set_label+0x46/0xc0
> 	    gpiod_request_commit+0xd5/0x140
> 	    gpiod_request+0x49/0x170
> 	    gpiod_find_and_request+0x2be/0x520
> 	    gpiod_get_index+0x56/0x70
> 	    devm_gpiod_get+0x1b/0x90
> 	    0xffffffffc0401ff8
> 	    platform_probe+0x58/0x90
> 	    really_probe+0x1bc/0x490
> 	    __driver_probe_device+0xa2/0x140
> 	    driver_probe_device+0x1e/0x110
> 	    __device_attach_driver+0xc2/0x140
> 	    bus_for_each_drv+0x117/0x170
> 	    __device_attach+0xd5/0x1c0
> 	    device_initial_probe+0x34/0x50
>
> I came up with the following diff to resolve those issues.
>
> diff --git a/drivers/base/test/swnode-devlink-test.c b/drivers/base/test/swnode-devlink-test.c
> index 6f59f13214fc..143b9c4047a0 100644
> --- a/drivers/base/test/swnode-devlink-test.c
> +++ b/drivers/base/test/swnode-devlink-test.c
> @@ -17,6 +17,10 @@
>  #include <kunit/platform_device.h>
>  #include <kunit/test.h>
>
> +KUNIT_DEFINE_ACTION_WRAPPER(device_remove_software_node_wrapper,
> +                           device_remove_software_node,
> +                           struct device *);
> +
>  static int swnode_count_suppliers(struct fwnode_handle *fwnode)
>  {
>         struct fwnode_link *link;
> @@ -294,6 +298,9 @@ static void swnode_devlink_test_probe_order(struct kunit *test)
>
>         ret = device_add_software_node(&supplier->dev, &supplier_swnode);
>         KUNIT_ASSERT_EQ(test, ret, 0);
> +       ret = kunit_add_action_or_reset(test, device_remove_software_node_wrapper,
> +                                       &supplier->dev);
> +       KUNIT_ASSERT_EQ(test, ret, 0);
>         ret = device_create_managed_software_node(&consumer->dev,
>                                                   consumer_props, NULL);
>         KUNIT_ASSERT_EQ(test, ret, 0);
> @@ -313,8 +320,6 @@ static void swnode_devlink_test_probe_order(struct kunit *test)
>
>         /* Tear down the consumer (and its device link) before the supplier. */
>         kunit_platform_device_unregister(test, consumer);
> -
> -       device_remove_software_node(&supplier->dev);
>  }
>
>  static struct kunit_case swnode_test_cases[] = {
> diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
> index ad961cf97aee..7798f8a8e602 100644
> --- a/drivers/gpio/gpiolib-kunit.c
> +++ b/drivers/gpio/gpiolib-kunit.c
> @@ -449,6 +449,9 @@ static void gpio_swnode_probe_defer_on_unregistered(struct kunit *test)
>
>         pdata = dev_get_platdata(&cons->dev);
>         KUNIT_ASSERT_EQ(test, pdata->gpio_err, 0);
> +
> +       /* Tear down the consumer before the provider to free the GPIO. */
> +       kunit_platform_device_unregister(test, cons);
>  }
>
>  static int gpio_swnode_probe_order_test_init(struct kunit *test)
> @@ -614,9 +617,17 @@ static struct kunit_case gpio_unbind_with_consumers_tests[] = {
>         { }
>  };
>
> +static int gpio_unbind_test_init(struct kunit *test)
> +{
> +       device_link_wait_removal();

Interestingly I noticed this in the GPIO test cases but not here...

I also think that we should call device_link_wait_removal() *before* and
*after* these cases to not affect other test suites - as pointed out by
sashiko too.

Let me send a v4.

Bart

> +
> +       return 0;
> +}
> +
>  static struct kunit_suite gpio_unbind_with_consumers_test_suite = {
>         .name = "gpio-unbind-with-consumers",
>         .test_cases = gpio_unbind_with_consumers_tests,
> +       .init = gpio_unbind_test_init,
>  };
>
>  kunit_test_suites(
>
