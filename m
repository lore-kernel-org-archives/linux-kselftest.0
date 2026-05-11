Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A02E3FCB34
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 14:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778509073; cv=none; b=Wqm5CaPUrrBEemFJ2BFANYHsyE2Fnz3zOnh+Z0L6dXYebanIALMy0FLExxJZJY5O2CeQpsEjF05gREwHBjgGsBKVhnWgXO4i6JxSn/NhxdI4bAblap05kf6uOQsseHWOLccRb9ZNwLRN0yHMWwsh2ymm2Gd0Dmvldn51uMXkChY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778509073; c=relaxed/simple;
	bh=tWCQMWSCIU1JwQksCEE89vFumxajGqRDTss9nzohQP4=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CcEaW5kZukokioeUvP01/922ghQ5VF7LD2lmeWK5c0diDpM37zvBe2hpYKSpzc7EtzGbMTCfFJww8gjMIHL8lhRfA7b2Mc2h2zTXB5FmNbaJXuJenxT9ql6LOo+d3zIJaZjxAGwWBP+TAC0QiIi5EkNY8DRE5BJF8wRC5JpbJJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s6/l46LS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s6/l46LS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FCC4C2BCF7
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 14:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778509073;
	bh=tWCQMWSCIU1JwQksCEE89vFumxajGqRDTss9nzohQP4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=s6/l46LS8Wj1RE+IVf9xy3VzAorPDHt/9jb1MeDqKmFG6P3R+1cOiNCbQr9DiGe7w
	 pvUyOZRfpfWat1DN3P5gPEJXW12nfB7ajHQu/W+i24v2xwcGhnPVMn2J9A6MrV7YMR
	 Xq9TeNdHjj7xmWe7Pl0+Lt4Etu57vqpJjQvOidpzCF/Qk/EA8MUu6oslFD870nT3NF
	 XtWQY4GQsnVCjQUnRg8mDoTnPOfVvkdiU6unuIz8fd6BCUmEphdC57gCnJsjNNbabk
	 VtEufkQWhpcWtDgiXoBo8s1yKLQt5I+2MzqyQmCjmH3si37BZAGcQiYVWhngD0gmTX
	 jEKN79sWgi7FA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39378db197aso44701971fa.3
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 07:17:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8XvSy1BU+QOvHuFVH5gZkXwYZP9p73pYiG0UKsDS/OvDSGNNngTcYa3gUxRaw1RQQXiJk0Or0C4YgpBXR02z4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfKGOPva8FfNV7IZU/6zrWr64WkajGElRnknJr9K43qCQizUrU
	TqXVtm7zp3WfFLCG8R9K74lQQAdRL+retTlmhbDuSufXHiYKIcxfDdjqgijeTrrzPsQMrGHYni6
	2680pq1xt2VK2aUY6qELm6AldftP/hIeZbzo8NCVWtA==
X-Received: by 2002:a05:6512:3d04:b0:5a1:d352:a49 with SMTP id
 2adb3069b0e04-5a8b747b7ebmr2589014e87.41.1778509071937; Mon, 11 May 2026
 07:17:51 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 07:17:49 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 07:17:49 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <DIFWH6TWTOOT.37CW17JHKWBQR@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430-swnode-remove-on-dev-unreg-v4-0-01574da0aed3@oss.qualcomm.com>
 <20260430-swnode-remove-on-dev-unreg-v4-1-01574da0aed3@oss.qualcomm.com>
 <afNEwrHLNTA4ywrN@ashevche-desk.local> <CAMRc=McH0zKz87z0TwPFrzZHMW6psytMaLZybM3pUk6OvUfo9Q@mail.gmail.com>
 <CAMRc=Mc_huU0HxHpD+RMNWeX2Sg84-LEg8y96BcF_qdtPr31eA@mail.gmail.com> <DIFWH6TWTOOT.37CW17JHKWBQR@kernel.org>
Date: Mon, 11 May 2026 07:17:49 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeiL+MeFsiPrWja2qJx=zU3RXKLL7CDccX1epXWgNtvdA@mail.gmail.com>
X-Gm-Features: AVHnY4LNfVOZzGtnHEuvlnWv66y_mqFueWFoaAxy3hLiq7T56xfhHM7e7I8mKaQ
Message-ID: <CAMRc=MeiL+MeFsiPrWja2qJx=zU3RXKLL7CDccX1epXWgNtvdA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] driver core: platform: remove software node on release()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 May 2026 16:00:23 +0200, Danilo Krummrich <dakr@kernel.org> said:
> On Mon May 11, 2026 at 9:33 AM CEST, Bartosz Golaszewski wrote:
>> Danilo: if there are no further comments, can you pick it up for v7.1?
>
> It seems that sashiko has a valid concern in [1]; can you confirm?
>
> [1] https://sashiko.dev/#/patchset/20260430-swnode-remove-on-dev-unreg-v4-0-01574da0aed3%40oss.qualcomm.com
>

Yes, I explained it here[1]. Basically it's similar to how we need to call
platform_device_add_data() for devices created with platform_device_alloc().

We can consider adding platform_device_add_software_node() once there's
a potential user but for now I'd just leave it like this.

Bartosz

[1] https://lore.kernel.org/all/CAMRc=MdR+xKCP5e+RiF-MvHvD9-z-Vxno=0B7nmOm+1oS6TDMQ@mail.gmail.com/
