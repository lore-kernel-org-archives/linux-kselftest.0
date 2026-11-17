Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910219;
	b=Bseg8K/MCJRKK5ifAg6T8bZBjYw4rdtTVDFlqhM5yuZSYGCY6Fa1AFhdXnBTUSb53ZjV
	 SeYEyln7whpvTUMeRm9rE7HtfCBGfyVb8uOjyu4YmMAo6H/o6EoVCwHKeaRj6mh2kfUr5
	 r0n0FNlsw+ZLi0l3r7Q2gvmHav+arcQmX9SDgmMkScP6Sm3ME1JcBqMfqKejIqevDquXQ
	 aGWB7DvpP0nz0MNWYBVUe54Ek/IXdwyNYPvQ/l7sntgxE89PGqgFDxEpbsi4Hl2fnlc6y
	 7Zt7ZIDxT5qbmRWaezEJznBySzhu69/sKeyH0qvRF35j5PYiP6JhH+78PnJDzxS6gnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=xfBMXtQzr2JQHUojf4ewtSOsAqE+X7FzRw+q2BHepVo=;
	b=DEav9Q2pv5wC0VJX3W+M/euDoVXjsY8jE57W2ZMiMegjYG+cCy/v/5mznJLJgF4yucj6
	 tgK9FeC0z2dQ18z2N7TIFrHMuOPQ8rO+YF0fs3e3wOlu7Yx6a/ES7YICve7e+KrsnCAmB
	 5emu/seIywXWEVT4s0vDVYiSnrglb8ygCmO1nzlcR2aEwysSBdGUCKC+aQx0rXY6txBLL
	 oXrCGjC0MUgGlsxDBMhJaFcltRfgyfcXOJWMv2VILx5QIZzKRTX5Na1X1gnIvMnlCtXND
	 V0VjXTL6SHIVyMaohNDlIhnNDHm/VSI+tqPuj4ElKU5n/o4vmrGQTGVY2SmtYO3Tn/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=O2Ey1g0P;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E438606A32F
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 10:10:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E438606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=O2Ey1g0P
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdd9d0c9bbdso3301470a12.1
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 02:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794910219; x=1795515019; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xfBMXtQzr2JQHUojf4ewtSOsAqE+X7FzRw+q2BHepVo=;
        b=O2Ey1g0PKEfr38weA+uVErvWnI7XwM86CVj+pPkNVdxZgM5wm7lhx4p4o7rZkDQeLY
         3rf0OgiMS59q/32Xlfjew23iJmrzGj5OXJiuDVTxXg4weJm8rX8j46tQs0lgR/C6Krir
         /MwDcW1DAcxSzrLbqe6/Si3sVy9Wyfy2YOEHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794910219; x=1795515019;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xfBMXtQzr2JQHUojf4ewtSOsAqE+X7FzRw+q2BHepVo=;
        b=rr60yCPx5Oh5HClKRl+pGvK72h/+n5qxur2O05a/jIskGmASAub8zMxLwPlGIKv/e4
         bQBdxKXfgdT9cZhWKgMY9KmqJ4+39mmWOSTY/9pBXfdTRslWqJSX+jJk8Zr0NPxbqRvP
         KR4feJp7d9nOlnIiHI4uYtqIfp9P2fzecu+hpUhxNyae8qgSdJHcCWFyFgKbRc9WyN0/
         dPGXyxyHaBeW3Nvu2A/F4O6tRVBAMS3o8BCEwljZTRDMT/BgBhcOAOlkZ9RFaQ9E9tZh
         O4yq6OmbGeM1tSW9ayHnO2tthWxlB+rG6yQ4ExLZzofQzv02Asr3YOuspg+Q33Mb7SAL
         aSYw==
X-Forwarded-Encrypted: i=1; AL+hErFYalik+FHGclCN62eywZoMvBMWnQa9YaGUbXTS96PG5YE/Ed8FV+7V4x0di9+hqCbLZCRqVLp1PVPnu7uBhrU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IxbiRw4zafTDMu8Fg/Qc9gMcREyn4PSGeis2PD4GufVHyvo1S
	Ogji72fhjuUa+gWu4JeoZIHndsT35nNdQTAwBSvLv+Pd7zG0jNCKTEISRRlJ6IUXVgE=
