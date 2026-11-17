Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794891034;
	b=yCLWt8UGy511EQJ7ak+dAqQNBPz0rQ3jPm/z+eehEaTdAminI30oKiTgdzPyrOIU2tN6
	 dXcZ0H86yP6tIkuqI/3m+d/YD56ezidIdF7238Mi1ZFYBiYS423q8+vJFVur1oTwxPZje
	 z90U3jRiq5ubAK7ocERVnA+RD+TEhihdXGLYnbFBGQ2fhsCx2tskgdzGEu34cHaxx/y6l
	 kcLEzspJ+0NERAhL7XPBlUQY27Ws0riytRJ0DyJNFhKq/xOjv7bgXJANbIP4IDCX60ddp
	 L7Na5+R32nb20t1dSv6lAYRMg8eF4sjAkI6Lu0zmphbhBWN0AR76573Q5Lr861gpV7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794891034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=yUYUZ2LlOsiIpdrbhk1wJZRY3ayR3Noi9TQPGtDKtP8=;
	b=wuyLLeFAwI1YhIjlbUntYNDMXQH8ZiJvw5dliRK5tTr+ELDDUFTLnJciiDqi2wWZ4ndY
	 MMPZS7zjh0RaTI0XrLJNtRK4/WCEM0rCiWtiPojReluCyPXVxIsdK+2OrBH7943qV+i9x
	 MKLT8cd9SmdB7o2wUBDJfPq2rF5w3IeE++vQAdJvVlp5KJhy8ornf7pwmX/0Q3bSNrETw
	 605Ua0+rxG5MPLYvEjBzKiDfG1yWits6eRkMOYAUwgjdfzR177/tuWTdOIrcDQhGUEb7W
	 4nz2BtYSpETO4C1AOZUulHY+ekrsyQ551Ub6wGjDJBU9fYLnnJbixms5LogIL3GKgjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=xGusYjGi;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5151A606A32A
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 04:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5151A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=xGusYjGi
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-170135e43c7so6784090c88.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 20:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794891033; x=1795495833; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yUYUZ2LlOsiIpdrbhk1wJZRY3ayR3Noi9TQPGtDKtP8=;
        b=xGusYjGiAdnGxncVaBVneIpjK1Ph9eHqEeeWt7lnJOkMFdfkTt1BtipRJ++rtd7axm
         TNY7mXokRzpdPDScm4nkTWyZVHSDCLj45TjHq4Sbviprep7R07QzTsdMPDa4KrXp2Rvn
         8lsnvqGG1oEchDAwidDM03GPkgBCly20w/qqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794891033; x=1795495833;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yUYUZ2LlOsiIpdrbhk1wJZRY3ayR3Noi9TQPGtDKtP8=;
        b=WNh9sMtTH8yCmuwzofa0/p6sFghtP1lwnGU8YxwoLYXF3QEH5IsJjpF11yHxjUi4IM
         ijrPlJibpD6ZmcVdHazIQHeZXLaHdIgEKBpSYrdSc0oLs2eCKZ5EvP7DkSzKDuawMcC5
         Jx7IMJt1xc8mt8kiou2sqYib0WBD9s45xXQOGl20PkjKVeT9S4dtQEr5SiTmbzpP6V1T
         ncPScfF2V1t1gbBuox0jwpaeP7Y63k/yT+a/e+GsqMm8qefrkhdMnNoqsPML16l54x6A
         qiRp7T3Jo45UG3YYNr+MDMkAD6oT2QVCnRp06LG+wKgyhWzaqQYY9LlTBHIdeyZeMNVY
         +QuQ==
X-Forwarded-Encrypted: i=1; AL+hErGyf67KoiWDAVSL26aLeJTgftNJEqAUeUOjU7hEYVrnCTyNYHhX58Zlnxf5ST4NnHU1uX7rz8uf5w1eih5LSVw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+huBDzZp0HL+0MBxzcb1Fv2Rr430pglwc6NfUoAPVyPDeNsqyQ
	jrRjYKEwuKBVP84EVryMYnl4VtkSDFGoJQ0cyGWRyRb4NkzYijSwr+NVj4Omvf0LiBo=
X-Gm-Gg: AYBFou34/QOFGokTzsFKa5YvFqpIc9AKrWImRfKtJFXzohfB5dGnuI7bRmj/x05Kaez
	oIdO0uZejbMoGkTXQgojToVzCvBvNGGohOhOk7ZKYJXFWJHWTy4avqvm6ZVa4XtNcL5RneIMl+o
	6s3xf5wMxFWh52Ro6c/4OgfgDK9NkPqhJSb9gfbvrkK3BS1MwZX/wez52DVjUo6ffVKFLitpUGL
	vbfBmSDJQlnM7s2D77mTxrEDYWW3lboL7j1pLegZFgTkdcyxN7niIS699GT+WOgfytqIPc252LM
	7cRVwh9D+bwO+Gwda4WU8VHq1cT+peZi6GrO2MYXccWg5Jb25tJnKA4Kjm3Jdy+CaoHz3C6j55T
	/hWhHuWyFo2+GX0FypB4A18zfOBX59drcX2CPohCWgjTjk8rAN0HOiFKHBx3ctZAFyWu5MUr/Ks
	U4Dv0djZ2Q9BqePNp2vRgZxbWfxSBW0XhBUpwZuGpjMAl/F9WVpiAKyBga80RuKVvwot9y36va2
	c4SaPRw66y7uz2z62w+LAtutWvCn42JwTHT8Ef9VHaZA7UWznG3RhMjqZuEOPemHZaVXyb9ZUB1
	B1/tQlYd4ZtSVpk855Sr02TvILTSnB7FNlThEiCNymCv9tnzAK4gwU6STrwnnPQn/Ij4kiqz7MO
	VnrMXlE1O66swkr7yqrt6RxHCHlPRG9UdkJ0TM5QXIzpsisZELazz7/piQV44s9iBJGSRA5O8wE
	QGWnivf27TBwiP0UxFC2Urb9bAenWKKQm8P/oiZfd8DP8Oe8jrH38vvNN9C0COYfWY
