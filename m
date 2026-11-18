Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794962224;
	b=4pVk5QjVHXkoBJcO09Wg7HB9rMq9NJ1mFPaqfHD7fDGinTRE3E3Y8sDfPlZqWExys7ff
	 vFu3CHVoi2Mg7d6f4i0w5hw1OvmBHyg2T//c6icKkLKNkpnocvcKqkQqbiWlcFlrBjTqt
	 KZ+QBEHi3i2axD+cPnw7fcfESREBgr4PxhXA1/d6DyMcCAnESl1rZ1IpykoBvY0SHN635
	 Cnteats7iyZWiJfv9AqnOqXNyjnjtax1iS1fbogQO9YunoLLdC70rrCkSTpehsneU6YJg
	 u5CMzJoZpacxR4baYggoFdQJy4Wt9FFxkkSEcr5I148sQ+cWKaLsYR92p4CEMieQ61w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794962224;
	h=Received:DKIM-Signature:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:MIME-Version:Content-Type;
	bh=4kbBk37SUYvMVJny9GfKjjQos42kqXBJeWxGUOyaU2E=;
	b=PRsu9VGygekcr9mGJesMbaFrj5i4bKCvnUx2UvxS5pn5n9AqFzRWc4z4bUlgqv10O484
	 mccrfa8utn2fzozWzgCbmzqUQ5E/tlGBzWLZePkNTB98CiuNEnu78sj7h5AwwinQRHcw/
	 sPtMIAXY/dZlvnoHKmvINwSpwqNX4VFMLU7DvJcSqb426qhAsiQ2HlZBi6Dh4XZx1qb91
	 p0hgOM+5Fol8Ul/pkAtnRGomcEugrQGhd5E+3XwZW0UdVDG70+eZ5SJEINB+l1obz2drv
	 JpzI/ennfeii9ecKKnqlc6XdnNNjJUmjLPVS14ox754saUVGE96r1uorfxJ9TgBiEDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="G/v5cxLh";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28ED606A881;
	Wed, 18 Nov 2026 00:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G/v5cxLh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9419F1F000C5;
	Wed, 18 Nov 2026 00:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794962224;
	bh=4kbBk37SUYvMVJny9GfKjjQos42kqXBJeWxGUOyaU2E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=G/v5cxLhB1/dgV5Xl4goxSccn7AlW8fiE46777Hs9OGguTbq4AVahrtcMrkZAxsRp
	 CkHKfhKDSUQozc4kaG/isS8F9+wNaQyf2aogoLhx21hHs75+24Or1WlZLzBhGNN34+
	 HW3ehV/A6A9BGnUJWeBJ68PF/ehdNtSQBuX2yPMcOdnXqvEqN3KOdRvRAakhekJEFU
	 sSFKFCig4yJdhauT0zTrQGVXsNS6DuTpmWJkK8ISxIAp3owW0612Sy8F824Qkt4q/2
	 Ysx5CZst9jrsCyQEtK1PP+/PQ8UkF0ZxMTGXX6i0/ohUyjvAQr3dhVxFO6LH5X5uM6
	 cM+oNRMSrzOSw==
Date: Tue, 17 Nov 2026 17:37:03 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Chen Pei <cp0613@linux.alibaba.com>
cc: pjw@kernel.org, palmer@dabbelt.com, alex@ghiti.fr, rppt@kernel.org, 
    pasha.tatashin@soleen.com, pratyush@kernel.org, graf@amazon.com, 
    shuah@kernel.org, guoren@kernel.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
    linux-kselftest@vger.kernel.org, kexec@lists.infradead.org
Subject: Re: [PATCH v3 2/4] riscv: Add support for kexec handover (KHO)
In-Reply-To: <20261106071459.2003-3-cp0613@linux.alibaba.com>
Message-ID: <8259aea2-c8f7-b9c2-9e31-bb852bffb83b@kernel.org>
References: <20261106071459.2003-1-cp0613@linux.alibaba.com> <20261106071459.2003-3-cp0613@linux.alibaba.com>
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

On Fri, 6 Nov 2026, Chen Pei wrote:

> The generic handover paths are already in place on RISC-V: the outgoing
> kernel publishes the handover FDT and the bootmem list in /chosen of the
> DTB built by of_kexec_alloc_and_setup_fdt(), and the incoming kernel
> picks both up while scanning that node. Only the architecture symbol is
> missing.
> 
> Set it to 64BIT && MMU: ARCH_SUPPORTS_KEXEC_FILE is already 64BIT only,
> and KEXEC_HANDOVER selects CMA, which depends on MMU.
> 
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>

Acked-by: Paul Walmsley <pjw@kernel.org> # arch/riscv

... since MikeR is planning to take these.


- Paul
