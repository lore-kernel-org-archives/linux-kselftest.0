Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794302683;
	b=Yc9ImWZfrVRtk8PZlEC1BzCTj2DnahkwPEJaEj2jWf7C38Gn1C6gp5Oa3vR6aUmY84jJ
	 fG9Nk3VqD1QapP7hvFgVf1XW+7NPPZB5eRWFX94sKaIQpATo5FZ5rycF09QDQiNDL/EP9
	 +PVEqWl+OvppGqFUGLFjpkL9yYiXAbrjiKcqj59MXRy/0pUazYVhJjgmwcMplAO+gnD1O
	 9/i3dMQkdZnG98Ccry2CoNmuHanUdPbVZKsx+WbsxB/JC9M/2ZEwxbXT/hAikvajr2/l4
	 jirUy9t160TO/1oMck6UILc+RqKbOXnxkl5ApT0osgy5/CArIzqZeN9VUGbC5eLuy3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794302683;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=anLdELyja2Hy69l1U4K5GC3KSWyOsZhor6+5I7MJPrQ=;
	b=pQ+DL/c8FzaulqvYZuxUwjw51mYrsXKMt66aqeQBGQguPYKJDEGYBIfV1yiWrmnxKXbx
	 GiSfS7Z74zm09cGUJ2szA9pNi9Q+NiPJvCIn2PW4RcIGsbimhcgAFdcvIKuChofaIsN3g
	 P1Xm+oGY6Qata3R3l2DpWL1y38j99hfM6GegQdg264UTbNrBK/xGZ+Bku4DSWxuBMcWwJ
	 WMntF8pCMC3UJTc1W7b5lWAmDMu5lSwNL1mqe3t0aovx/duOgy3ZG8vD+PeLAmgAEXwyE
	 FtyZznHtkp8x/A97b4asvvw9dxI3bipJy2VU2Kvdf0m0n3YIQCWuq/Qwou0xS7nFzJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ESB/PjWK";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4096070B34;
	Tue, 10 Nov 2026 09:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ESB/PjWK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5C931F008BC;
	Tue, 10 Nov 2026 09:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794302682;
	bh=anLdELyja2Hy69l1U4K5GC3KSWyOsZhor6+5I7MJPrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ESB/PjWK+7S4hjQjB/73o85ozUTxNGJcqR0TnfzJKkNnd6UYrv4E7xJSc1bKO//Hn
	 rkf4+WQvzyZf42O1qbYbMhUlmgr1W5deOzJJmZ5KUMYJKnnpWtoXVYXj+dtdZtyPoS
	 xxrS1xZ9mP2EWgJcmiidxffyNNuo5GynD31uah5rmQUQHROrdjeqVIc3FwWbOt/y4s
	 iE2aCm5GxutXvK/N4gExiTkv5wRs7xrv9DSKusBdgzQawHVWyUg7snClrfR+QAU+ip
	 DJKYBZLvhsxN84M2YjXVI0YTj3dOCOF3l3zhtRrYrZmu6uDkut5NaVFPbagJucH2mt
	 RrlQ9HWeLrLTw==
Date: Tue, 10 Nov 2026 11:24:35 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Chen Pei <cp0613@linux.alibaba.com>, pjw@kernel.org, palmer@dabbelt.com,
	alex@ghiti.fr, pratyush@kernel.org, graf@amazon.com,
	shuah@kernel.org, guoren@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	kexec@lists.infradead.org
Subject: Re: [PATCH v3 2/4] riscv: Add support for kexec handover (KHO)
Message-ID: <avLi0_mYXatBWmpL@kernel.org>
References: <20261106071459.2003-1-cp0613@linux.alibaba.com>
 <20261106071459.2003-3-cp0613@linux.alibaba.com>
 <179415145358.358073.165272378597657083.b4-review@b4>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179415145358.358073.165272378597657083.b4-review@b4>

On Sun, Nov 08, 2026 at 10:24:13AM -0500, Pasha Tatashin wrote:
> > The generic handover paths are already in place on RISC-V: the outgoing
> > kernel publishes the handover FDT and the bootmem list in /chosen of the
> > DTB built by of_kexec_alloc_and_setup_fdt(), and the incoming kernel
> > picks both up while scanning that node. Only the architecture symbol is
> > missing.
> > 
> > Set it to 64BIT && MMU: ARCH_SUPPORTS_KEXEC_FILE is already 64BIT only,
> > and KEXEC_HANDOVER selects CMA, which depends on MMU.
> > 
> > Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index e7891a2a89da..a5c56252ff44 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -1125,6 +1125,9 @@ config ARCH_SELECTS_KEXEC_FILE
> >  config ARCH_SUPPORTS_KEXEC_PURGATORY
> >  	def_bool ARCH_SUPPORTS_KEXEC_FILE
> >  
> > +config ARCH_SUPPORTS_KEXEC_HANDOVER
> > +	def_bool 64BIT && MMU
> > +
> >  config ARCH_SUPPORTS_CRASH_DUMP
> >  	def_bool y
> 
> Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com> 
> 
> But pre-reqs. should be applied prior taking this series:
> 
> 1. https://lore.kernel.org/all/20261023054518.3258350-1-gthelen@google.com

I'm planning to send it to Linus this week.

> 2. https://lore.kernel.org/all/20261104-kho-bootmem-sizing-v2-0-b0d1a834780f@kernel.org

This is easy if we take it via liveupdate tree :) 

@ricsv folks, how do you prefer to play it?

> -- 
> Pasha
> 

-- 
Sincerely yours,
Mike.
