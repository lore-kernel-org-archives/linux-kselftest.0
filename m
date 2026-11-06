Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974850;
	b=FpWGB/bN/Dt3qWu1EWMh/L/tDBK9NS0cE9GsSO1+R8hHb7dQ8dGyN6PijiiESYbxG3aL
	 xfXLeX57bkMJXNL3Wy9qZYxkCPw52z6UBHX+01mynn6gFI0ewvi+SQ2aqmfkl9uQ1Ln50
	 3ZH0DhEEDxN9RqzRPoapf7aYpOEqgpGAGXFxAsEpnHG+Kmd9B57xYSo0VU4ZA7hjxsl4z
	 nYk4gnOzsHW1umcAszB+XV7qL5TgcaIHdEzc5VAGzzoe2YkttfAa6Ik5ej7i4lj/5bR4T
	 jbQXph3TL2au95Oo9h5zK3NVhpJIOrwqxvMo32QF2MsHAuZ8tDMmaFc0Ss5SrMfIjCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974850;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=3BGm6++pKtOncS4lRKnJP40WFpWtCJnoqlazLALAmUQ=;
	b=I41l68SeSWOJOmrHbsphNws0BM3dNHKP5AXXETy6+dNlr0UTEgvqGyI+pe4ZT7Rcw8Qq
	 RjUQmB0F1ki76NS0qG256LnsVKe0llDECTVWzyGiYIcdYopjH3/5jotsfedGBUs0r76+S
	 F0sjj3VdJRmQ5Fqfx4FMCrSBL/9zNBglFISx8I7v3hobJl3LwK2xQC7dl6JGEJ+CxdZ1U
	 ZUfSsAZRuiRkYrClpcqjigTJeWmABlSYylqAENBtuW4g1esyhvKpVmgYHt4jHVbfhL/yS
	 lGsqWIvwtuYORT1j24rIsHlvUcHNH6EFYl1cn5sN+/MTNLyU1xpplWO30dOUsy1JSRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gyQX4xrL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D664606A326;
	Fri,  6 Nov 2026 14:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gyQX4xrL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 212391F0089F;
	Fri,  6 Nov 2026 14:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793974850;
	bh=3BGm6++pKtOncS4lRKnJP40WFpWtCJnoqlazLALAmUQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=gyQX4xrLrx1BFfFkKUZiu5XvGClGl9PbeRhj0kyNOSTxMLNyElhN6ErH+KHOL2n4r
	 BnkL587QN1a+6hBSF3cSgTzMR/sZ9xpPH6aorLKPvcO/nm/M60cQhz6fzdrag4gGFE
	 LQRH1tLBNlwv4RFQ6dElUrV2xanXCvtgwrfHJaWzZu/nFdnND+k8WE3H38bKL5Dczz
	 jLnriyrw/uSRafnQN8JItgZR9AQPLLiX9qhd+c6N0S7jB2sJKZvr/iWgZCLdRHEi0S
	 I71Ra4+finmIVHXOLTmF2NXyTNBYc6bLqwzm0sC5Gaz6IXN0bJUIStZvJ3mb5W6CSR
	 GGSOTjrfYdTLw==
From: Pratyush Yadav <pratyush@kernel.org>
To: David Matlack <dmatlack@google.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  kexec@lists.infradead.org,
  linux-doc@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-kselftest@vger.kernel.org,  linux-mm@kvack.org,  Alexander Graf
 <graf@amazon.com>,  Andrew Morton <akpm@linux-foundation.org>,  Baolin
 Wang <baolin.wang@linux.alibaba.com>,  Christian Brauner
 <brauner@kernel.org>,  David Hildenbrand <david@kernel.org>,  Hugh Dickins
 <hughd@google.com>,  Jonathan Corbet <corbet@lwn.net>,  "Liam R. Howlett"
 <liam@infradead.org>,  Lorenzo Stoakes <ljs@kernel.org>,  Michal Hocko
 <mhocko@suse.com>,  Mike Rapoport <rppt@kernel.org>,  Pasha Tatashin
 <pasha.tatashin@soleen.com>,  Randy Dunlap <rdunlap@infradead.org>,
  Samiullah Khawaja <skhawaja@google.com>,  Shuah Khan
 <skhan@linuxfoundation.org>,  Suren Baghdasaryan <surenb@google.com>,
  Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v3 07/10] mm/shmem_luo: Retrieve tmpfs files onto a
 tmpfs mount chosen by userspace
In-Reply-To: <auuyAseOISaOWwbO@google.com> (David Matlack's message of "Wed, 4
	Nov 2026 22:30:26 +0000")
References: <20261103010216.3447716-1-dmatlack@google.com>
	<20261103010216.3447716-8-dmatlack@google.com>
	<2vxzecd0k1dg.fsf@kernel.org> <auuyAseOISaOWwbO@google.com>
Date: Fri, 06 Nov 2026 15:20:44 +0100
Message-ID: <2vxzfqxehwhv.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Nov 04 2026, David Matlack wrote:

> On 2026-11-04 05:27 PM, Pratyush Yadav wrote:
>
>> > + * If @flags contains unknown flags or O_PATH, if @mode contains unknown mode
>> > + * bits, or if @dirfd is not on a tmpfs mount, the retrieve fails with -EINVAL.
>> > + * If the file can't be created, the retrieve fails with the same errors as
>> > + * open(). A retrieve that fails before the preserved contents are restored can
>> > + * be retried.
>> 
>> How is userspace supposed to tell if preserved contents were restored?
>
> Through the error code, like Pasha said on patch 3. I'll reword this in
> v4 in terms of errors instead of kernel internals: errors from checking
> the argument and creating the file, e.g. -EINVAL, -EBADF and the errors
> that open() returns, can be retried after fixing the argument. Errors
> while restoring the contents, e.g. -ENOMEM, or -ENOSPC when the contents
> don't fit on the mount, are permanent, and retrieving the token again
> returns the same error.

I wonder if we should document per-file type error codes and what they
mean. Perhaps some time in the future...

>
> Thanks for the review. I'll address the rest in v4.

-- 
Regards,
Pratyush Yadav
