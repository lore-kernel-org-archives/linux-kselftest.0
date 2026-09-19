Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AED17557E
	for <linux-kselftest@vger.kernel.org>; Sat, 19 Sep 2026 11:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789815905; cv=none; b=UUNhdjZTuMCosCeCY48qlqH/eoahx8CfCxYC6qfafKbs7xa1G6Q3hGZZxyzrR4esb/oyBmMnosWbP5VSrkf1f4PSb0DECGuvLVUDH0kxJwm39WhEgNI0YbVgmLAC/85j36W4/fnwOvoUZ8PZ879pIVIlYgdBvyJAd6do4bhnlFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789815905; c=relaxed/simple;
	bh=gQDfqWyvWhhukz0RZPe3Rxu+FRVDAMr+ZZPy6EzA9hs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a8/N503XZGpwzmR7Q4N2fv1wYj4aTq3oUDTbG7nQfo/8APWPRKwYScfEcxcBoDzvkc+CAYUZHBWj8A/I2r3M18Cu5iAVYdP8h6yTyx5oaDtPJShRDoSZgWXuuqNDXR0KqJarJ7i+QwDmD8xLXRw9B81fGJwezDngVhtXfReP1hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aIKZrqxj; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aIKZrqxj"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso820350f8f.2
        for <linux-kselftest@vger.kernel.org>; Sat, 19 Sep 2026 04:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789815899; x=1790420699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7rwy3osRntuCmj5MLCO/i0SriZXb6Zy0hh2IOAi6LGs=;
        b=aIKZrqxjF4VPN1406UeZ5bCtjM0v7OATVattud/Vgqfpi6VI5CN4dIoxiRwXGqvccH
         JcbdKdV83LLv3hndd3GQaMKJ2V8q5XmwYEZJaIaAlrnpRg52hjnRkvxkIiQokSlkBVOb
         RYUdGliBMWg1LOorOB0MG9VsFyRTKmLXLCf0xDJELBBsUMxpiBJIccrbrsbRD1N6WxPF
         rwZzN7Y2gVQwIB93QWEDzJ3le3YoYEVk+4jEuiiXOaApfcSTH6jOBIMPnsUmEkd+izLD
         IJSfVghYfk8of+6CG8ToupnlUn9CaERhykWxJ1PbRaWCgjIJ5VWvA5124A9grCHwrhZA
         aAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789815899; x=1790420699;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7rwy3osRntuCmj5MLCO/i0SriZXb6Zy0hh2IOAi6LGs=;
        b=RwiT/Q8VizsgXmReWBYC1QMWBWaqQ12VHDzXnSBT4uzWHjBX8l2U+w4pH0E5oBZkxk
         0n4GUeoAmQo8e0ShsA5nWrYqz86oNXAwoj1nwsq+9CN07966CmgkRwipPVAw+ajT57Ps
         gxAuSPO3Fzsh3DIpHRf5kdqQ2SGRwTWoYox2vhzsU7p4s0Q8saMIYGpTodRv6T1NTm/N
         YAuLOtLYY5q1HSXz6kzRSjLLK0AX7NtjVYgh1Vbloc65OfrIgIt6jLgI33s/Gu+vVYz7
         2Qd5kfUoHV/j+jhb84VNcLBeSyEmjqTEleAWBZm6Ks1cIJHYCvfw3jB+wLLcQWM5gR+k
         jklg==
X-Forwarded-Encrypted: i=1; AKwUvBytve9WyrjnDK17KegRJSYY5+oxP5bHBgAs5J6XAHC84U5yDOdU30u/RJ7f21pzcxHedyp2KnMntnphi1+nksg=@vger.kernel.org
X-Gm-Message-State: AFuF++mHzzInnCMw8I6CYHa7RDrb9hhzlqV/npuqBU9WCtLQ5xEYhFjD
	5QB3idvo63XT9gFWDTiPShkwSwVFqSOWudFH8L1Lud4ZCaSJmTP0kmls
