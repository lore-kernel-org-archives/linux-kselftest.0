Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF5130F543;
	Tue, 19 May 2026 23:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779233634; cv=none; b=hxdqT8gl0q8mQD7TszqnCY0OijrJOpMj3+t0JIuxFfK6h19f5cKY6tQePxkYc5R4ti4oFt0iLwvqBxFOabyKgjQ0zD85ftzlCKYCSzbUvKEf/ioWNt1VhSkSzQflpqGsR7Tdi/OA3QY6dcKtBp447ZJ3G8Y6d36IRIOixMD84OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779233634; c=relaxed/simple;
	bh=vC6AYwTXot09caLQd/ZvoTsC5AafWzvtW4/7zofEtLo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oleEkrWlJ0WJTvCHBx1OjSW7qtQv0cAK22rG1JnqY0b+Lje8r1g+jZjGBbPDVTWoCqUOMsRY23h8AoP6iCqcWk7Ve6jKxX1m2RatC+UsW8HHLM+67+LhkuYMDhy/gpxB+jqw4s7xFrz0BEF4Pv2rlv+XsIhyDrKQSiz5Brsr5Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kz5/cGO0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kz5/cGO0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 178161F000E9;
	Tue, 19 May 2026 23:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779233633;
	bh=ulX6b7vP0uk3sV6760OHzBmHypbWS7Ssl299R22XTgQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Kz5/cGO05sc+DsGXo4EoXs6HxhCkB66LinX7rBIhamZPUuMbS9RfZ7w6VwTDULiUs
	 RyeJFtNbg3+52hqHRTIQQPJGeAJpZQjBzhDTQucbI/VAS2nHRllZbGkxW1Rd/p7Eno
	 Uovy60soxI2dgcqpwtF4PAQlXF0oMdHNzjttOBtpoGetxAfrc1hTxEbVFz2huJ/7wd
	 1EDI1phaP6Xh1zjCtHIYLw30HIobMTBOG+1rHn9HPKrjglByMquGW+gWkVJr012iLT
	 hVdpIAX115yu2lu78++gReQUNsjQbe+sJaNVAtgZ7dK5T9vIMdL+lMlHzApAKYffxf
	 A7ACSx0yXNHoQ==
Date: Tue, 19 May 2026 16:33:51 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Arthur Kiyanovski <akiyano@amazon.com>
Cc: David Miller <davem@davemloft.net>, <netdev@vger.kernel.org>, Richard
 Cochran <richardcochran@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Miroslav Lichvar
 <mlichvar@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Wen Gu
 <guwen@linux.alibaba.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, David
 Woodhouse <dwmw@amazon.com>, "Yonatan Sarna" <ysarna@amazon.com>, Zorik
 Machulsky <zorik@amazon.com>, "Alexander Matushevsky" <matua@amazon.com>,
 Saeed Bshara <saeedb@amazon.com>, Matt Wilson <msw@amazon.com>, Anthony
 Liguori <aliguori@amazon.com>, Nafea Bshara <nafea@amazon.com>, Evgeny
 Schmeilin <evgenys@amazon.com>, Netanel Belgazal <netanel@amazon.com>, Ali
 Saidi <alisaidi@amazon.com>, Benjamin Herrenschmidt <benh@amazon.com>, Noam
 Dagan <ndagan@amazon.com>, David Arinzon <darinzon@amazon.com>, Evgeny
 Ostrovsky <evostrov@amazon.com>, Ofir Tabachnik <ofirt@amazon.com>, Amit
 Bernstein <amitbern@amazon.com>, <linux-kselftest@vger.kernel.org>,
 <shuah@kernel.org>, <vadim.fedorenko@linux.dev>
Subject: Re: [PATCH v3 net-next 0/7] ptp: Add PHC timestamp quality
 attributes
Message-ID: <20260519163351.61b746d0@kernel.org>
In-Reply-To: <177921463623.22936.15326822041328476600.b4-reply@b4>
References: <20260515164033.6403-1-akiyano@amazon.com>
	<20260518182646.2d1337d4@kernel.org>
	<177921463623.22936.15326822041328476600.b4-reply@b4>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 19 May 2026 18:17:16 +0000 Arthur Kiyanovski wrote:
> On 2026-05-18 18:26:46-07:00, Jakub Kicinski wrote:
> > On Fri, 15 May 2026 16:40:20 +0000 Arthur Kiyanovski wrote:
> >  =20
> > > This series adds quality attributes to PTP Hardware Clock (PHC)
> > > timestamps, allowing userspace to obtain error bound, clock status,
> > > timescale, and raw counter values alongside timestamps in a single
> > > call. =20
> >=20
> > How does this proposal relate to:
> >=20
> > https://lore.kernel.org/all/20260517220326.4625-9-dwmw2@infradead.org/
> >=20
> > ? =20
> The two series are independent and complementary. This patchset adds a
> generic PTP subsystem interface for reporting quality attributes (error
> bounds, clock status) alongside PHC timestamps =E2=80=94 it's a userspace=
-facing
> API extension. The RFC is about kernel-internal feed-forward clock
> discipline, letting the timekeeping subsystem lock directly to a vmclock
> reference.
>=20
> Both touch ptp_vmclock.c but in different code paths: this series adds a
> gettimexattrs64 callback for PTP chardev ioctls, the RFC adds
> timekeeping_set_reference() for kernel-internal clock steering. No
> functional dependency or overlap.

I suspect David will agree, but it'd nonetheless be good to see his
review tag on these patches.
