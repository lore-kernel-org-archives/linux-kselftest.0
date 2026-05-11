Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3C46FC5;
	Mon, 11 May 2026 15:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778511846; cv=none; b=Am11D9tsQk5zqWue3a9bmjTfPRbJvhyYSryald1La+JIPgw88BhuuYKS/bcKSCJY6CIhwdxDp3vg4HQpZ0nRYqaifTPZxudd4JBWxfcckknqSINTrNDUI7nDfiJciNKj2ONEKR87fXlR0Qi0lprBfjIbcpmrCZLG06fIQzsnAfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778511846; c=relaxed/simple;
	bh=5rwKi7tr09hER0pihis6yf/52eFEpLBNrZLa2dXqHsQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=RbAT0VWGu1obZ0D2/IttA61k11E0gIVK1TeckFsMNk2JQ4/9k2dKi25adQHKD+2QbXU6Bf/mIHt0qxM/J2Vn9wGa7UJoxhmK/ApCjtlasq/SgdUjatyO7gGA8+mne06YrMYzypiB+WYgIkXyFLOey9FVRIPJS/wzL+6vBpdTOtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uz7hdyiJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uz7hdyiJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DDEDC2BCC9;
	Mon, 11 May 2026 15:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778511846;
	bh=5rwKi7tr09hER0pihis6yf/52eFEpLBNrZLa2dXqHsQ=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=Uz7hdyiJ0VNra3nlqRzquy2RRt9l0Qx/nn65nxnEo0PmnxtAXi4qU98KupgG6b7x5
	 pbzISue6ee48iBaBZmRDHJD/kdQI4qc5S34QHHgJDnjz8JtfBmMqAzrx69HszCrYya
	 NTsSkzn+WG0G3pO8JKi967Ev5Ig05kwAgwbe5aOCa3qXY9xvfyWG13NOSSwGN1LkwJ
	 W2Y79NbAom83OkixSmjTDyIODGZ7ElkxbX24iQY+WcL0UuDT2I1Wz+xn29okd8UubT
	 70jvPjXiem53VGMZvpfj84E8QApe+gE4kO4ihNDCZTgFF6TIaRLgmDAR2HGSD4PcEP
	 YR+mv4YXSTV0w==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 11 May 2026 17:04:01 +0200
Message-Id: <DIFXTWSAEDHD.RMJBLY7XXEXU@kernel.org>
To: "Bartosz Golaszewski" <brgl@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
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
References: <20260430-swnode-remove-on-dev-unreg-v4-0-01574da0aed3@oss.qualcomm.com> <20260430-swnode-remove-on-dev-unreg-v4-1-01574da0aed3@oss.qualcomm.com> <afNEwrHLNTA4ywrN@ashevche-desk.local> <CAMRc=McH0zKz87z0TwPFrzZHMW6psytMaLZybM3pUk6OvUfo9Q@mail.gmail.com> <CAMRc=Mc_huU0HxHpD+RMNWeX2Sg84-LEg8y96BcF_qdtPr31eA@mail.gmail.com> <DIFWH6TWTOOT.37CW17JHKWBQR@kernel.org> <CAMRc=MeiL+MeFsiPrWja2qJx=zU3RXKLL7CDccX1epXWgNtvdA@mail.gmail.com> <DIFX59JPJI9U.1Y41563GD6YJL@kernel.org> <CAMRc=MfBnbSUxwjVjf81K-W8uQ8ecXmK=8=FkRqVvK+6AipQuw@mail.gmail.com>
In-Reply-To: <CAMRc=MfBnbSUxwjVjf81K-W8uQ8ecXmK=8=FkRqVvK+6AipQuw@mail.gmail.com>

On Mon May 11, 2026 at 4:50 PM CEST, Bartosz Golaszewski wrote:
> On Mon, May 11, 2026 at 4:31=E2=80=AFPM Danilo Krummrich <dakr@kernel.org=
> wrote:
>>
>> On Mon May 11, 2026 at 4:17 PM CEST, Bartosz Golaszewski wrote:
>> > On Mon, 11 May 2026 16:00:23 +0200, Danilo Krummrich <dakr@kernel.org>=
 said:
>> >> On Mon May 11, 2026 at 9:33 AM CEST, Bartosz Golaszewski wrote:
>> >>> Danilo: if there are no further comments, can you pick it up for v7.=
1?
>> >>
>> >> It seems that sashiko has a valid concern in [1]; can you confirm?
>> >>
>> >> [1] https://sashiko.dev/#/patchset/20260430-swnode-remove-on-dev-unre=
g-v4-0-01574da0aed3%40oss.qualcomm.com
>> >>
>> >
>> > Yes, I explained it here[1]. Basically it's similar to how we need to =
call
>> > platform_device_add_data() for devices created with platform_device_al=
loc().
>> >
>> > We can consider adding platform_device_add_software_node() once there'=
s
>> > a potential user but for now I'd just leave it like this.
>>
>> But there are users that already need this, no? There is Xe [1] and Surf=
ace GPE
>> [2], or am I missing something?
>>
>> [1] https://elixir.bootlin.com/linux/v7.1-rc2/source/drivers/gpu/drm/xe/=
xe_i2c.c#L99
>> [2] https://elixir.bootlin.com/linux/v7.1-rc2/source/drivers/platform/su=
rface/surface_gpe.c#L308
>
> Right, I was not aware of these. That could indeed cause a regression.
> I'd like to fix the problem in v7.1 but also keep it minimal so adding
> platform_device_add_software_node() and updating drivers to using it
> may be the next step but for now: how about adding
> platform_device_release_full() which would call
> device_remove_software_node() and then the existing
> platform_device_release()? We'd replace the .release callback of
> struct device in platform_device_register_full() but if the user just
> uses platform_device_alloc(), they would keep the regular .release()
> that doesn't remove the software node?
>
> That would go into v7.1 and then I'd provide
> platform_device_add_software_node(), use it in all drivers that need
> it, and then we'd remove platform_device_release_full() and go back to
> a single, unified release callback?
>
> Does it make sense?

If it is just those two (and at least I did not find any other drivers) it =
might
be easier to just add platform_device_add_software_node(), use it within th=
ose
two drivers and still land it for v7.1.

I feel like this change turns out simpler and less error prone than the abo=
ve
workaround to keep changes local to the driver core.
