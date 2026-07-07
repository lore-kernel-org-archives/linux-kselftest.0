Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1063DD530
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 07:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783409152; cv=none; b=MIauU7b5e8xOIRmvGZoOPag/DqTXX7Y8tNcUL1ZFiph1BDz09HrHgTTiXPNMBe9+ek9BcWuZZFX/XVZDx/A+M2zXiS/YelYaw3uMcfWpUYg2TblpSlD9FIQVyZCxwZ4i6loyFNslMBY4fanxIb5Nz4IJnSXOw7YG+GB70n7bEbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783409152; c=relaxed/simple;
	bh=ueAyYCOfMV4Ufdfx9AVyTK2lGxrTrZnsndPc9ULF9iA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Etzy8p/uJv/eZarc3McGPYsNik9D/oHysEjPQ7GN6sPGUubmseg4RnwFVRP65vrqq2rZTqh/MLLjUdlmKfs6Pki7eGKs5zD7u2oON223rwDlTq18mYiNoYIxNmgZyh0taDUEvITzcRjarGNivP7Jav8WJmq96Jr4OwvUio6oDs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KVG+WXqv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KVG+WXqv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58AF31F00A3E
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 07:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783409143;
	bh=AnulwQxL/OQLIVkhwLjzK1QzJkTrEXXoW+88TePiaq0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=KVG+WXqvcbO7hG7Q1AstC/2M56pHAnPnTD7Ve5taqbqOI+cKMaAn5axppsoKSdqUx
	 9n4w2P48rGxOPsB2HdaB3m0QQzE9QLb9Jgo7e9dQW+QB3cR4baddKyJQj45elGnP+P
	 TRqdzFO50HALyt+CFYZ/C6K3X3GIc5hVs/pOTgXawH4a0uCVlSy0fVUNiPfbEpxPUy
	 2U5G7kZXZ+anDdGlaXc0gYoWfSLkxeyCOIYlAH/U5Lh3i44JllUrRXsSzesGZziKGf
	 DqZ8nvRykwAtIXYq5l3lLAr2kTg25mubLLVQhT9IcS/MXenCdAruVTiyJ2xrkDOTl4
	 QUB/MHwpn6rKg==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39b14a7e53aso38472011fa.2
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 00:25:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrHDleyxE8+Owc1mvWxvZG7T4pLMSP6MlrV4rztzW6vXPlx89NiyqPSOgJkuhS2Jjt6/uzEsq2Mqq2bUsHzaMM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZLuom0SKKU27b7lZP1o2TsOVIylNAo3wxXwAtSN0gnBpCxFQP
	qO384etRNVD+XPJ9voLRbkTb/n4+4U/17nBgXtxtxij2KOCNnJ7VecnJuBSn8UeQ2SNvzHJqP3U
	yJmnMCgfI1KPyiYakvOrvifNt1i1DBgbLWp4rZeU5UA==
X-Received: by 2002:a2e:be06:0:b0:39c:650d:2f63 with SMTP id
 38308e7fff4ca-39c650d3187mr5799031fa.1.1783409142106; Tue, 07 Jul 2026
 00:25:42 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 00:25:39 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 00:25:39 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <akwLg6XiA6eJblH2@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com>
 <20260629-swnode-fw-devlink-v1-5-b90058b41839@oss.qualcomm.com>
 <akKWGNpGmHjWYdfX@ashevche-desk.local> <CAMRc=Md1K_ZfO7pUANNhCkwEpmF6nX-Wo=AeuiO57hjKLtWDWg@mail.gmail.com>
 <akwLg6XiA6eJblH2@ashevche-desk.local>
Date: Tue, 7 Jul 2026 00:25:39 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfQV8nsqjH1xkZ-rriNMdpdvXjGghkfBrkfxUdu7QCF2w@mail.gmail.com>
X-Gm-Features: AVVi8Cd4zSiR6iCjegfG7uEMuMQeaCzvQIzA0WpvDnFiM-et0cbjWnQALsxKsUg
Message-ID: <CAMRc=MfQV8nsqjH1xkZ-rriNMdpdvXjGghkfBrkfxUdu7QCF2w@mail.gmail.com>
Subject: Re: [PATCH 5/5] gpio: kunit: add test cases verifying swnode devlink support
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Jul 2026 22:09:39 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Mon, Jul 06, 2026 at 08:32:28AM -0400, Bartosz Golaszewski wrote:
>> On Mon, 29 Jun 2026 17:58:16 +0200, Andy Shevchenko
>> <andriy.shevchenko@linux.intel.com> said:
>> > On Mon, Jun 29, 2026 at 12:52:10PM +0200, Bartosz Golaszewski wrote:
>
> ...
>
>> >> +static int gpio_probe_defer_consumer_probe(struct platform_device *pdev)
>> >> +{
>> >> +	struct device *dev = &pdev->dev;
>> >> +	struct gpio_probe_defer_pdata *pdata = dev_get_platdata(dev);
>> >> +	struct gpio_desc *desc;
>> >
>> >> +	pdata->probe_count++;
>> >
>> > Even in case of error?
>>
>> We're counting how many times we *enter* probe, so yes, I think it's right.
>
> Perhaps a (short) comment on top of this line?
>
> 	/* Count probes independently on being successful or unsuccessful */
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>

I mean: sure, I can, but it already says probe_count, not probe_ok_count. IMO
it's overkill but I don't want to bikeshed over a comment.

Bart
