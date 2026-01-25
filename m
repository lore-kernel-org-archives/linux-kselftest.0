Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3201E0DE8;
	Sun, 25 Jan 2026 14:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769350067; cv=none; b=VexYOkqxiAKM7UUl9l8IOGSIBRG3OsEhV5D+MLTy6tDvtPrZr90qNgatDDhI6GM4FRE1n/7juFyo+eV5YByDBt3nv073xSMpG5P5gHsSSPWz/NLiioyQUwn9q2Ij8b9KaA8RFflNUlUImtkvHuKSGOtTEGqpIo5AUt6/q6RYbcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769350067; c=relaxed/simple;
	bh=RsasokAE/xoslm1w7Oy+O2smeV6JJDYMlJREUp4PT5g=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=hoPWu9NxMLAiru5b1fLzcoe96im/HuRcDugPpPl76I3iqnjNsdthdOsI4rs1dInnsSBm+2luS0LbLIwTXpTtB0D/s1n+8ymCGAZGFDVQxYZh8LDwQRxy//zniZReJQnlXSl7EkJ64J8n2NvHXz6yWX2f3CjEXYvTfK/0VNcaqEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fk/VYJr/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fk/VYJr/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A82D7C4CEF1;
	Sun, 25 Jan 2026 14:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769350066;
	bh=RsasokAE/xoslm1w7Oy+O2smeV6JJDYMlJREUp4PT5g=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=fk/VYJr/xqTJTUUU9vaexb0LDO/ysRYZAx2Jyw8Hbpw7KbN5T0FAf+ILPKT1mcP9k
	 oi6KTvjUcoqCuJ+hHFgmwlD4XSsKY2GbGUI/55hjaoNfOwUY2RKsRZwS5Bv0QZtXI5
	 kiqTaKi7j7eDwS3YXLIJRL8U0oS6mjLniTGBgflltAGQUSAnztIp3mWGpSPZW7SpmC
	 Rq4OBpvNodHsIOqIclye6tJ8pidsZnyo5v6oJbGI1ebSRsE57GQqg/+WqzBvFNAMWE
	 p9K1il4yaMI7Wd98aALKygcmWdHi5YI/hOOKvTOSBgSqOqIPlrPC8MUbcqi3/4EUbK
	 aTppkHBxhK66w==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 25 Jan 2026 15:07:41 +0100
Message-Id: <DFXQ915MAG5K.2KYVQOTF056N5@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Johan Hovold"
 <johan@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, "Tzung-Bi
 Shih" <tzungbi@kernel.org>, "Bartosz Golaszewski"
 <bartosz.golaszewski@oss.qualcomm.com>, "Linus Walleij"
 <linusw@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <shuah@kernel.org>, "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
 "Simona Vetter" <simona.vetter@ffwll.ch>, "Dan Williams"
 <dan.j.williams@intel.com>, "Jason Gunthorpe" <jgg@nvidia.com>,
 <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh> <20260125132250.GP215800@killaraus>
In-Reply-To: <20260125132250.GP215800@killaraus>

On Sun Jan 25, 2026 at 2:22 PM CET, Laurent Pinchart wrote:
> It's the wrong solution for most cases, if not all. It will spread in dri=
vers
> and then become another big piece of technical debt we'll wish we had nev=
er
> merged.

It is a matter of how the revocable pattern is adopted. I.e. I don't think
drivers should create instances of revocable (device) resources by themselv=
es.
Instead, I think it should be up to the corresponding subsystems to adopt t=
he
pattern in the way necessary and make it accessible to drivers instead.

> We know what the right solution to the cdev race is

So, what is it? Assuming that this is what you are referring to, how do you
prevent accesses to (potentially freed) device resources after the bus devi=
ce
has been unbound from the driver for subsystems that may still call back in=
to
the driver after device unbind?
