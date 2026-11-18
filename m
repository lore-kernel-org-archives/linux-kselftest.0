Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794961533;
	b=i6QyaJFMaqsBDisL3ku3ueLPrv6TGZLhNztDhdS6dhTzgtI9tpA9k4DkkeW7U0jaD8sQ
	 /QW+whSOcNbmymuzguTZ1TCBn6NU2R2F+XiQX3Zb0nT7Ns65ilannggmTwE/33557U2KT
	 Biaa3oB0koeT+Yvs7t9d/lgTmlrSntnpMWl/n7O2uNA1g4+2moTRQcfwSBuL8FYowYIeB
	 VlKnmqOYJ7j5Y/MkVkyNmTDBAyMvm6Pz3U7wxMT5xBODqhdMcADz89YaJXk6rUU13I3gI
	 4adpot7xar0I5NMpVS0OR0eIFzTlcAckYHW8IesDYuOA0UrosjjpThCcVKHhrlz8qPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794961533;
	h=Received:DKIM-Signature:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:MIME-Version:Content-Type;
	bh=0FtVx+bdZ2ArSXP0mcBKd/WQHCmPoQ5KtqvMi55F/xs=;
	b=YNNbTumYPJAqev+Y8ylxIeucHR5PosGXSqWdhRtv1rNvbDERIMozkMIpf1aZWdheIqSU
	 6ejEgpsnJs79tkxH/Oz2QlvOvKeNNUfnXnwqVQ/iggcG1Wa66oY7PsVI4+0xMXjKQjedJ
	 O78U2G8czUUmboZ9H44ePVUr7qo0icyh84he86QhnYZTgH6KtlE0I59Lw8VHyofq+I4hC
	 +ocpSZglOfNRQkaeQk7CN9BA60FraAWIq1UBBDpnx7Hkkhxm0eX3JQBf656xypuX5b2lO
	 0VV+8eI8qrNHrvMj3AnU2Wj5bHmXrbc9ulp0T02C8IsmOQTnOA4QWk8XR8nD6coNCqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RcbYZgYK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2F0606A31C;
	Wed, 18 Nov 2026 00:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RcbYZgYK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 112E31F000C4;
	Wed, 18 Nov 2026 00:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794961532;
	bh=0FtVx+bdZ2ArSXP0mcBKd/WQHCmPoQ5KtqvMi55F/xs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=RcbYZgYKuT8rtNBavT9z0RMeM4rv0wQkI8zvWHGBOBvEBOgztWdMgNcwrojSs3pWx
	 HRRaFKWgBtsPJfe0t/DO4Bbcp04o4fMI9CXSTEo+D7alzjW73Kmofjb+seANrtRMXg
	 PbXFyPiP+fZj/bQNK3A3AMBPlvGQE2r2QDwBeOp0kkL2YEgx+WSPQZyx+ZCwm1Fctn
	 xkVDBtaBfAt5+4g9ucbO/tXTR3RX0McYZgbPwcNcNfrQ58eFBavf1XIYebevnXW4/K
	 A7jlS6YsGDl3fqMDvPR+spnQ2RThSzCEcsf2Oa0e/rpWh4VVy7jnhNwQN27f2d3G/9
	 4l3d+Yv1MXXkg==
Date: Tue, 17 Nov 2026 17:25:27 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
    Chen Pei <cp0613@linux.alibaba.com>, pjw@kernel.org, palmer@dabbelt.com, 
    alex@ghiti.fr, pratyush@kernel.org, graf@amazon.com, shuah@kernel.org, 
    guoren@kernel.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
    linux-kselftest@vger.kernel.org, kexec@lists.infradead.org
Subject: Re: [PATCH v3 2/4] riscv: Add support for kexec handover (KHO)
In-Reply-To: <avLi0_mYXatBWmpL@kernel.org>
Message-ID: <6c377596-479e-439a-f68c-5d61fe40824c@kernel.org>
References: <20261106071459.2003-1-cp0613@linux.alibaba.com> <20261106071459.2003-3-cp0613@linux.alibaba.com> <179415145358.358073.165272378597657083.b4-review@b4> <avLi0_mYXatBWmpL@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Mike,

On Tue, 10 Nov 2026, Mike Rapoport wrote:

> On Sun, Nov 08, 2026 at 10:24:13AM -0500, Pasha Tatashin wrote:

> > Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com> 
> > 
> > But pre-reqs. should be applied prior taking this series:
> > 
> > 1. https://lore.kernel.org/all/20261023054518.3258350-1-gthelen@google.com
> 
> I'm planning to send it to Linus this week.
> 
> > 2. https://lore.kernel.org/all/20261104-kho-bootmem-sizing-v2-0-b0d1a834780f@kernel.org
> 
> This is easy if we take it via liveupdate tree :) 
> 
> @ricsv folks, how do you prefer to play it?

Sure, if you want to take it, that's fine.  I'll send acks for the two 
arch/riscv patches.


- Paul
