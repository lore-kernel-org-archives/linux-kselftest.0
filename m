Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DC141D4C8
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 11:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783338162; cv=none; b=LMUHljw+xmkFn1oMrlUOOkwvNWcfnPEh27wE1QzKnlq5tRupGlPePnOWFKCp8IkBXK91CEb6SVIcBv2a03Df51ngFikyP88RDadG3Gy9EDWsAeFrbH960jy8WlaOwUwCXvRRobYi/aVeTDKVMQkb4w7F09rDOM1dR5EgVgrL4SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783338162; c=relaxed/simple;
	bh=/NFvR6wfBtbE/e2zmh3j4EF1HB4MMchD8i3wmLsvD+g=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rT4jjaAH09A4mgECY5MnuIS85GYtb9IuMF0IBbQ5IS1JfxAf67J3bBP+C6qbYoku6EPsiqfuNTNcvesOilhVMFccin2FstQLdFuLlofrLVTZw82BHI+BXI0ts9u0pwgcvUIkQBrO49/Fvygxc2bOSUcRs9epmIHhcPCgAFqGk2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=goLXkLzL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="goLXkLzL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 111761F0155B
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 11:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783338160;
	bh=2WHMyn0VUWWYlG5J6larR9VZfgkh4kTyac4Ldi9U/aQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=goLXkLzL/8kZfh4ry6XD2G2y91J3vdVG9bTzONAbnd1FSMNEBIeMJx0nMmiTrOVs2
	 AhMwwf0K4uy6C9Wbbo8LCsfdj6j6RYmFts9ee0VG5leRSF8UKoHc91aLgYuowIsRK5
	 sCOZrqMaTCtnwcnT/hGcuhYc0S/u6gGIaxAeDj+vzH1oKbtQUUWaCabX90XPaP44qz
	 ife+SEuDUsML3+vnu7w93KYD7Y7PJr5tnqGvtexQfAjkZN2LpIOzMGRvaajlf7P6u+
	 AQ1W4ggJYKq2DpAxTXg5K4kar7hGr27pnT/hg/lGf4n3VnkiKXi5IBRlvG/9XzxuNS
	 5QWYyoc9qx1Uw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39b349ae174so25046281fa.1
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 04:42:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro3vPRZLXT8MiKFsz7jTgFfKUzd40kjtcuaq+cpRM7xw3XbNDu0YlKq3df6qqRhubwwp8FkcRjBzJT2a+Uspo0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5pUA2onpLmM/PjaOZZrspodQ+h+yOW+AuDRGy//o5NsctoZ+k
	TykK5vKlj7dEoiq7MkwmrRcP8D0xJVwIzPPCg8IHohqN3X2oKYu4Q0OPrAixNkgPDhMu9az8Hmk
	0KG5MiV7X4l7E+TmAbQWWIjAfRdGbIXVyXymfimvU0w==
X-Received: by 2002:a05:651c:f14:b0:39b:4402:3c82 with SMTP id
 38308e7fff4ca-39c6004e724mr633711fa.37.1783338158704; Mon, 06 Jul 2026
 04:42:38 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 07:42:36 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 07:42:36 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <akKT8q5TjkMkZkmB@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com>
 <20260629-swnode-fw-devlink-v1-3-b90058b41839@oss.qualcomm.com> <akKT8q5TjkMkZkmB@ashevche-desk.local>
Date: Mon, 6 Jul 2026 07:42:36 -0400
X-Gmail-Original-Message-ID: <CAMRc=Me4oJG47C2LOzRvagbEtAWKqbzmQ_R2VG4rt6zd1-QE5Q@mail.gmail.com>
X-Gm-Features: AVVi8CcgKXfNSlhhfMGRqXXq180I-tblQnpihdsKJ_ip6-61GNWt0Dm5fNgFkuI
Message-ID: <CAMRc=Me4oJG47C2LOzRvagbEtAWKqbzmQ_R2VG4rt6zd1-QE5Q@mail.gmail.com>
Subject: Re: [PATCH 3/5] software node: add kunit tests for fw_devlink support
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

On Mon, 29 Jun 2026 17:49:06 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Mon, Jun 29, 2026 at 12:52:08PM +0200, Bartosz Golaszewski wrote:
>> Add a kunit test suite for fw_devlink support for software nodes.
>>
>> Most cases call add_links() directly and inspect the resulting fwnode
>> supplier/consumer lists: a single reference, multiple references, a
>> reference to an unregistered node, a "remote-endpoint" reference and a
>> reference array. The last case is end-to-end - it registers real consumer
>> and supplier platform devices together with their drivers, adds the
>> consumer first and checks that fw_devlink defers its probe until the
>> supplier has been bound.
>
> ...
>
>> ---
>>  drivers/base/test/Kconfig               |   5 +
>>  drivers/base/test/Makefile              |   3 +
>>  drivers/base/test/swnode-devlink-test.c | 336 ++++++++++++++++++++++++++++++++
>
> + MAINTAINERS.
>
> ...
>
>
>> +/* A single reference creates exactly one supplier link, on both list ends. */
>> +static void swnode_devlink_test_single_ref(struct kunit *test)
>> +{
>> +	static const struct software_node supp_swnode = {
>> +		.name = "swnode-devlink-test-supplier"
>
> Keep trailing comma.
>
>> +	};
>
>> +
>
> Redundant blank line.
>

I actually leave a blank line between static, const and regular local variable
blocks for readability.

Bart
