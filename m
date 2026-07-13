Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221B83BC69C
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 10:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938023; cv=none; b=u7CMeaK+38YLAJLsXfmRXZ6veEagw3ShgDBso1iGVXmSJoglBu2V5uWtaE//NC6xM+6psPep8LzfW7VVnQblI5Y5XSyfsVoLwceImzsPE2V9PTppHKSMPahpbiX4nhTQ8YmJxCLZ3AFKWDM3rF4pwyWzC8Uu6MBlb+cfcryusfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938023; c=relaxed/simple;
	bh=kcn99Xy/3DudcybC0jtllxbvzn7qC6YvN7bxjIIy5So=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JmVI/KboB34rbl0KwFpe/IlJ5/j4iO7//7W2OKStsN0Q7BbKBIQw/U2fjGhzqompNLdL4MILgn58HXP44B73CIwZMPyCNuFwH2GWbhFcjTjDbguRYwkNz/gatjFenLJtkLUIhgkruL+VZQvB69HYfttm4GXTLAG68nbI1FP/QEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wf1UkD1F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wf1UkD1F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC2F81F00AC4
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 10:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783938021;
	bh=E2Il11/mxE78nQhBlWi8jSDcSjyK2Ic0zf6JqsJx93g=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Wf1UkD1FP+Rahs3YaRe39uXTOXiCmBmEdY3pj/MHWA3iJZd+H83nbglaJ7xmp7GAn
	 kbQ2pelhbolfoIVBdJ4hX6APi7hzmW6HBWrfwpk0qILjd9vIxgPmpCjIm4hgA8JafS
	 Ogb0jamd4dhenaU7GJunZzz+cQ0aXi8SE6UGFwiYUgvWXySZ7PBCfvasMMvOlbQyfX
	 OlHjfjoOmc5QiFPKQEgGN0zdqL1K0MJlJspaH1GEgX5uG3pW2Gg4t+xmNxw1Bti1gz
	 WtdT/DzJWC8Wiag6O9dwC9PsfIA9/XRsiU9hoGMauH+nHwSpsr4s1ojo+7+DnDW6uC
	 RsAYLLNRgV0mw==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39c923b8c2aso26038751fa.2
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 03:20:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqphNd1sXuNlM33WPC7ri8Cxxw+isM5guGwoBQ83zN8Fhwzp5nAX3/dKwJ2vrOy8rC4Fe+qla8Dg/aAOytsiO8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yze7bkB2MZ5xwNXcAJZuc7Kd4dsmAPePnA30zunudF9a+/NZkCG
	ZUAoQb73uVUMvFtPp9rtPmPrezGCtj/zj9A5KOqFmy3XtaARW9Bn04z1OJO0sO50iwnJOyvHFbj
	ph6wkuFNx+LciIGG0PS3l9RU2eykI9f0qc9znwRcAIg==
X-Received: by 2002:a2e:b8c3:0:b0:39c:6d3a:2dc6 with SMTP id
 38308e7fff4ca-39caa806714mr17361151fa.15.1783938020444; Mon, 13 Jul 2026
 03:20:20 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Jul 2026 03:20:18 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Jul 2026 03:20:18 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAMRc=MeW_pjczz-5L+p2tqPw4TfgVPmB7t_hXdtb9cX0BDSHuA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710-swnode-fw-devlink-v3-0-993f31874e40@oss.qualcomm.com>
 <DJWR3RYAWYAI.LQC41HSN2I94@kernel.org> <CAMRc=MeW_pjczz-5L+p2tqPw4TfgVPmB7t_hXdtb9cX0BDSHuA@mail.gmail.com>
Date: Mon, 13 Jul 2026 03:20:18 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mc7f7BDp5o-36ik6yHZSMQg3f2MNEpjurJ2x--BKga0Hw@mail.gmail.com>
X-Gm-Features: AVVi8CclRsLtPY2fK5pxv1kXXcH67GXVTmR40NKDXmnFg0VoXAkCK1k3ECh2mL4
Message-ID: <CAMRc=Mc7f7BDp5o-36ik6yHZSMQg3f2MNEpjurJ2x--BKga0Hw@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] software node: provide support for fw_devlink
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Jul 2026 11:45:17 +0200, Bartosz Golaszewski <brgl@kernel.org> said:
> On Sun, 12 Jul 2026 18:59:04 +0200, Danilo Krummrich <dakr@kernel.org> said:
>> On Fri Jul 10, 2026 at 3:51 PM CEST, Bartosz Golaszewski wrote:
>>
>>  static struct kunit_case swnode_test_cases[] = {
>> diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
>> index ad961cf97aee..7798f8a8e602 100644
>> --- a/drivers/gpio/gpiolib-kunit.c
>> +++ b/drivers/gpio/gpiolib-kunit.c
>> @@ -449,6 +449,9 @@ static void gpio_swnode_probe_defer_on_unregistered(struct kunit *test)
>>
>>         pdata = dev_get_platdata(&cons->dev);
>>         KUNIT_ASSERT_EQ(test, pdata->gpio_err, 0);
>> +
>> +       /* Tear down the consumer before the provider to free the GPIO. */
>> +       kunit_platform_device_unregister(test, cons);
>>  }
>>
>>  static int gpio_swnode_probe_order_test_init(struct kunit *test)
>> @@ -614,9 +617,17 @@ static struct kunit_case gpio_unbind_with_consumers_tests[] = {
>>         { }
>>  };
>>
>> +static int gpio_unbind_test_init(struct kunit *test)
>> +{
>> +       device_link_wait_removal();
>
> Interestingly I noticed this in the GPIO test cases but not here...
>
> I also think that we should call device_link_wait_removal() *before* and
> *after* these cases to not affect other test suites - as pointed out by
> sashiko too.
>

Huh, that won't work because suite->exit() runs *before* kunit_cleanup(). Isn't
it wrong? We do suite->init(), then schedule actions inside the test, it would
make sense to then first call the release callbacks for resources and only
after that call suite->exit()?

Anyway, that's material for another series.

Bart
