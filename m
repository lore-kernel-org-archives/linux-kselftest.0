Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794397516;
	b=BPPUoUFDyT0+40DZzoZT9lQrfJqnJgPhaAjjLgKyrjjNnFznAYC5njCKOxa2oy96rl+7
	 RFpDbA9VM/DAiVwvRAteBonGDcA9++NPrcrMMUhRCnOs+lyu0kqVy6/XD3d9SQZNyFbHW
	 DSE0hntV/zetVK+gjWcQ8sFUAUyAIPkrO9i+OlfqDA4/Q055uq7/shjO7fD+h23eqy2PI
	 HmMOFRjCuqZAO8CS/GOC1DMOUiyRQX0V0eiZGUBthDPB9TzjGvpvtbotWebwlFnbJTidh
	 xpkdtTqDLNuHsOeJY1DvXrTeBSP4lOm51W+o3YeVFxxfHHMKMN94ke5ruWIRAl4Osog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=kVFpNKJHonPsoU0rKznaV1aSGj2r5pa7n7k1+LB8yBg=;
	b=r0bpsrZgVvZM9uBCOWw/6ZlR1b9iXwg+mQihWxlQ/u/vfu2XA2AqiYkj3Lfo8Rfbj6Cb
	 uYBz8j0EqsLZlsEIPb9BrAT/UWrmIw7N+yfRF6dlwcOkKEffKYK0gSRBoXWvyqgrFKbgP
	 +eEKu3gsgkOxccJwbeYvT8p3QxYIW2dU3gg9LMUO5YIeK/Tob9QggH4t5kkxTTBjOhd1Y
	 djT/IYSmSLPtPYBG+g+vi9QJUD8iw8lyxv6LZUAxAXqixMr2nuz9u7GV752F4JWAzvWOY
	 ihBbF+9uHshy0qIRaSsD0wP1+o0fRxYicCUHzsUsSwzYQNvBDzPguGmcfRWvmTi3DNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=c9DA1cFS;
	arc=none smtp.remote-ip=209.85.222.47
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293B7606A335
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 11:45:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 293B7606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=c9DA1cFS
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-998569550adso1734950241.2
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 03:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794397515; x=1795002315; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kVFpNKJHonPsoU0rKznaV1aSGj2r5pa7n7k1+LB8yBg=;
        b=c9DA1cFSmxCvO39uVubU9GovzfKszsFQBrJmlM2Z9CBevLDLmE6mQZuJVOweGh6q92
         0i/zFk4uRueqghCvx+g0+EWpI118FoHTAGu+B4lBXBLA4cgYDizfhGfUvUEQ7YGmsFKL
         m+Xp7kjZh8p19s2Oe8TjPO/gkx1lizaudJ41A2Cz32W6t1h7aNO644Jrm9adsvfwrUWb
         T9ISwCJMNe01okSmWCNQRK3WtK7JqMxeGtVhdx7lkJUWuP5P0RRYGt/AOr7mBU5aX3r6
         pRxCfdWUSag0sw8VpJMWFolX9dxNsern051lY7I2xzQeMMO9clCGP/e1NYzjUyXpksnd
         6qvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794397515; x=1795002315;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kVFpNKJHonPsoU0rKznaV1aSGj2r5pa7n7k1+LB8yBg=;
        b=ZivPgfs7/cXG9zxUUfB3q8RtVX/atVTSKYKupARj0lzyw5i9hqyZM29v3zRfo4QqZM
         YLuIXj2EZooaOy4pD2D1qBEtZN4NSSi/rAvjREbW9Lu0cVP63yDcGfnMYHCnr6pYFQjK
         +naOYxLgTF1U5v9xqi92amwZ5+3N/LHtMM7hZYS8ghQ08O43vxU3ubkJkoEXCAmzICjI
         xBVqZDSEDtKMSXdp8j2KzRBQETJkrDOiTS6nwBn5Da91H3E0UqOoXuREeyKfpHIbGvKP
         4LS70+L0wp6oz0G1u4/tfmO75wzSpXmRM4rj6Kvr0leif1kzmxaZKg7omgR3EXOBYxDk
         gnEw==
X-Gm-Message-State: APuU4Z/xgn83ali4jXaHfKKp6K9PAOLOwM3SC1t7ndXyiIiPKgsDkA/k
	guthCc98HFliM+15ycIYmD8w0/77wTpaqLToVzbM5hdwQwi2jeQyftzGk3UKYpgIfgs=
