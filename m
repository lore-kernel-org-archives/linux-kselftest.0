Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C02326D69;
	Thu, 29 Jan 2026 22:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769724027; cv=none; b=eKC9grERQD+g5Lgqr+2cpFa2Sh3vKF/FrGGyOo8s2o8G9R9wXMHAzTS2EwqsQJrWERnMPpSry3vBAM1lVX+rpsOl6KdPhZQeDfu/XwtsIxNrC3KZfQBGbtkmK1A0arsvx74q1lqlZO6bJbGKVnLHax3OyrzyujVDdyyIylBGZpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769724027; c=relaxed/simple;
	bh=Ft+3zSwMAmTsSgy8oyxsbijh1RzStnobzv6PRBzfa+I=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=n1pl5KSELxtnZ+ng/lXwvJkWTR932Zkf0j3wkd69ENcOMkw2vY7otPIXAdOcjSxJA9D+/YoUPiZPnSYishkO9QXg6we6sqmSVnExgBuUVID3R+Q8ieQMTbINpbtuibVAzXM5hAh5cPLxQVAAXLQMRDCrwQeuMkGa3C4QEwInlro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sfqmIq/M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sfqmIq/M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D3E7C4CEF7;
	Thu, 29 Jan 2026 22:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769724027;
	bh=Ft+3zSwMAmTsSgy8oyxsbijh1RzStnobzv6PRBzfa+I=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=sfqmIq/M25hauNyHN5KCfy/XgRs+bVpeMLss8LQqyDLBqvzgwKYCrX+iR02Qgt28d
	 LXIyZUc6UGpvihh7aaUQ+6C0SZmAxkxH/zxSgPIARxczJ7imaLdaQ554NqiMbLPdFm
	 BbG+gpvN2XpJlInORYna7yd69eEkjKyYWm9OkRvAivCV8y8E7Q/moaKOVi/26R3QiT
	 47HpWrR9PzQVKhSUyFZSfUzh+qpHWPueQdPUwPgd+/px7/tYwwJwDEWqUkRvNLsAB5
	 mJ1iq8X+JqO1cJOntjD9U5j/WNhRcHIvkzmt4mRKSEtOUTzmEOTSK8EUJNZYuPiB7d
	 07J+KrxK68fvw==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 23:00:21 +0100
Message-Id: <DG1ET3ZMX3LK.QKKLPFK1424M@kernel.org>
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Cc: "Bartosz Golaszewski" <brgl@kernel.org>, "Johan Hovold"
 <johan@kernel.org>, "Bartosz Golaszewski"
 <bartosz.golaszewski@oss.qualcomm.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 "Tzung-Bi Shih" <tzungbi@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan" <shuah@kernel.org>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Dan Williams" <dan.j.williams@intel.com>, "Jason
 Gunthorpe" <jgg@nvidia.com>, <linux-doc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <CAESzEGiA2DSp79pkjxBA5X-DWmSAAgyAF7usKn253jkGpYJMew@mail.gmail.com>
 <aXovtrAM1r1UyWxA@hovoldconsulting.com>
 <CAMRc=MeMW4g5em_b9qGBR9OmQZNzyQp-S=zKDCPFu506ixy-cQ@mail.gmail.com>
 <20260129105634.GC3317328@killaraus>
 <CAMRc=MfzByLPJ0FKySmG7b79Ah63Mtk1hs1N=6kv8pTDydrcGg@mail.gmail.com>
 <20260129144906.GE3327197@killaraus>
In-Reply-To: <20260129144906.GE3327197@killaraus>

On Thu Jan 29, 2026 at 3:49 PM CET, Laurent Pinchart wrote:
> On Thu, Jan 29, 2026 at 08:50:30AM -0500, Bartosz Golaszewski wrote:
>> On Thu, 29 Jan 2026 11:56:34 +0100, Laurent Pinchart said:
>> > On Thu, Jan 29, 2026 at 10:11:46AM +0100, Bartosz Golaszewski wrote:
>> >>
>> >> For I2C both the problem is different (subsystem waiting forever for
>> >> consumers to release all references) and the culprit: memory used to
>> >> hold the reference-counted struct device is released the supplier
>> >> unbind unconditionally. Unfortunately there's no way around it other
>> >> than to first move it into a separate chunk managed by i2c core.
>> >
>> > Isn't there ? Can't the driver-specific data structure be
>> > reference-counted instead of unconditionally freed at unbind time ?
>>=20
>> Oh, for sure, if we did from the start. But we did not and there are now
>> hundreds of i2c drivers that do:
>>=20
>> struct my_i2c_drv_data {
>> 	struct i2c_adapter adap;
>> 	int my_other_drv_data;
>> };
>>=20
>> and in probe:
>>=20
>> struct my_i2c_drv_data *data =3D devm_kzalloc(dev, sizeof(*data), GFP_KE=
RNEL);
>>=20
>> (or just kzalloc() with kfree() in remove, it doesn't matter)
>>=20
>> and the ownership of that data belongs to the driver. There's no way we =
could
>> address it now so the next best thing is to work towards moving the owne=
rship
>> of struct i2c_adapter to the i2c core and make it reference counted usin=
g the
>> internal kobject of the associated struct device.
>
> What I'm reading here is essentially that we rolled out devm_kzalloc() to=
o
> quickly without understanding the consequences, and it has spread so much=
 that
> it can't be fixed properly now, so we need to find a workaround.

I'm pretty sure I don't have all the details about the problem with the
i2c_adapter, but from what I read here briefly the problem simply seems to =
be
that currently the driver providing the i2c_adapter frees the i2c_adapter o=
n
driver unbind unconditionally.

I would argue that this is a violation of the driver core design anyways. I
mean, in the end an i2c_adapter is the same type of device as any other bus
device (platform, PCI, etc.).

For instance, when the physical device that is represented by a PCI device =
is
removed from the machine, the corresponding struct pci_dev is not forcefull=
y
freed either, it stays around as long as there are references to the device=
.

So, I fail to see how devm_kmalloc() and frieds are the root cause of the
i2c_adapter lifetime problem?

> And now we're trying to work around the problem by rolling out a revocabl=
e API
> that has barely seen any testing, and is known to have design issues. Doe=
s any
> one else see the irony ? :-)

I don't think anyone is trying to work around problems with devm_kmalloc() =
and
friends. It's just system memory, i.e. nothing that needs to be revoked. We=
 can
just not use devm_kmalloc() and friends if we need the memory to outlive dr=
iver
unbind for some reason. The problem is about real device resources, such as=
 I/O
memory mappings that *must* be released when a driver is unbound from its
device. So, revocable is clearly not a fix for devm_kmalloc() et al.
