Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2DB3B71B8
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 07:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784531715; cv=none; b=T8IRLB/ekeAeAngE8OxnQxQafAFslSYXX+zs69OnRELKrBNTlIGtvz4Ce25USktTNkU8Cb/FAqvrOgz2rXjjqaVLewElTQYtNrMaeuEJKhiIku67CwTWAvEZDXMPzb3v+xLpqotDEbz8xJYcceL8lvXpkDotrQ7GEIajsa2diog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784531715; c=relaxed/simple;
	bh=Qxe1wlOLxloaHegMhvAeO0dFL1jjuOsAo2Z3X8y6mtA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=czhCh8R/jmQJF9F86qLGWCRHDFdUpXYNg0c4/efRuxJPIp4p7R5M4Wi2cnDXEAtNVPqHUsMFIyFPA980XIjPs4PZHGoO/uvg5xXpz+QCH7szeh6GQ9BsE4RPQmfHQ4ralV1TjGkQLA+LyPcINjSTe43RUTfj0bFAbdAzLtcn7GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bCXaXPTe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bCXaXPTe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA22A1F01563
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 07:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784531713;
	bh=o5mECv2KTe8SiKRGXZ+hZW/XufJFB3KGTqUxWEwdBTs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=bCXaXPTepqkG8rEMFTGJwSWdm9al/MppPpUZDPfJucn3GGjvgHfGWslxcjpOCGsyg
	 ws7mhMLy6cbzlMq+7LNX6+TIoWEAq+uFMuVhh0rltY9FCgTEQRDsB7cXbqtnFbPksB
	 6AjYfDcqapi+S4aNBMtgfmWOjL0aXMOHvPA1bOQuTKs/JK87Sf4S4c1SaBss9/yO+T
	 rtK05IFQgHSTEfozS3x152yr/kSYh499cJe9hoNZcnKfzCt4u2o3X6hlJOko0N7mUT
	 xsRrGz4amQLOH8U92WhZ7uZ01onvK0J8ShnnZ7MAiNfj5p/VZ4lvqFMaO52ZoQVpY1
	 F8sX5UzvrwggA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b0117d49dcso9090518e87.3
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 00:15:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrVdf/Sf2B620Be4mlhw4R7Za8TWONO3MBCTGmmyl3G1H37S56cHuTGB2sKmkatyovwL2aMvNWZkAu9BI2CTtc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyek8FIpANeGWC1/CmluMPF6HVDbABKcci6zwmwjOQRoi9dKjQn
	qVL1ziqqV8yvDf61OCdDlUkqeh0e3qcEpDvtT2z+6NqWI+TAbhySiqvgkCEZxdvxCid8TpQvODu
	SE8QpRznyi+brTIqyhrJSm0GQNVliKx9XslHHareGow==
X-Received: by 2002:a05:6512:1503:20b0:5b0:13b4:6079 with SMTP id
 2adb3069b0e04-5b28f9ae65dmr1582849e87.53.1784531711252; Mon, 20 Jul 2026
 00:15:11 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 20 Jul 2026 00:15:09 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 20 Jul 2026 00:15:09 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <DK0W7O5C7LYK.3BJOBTN337Q52@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713-swnode-fw-devlink-v4-0-d4f2dee27ad9@oss.qualcomm.com>
 <20260715212830.3077100-1-dakr@kernel.org> <DJZGR6NV2WK5.2ZRW7VZIRO3LD@kernel.org>
 <DK0W7O5C7LYK.3BJOBTN337Q52@kernel.org>
Date: Mon, 20 Jul 2026 00:15:09 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mdvhf69-vJx22+MuaWVJfn4ipFbQ0wc2U96F599uqrdVA@mail.gmail.com>
X-Gm-Features: AUfX_mzhVw0yY4ElBsp3RJ24-o-6M3TylIG-umxlyM5jDc9PiJ1qxEAwGhY8ScU
Message-ID: <CAMRc=Mdvhf69-vJx22+MuaWVJfn4ipFbQ0wc2U96F599uqrdVA@mail.gmail.com>
Subject: Re: (subset) [PATCH v4 0/5] software node: provide support for fw_devlink
To: Danilo Krummrich <dakr@kernel.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Jul 2026 15:49:55 +0200, Danilo Krummrich <dakr@kernel.org> said:
> On Wed Jul 15, 2026 at 11:30 PM CEST, Danilo Krummrich wrote:
>> On Wed Jul 15, 2026 at 11:28 PM CEST, Danilo Krummrich wrote:
>>> On Mon, 13 Jul 2026 13:14:43 +0200, Bartosz Golaszewski wrote:
>>>> [PATCH v4 0/5] software node: provide support for fw_devlink
>>>
>>> Applied, thanks!
>>>
>>>   Branch: topic/swnode
>>>   Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git
>>>
>>> [1/5] kunit: provide a set of fwnode-oriented helpers
>>>       commit: 9fdbdb528488
>>> [2/5] software node: add fw_devlink support
>>>       commit: 37e586675993
>>> [3/5] software node: add kunit tests for fw_devlink support
>>>       commit: eecba5978729
>>> [4/5] MAINTAINERS: add myself as reviewer of software node support
>>>       commit: 122630406245
>>>
>>> The patches are in the topic/swnode topic branch and will be merged into the
>>> corresponding target branch soon.
>>
>> I will provide a signed tag once I have the 0-day result.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git/tag/?h=swnode-7.3-rc1
>
> The changes are also in driver-core-next now, thanks!
>

Pulled, thanks!

Bartosz
