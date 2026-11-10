Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794310477;
	b=2BZZFOG3LGlPTUO/ilAK4IwByEnWKWZ5EA7lx3FM0eeNAgLKr2OsqeujVxloVWLjaaCw
	 sottyHDzAPcfYzsYxIa7p9GrLKUNvMZkQj7W6imOXq2S1f/Q5vZqzn5EZi9E4k0penSES
	 tE/rDB0pohujk65/h5L8r/Yr6bLlTpVynQFhYH9pDIKpkyJImwJkka8VY0wbJ5/XyCfJb
	 BYibKc7rPq4HsBPkPvcxFl7iWrBbiOH//B+SjWDBpN/Z26CY5d7eMtI03ec7ejIEV+Tbs
	 0Fyb5wQ0R84FB39RoQmi7syUOMGC0rACtiSuCTHMP7GfunW019blLrxqADABF57e3iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310477;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=O2a1TDsS3iUxIM92pLHqfLDtktPZ6Hk3khSHvckjZDU=;
	b=XIHq3YHTz/Xr6hPKCadCAagRzA02NHEC+2sio9QwiCcgiJm8ygdeeA5lM/2kWIGo++9R
	 CHWOIkYV2fD7a0IJEEK7BxnZ3u29kmEFmivY2LpQs4UGBaSCRK41Cnxk5i/s0mjgGbV3H
	 Y0UXj2VGB9E7exlqMCwZLd3ROXK8fBRy+Fk++T8M92WRMUJ2yOZDT2U8MFK5nodVdkBpd
	 E7WfAkx8X4AzP/xjTGzFdx8wTJJA1eFOY4qtTiaT4vu4xjuj0RHm6XerJdOYGDOErYKX+
	 WMyLFwxn0KXIXBmBjac3OGXO7bwpH23LIih7Nec0DSYsSbd3tzco/q94vIDYUaaIbjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qZPqylz3;
	arc=none smtp.remote-ip=91.218.175.136
Received: from mta0.migadu.com (out-136.mta0.migadu.com [91.218.175.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2794B606A32A
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 11:34:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2794B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qZPqylz3
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=sx7YNgEU9+H0zh4XLdzTGH7bAYCesjUaRhN37pRVeCo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794310474; v=1; x=1794915274;
 b=qZPqylz30aZ3e2BfZqsTlDRz+1A5BGW9qBCxc3KAgoelfm0jerbLRA5Mf59vl44Y4zV6fsTz
 I3Grq8ySLHtOt8IhhKwwnmYkw0eLgOyUZSDb/nVE9HYSLcWzf1/h9RUK0RhrHwMkYAjeU8wm6zz
 lU+CKzCBZOJ7GsPG8EUt6gB0=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 8d782ae6a49889d8;
	Tue, 10 Nov 2026 11:34:34 +0000
X-Mizu-Trace-ID: 8d782ae6a49889d8
X-Migadu-Flow: FLOW_OUT
Date: Tue, 10 Nov 2026 19:34:21 +0800
From: "Xu Xin (vivo)" <xu.xin@linux.dev>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Jinjiang Tu <tujinjiang@huawei.com>,
	Qiliang Yuan <odys.yuan@gmail.com>, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Huan Yang <link@vivo.com>,
	Wang Xiao <xiao.wang@vivo.com>
Subject: Re: [PATCH v2 0/4] KSM: introduce only_merge_zero_pages
Message-ID: <avMBPaBPMpQ75odi@dgvxl46587.localhost.localdomain>
References: <20261110074312.219847-1-xu.xin@linux.dev>
 <avLsbZz0S7sRYIL9@gremlin>
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
In-Reply-To: <avLsbZz0S7sRYIL9@gremlin>

On Tue, Nov 10, 2026 at 10:08:00AM +0000, Lorenzo Stoakes (ARM) wrote:
> All-in-all this seems to be adding more complexity to a current major AI bugfix
> target, in a cycle where we're not really looking for significant new
> functionality.
> 
> So given [0] I wonder if this could be deferred to the next cycle? David, what
> do you think?
> 
> In any case the code is pretty rough from a scan (I reviewed one of the commits
> to have a mini-dig) and looks very LLM-generated.
> 
> It needs _human_ polishing before we could take it regardless.

I don't mind deferring this to the next cycle.

Also, the patches themselves are all written by Jinjiang and me; some of the
descriptions may have been translated or generated with LLM, which helps improve
efficiency for non-native English speakers like me. If you don't like that style,
I'll try to avoid it and write the commit messages manually.

Thanks.
> 
> And additionally, you are shoving yet more logic into already horribly massive
> functions in dire need of rework.
> 
> Sorry but the technical debt does have to be paid at some point, so I think this
> would need some initial patches doing something about that before the rest of it
> anyway.

Fine, I'll try but it's not that easy to refactor scan_get_next_rmap_item().

> 
> [0]:https://lore.kernel.org/linux-mm/a2f584f6-e382-4876-aa6d-d5a34de6ee59@kernel.org/
> 
> --
> Cheers, Lorenzo