X-Gm-Gg: AYBFou0OszBKnsDWWYxl7t2iAdXvUHXiFL/M5CIgsLIG7y2M6/XKpfWxQjX3u+wAA60
	bkLdB2gYRQqBrqKWshIzxe4fDOA6b56i9YmNmNYxcw5Mquapjp4D1uQVwi2KTLOC8VhRNPGXkZH
	aWBIxCYDgO+Uo6M/okJM3RvJcZgMy5xAeCTdX7zR7W41cvxSoejtOOJzIH0gSZ9FRa73fHtrGDN
	WFz5XwZQ3Lx4DtX+SBiL+qHmKFzJXCwKMRlA2C3k0Pi/sMr2LxQbOsFk6PNnykb1p1S4SnrOM+x
	rpaZJ7xXRlngBZOXTNdgANxcvxIUvAzw0AcofQHdtO4iaKrrZO/agE/xEBTDTUnRKpYqlngo08M
	VBZd9yBVFexa+RrXezVkWbIAl1HEoLafXSNZAZAlf+NcdHOm1fmYnmU8sZUM7m3IHBjatYqMfMy
	GNFsf8E2ca1KK/del4X4IdbhL2tucgAKSqYlK0BqBfTMxNmpUJz+HOxpbXj2ppzDGfW53QU3c9J
	LriJqQWBwkzNYCM+X3GGUTr928cqQtZzKKDUqi5chSjsOegUdD5db6SmH/hT/VCgXH4JWjfmu/p
	UHbBMApWWWimHkth8iH21fk3LTynBSNvhMNNLJ6sQs+ol1OrXK4oMbPnS9MPbqdZ5vUv2BJBVye
	96dCudPskWFdRXaxh55Qvqhi2ObhHWxk=
X-Received: by 2002:a05:6102:5241:b0:7cc:306:d3ab with SMTP id ada2fe7eead31-7d4efab730fmr666726137.5.1794397515001;
        Wed, 11 Nov 2026 03:45:15 -0800 (PST)
Received: from localhost (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d3023543casm3548860137.5.2026.11.11.03.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 03:45:14 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 06:45:13 -0500
Message-Id: <DMSCTXTWCJWK.QF8T3E7OJ7L2@soleen.com>
Cc: <linux-kselftest@vger.kernel.org>, <shuah@kernel.org>,
 <linux-mm@kvack.org>, <skhan@linuxfoundation.org>,
 <linux-doc@vger.kernel.org>, <vipinsh@google.com>,
 <linux-kernel@vger.kernel.org>, <corbet@lwn.net>, <dmatlack@google.com>,
 <kexec@lists.infradead.org>, <pratyush@kernel.org>,
 <rdunlap@infradead.org>, <graf@amazon.com>
Subject: Re: [PATCH v5 0/6] liveupdate: Add LIVEUPDATE_SESSION_FREEZE ioctl
From: "Pasha Tatashin" <pasha.tatashin@soleen.com>
To: "Mike Rapoport" <rppt@kernel.org>, "Pasha Tatashin"
 <pasha.tatashin@soleen.com>
X-Mailer: aerc 0.22.0-39-g5d7784875be2
References: <20261105050053.3063001-1-pasha.tatashin@soleen.com>
 <179439592040.425130.10808690337075841196.b4-review@b4>
In-Reply-To: <179439592040.425130.10808690337075841196.b4-review@b4>

On Wed Nov 11, 2026 at 6:18 AM EST, Mike Rapoport wrote:
> Hi,
>
>> Currently, LUO freezes outgoing sessions only inside the
>> reboot(LINUX_REBOOT_CMD_KEXEC) syscall path, serially under global write
>> locks, and binds every outgoing session's lifetime strictly to an open
>> session FD until reboot.
>>=20
>> On hosts running many workloads (such as VMs or stateful daemons),
>> workloads do not all pause simultaneously inside reboot(): they quiesce
>> one by one ahead of the host kexec. Userspace needs an explicit
>> per-session freeze point to snapshot final file state (.freeze()) as
>> each workload pauses -- concurrently across sessions under per-session
>> locks -- along with a way to commit a frozen session into KHO so it
>> survives closing the session FD.
>>=20
>> This series introduces LIVEUPDATE_SESSION_FREEZE on session FDs:
>>=20
>> 1. Freeze (flags =3D=3D 0):
>>    Freezes all preserved files in the session under the per-session
>>    mutex while keeping session lifetime tied to the session FD. The
>>    session stays frozen as long as the FD remains open; closing the
>>    session FD before reboot (for example, to abort the session or on
>>    process exit/crash) runs .unfreeze() and .unpreserve() and reclaims
>>    all resources. At kexec time, already-frozen sessions skip the late
>>    auto-freeze step and are published into the outgoing KHO subtree.
>
> Let me bikeshed for a moment :)
> I'm not fond of "published" terminology. We just moved serialization
> from one place to another, why not keep the naming?

sgtm, I serialization it is.

--=20
Pasha

