Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEB833A9C3;
	Mon, 25 May 2026 18:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779732376; cv=none; b=qt14K9VQzAPMKDGS1x8UcFvnNvQ5DG0GC+TsOQBTrqNzSlhtyNxvLq97p3AhW4DK60jBlLqT+JiF2Rpole8pQOCY363aPBVzKqUgkGUMxaRBCmBI2gIWRN8Lx0IOg1dhi5eFlEEh0ivTyraBuA+tKaenydJq6NNd3iqeg2RnLps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779732376; c=relaxed/simple;
	bh=VbZtE92DEJPaUYzv2cVoHkrnhRBWIh/74nXctkLSO7w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YnpEN9Ovz5Qkl5QbfXDxbQTbcCUKvM7n4ZcasMLRrFgXnmbUJHb3LZg3WFGOs/68WDIf97gQHRjszoXT3cglMdvYoS8702jsU49iEKvktEHsCVTa9PHkgbR1Z5yWKwb2B+c4gwfObGq75WOaDve3DJqwGPHe0k36+fBrcrgxHEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AAgI907/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AAgI907/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7586C1F000E9;
	Mon, 25 May 2026 18:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779732375;
	bh=VbZtE92DEJPaUYzv2cVoHkrnhRBWIh/74nXctkLSO7w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=AAgI907/ix46+f/o+rYSUASNl8Yo8MzXYWgMHOPxVQjSOz/9rNLLJAMGiSsZRy9kR
	 24OkeO/nW7oiHdYKn9CKwPVryjJZPiCbXB9uj46v8sPOIJcH0o4USw1R4bcQr3SMb2
	 qRsI8szcQeqKDxz12lDgwHcp/Sx1ai2OIteUhNaDJ9EwOVOZ3Ub8KR/kOZ2qPxujJs
	 TuBA3gQvTjWdMif4+gt+B8Gef+ExtXfg9DUinsd0gwRyk+Z+ooifQywadijwrh1aqM
	 +9Gich1xLUVPf5UeKH82KDuYcvP11RtvdzBd5yE18jMt6JkAcwkenpmwiNVUQKcNSc
	 Oyp1w5SFyzYNA==
Date: Mon, 25 May 2026 11:06:13 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan
 <shuah@kernel.org>, netdev@vger.kernel.org, Jacob Keller
 <jacob.e.keller@intel.com>, Mohsin Bashir <mohsin.bashr@gmail.com>, "Mike
 Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, Pavel Begunkov
 <asml.silence@gmail.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 0/3] fbnic: Support larger io_uring zcrx
 buffers
Message-ID: <20260525110613.4a1641e8@kernel.org>
In-Reply-To: <CAJ+HfNjE8e1Lj1yDEPYXk_KPspjN166rDbHon+zwiJb1rPqSrA@mail.gmail.com>
References: <20260522113225.241337-1-bjorn@kernel.org>
	<20260522070515.044d7d97@kernel.org>
	<CAJ+HfNjE8e1Lj1yDEPYXk_KPspjN166rDbHon+zwiJb1rPqSrA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 25 May 2026 13:08:59 +0200 Bj=C3=B6rn T=C3=B6pel wrote:
> The driver relies on the generic XDP frag coalescing
> (xdp_buff_add_frag()). So, adjacent 4K completions are extended into
> the same frag. IOW, GRO should see coalesced skb frab, rather than one
> graf per HW BDQ frag

=F0=9F=99=82=E2=80=8D=E2=86=94=EF=B8=8F=EF=B8=8F I'm taking about coalescin=
g across packets.
You should enable RSS-hash gated payload packing, and then we should be
able to combine frags from multiple packets. But only GRO can do that
safely.