X-Gm-Gg: AZFdTZc3AaZ+MocJku8LJDh0Mk16chV2EfGSS2au/GdOnZqmFVfq3o8VqwdaAb7ZE76
	NCl0Bh7LTTGTVR0hDIP6Ui07nUQiXLLNeCTpo2oEs9R7tPkCkY5Stj783x/kLJLfLdz+202XhEb
	HDEZB2YxJgPPjy53m8HP+1qSmfSksamTXCDc+V3UyH6fYtJ664zs0WpapAXVK/1f0RRtQAad2Rb
	RH0rApIIjB0BJ/VPmfVjYt6AVVWoZ1sMOS0zgfb2nSKT7DXNpgCH9s8iwtTy95xGSmGswZl4Wp6
	wSaK/cEtmH2wSOxUeZnCHUcyLZFqCWz81DIfe/ii7E7d2paNHjt+lMeFXUtsoZxE02k8WmqSrOb
	F4Td83uhaeor5FEYdFc6T3CEwYuYgR2tOhTUIbPz0dTtFyInQHaMAHYqXjwUqoOGGbcJrQBg67R
	MHFIgE044TI5si1GYRcmGgmd4EBVNQX3fvtznPkbzhXtoD1j7v9lCAD8PQXmeteMrUF4ThqZvks
	AMzMFBsorjTaxL06Fg1OQYjWOrfiTWgSwgXIfgBCVBeiExFc3qRrxxZROAKqZGxkM6yI0iXRV6E
	pmYdmYBwJ9xpC0WewUr1byEQY47DHcOCFuuOXqa/XBVKN6eGY+pTOfxkOszBlS/x+q2Kd+bwc0c
	EdkmkLSBn+8rmi7poo1dnOk/i7MAzx3facYJS0lKDTbI9CKA3Pf7feHLOCZDou7hcVU2PjZRn1/
	2N3pqiLnjBdlR8GYhhx/tf4Wh+MznyxZk+hbk61mhFKpCtnar5WK+0XGEWPj2CLLAD
X-Received: by 2002:a17:90a:e7c6:b0:3ac:d79f:8229 with SMTP id 98e67ed59e1d1-3b1b0d55ce6mr13140816a91.61.1794910218659;
        Tue, 17 Nov 2026 02:10:18 -0800 (PST)
Received: from [172.20.0.2] ([172.56.235.113])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abbad970sm3433447a91.4.2026.11.17.02.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:10:17 -0800 (PST)
Date: Tue, 17 Nov 2026 02:10:14 -0800
From: Chris Down <chris@chrisdown.name>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, Alexander Graf <graf@amazon.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>, Tarun Sahu <tarunsahu@google.com>,
	David Matlack <dmatlack@google.com>, Samiullah Khawaja <skhawaja@google.com>,
	kexec@lists.infradead.org, linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH 0/5] KHO map
In-Reply-To: <20261116134013.1636689-1-pratyush@kernel.org>
References: <20261116134013.1636689-1-pratyush@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <avwoBj5ceKYjcS9G@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Pratyush,

Pratyush Yadav writes:
>The main user of the map is memfd. Currently memfd uses a vmalloc buffer
>that has a pair of {index,pfn} to track the folios in the file. That
>uses 16 bytes per page. The KHO map uses only 8 bytes per page with some
>overhead. So for a 1 GiB memfd, it uses roughly half the memory.

That only holds for order-0 folios though. A leaf covers 512 indices, so
a populated memfd needs one leaf page for every 2M of file whatever the
folio size, while the array needs 16 bytes per folio. Per 2M of file,
that works out as:

     folio size   array    map     map/array
     4K (o0)      8K       4K      0.5x
     8K (o1)      4K       4K      1x
     16K (o2)     2K       4K      2x
     64K (o4)     512      4K      8x
     2M (o9)      16       4K      256x

>- Multi-index entry support: currently, while the map is very efficient
>  with 4k folios, it is horribly inefficient with 2M folios. Each folio
>  in the memfd takes up a full page to track. Multi-index entry support
>  can fix this by tracking entries that cover a whole page in the
>  previous level, similar to page tables.

Since patch 5 makes things worse for memfds with large folios, I agree
with Pasha that this needs fixing before memfd switches over. Storing
PMD-sized entries at L1 fixes the 2M case, but mTHP sizes between 4K and
2M would still take a full leaf for every 2M of file. Do you expect
mTHP-backed memfds to be preserved? If so, it's probably worth handling
them in the format before it becomes ABI.

Thanks!

Chris
