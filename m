Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DF7344D88;
	Wed, 15 Jul 2026 21:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784151033; cv=none; b=Ags1ZaTCROimugRHPU9JL95AOGZ3cpWRBBKd5/U1xEuDl5qqj+3cnoQZELATTyzqrLp3SnK4dW/Iu8iX6eLxVr5JJaWqX8KzjbZXfzok0iDKbAPR1rmHTKRBoSY53dJ2HxrxiXVaZbJoqac+NvzER9bjIzYOOxHwyXY8dKAxFFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784151033; c=relaxed/simple;
	bh=3PABS9NH5iuy84zHvN34brW4BF2bACsa7KXSX5fZj7U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=jQLP7lYUNTqis3sOCyrIz5DtIekSOqLe2JvMQV+rSW1FTJIZ/2CkM0eVRBv36Aa7SBTzFp4BsT9NwhBj/mFFTmOPFa/TJZxqnui5btRwrtTTzVBBbt4j+i0HWP5PNOHD2PoGwLZhkkoEwGww/4XatI2iCQhyeKzLeMFqdkJs32k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zu4Gyp8T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zu4Gyp8T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DBEF1F000E9;
	Wed, 15 Jul 2026 21:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784151031;
	bh=SaZ9nC0EEMsH/yfZRMmBPzfK5fZuUVlcMCSC2gKRBKg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=Zu4Gyp8TaOmVKv3nexwqoez9Ui3RD1dY/HZD8Td0pOQLmvoPMTbKlyswud/isDCz5
	 Rwy9DGIC2b92lIYw+BjThrocKJzcKrJJ2Mg64pPatfaODPtTYft//KKVMbG9HKq5KQ
	 2nWkR/SJCOOsSFZPBnPzrx5j02T6b4TiGfWv2mNIZvfJFOtoZQD9auxSeH1chYPvmS
	 Ap76054PGRWxSrvLhhXuLdD57emrgmlIjxF/N/SvCabNk3NTskV5mx97e/Dhu2doit
	 3wbn5rm9TRsK2ADPAs6/kwfOtT5Av5zG2LP90uTgjmy8HB0k82sPsf1scSIPjNSiQd
	 ge4cLVFJiOaJA==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Jul 2026 23:30:26 +0200
Message-Id: <DJZGR6NV2WK5.2ZRW7VZIRO3LD@kernel.org>
Subject: Re: (subset) [PATCH v4 0/5] software node: provide support for
 fw_devlink
Cc: "Brendan Higgins" <brendan.higgins@linux.dev>, "David Gow"
 <david@davidgow.net>, "Rae Moar" <raemoar63@gmail.com>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>, "Daniel Scally" <djrscally@gmail.com>,
 "Heikki Krogerus" <heikki.krogerus@linux.intel.com>, "Sakari Ailus"
 <sakari.ailus@linux.intel.com>, "Bartosz Golaszewski" <brgl@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, "Linus Walleij" <linusw@kernel.org>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <kunit-dev@googlegroups.com>,
 <linux-acpi@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <linux-gpio@vger.kernel.org>
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260713-swnode-fw-devlink-v4-0-d4f2dee27ad9@oss.qualcomm.com>
 <20260715212830.3077100-1-dakr@kernel.org>
In-Reply-To: <20260715212830.3077100-1-dakr@kernel.org>

On Wed Jul 15, 2026 at 11:28 PM CEST, Danilo Krummrich wrote:
> On Mon, 13 Jul 2026 13:14:43 +0200, Bartosz Golaszewski wrote:
>> [PATCH v4 0/5] software node: provide support for fw_devlink
>
> Applied, thanks!
>
>   Branch: topic/swnode
>   Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/drive=
r-core.git
>
> [1/5] kunit: provide a set of fwnode-oriented helpers
>       commit: 9fdbdb528488
> [2/5] software node: add fw_devlink support
>       commit: 37e586675993
> [3/5] software node: add kunit tests for fw_devlink support
>       commit: eecba5978729
> [4/5] MAINTAINERS: add myself as reviewer of software node support
>       commit: 122630406245
>
> The patches are in the topic/swnode topic branch and will be merged into =
the
> corresponding target branch soon.

I will provide a signed tag once I have the 0-day result.

Thanks,
Danilo
