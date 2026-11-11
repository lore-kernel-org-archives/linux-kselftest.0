Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395927;
	b=bG1ookKIL7bKnfnBmSLCaLggQJmmAIfLApNGpSCULaW+NcDy080UoE6eOPx0QRjB127Y
	 mS+Der4FoKRPSC2v5Zui2DHgJDbVVBbP9rRdp+XzHbQhmcAdvdeUv42ppLIOu7Lcfp5pD
	 Oup+GMfulav8YHY6xIT85VY/PuxEBbJif1WuEZUggtNVEwd8N0Bw31fOLwIsQYEPEOzNv
	 JcP76SkbIFsx2IKOebODNLbHrAF7eb80Rkw2K5BziXvj4/4wY/8UVbdRwUmFcmbgwG4x5
	 KfQz5em5jZdmd0c3CaxcKHSxQ4782fiTQbHCQCZpSy8yFWGA8cVAxV3XIBQ1OHTAKGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395927;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=LGtA8oHwJxBMbpFS71S5aylj40/O50v1rdQBtx/3tAk=;
	b=ibcIz7UBbL89xNPn2cTvIzm/N5LLHaehO8MJ4UK+hpiknldbt/YFxeJHK01MfKASELYk
	 Xw6K/tWkPq6slNEJXoVQz+SCwxp7/ggM3txHxdJ6TwxU/eqh48n+AU48Tg7V4+Hb/jwT/
	 Z5DmdtTCok4fcXl0/w+G0RwFlHoErL66mACwZGnGDRAyQmOD9ShmfARE2ZKmSfv1lZhug
	 3MCNrNQkqZhaLAH1a5750Ds8gxE1gJXc8GkOtPzy1CDmxW9z25QA1Kx6eWzcgX1a6HZ2F
	 7S6fi90H52QcHvacjx+cOeJzPmd6ksWyABf0CLnCezQV62HAGABQSMFdBqYBPA9R0Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hlG6MDWB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6EE606A321;
	Wed, 11 Nov 2026 11:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hlG6MDWB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0F971F00A07;
	Wed, 11 Nov 2026 11:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794395927;
	bh=LGtA8oHwJxBMbpFS71S5aylj40/O50v1rdQBtx/3tAk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=hlG6MDWBY3f1BLNyjZYL56zodU/rHV9hZ+npsdSbztWpev2Pr3j7saWo7HrZR9h0g
	 r/F714KjW5XGwjw7RKw9cII9h6AK6haRNUANV5ARKvGJHmqiimNq3j6T9ddmR3V8Hr
	 zVtJJ+FY1hAA7mkWNHYX+EcZEvzkWUGg0rq3wsUcNo5a7gS7CI0wO8o3DXznPVIhil
	 9IvcoeMkIWcxahIopQgSHyi+oklrqZv2T2QU19r4qs9exYAUTwEN+rbLCTpB/pGAeg
	 2RsS9dQGmcstxsPmOv94KVlDlM8arNS0cnTDwJa6FF65R+eIt126qpFl5CaFq98KGc
	 T6HtQw9NEaqQA==
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 0/6] liveupdate: Add LIVEUPDATE_SESSION_FREEZE ioctl
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, rppt@kernel.org, shuah@kernel.org, 
 linux-mm@kvack.org, skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
 vipinsh@google.com, linux-kernel@vger.kernel.org, corbet@lwn.net, 
 dmatlack@google.com, kexec@lists.infradead.org, pratyush@kernel.org, 
 rdunlap@infradead.org, graf@amazon.com
In-Reply-To: <20261105050053.3063001-1-pasha.tatashin@soleen.com>
References: <20261105050053.3063001-1-pasha.tatashin@soleen.com>
Date: Wed, 11 Nov 2026 13:18:40 +0200
Message-Id: <179439592040.425130.10808690337075841196.b4-review@b4>
X-Mailer: b4 0.16.1-dev

Hi,

> Currently, LUO freezes outgoing sessions only inside the
> reboot(LINUX_REBOOT_CMD_KEXEC) syscall path, serially under global write
> locks, and binds every outgoing session's lifetime strictly to an open
> session FD until reboot.
> 
> On hosts running many workloads (such as VMs or stateful daemons),
> workloads do not all pause simultaneously inside reboot(): they quiesce
> one by one ahead of the host kexec. Userspace needs an explicit
> per-session freeze point to snapshot final file state (.freeze()) as
> each workload pauses -- concurrently across sessions under per-session
> locks -- along with a way to commit a frozen session into KHO so it
> survives closing the session FD.
> 
> This series introduces LIVEUPDATE_SESSION_FREEZE on session FDs:
> 
> 1. Freeze (flags == 0):
>    Freezes all preserved files in the session under the per-session
>    mutex while keeping session lifetime tied to the session FD. The
>    session stays frozen as long as the FD remains open; closing the
>    session FD before reboot (for example, to abort the session or on
>    process exit/crash) runs .unfreeze() and .unpreserve() and reclaims
>    all resources. At kexec time, already-frozen sessions skip the late
>    auto-freeze step and are published into the outgoing KHO subtree.

Let me bikeshed for a moment :)
I'm not fond of "published" terminology. We just moved serialization
from one place to another, why not keep the naming?

-- 
Sincerely yours,
Mike.

