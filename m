Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792539233;
	b=v0VJZ1slFA4WEsnePYkiaD/iN/wd6Goz1gAjQTJuhxrXysjV/+fBjDQEH7c7tgRkq7zo
	 4YYKckfeZb8v44Wc3jBkyn67iH98cIp8Fhs4HpNSc3MhCwNiujzMr3K3aRtBVtEkE3bD+
	 SWPVZI4N3UwDjisyMH73T/8cUiUcY1dTdHDwytkTrHTNTQgS5LV+v/92Ik6Evsql9Xa5t
	 X9IGAfEJw1n64HUZNpGtUoqMw2cIIPua9pfg2Nj/J01aI5iwZJCO6KysKAK2dEYJaF8qF
	 huFCwOkGf3NRqMw/XZJrdDk09Pmt/c4kjM7pAgsqPpQvgTeq10UQgufyJbyDV6kRLoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792539233;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Content-Type:Content-Transfer-Encoding:MIME-Version:From:To:
	 Cc:Subject:In-reply-to:References:Date:Message-id:Reply-To;
	bh=rXuTf9MlNi3gCPS9slrsF274GgQjjMDR257jPNV3xKE=;
	b=Zo4CTJNtWVeKGwZAE0qfyKWMABoLGhwXWmID94Nx5Azfg+CkIMi/HXyin5ZaXp+AtrIp
	 gVckAl1x2e3PrtCR4TyMN0ncVYwKAX8rElZqBQMGHbzLXoyeUZkxrfqI18Fm+nQyTCnNe
	 s9qvbUO2BETk2ZU4WZVS8HK+DlonzVtlZD2WkRt3XERMY9ts4fsRG3A6wc9WP+OFBD0PH
	 vx84s+qdT+VNOcJcOkHTp0zrLSUSub4/xC07TYBz8ackxUBpQZETEjr73xc3/ukB6MJtc
	 /mTtF+7rr6o66pjhgRbpkD1lfGoCsIRyuq9W8RqLIsrXjS41FurnwS5KofmCF1OYmsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ownmail.net;
	spf=pass smtp.mailfrom=ownmail.net;
	dkim=pass header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm2 header.b=jbFVrqp2;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=NmsGfiJE;
	arc=none smtp.remote-ip=202.12.124.146
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E84C606A319
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 23:33:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E84C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ownmail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm2 header.b=jbFVrqp2;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=NmsGfiJE
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 968721D00059
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 19:33:52 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 20 Oct 2026 19:33:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to; s=fm2; t=
	1792539232; x=1792625632; bh=rXuTf9MlNi3gCPS9slrsF274GgQjjMDR257
	jPNV3xKE=; b=jbFVrqp25QmshWSsLAdTlzXvUoy9NfrY5cVTYc7m8QAaKUrpl9y
	QusNbOc5/1sV3KN1FqQ+DP+qYw0al+GDT0jPyfrgQ9ajcoPMub0Xd+eZgl93jYei
	UneT4eRB8gPW2fzljYlz4IrDsrE4PVPRfLtkWAaDSNaObhDu24vmXm0bgamFZUGJ
	K8VsZuIv0F950oQQeCrpd/ZOM26dKcGbUgOP10TOOuvl6iShaTJajAKHWTvJbuXV
	mxa2KLBhf9AOjG+rq+jkudeRzEg/STaPWl8W8r/U0Vh4hPEI4ZWqWsi5Ie7fbTdF
	alYwTCI6Wr0+M8cDKjmiLeGRiyJU1HAC5zQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792539232; x=
	1792625632; bh=rXuTf9MlNi3gCPS9slrsF274GgQjjMDR257jPNV3xKE=; b=N
	msGfiJEA1jauM+EM0poq/ZB1SRhLq0HqRfAQR8O58GuTQT/2iijtp4NhqFubdiDC
	+TLtuwfHsj4O6G9/HOxbxoO3veERndt8zHVhHYbbq3CMCprjKbB5xxVsot9ZXEe8
	xJShUl2AB2vAEs0pJcNE+/CTgNN/Hssy/Lk/zZO2T/LaAzesQPUX5edc/kB+JE73
	KhEsDngHjtjZIz4R52QpyhGVnXEoMG6kU3YhicvQ7WS7PTHN0+HDKBEjx73njgAp
	cgMeOV6YQLz+Q9/Q6hxSiWIGj8KcX4ZZDYEM7apcZx9ST8HmVY80FBUkWcIqesVY
	0taXcBTmXeVmIK6i0rHmQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=ownmail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792539232; d=ownmail.net;
	mf=PG5laWxiQG93bm1haWwubmV0Pg==;
	rt=PGxpbnV4LWtzZWxmdGVzdEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:aeb9avtPYmigwdqzp1/D4qaKQxZn4kQU+oqNHavgdFhOriI
	Atlz6iLGQb283e+mgddwFFfQqAa1oQMLINptI/obdpZIr8aXA4oRAyzzzuSuOtt8
	+7BeHT0Q5MYEIxwEaL1pSnON18Gv0VTB7GzppYlqsL/823K+H+x5KF1s4pB2RXAG
	rO/JD2x4QVlw6wFpUSItPHKDhfNEAqescVs7p7nzUs3xqnKskcw6Y5wqt82NNCGN
	TN4ecc9pqkeu0Rrgw75gIxzNjh7gNEHepV0o7l/5zA177Woxh/EoBLgG4XM3ZyPr
	2PG7+5GxTeish5cA3n8cmNFMSQxczUmU4NUdZWw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,reply-to,
	subject,to;
