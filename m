Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792718353;
	b=nbTtxWIy14eXXDssIVAoHqW/zUgYtj85NMg986gCeq7DAbXCMKKNK8+/rAnuA3CBhp2E
	 ZawL/WNSFax/+H3P82SDAVeFicMDufb6giQuJzE8Ht7qBHIIcCnZnldGvwuQsMhiso6Lt
	 ODjHbrYTKt19C5fBA2tSW0ceMKGCF0yDjhYnQZY4bOlxEDyLQ4eUVQ3HdmMFKdHr52ug5
	 BC8OPPrPcRjPNHH9atPgGeVOlQ5ky8MlPMaXA5WflYAEIogfYkC1gZLvi+uvOTSAs3f/Z
	 CVIeCgTXjTHODJ3EQbHyp3U0JjfN03HBNHJnF4zPBDFczQL25w7BSlrdDRlWL94nQww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792718353;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=e2zDuQ/aXEEWomBrxUJGRirsqAdsyLdM9FzdN7nPUwk=;
	b=mY2jLyjx7Ux4/8Gt3vDsvy+PuJvWeZJgpq04DdBl4he6zXWSK8BFov4xQZVzpXQRdnTB
	 pTJVWe7W7BFTtbiWDLoZnTT8hcfpYat2Z1dG13KV/NICyXSucNPSBrUoQtjIcnexd2bCE
	 xnAVJsMXbWVMSHLOjMIw0MeIU8k3x7CKmKFCjDP1uceqlSVu6ee+a6oAxS4kh+CAvQ0q6
	 BziPnUqIQ92MwcfG4cDmiHSZNd5XK7EiLNMXOFMVi91pM59waybHxz+KC5M+sXXXwQwWy
	 /pEs/+uhrUPPRcQli+WnmaBiWHpljmWP7iOVKvyGAW3bxM7Aj45Z7UEXCjZv8mUxNMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Uc/rGAGZ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E91606A319;
	Fri, 23 Oct 2026 01:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uc/rGAGZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AE681F01825;
	Fri, 23 Oct 2026 01:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792718352;
	bh=e2zDuQ/aXEEWomBrxUJGRirsqAdsyLdM9FzdN7nPUwk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Uc/rGAGZk8vr+E6AoXyh0t0soaQCApn2WDra6R058New8ww35F55ki8kh5lY4Rkng
	 bX1+JIZRtXNt4lTfQGyAsaL5Hqgg9YrS/EoQ+0L+AD7cXTOhfxS+UgoPbf+f99VjqI
	 BiM3JV0LTKvwaypqoVcmebZYTJmWVMCWnNsfKmdXYIO6fw5L5Z1zt6JPdE5rxIcu3o
	 sxc8Pld+qO/L+7B9hJSVOMRMjG6AuwVCAbNu/KUFFCCZbnGDTIj4gR/Dofdbbo9Xg0
	 NU9Lxbvf69hLYjNPGAf7S18Xymzqe8/ATcPRTh7ftyo94IZTtxdQsyj9LO4L6wGPBy
	 5ZLuvkzlG6Dgw==
Date: Thu, 22 Oct 2026 18:19:11 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>,
 Stanislav Fomichev <sdf@fomichev.me>, Taehee Yoo <ap420073@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, Kaiyuan Zhang <kaiyuanz@google.com>, Bobby
 Eshleman <bobbyeshleman@meta.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, Simon Horman
 <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Dragos Tatulea <dtatulea@nvidia.com>, Nikolay
 Aleksandrov <razor@blackwall.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Tariq Toukan <tariqt@nvidia.com>, Kaifeng Wang <kaifengw@google.com>
Subject: Re: [PATCH net v4 3/4] netdevsim: support devmem RX and TX bindings
Message-ID: <20261022181911.5d19ff13@kernel.org>
In-Reply-To: <CAHS8izN_N25mm9vALax+P+W45gyxVoMbZoTXW3r6nPC2Z0A7JQ@mail.gmail.com>
References: <20261015163915.1166043-1-almasrymina@google.com>
	<20261015163915.1166043-4-almasrymina@google.com>
	<20261020121858.3b9107c5@kernel.org>
	<CAHS8izPwWT+vbgAe49m5vXsRxT3unbfjLTkVZBScgAPdQTo2dQ@mail.gmail.com>
	<20261021132304.23e0a4e7@kernel.org>
	<CAHS8izN_N25mm9vALax+P+W45gyxVoMbZoTXW3r6nPC2Z0A7JQ@mail.gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 22 Oct 2026 08:41:43 -0700 Mina Almasry wrote:
> On Wed, Oct 21, 2026 at 1:23=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> =
wrote:
> > On Tue, 20 Oct 2026 23:17:34 -0700 Mina Almasry wrote: =20
> > > But on the other hand the test coverage is nice, and maybe one day if
> > > we add enough devmem support in netdevsim we'll be able to fuzz the
> > > data path or something. Is there a way to get the best of both worlds?
> > > Like put a comment on top of netdevsim that this is test simulator
> > > device and any missing functionality and/or bugs in it should be
> > > medium criticality max or something? Or is it too much trouble and I
> > > should drop the netdevsim support and tests? =20
> >
> > I already strip Fixes tags and apply the patches to net-next.
> > But it's still a burden. If you're signing up to fix the issues /
> > review the slop we can try. =20
>=20
> I'm more than happy to help but I'm not sure what you have
> specifically in mind. What I was going to do is put a comment/readme
> in drivers/net/netdevsim with a note to sashiko and LLMs, "this is a
> netdev simulator, used for testing; do not call out missing or
> incomplete functionality as bugs." And then hope that the LLMs and
> sashiko pick the directive. If not, I can tell patch submitters to
> ignore sashiko code review bug findings in netdevsim. Is that
> sufficient, or do you need something else from me?

No, the fact that it's a test harness only impacts whether fixes
got to net & stable, not whether bugs need to be fixed.
I was expecting you to keep an eye on the list and review any fixes
that come, basically.

> And we can always revert the added devmem supprot in netdev sim if it
> becomes an issue.

Right.
