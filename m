Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792551281;
	b=xrxCSyim3GnJrMUp1FT3FgRS10AXLMMJL8FoO5zPaN37dCPXk4WD7n8ublNhtFvhYJmg
	 o2F6gDLd2WoP6uhytYXg4ih3RwuEOxREySmiGs0mtVXr8h45JejLBVcODs/58BkDHXefP
	 o42Pzj6XAQK3KxIqAWySpK9Ja1BgBnSffdXGI/mKJFNRYz62kLH0aHm9PDEq7eSulba/5
	 fk/6bA+eQTilk8s106fRgp+XdzG0PNMs4M0X5HpIfbs5BJ3wNsoke0IxxaYDZ71c9MWk/
	 rIZNVbnQ6zbHTCBvYbURszGp4cZyqcEu/WXNZT2+/6Xl3lBAIOLuabQX7P3Ym/xuiuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792551281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=dSA8sP/l7jXaX7+Oajvaq7NlGy6nqeA0l/fafopK+Hk=;
	b=gDjBEznRttBe7CUniPvrFayx7TnHOmDWptWGJLu0kwbA1HFK5EDI7D8IJoWI3Vzev85R
	 pOvZdZKKYJt3fUyMDJnDE8Y+MASk96NyBw8wAzQsVvDzGkH9spllIPuLvwR2fbsOj3eN4
	 xuTBqCLyGhQb64AwFcTLVIRL83EtWy0xO6xonyZRlfI1Taj0EMMDKHEwWJnFwTAYnmgAm
	 2oJbcXb1wcOnXiaIXLLt+DJKJ5DDh3/XUoBUPrPTd3IBiPXarZxftVBapGnpiw6tGjxAh
	 Q8w1KGfBfW7HMXMtslFbZMNpfMx7xtv9KC1s5D3+YB50Ltn85wHGKxSLhm1BWmlEVwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=TPB7P4wT;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74971606A31A
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 02:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74971606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=TPB7P4wT
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5364648ae07so3165511cf.1
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 19:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792551280; x=1793156080; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dSA8sP/l7jXaX7+Oajvaq7NlGy6nqeA0l/fafopK+Hk=;
        b=TPB7P4wT3ZpwzDc0H04y1xO6RW40hKiUdingtfVzBENRbJUby8lnyQDabNyMR9ryZb
         L6ryR7ZIQsu9H+R3Vi5l0CGRbA4/5DA0YJ7uLGiig0guGyBmFgIFx/kc1bje644633/H
         GioqQ5BmGmcy33d0lUUfqjyR5Opgnl7gQQRSOJaz3HA02O9hD8oLsE9zTtQAYgNnnfJg
         UkrKGKeR/Nwh+Kvr7jeACX6I9OoprwZ88EDhKPF3VZxiPIadPxqRkzbuaZz2zb+GvEBE
         RqCPDkjelW3nmag27k7NIfFh6E7B0+5WYqfNQknjejpqzqrBvmceLFo3n+8fvN1x4bLP
         v20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792551280; x=1793156080;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dSA8sP/l7jXaX7+Oajvaq7NlGy6nqeA0l/fafopK+Hk=;
        b=Wb0Fo0xZ8U0xsSoqIj79m/4TbGCwjogH3dg27l02ITf/QI5nNxt7e+SZZGZt3TwmL2
         vUyyJ2t/EiaHtLOoIHD2iJ9RH0NZbttIhsLJbeWSD0Y94hW6QA/fmoVvAaPXq6uZyTA6
         ykFkywdCx+d4Tror8uG8J3RquzBuDJC6MT5N518Tb0XhOD9JXfRp8WfovBF9D17lGyBo
         8jptJVbeyrgJn3U/I7aZfIV3l7OW/8IR2SpjC1oJwRk8p9AhK6unoJB5eGhcc2wdyPcU
         N97uyziEoYx4AFFG9e3PqJtyMhfrfM//UMjAjNtiTA433xfcaGj+0h2rk1HQvCHIdhZl
         vWvg==
X-Forwarded-Encrypted: i=1; AKwUvBzkZyZ+eWfyqkAzRmMUI7AMm0jd6OGu9UfjmHwZ5h/zpkhdCs2A65sAQ8lESEYVX+VU3ywjf2TPVrsqgPjRsPc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIoCoQKhGxtb58wyPrXGmFs7hHjwIflrpK+z6f22CsduTQ6an9u
	eMDsguvhodeS3Tl6ctyjjutv87uOYOHf9zeSyKX4UIkszKm7FTlV+wEVQnA6yI2LaWI=
X-Gm-Gg: AYBFou2LH6eLO95mxf80GjHshi+dqXQC6vW+drLxCY/9833sV5H4upD+aNrSG3CTP/E
	e9NwSkU88cf9e4Zk8Uaa5KMm6IVPiCOElhyahcBpB+NvysR6fO1ouvdJ3q94518my86lj0tmrIj
	WvCh0uxJ0LlD0c30Vo5FjuYz2IEv4+iZkH9GPvbYjaSkjM9P1XyU4/ehNbOEakWNgqSYbS11cpY
	jxUwwEn4VGQuL/sLcIQJHlAKjpmKjdv3BDSK5blaixD8nzvIexBw7UaM2NGGnGbw++TyB4rV49A
	omi+vkixQmTfVi03kzmRqJADlr6ljjGzUzxZmoGwArp4HmOzpM9SoD48jp4dSxZuVMfmn7YyPud
	8PqOqfV95LB9Wff6ShuugLQ8aje7dEEGzthqfzjjynTJKGFm91QwxX4ksd0wNNt64x1H4xEsW4e
	0bgFYsTYiyND2kH8qlzckAm8zmihImRGpy5Y30CX1GV6p6EcWzup8bkmtPbvEYNvlEiAidpvAL+
	kCa9UXhf+Hv6Hy79594o9LZg2TOyx5i+Ttt2IXEp3YX03onm0EzK4W5QQnCYS1Hv8Y4wuANJOqR
	DdV5TaOjHlb99mCHqy72m8dAKEI=
X-Received: by 2002:a05:622a:a15:b0:535:a5fb:645b with SMTP id d75a77b69052e-5369b8fb767mr11805941cf.70.1792551280390;
        Tue, 20 Oct 2026 19:54:40 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53698b290c4sm9952991cf.12.2026.10.20.19.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:54:40 -0700 (PDT)
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
Subject: Re: [PATCH] selftests/mm: merge: reserve the far mremap() targets
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Danish Khateeb <danishkhateeb03@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, 
 Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261021011929.89150-1-danishkhateeb03@gmail.com>
References: <20261021011929.89150-1-danishkhateeb03@gmail.com>
Date: Tue, 20 Oct 2026 22:54:36 -0400
Message-Id: <179255127693.1919196.16421147648649712106.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-20 20:19 -0500, Danish Khateeb wrote:
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
> Make the carveout large enough to contain the targets.
> 
> Fixes: 4e25f85b9f85 ("tools/testing/selftests: add mremap() unfaulted/faulted test cases")
> Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>

A better improvement would be to tweak the tests so they don't use
magic numbers like (page_size * 1000) and it matches more statically
to what the mmap'd region size is.  Otherwise it'll get copy/pasted
again later.

(e.g. please don't just update the mmap, please update the tests as
well)

~Gregory

-- 
Gregory Price (Meta) <gourry@gourry.net>