Message-Instance: m=1; h=sha256:J/XJTn0s3QUHG8+qquqGGSJZEt19yvABeMqfC5v6w18=:kFba7Dsgg5LxWvj8orHnHGtvho6jdXYB12ViMVRveZs=;
X-ME-Sender: <xms:YPrXaoBFFJ0Xy6yQTmPsqGX14QP_dGVFe36OTRwQrw-vEHT7UZvSaA>
    <xme:YPrXavdMnzeKMvpZtjqBIwwqQuet0587bX2V5lOMjYTKfpz1AHWS1VyaIwijfAOJw
    W7vXISyIkjVkianClkeVEgr0q-EBqp1kM43lJykAMqUolUcRPI>
X-ME-Received: <xmr:YPrXav3eLXVQrL_dow6ysa5_a8-2nldHq8loLF_j4SN1LfoaL5HCUvijINGweMto6Lh2IKRgVQNyrmJTvT6eNCoTGr1LRLY>
X-ME-Proxy-Cause: dmFkZTGWaOVZU0YAt7mxINLLGn1D9+oSwfzBCHxdbgm3M3WrsGh0Yz4KrBc/T7GZ/WgvCY
    DXtXZ7zL/hLg16re4tAbVVBPnHXpfmmzVQNZDm9KvsSvUSwX5cAGu2ioYzQilwRlpM918L
    eDCKmfZQp43Qo/+YFAlfi/SKHU57xPBQeoZq9lUecR7+12XvaB6kG34Nu+PEdKoyevyZza
    Vod2FWkXII4RfqRoGr3K3z4fqg/fnX6l1pGobryjGfcC6amiRDDAsSM3iJ20ONc7sqE0IF
    RgF8EAL3J1QuGQHWzar45OlKk+zyeXplf6AHqQn5KWkg/o6uzsgqLLfDeHiVrWsMzk3par
    OOUEz/NktG4SWtO0hU+irl9txScKxpRjD5UlQLtrUxqMSJwxxAVI4GqDNOOdNATVja0F34
    uYXHWxSYxBiI809IHZgM5ONfpg6j4QIGPqLMiSJKomwSa3nlK+yY1+PTrS8NOl2jZeG0mC
    I4xWSYVvHooQrQZOPdAbf7RoK77CPNN/zaqJIKaddTiCQX2EzQLGJH7tXq4BAOQq60QPGu
    RucImKWtQ08ebSE9yZGQdwhKiTvvURZs8kFgVlj+z08s8zDuyMMkwW54gUZzpznkMH+FSK
    nCqRLUZgrjkc2HTWzXvG3ipcK9nVRjTe1iU5MaIQB7UWdBHTTM10kJkaR0xA
X-ME-Proxy: <xmx:YPrXauj1vCMgHmLHshj8RYoN-72aQAGuL4zhdTXFOLNA7BsBP9eO0Q>
    <xmx:YPrXagkgSqdZtVkl6rDEpyox8jTt6Yjb7FciuJRyx00FmkPbIuLDVA>
    <xmx:YPrXasagb6F-dXAPIilO1-jjU1g_4IADkEbEd5eQUPYbFjh0hLmjGA>
    <xmx:YPrXajGRJ2WCxrIIPxkm257JpX_ihvrJrPBQnkUrOqWj2fg3PLc23Q>
    <xmx:YPrXaswZ6_OTEU0BPZ4PmvIvzx9M5rpGntKL9XO3pDl2IiU8m3xNSxBH>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Oct 2026 19:33:49 -0400 (EDT)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "jamz" <jamz@amazon.com>
