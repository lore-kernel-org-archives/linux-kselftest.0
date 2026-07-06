Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED73D42F71C
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 12:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341153; cv=none; b=ulLpIc28fBFOo+55X113I0RP1v7d/zzhrRb+S/AatCf7jQrV9HIlfiJccTvkWRJjnmA57Z6mOws0BGdf+hH+KgzjD7Ob29R3yH1hjHtw7kl08NMMmeGIduWmXN2/VOh1yw9th2R7v8fI/O2RdIpGbWwc5kvcNC6gm/FY46llPB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341153; c=relaxed/simple;
	bh=9w7tRzk7PU0ug0Dv4zZfspHRHMFIbLhwN04rhG/BBxs=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rB08Ru3RlfhBqeVgfHmaUIJvmYwI4riA0PeufixH2jvn1DmCyhg6nQK9vYC1AXdrbXBwHnUbX4sU0kMWTz0HlxoOqkxBev9tE3xnOP7Nxf17CjUi5PLjTUvy7kyCJQq1M+YeECxO6HR/XW++/WOIDjw0tXNxSx7h4Tx+XPx6OtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j38RakwE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j38RakwE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD92F1F00ACA
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 12:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783341151;
	bh=uIXPhbuLiSA0I+TaS1RlSct61HCtgPulsM6QHEhVD3E=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=j38RakwE9+mhi/OTlzPd83kr8s8qaoxHOA57XWLa8acIv0VRVcM9nY4EFL2ETOGJU
	 RIujxCtWCmIKXHV6LHpqadlX9iLFIzbw2KeRCgi4WFPElAVnhEkn/U3kM1aLOzHDiL
	 vMYtNkbjqtAlVv1gwmTdgZXJnQVcy9At2CndrelkVR0ufaFJPse8EEOhn0SC6ut7o+
	 9FtbhVxgJ+AEnkP8sAcqpq5/skiZZUfXPNcRe8r3CEd6qQAxweGihTQtAXr1Z44QBc
	 zRkW2fNqWsS3Ue6QJd3tJxt8PV67OUKfhinBuzdGCKgpwLqPfQ/Vvi6bwBOujMiCDV
	 CNM+uEkeSZsVg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39669bcaadfso33695111fa.0
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 05:32:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoUD5M4HpuqNsf80VBvd1qNW6eHTeUULCnmCOLezJM4GjfbR65gbne3al2EMEq9Uw4odhsbqRQuNMs07R1omx8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF631GMTeTLIApg9IuCMMT78/6NJaS8pmaNF/2mPWWkTZU+G3K
	pBR5xdG0DfbQWHerdF2/y7GnU729xjlvkCaCrWc3eILmLJECRGWZcK4CNluWMxvxRrpMLjEPDcF
	adVtKgUMO7vlz1g9WFfSxeLhzyR1chwBEol7clWq7pg==
X-Received: by 2002:a05:651c:549:b0:39b:5a79:ebdf with SMTP id
 38308e7fff4ca-39c5ffcf5a0mr1203241fa.20.1783341150370; Mon, 06 Jul 2026
 05:32:30 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 08:32:28 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 08:32:28 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <akKWGNpGmHjWYdfX@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com>
 <20260629-swnode-fw-devlink-v1-5-b90058b41839@oss.qualcomm.com> <akKWGNpGmHjWYdfX@ashevche-desk.local>
Date: Mon, 6 Jul 2026 08:32:28 -0400
X-Gmail-Original-Message-ID: <CAMRc=Md1K_ZfO7pUANNhCkwEpmF6nX-Wo=AeuiO57hjKLtWDWg@mail.gmail.com>
X-Gm-Features: AVVi8Ce48DElPbC3oMv4vPDSxH-Ukr5qoWCuUMufjQm0Yxr66KoTNX6potICnGA
Message-ID: <CAMRc=Md1K_ZfO7pUANNhCkwEpmF6nX-Wo=AeuiO57hjKLtWDWg@mail.gmail.com>
Subject: Re: [PATCH 5/5] gpio: kunit: add test cases verifying swnode devlink support
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jun 2026 17:58:16 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Mon, Jun 29, 2026 at 12:52:10PM +0200, Bartosz Golaszewski wrote:
>> The software node fw_devlink support already has its own kunit suite, but
>> that verifies the fwnode links in isolation. Add GPIO tests that prove
>> the ordering works in a real-life use-case: a GPIO consumer that
>> references its provider via a software node.
>>
>> The first suite registers the provider's software node, adds the consumer
>> device first and checks that fw_devlink defers its probe until the
>> provider has been added and bound. The second covers the fallback:
>> with the provider's software node not yet registered no supplier link is
>> created, so the consumer probes, devm_gpiod_get() returns -EPROBE_DEFER
>> and the consumer only binds once the provider shows up.
>>
>> While at it: the existing gpio_unbind_with_consumers() test keeps the
>> consumer bound while the provider goes away and then operates the orphaned
>> descriptor. With software nodes now being covered by fw_devlink that would
>> instead force-unbind the consumer along with the provider, so opt it out
>> by setting FWNODE_FLAG_LINKS_ADDED.
>
> ...
>
> + cleanup.h // guard()()
> + err.h // IS_ERR()
>
>>  #include <linux/platform_device.h>
>>  #include <linux/property.h>
>
> + types.h // bool
>
>> +#include <kunit/fwnode.h>
>>  #include <kunit/platform_device.h>
>>  #include <kunit/test.h>
>
> ...
>
>> +	properties[1] = (struct property_entry){ };
>
> Just zero the whole array at the definition time.
>
> ...
>
>> +	pdevinfo = (struct platform_device_info){
>
> It's better to have a space after ).
>

TBH most compound literals in the kernel seem to not add the space.

>> +		.name = GPIO_PROBE_ORDER_TEST_CONSUMER,
>> +		.id = PLATFORM_DEVID_NONE,
>> +		.data = &gpio_probe_order_pdata_template,
>> +		.size_data = sizeof(gpio_probe_order_pdata_template),
>> +		.properties = properties,
>> +	};
>
> ...
>
>> +	pdevinfo = (struct platform_device_info){
>
> Ditto.
>
>> +		.name = GPIO_TEST_PROVIDER,
>> +		.id = PLATFORM_DEVID_NONE,
>> +		.swnode = &gpio_test_provider_swnode,
>> +	};
>
> ...
>
>> +struct gpio_probe_defer_pdata {
>> +	int probe_count;
>
> Why is this signed?
>
>> +	int gpio_err;
>> +};
>
> ...
>
>> +static int gpio_probe_defer_consumer_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct gpio_probe_defer_pdata *pdata = dev_get_platdata(dev);
>> +	struct gpio_desc *desc;
>
>> +	pdata->probe_count++;
>
> Even in case of error?
>

We're counting how many times we *enter* probe, so yes, I think it's right.

Bart