X-Received: by 2002:a05:7022:1583:b0:1ac:1343:fa54 with SMTP id a92af1059eb24-1b503112a8cmr13989391c88.14.1794891033256;
        Mon, 16 Nov 2026 20:50:33 -0800 (PST)
Received: from [172.20.0.3] ([172.56.235.113])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm43375533c88.5.2026.11.16.20.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 20:50:32 -0800 (PST)
Date: Mon, 16 Nov 2026 20:50:28 -0800
From: Chris Down <chris@chrisdown.name>
To: Jiaqi Yan <jiaqiyan@google.com>
Cc: linmiaohe@huawei.com, muchun.song@linux.dev, nao.horiguchi@gmail.com,
	william.roche@oracle.com, ljs@kernel.org, vbabka@kernel.org,
	tony.luck@intel.com, wangkefeng.wang@huawei.com, willy@infradead.org,
	akpm@linux-foundation.org, osalvador@suse.de, rientjes@google.com,
	duenwen@google.com, jthoughton@google.com, jgg@nvidia.com, ankita@nvidia.com,
	peterx@redhat.com, sidhartha.kumar@oracle.com, ziy@nvidia.com,
	skhan@linuxfoundation.org, corbet@lwn.net, david@kernel.org,
	dave.hansen@linux.intel.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-api@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 1/3] mm: memfd/hugetlb: memfd-based userspace HugeTLB
	MFR policy
In-Reply-To: <20261115160105.2507650-2-jiaqiyan@google.com>
References: <20261115160105.2507650-1-jiaqiyan@google.com>
	<20261115160105.2507650-2-jiaqiyan@google.com>
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
Message-ID: <avvdFHtnw2BlE5Vq@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Jiaqi,

This generally looks reasonable in principle, but some comments.

Jiaqi Yan writes:
>+			if (!mapping_mf_keep_ue_mapped(mapping)) {
>+				ret = VM_FAULT_HWPOISON_LARGE |
>+				      VM_FAULT_SET_HINDEX(hstate_index(h));
>+				goto backout_unlocked;
>+			}

This doesn't look right to me. For example, hugetlb_mfill_atomic_pte() also
checks folio_test_hwpoison(), so UFFDIO_CONTINUE on such a folio still fails
with -EIO. Also, do_migrate_range() calls unmap_poisoned_folio() on any
mapped folio with HWPoison set, so offlining the memory block unmaps the
hugepage after all.

>+	folio_put(folio);
>+
>+	/* Refcount now should be zero and ready to dissolve folio. */
>+	ret = dissolve_free_hugetlb_folio(folio);
>+	if (ret)
>+		pr_err("failed to dissolve hugetlb folio: %d\n", ret);

This isn't a good idea when somebody else still holds a reference, such as
a long term pin from io_uring or iommufd (Jason was asking about the latter
in [1]). dissolve_free_hugetlb_folio() returns -EBUSY, and when that last
reference goes away later, free_huge_folio() puts the folio on the free list
with HWPoison still set. Now, while this sketchy page may well never be
handed out again, it is nevertheless counted in free_huge_pages, so a later
mmap() can end up getting its reservation against it, and as a result, a
SIGBUS when it faults. That seems like a real problem for a VMM with
passthrough devices.

I didn't check in detail, but since the folio has to be dissolved when its
last reference goes, wherever that happens, perhaps one way to fix this
would be to do it from free_huge_folio() instead, and treat a HWPoison folio
there much like a surplus one? That would cover the pinned case, and I think
it would also let you drop filemap_offline_hwpoison_folio() and the
folio_batch changes in remove_inode_hugepages() entirely.

>+		if (hugetlb_should_keep_hwpoison_mapped(folio, mapping))
>+			/* A new raw HWPoison page in a still mapped hugepage. */
>+			ret = MF_HUGETLB_IN_USED;

This also looks a little wrong, because a 2nd error now gets past here and
reaches the hwpoison_filter() check in try_memory_failure_hugetlb(), which
calls folio_clear_hugetlb_hwpoison() when the page is filtered. That clears
HWPoison for the whole folio, earlier errors included. I'd suggest instead
that it only undoes what this call added.

Thanks!

Chris

[1] https://lore.kernel.org/r/20250120172626.GO5556@nvidia.com
