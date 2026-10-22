Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792682254;
	b=CFtgWssaMNVx3gKIWYxX3SC2PFn5GVsZ0d53OWxxyWM9wUGHXhs12/y1DpcgMUBpVoyL
	 LKcHbx8NucKMTwPqP0WDZ9+0sT4xV0EbLKY0xGKX/1UzOi/M2CxzuWk/6XnMnF0zxuHFS
	 WRXCIn+grwj3IDHOqVBm70AHX3CYHjG1T1dDrcqUP8+tJlUyHy6+9vQaCaoR3svH2JbSE
	 1TGDXKI9ZNEGavgaoLdf9AoGhoC2abAfPEgfm/B5Go01CBOfjOwg5jwFUEkoNXODSJTTN
	 r1S76eEp/muJb7/dAYYQ/IVwDglr341Ng/X0Z61BCxNbcU1Q+XfKXqTHFS5dcYq03/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792682254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=nw86MTT9QYJNuk6B5SLe4LXpcyaG0CYCN6se45mv/xk=;
	b=1OesM91on+6AcGhraN978NerIZufbB5dLhsVAd9Vk16LWvczym8BJFs2p3AW8SqNOHti
	 w+OYU40gb09mFR6vpZCmz7pw9TiuJY6xmOlEa4ipL2sIx07bN8G4UZ3o+H5wMhpQWwxMg
	 fE+UnURmXIsHlAtIospbHbXGnAw5VkFoZNLkf7/uExkzrlE78da28Ld5WFDoEdhb7aarl
	 mnOiipAQHbOHn0r9IEb42wZjOLmCGcZv6wdMcRVl9eJwg9kXCH5jkYDkr3POWH8yah7r8
	 Ub2/k4kFnb1ChiENTyLc+VkT1m1ttAXfGemLPNVUzI/KOBkjXx3oDtpsAbaM6MBCDCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=ggwPTk0p;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32E2606BE63
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 15:17:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D32E2606BE63
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=ggwPTk0p
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-53639b8903bso13041031cf.0
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 08:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792682253; x=1793287053; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nw86MTT9QYJNuk6B5SLe4LXpcyaG0CYCN6se45mv/xk=;
        b=ggwPTk0pasWSGURpBXG+Hx0NtC9nfHdt9/oYX4WsjDNReWfInHOmWAb/eE6uvhDCUi
         rlfJ/BCp/WYeix0KpUBdKO3FiSMHjH8uXlLmQabFvoarhqVu9yRrIXAO2SdpDaW1fOpv
         9bLsrnCgfGoQQ7KzECxILLPbbArhuCddZ4uiFuRFX/RW1r0SaXRaSipo1RV79FoiUAG/
         JwD45Nu3Lbcv/J/HoPUUXj6hvpsVik4SuAl0iOHnUpWBtkIZ0S2e+ZJ8+hGDzJ4JLCBA
         GGjWawyBWfTS4oikfDwN8f8StP64GX6h29tsgi2sKy3sZr4XZ+EBAQ7BHRdJHjr8aJYw
         DpEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792682253; x=1793287053;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nw86MTT9QYJNuk6B5SLe4LXpcyaG0CYCN6se45mv/xk=;
        b=b1b315P+UMss0zsy49+A3avu4lCKkK5Va81N0Z3a77NT6fgW1zSTzGmbrO6rBYnU2Z
         UBvcDfnGyxNaoxCPW4wff5Ok/jQ7GQBQp8aGAPdJXx6jgOEUANtgm9qmSY4yuuJTf6eZ
         Z0L1cOeQ54txMJ4EhQO/VIMKeEe3lFd0Jm9lAE83E63AtcXkKyoZZ6d60q9FC4EBWW20
         wKWpAuVipnsupf0S4ubu4O4VBjHTsrgaAkhxzXLaenZZnrlZ4Bi70p6sDzcYL5ZDcIBA
         rCJlEI37mk6qA5bnkSLNF79ZZQOML9pOJxOKznlphZuYpQd+UEu90Gl75UegGj3bhFJC
         Ja4A==
