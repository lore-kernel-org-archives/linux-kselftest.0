Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2DC3093A6;
	Mon, 11 May 2026 14:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778509915; cv=none; b=LT+4FX01G2QZ6fAm6lBFGVdHHybsGQhx7ZVRqcQTn8Ucqc23WJ0Oo6Mj36JMLiXA5GPI22NPPP5GLKS6NgqjuaCrVGeCNfq6fzRY94VVpKXSjpIY02gRZTNrUMVmh4Wc7Ju125RMNy6GuItardXw1JLUvCeZ0uYziISUzEGRobc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778509915; c=relaxed/simple;
	bh=8v4KE2KRo2HE0fobFmYT57AIdsiSReZ7GhIBsHolgrk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=KbGRSLntdMODqo8TmlScaO362n9MkmtdQo+HM009oYLMdzMqx3GshX3edw5DOzN+C/Nha+sN0spwjuCYRzY3y8Hs9QMAZ2C1GeRb/K4JLClP0KzDs/R7B/3GdLRlw7E/qifTCxwsIhGqAl6P438qXO3ZAC468x83xaZDzimm3z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HBOSTKmn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HBOSTKmn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1807BC2BCB0;
	Mon, 11 May 2026 14:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778509914;
	bh=8v4KE2KRo2HE0fobFmYT57AIdsiSReZ7GhIBsHolgrk=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=HBOSTKmnhj33V0nUdj71dzfNEmq3D9TOrPatRGeRiavQ61fC0bJkij0n5BBMnByDn
	 IjcXZAvuaZh5I5SYb10zILcaBvNcjub+2BC5ruLihW6YJpZif8VKqJnkCkJQy2teP6
	 I2+hXQqg1Y206FkWQpDt3Jd63GpCD1G+0ElhKKuDdxKZyAfhmjkIZPu/39ogOsMxRp
	 Qp7qK1oHVWutd6rMXOjGnT1xlTY1zaa6pmo1Jg7Jm0HCuUuUI3nyo4Igyi96I8QY6B
	 3RWP6iLMaOU+NS7A8HQLmPo35XAYUiVOHz4x/zLeJHEEKUUnby97x9kVApXXuZtULT
	 UdGQQ/s9EwerA==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 11 May 2026 16:31:50 +0200
Message-Id: <DIFX59JPJI9U.1Y41563GD6YJL@kernel.org>
Subject: Re: [PATCH v4 1/3] driver core: platform: remove software node on
 release()
Cc: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "Bartosz Golaszewski"
 <bartosz.golaszewski@oss.qualcomm.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>, "Brendan Higgins"
 <brendan.higgins@linux.dev>, "David Gow" <david@davidgow.net>, "Rae Moar"
 <raemoar63@gmail.com>, "Andy Shevchenko" <andy@kernel.org>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <kunit-dev@googlegroups.com>
To: "Bartosz Golaszewski" <brgl@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260430-swnode-remove-on-dev-unreg-v4-0-01574da0aed3@oss.qualcomm.com> <20260430-swnode-remove-on-dev-unreg-v4-1-01574da0aed3@oss.qualcomm.com> <afNEwrHLNTA4ywrN@ashevche-desk.local> <CAMRc=McH0zKz87z0TwPFrzZHMW6psytMaLZybM3pUk6OvUfo9Q@mail.gmail.com> <CAMRc=Mc_huU0HxHpD+RMNWeX2Sg84-LEg8y96BcF_qdtPr31eA@mail.gmail.com> <DIFWH6TWTOOT.37CW17JHKWBQR@kernel.org> <CAMRc=MeiL+MeFsiPrWja2qJx=zU3RXKLL7CDccX1epXWgNtvdA@mail.gmail.com>
In-Reply-To: <CAMRc=MeiL+MeFsiPrWja2qJx=zU3RXKLL7CDccX1epXWgNtvdA@mail.gmail.com>

On Mon May 11, 2026 at 4:17 PM CEST, Bartosz Golaszewski wrote:
> On Mon, 11 May 2026 16:00:23 +0200, Danilo Krummrich <dakr@kernel.org> sa=
id:
>> On Mon May 11, 2026 at 9:33 AM CEST, Bartosz Golaszewski wrote:
>>> Danilo: if there are no further comments, can you pick it up for v7.1?
>>
>> It seems that sashiko has a valid concern in [1]; can you confirm?
>>
>> [1] https://sashiko.dev/#/patchset/20260430-swnode-remove-on-dev-unreg-v=
4-0-01574da0aed3%40oss.qualcomm.com
>>
>
> Yes, I explained it here[1]. Basically it's similar to how we need to cal=
l
> platform_device_add_data() for devices created with platform_device_alloc=
().
>
> We can consider adding platform_device_add_software_node() once there's
> a potential user but for now I'd just leave it like this.

But there are users that already need this, no? There is Xe [1] and Surface=
 GPE
[2], or am I missing something?

[1] https://elixir.bootlin.com/linux/v7.1-rc2/source/drivers/gpu/drm/xe/xe_=
i2c.c#L99
[2] https://elixir.bootlin.com/linux/v7.1-rc2/source/drivers/platform/surfa=
ce/surface_gpe.c#L308