X-Gm-Gg: AYBFou2Sq56EQRB4SNbWKRoqRNOIaw7fqJQbkLc/RTZ/qif/OD1jUvvsurdjZN8z9VD
	TVqHq5kJMHv9fQFUXJYf1jIgrsRbYnzvAuUUmZjYi/n9TWpfGUbgZvhOMV8qK8ENb/ODqsrc2/2
	3IOpOvI5gi4Y/owU7Wzn5oRKEBVgIZUpODBpyVO5fQQsoFrx+eAwYgtpafWtgoDKiyUnrVkXifE
	OUFvthYU0goyjgBKfMpdmPRv2w7J+MnjaFO+CWiu+1p1KQXfJcg0ZW/l/h/sOkNQGUDL5ITycLn
	XgKHliHep/eoFyo5gO8yDMwq6MwTPX3cpOxaCIFT8tcDGwzEEXVjhHCE10ZxD9+cNpIz54KnUr3
	/VX3CZn8XKEeDS/dUFkrRviD2jx98Pk0nbXCPB/DB15vetFAwjGMZPNsq4EaDW1wxIeIyjn9P8G
	rMQ1hAw9kdKEnWT7TEhM516z2ZxWLorx+r4rYmCley2xP/VQQarwPPVEgnrDrlwMYrxc39vjIdE
	63Pgam7OKCU9g7KAvOtYATBMkZqABT/87Gu
X-Received: by 2002:a5d:5d02:0:b0:485:8ee5:5ffa with SMTP id ffacd0b85a97d-4871e36b1c7mr7900927f8f.38.1789815898629;
        Sat, 19 Sep 2026 04:04:58 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724460767sm6267511f8f.13.2026.09.19.04.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 04:04:58 -0700 (PDT)
Date: Sat, 19 Sep 2026 12:04:56 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Hao Li <hao.li@linux.dev>, Christoph Lameter
 <cl@gentwo.org>, David Rientjes <rientjes@google.com>, Roman Gushchin
 <roman.gushchin@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, Kees
 Cook <kees@kernel.org>, "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-hardening@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH v3 3/5] slab: handle ERR_PTR values in kfree and
 hardened usercopy
Message-ID: <20260919120456.5575e0a4@pumpkin>
In-Reply-To: <20260903203720.63689-4-kmehltretter@gmail.com>
References: <20260903203720.63689-1-kmehltretter@gmail.com>
	<20260903203720.63689-4-kmehltretter@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  3 Sep 2026 22:37:18 +0200
Karl Mehltretter <kmehltretter@gmail.com> wrote:

> Passing an ERR_PTR to kfree() currently reaches virt_to_page() and may
> fault. Warn and return instead, leaving the bad caller visible without
> using the pointer as allocator metadata.
> 
> Also reject ERR_PTR values in hardened usercopy. Keep both checks
> separate from ZERO_OR_NULL_PTR(), whose exact matching is required by
> krealloc().
> 
> Link: https://lore.kernel.org/r/CAG48ez05QVn6_gQ2TBrRa1a_DWQoaSSYubUsu5YMWxx-gqMijQ@mail.gmail.com
> Link: https://lore.kernel.org/r/202608111716.0FA9DB17@keescook
> Link: https://github.com/KSPP/linux/issues/93
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  mm/slub.c     | 3 +++
>  mm/usercopy.c | 3 +++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/mm/slub.c b/mm/slub.c
> index f9b56cb439e7..027b44dd7f07 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -6780,6 +6780,9 @@ void kfree(const void *object)
>  	if (unlikely(ZERO_OR_NULL_PTR(object)))
>  		return;
>  
> +	if (WARN_ON(IS_ERR(object)))
> +		return;
> +

Since kfree isn't usually called with NULL it is likely to be better to
have a initial single check for all the error cases.
Something like:
	if (unlikely((unsigned long)object + MAX_ERRNO <= MAX_ERRNO + ZERO_SIZE_PTR) {
		WARN_ON(!ZERO_OR_NULL_PTR(object))
		return;
	}

Although is would save a lot of code elsewhere if kfree(-errno) were valid.

David

>  	page = virt_to_page(object);
>  	slab = page_slab(page);
>  	if (!slab) {
> diff --git a/mm/usercopy.c b/mm/usercopy.c
> index 5de7a518b1b1..c8d8703544c6 100644
> --- a/mm/usercopy.c
> +++ b/mm/usercopy.c
> @@ -157,6 +157,9 @@ static inline void check_bogus_address(const unsigned long ptr, unsigned long n,
>  	/* Reject if NULL or ZERO-allocation. */
>  	if (ZERO_OR_NULL_PTR(ptr))
>  		usercopy_abort("null address", NULL, to_user, ptr, n);
> +
> +	if (IS_ERR_VALUE(ptr))
> +		usercopy_abort("ERR_PTR", NULL, to_user, ptr, n);
>  }
>  
>  static inline void check_heap_object(const void *ptr, unsigned long n,