X-Forwarded-Encrypted: i=1; AKwUvBxP8h1v983o3sBSqzwPGLKQkssFYyaaWjvJYTWa5Cplz+6j+ifICkAOC2N4r5U7XLqqNwRIUtgkJYsMaC4kiK8=@vger.kernel.org
X-Gm-Message-State: AFq9FYINepv9zafveP3BhuHcQe6J2VTFrZ41+zhYYLRZ8gjsIiVMBpcA
	LOZOv8RHUxkexDZRnbCYV2gqBh5OFR7G6yhApIteRXhek4CB09DiLA+9o5TsbYlA9wo=
X-Gm-Gg: AYBFou3kcRY+L4k46FfjqDfw/m6KJIHvfqweJnIsnOP09fPYx2Myd0NmlKiAaAcsWHB
	+sNaWNrJARLIsnWtF0/k+qvM/MvL14XjHIPidTgWgmKv2kbuE8JUvq5yiP58DLh5+d2zPpH1Q9r
	OyL+lFoFRoK7TQXNkNrX6lvGE3eculbasP04HQW1q8pMWuWtkKg0V647E7L4CEqejqXVhqCamNq
	9LRiXIMrANiIxdDFYtIb/PKUgX7htPzv/paHFTHuyEbsK5rzsErUPjkW26rOi2ubD5QsSPqV0/e
	9zV2Ix2xp81pBnCjrIXlAYMNmHUvY8uuhLSmklXg+QNA4Z4NLZekXqWmzPz9LeSNpExE+tCadRp
	ipmpq2Cp+c/EPVfClFgiQ5IrFl0rZ0Y6DgirdNFkked8fEUTjP4gl3y3vGUsbUxJrvyw2o1o25D
	NRKl/oa7c7GbumBJcMpUTpTwsQ8hFuAMaSbts63g2dflnJqnkT1JLMrHEym8PKuttRJ92BPh4rj
	5m4eGfdpWHkHNeayHInLS9SparrYEonQvV7lwFnuvfEUVPXFEwd3bvgf3vWYzkROdRJSPI/DxQ4
	JYjoeXEcUl1D//XBOZ+aWE/LzH3OAQ1Xg7pj7mCbA6rEb0hF
X-Received: by 2002:a05:622a:4084:b0:536:18c0:ab9c with SMTP id d75a77b69052e-536ae2086edmr43246221cf.43.1792682252769;
        Thu, 22 Oct 2026 08:17:32 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10beb7eesm53022736d6.28.2026.10.22.08.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 08:17:32 -0700 (PDT)
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
Subject: Re: [PATCH v3] selftests/mm: merge: keep the far mremap() targets
 in the carveout
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Danish Khateeb <danishkhateeb03@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Gregory Price <gourry@gourry.net>, "Liam R. Howlett" <liam@infradead.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
 David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261022121837.28723-1-danishkhateeb03@gmail.com>
References: <20261022121837.28723-1-danishkhateeb03@gmail.com>
Date: Thu, 22 Oct 2026 11:17:31 -0400
Message-Id: <179268225123.3943303.2482161052665688188.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-22 07:18 -0500, Danish Khateeb wrote:
> The merge tests map their areas at fixed addresses within a 30-page
> PROT_NONE carveout. Several mremap() tests move an area 1000 or 2000
> pages away to separate it from the others, but those targets are outside
> the carveout, and MREMAP_FIXED unmaps whatever is mapped there.
> 
> Under virtme-ng, the shared libraries are packed right above the
> carveout and the dynamic linker starts about 4 MiB above it. The moves
> then replace part of its text with an anonymous mapping, and the test
> crashes in its next lazily bound call:
> 
>   merge[6980]: segfault at 7f7ebb3c1e60 ip 00007f7ebb3c1e60 sp 00007ffd35fbaec8 error 14
> 
> Two to four of the mremap() tests then fail with "Test terminated
> unexpectedly by signal 11", depending on the exact layout. On a host
> where libc is mapped at a 2 MiB aligned address, the targets happen to
> land above the dynamic linker and the tests pass.
> 
> Since the areas are all within the first 30 pages, moving one by 30
> pages is enough to keep it apart from the others. Add FAR_PAGES for
> that distance, move areas by FAR_PAGES or 2 * FAR_PAGES pages, and make
> the carveout 3 * FAR_PAGES pages so that it covers every target.
> 
> Fixes: 4e25f85b9f85 ("tools/testing/selftests: add mremap() unfaulted/faulted test cases")
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

