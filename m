Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1895A3859EE;
	Thu, 21 May 2026 14:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779372449; cv=none; b=m0eX6NGoUswu2gFUXIXN7DZMvXFa/TVx+xYZVIkJdXTSaQMl7RidiLWyAuD9ZPym6FHpzhWnKw906PVBS0FezBOFOUE5MNtauvLPxC6HtfLeGa+s2gv0vxKVaHg8G3jvPWAOvnPuJEutSAssfUNdBbpTtFqkzQgatyOy68/qfEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779372449; c=relaxed/simple;
	bh=0a1EvytIIDKX0o6hs/rXNVLZx95abJo0lnvR7XdEMeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fj093OMlNUARtPXukf7IvHQxM1AY0pgFcMfKzdi1L2OJriVD1pZnVThdEe8dDFcrlqURn9TUeX+KS/37Orw2MaENQpGr9kuVtM8rwcubSp2w7GZsZ1sXfoT3l+8JbiKNcG/y5984RqqXSY6vRJuLg8EHO3bGacZGELP/e+DrpL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LV9TtB7D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LV9TtB7D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 408D91F000E9;
	Thu, 21 May 2026 14:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779372447;
	bh=Hux3wBl2wp9SFbVQhL1hrxxZt9zoT5Tprz47lmjNneM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=LV9TtB7DEyPu3uMF2RQp0T428LhTMYjUyHn7bZgh7JtLF7QohiEJdNdPCy9YZOr2e
	 43agC6Gu6h+VSujC1Gdci+BOPIAfOfKg0fwhNVufM6rjSYC5LumgAEU2T7x1RH6PEB
	 xsLR/K20+0kzST1fAYP5/TcQku9jjkS17JFHNeY00kl5F1oXjMxcoND6ZKE65WBQuc
	 jVy1L1wzQKl8+s+afA9y49BJdq/jy19+nM1wZbugWnMAPKNQM9KvnbDG1g51kryUxv
	 AtfadVmBSzfLBHmfTkxbd60Ocj0kASew3cst7sg5Zg2nj5xWvXVZrC1Q7C0DW0zDVT
	 FMDBxO+J9nFRQ==
Date: Thu, 21 May 2026 07:07:26 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: Geliang Tang <geliang@kernel.org>, John Fastabend
 <john.fastabend@gmail.com>, Sabrina Dubroca <sd@queasysnail.net>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shuah Khan
 <shuah@kernel.org>, Geliang Tang <tanggeliang@kylinos.cn>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: tls: use ASSERT_GE in
 test_mutliproc
Message-ID: <20260521070726.3494d2b3@kernel.org>
In-Reply-To: <5978f34d-dbcf-4196-8a95-13165a5ba034@linux.dev>
References: <0ee9f412b6bd1a260a547d19f979f73b396746ac.1779354585.git.tanggeliang@kylinos.cn>
	<5978f34d-dbcf-4196-8a95-13165a5ba034@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 21 May 2026 18:57:32 +0800 Jiayuan Chen wrote:
> > This results in a massive number of identical failure messages:
> >
> >   # tls.c:1686:mutliproc_sendpage_writers:Expected res (-1) >=3D 0 (0)
> >   # tls.c:1686:mutliproc_sendpage_writers:Expected res (-1) >=3D 0 (0)
> >   ... (hundreds of identical failures) =20
>=20
> I think it=E2=80=99s worth backporting, so a Fixes tag is necessary.

Why? Is this bothering someone? Are you guys hitting this in real life?
I don't recall seeing such failure in netdev CIs.