Cc: "Miklos Szeredi" <miklos@szeredi.hu>, "Jimmy Zuber" <jamz@amazon.com>,
 fuse-devel@lists.linux.dev, linux-kselftest@vger.kernel.org,
 "Shuah Khan" <shuah@kernel.org>, "Bernd Schubert" <bernd@bsbernd.com>,
 "Jim Harris" <jiharris@nvidia.com>, "Horst Birthelmer" <horst@birthelmer.de>,
 "Luis Henriques" <luis@igalia.com>
Subject: Re: [PATCH 0/3] fuse: atomic open
In-reply-to: <20261020141647.3271341-1-jamz@amazon.com>
References: <20261020141647.3271341-1-jamz@amazon.com>
Date: Wed, 21 Oct 2026 10:33:46 +1100
Message-id: <179253922666.1724252.16392934420146585044@noble.neil.brown.name>
Reply-To: NeilBrown <neil@brown.name>

On Wed, 21 Oct 2026, jamz wrote:
> From: Jimmy Zuber <jamz@amazon.com>
>=20
> Add FUSE_OPEN_ATOMIC, allowing the kernel to skip LOOKUP to improve
> performance. A server implementing FUSE_OPEN_ATOMIC will look up
> the name, create it if O_CREAT is supplied, and open it in one request.
>=20
> The reply says whether the file was created, as Miklos suggested in [1].
> The overall pattern follows his sketch in [2]. For a cached
> name, the kernel compares the returned nodeid with the cached one and
> looks the name up again on a mismatch.
>=20
> A server without FUSE_OPEN_ATOMIC replies -ENOSYS and keeps today's
> behaviour.

This all looks like a reasonably sensible design. As permission checking
happens in the client, not on the server, it is appropriate that
FUSE_OPEN_ATOMIC only opens the file if it actually created it.
So it doesn't make sense to implement O_TRUNC.

However the code seems to suggest that the server might open the file if
it was found to already exist.  In that case, were does the permission
check happen...

Maybe I need a more explicit statement of what FUSE_OPEN_ATOMIC is meant
to do in the various cases.  Or maybe I just don't know enough about
fuse.

There is work underway to support O_CREAT|O_DIRECTORY so that a
directory can be created and opened in a single operation.  Would it
make sense to include this in FUSE_OPEN_ATOMIC ??

Thanks,
NeilBrown



>=20
> Tested with a new selftest under UML and KVM.
>=20
> [1] https://lore.kernel.org/all/CAJfpeguEK4JsFo60=3DyHkpLL6XkDGS7cQ5GOhiFL3=
79KsYk0TsQ@mail.gmail.com/
> [2] https://lore.kernel.org/all/CAJfpegvXtXY=3DPbxv+dMGFR8mvWN0DUwhSo6NwaVe=
xk6Y6sao+w@mail.gmail.com/
>=20
>=20
> Jimmy Zuber (3):
>   fuse: add FUSE_OPEN_ATOMIC
>   fuse: open cached files with FUSE_OPEN_ATOMIC
>   selftests/fuse: add test for FUSE_OPEN_ATOMIC
>=20
>  fs/fuse/dir.c                                 | 359 +++++++++++--
>  fs/fuse/file.c                                |   4 +-
>  fs/fuse/fuse_i.h                              |   4 +
>  include/uapi/linux/fuse.h                     |   8 +-
>  .../selftests/filesystems/fuse/.gitignore     |   1 +
>  .../selftests/filesystems/fuse/Makefile       |   3 +-
>  .../filesystems/fuse/atomic_open_test.c       | 473 ++++++++++++++++++
>  7 files changed, 797 insertions(+), 55 deletions(-)
>  create mode 100644 tools/testing/selftests/filesystems/fuse/atomic_open_te=
st.c
>=20
>=20
> base-commit: b776cbe24cc1b79c7f5101762b0069b3f48b6a4b
> --=20
> 2.50.1
>=20
>=20

