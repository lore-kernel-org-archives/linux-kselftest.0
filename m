Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793831314;
	b=ElGTUGlsDUXI3Wk4wRh4bQ7gjrwtdsB83WkM17uyRYMNdRfCrTBdL5tU3Y12LhMOD4kk
	 leDEGGUNxU7KHh7VOD6skgSbz0OCbsjTFoIHS/7RGNsT7qtoMefCMdxts+zeMr/w69fYJ
	 WYews/Vfy4ZLTNtYitzhWLDCcnkCBjxHCWuL/izFubD4XMkx7kPsXu3beB+0/bSd1R0Qm
	 KpIrHLQLKqRBGH5K6pNmSekmnZ+lQ/papf2uhH2QtKdjfHEL7qqgwBmcbLJ0SN7rjmkn7
	 nWCGVk31Y1j+DYbiMvAoFBUmC8JJdv7cbLZzfUq3etYdolE3eXVyfpMOD8QdmOqCu5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793831314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ngSI9f0kiDWl+YO8rRXsU2IRSVNvxIMeC8SrK3o9F8Q=;
	b=sJrxORSQ/jhQ5kmtZZ4EqP3RxMJmRdbzBFxh+Fx0XME8RSxZwlXvtk1BhTn4Qd+y+V/7
	 nI62dx6L707Bd/EVI1o/oOP3NEnbjNAxcLMkn53B+Jw7JOo6NC3sgTPD8JibDcl9VTRCp
	 YQrv2l7PZM0OjimtxNtStst73C/cau8GSmtyqtnVOik6UVowQSUeDezhD0x9gmv5dB2y2
	 IZfmnOETz5tACKZUMJ8+sdUnr3e3pVMRqT4gO4e1xxqlg+ADaj/6Alz4N5ztJEBsZYt8B
	 6Nnj9AolU+URn0e4AGmFSVYhhu48oYaX1x9Sdm+dS9IkkHF3ypxw4o1r4xjtB61r+0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q4r8YYWn;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BDB606B2F8
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 22:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2BDB606B2F8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q4r8YYWn
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso223720a91.2
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 14:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793831313; x=1794436113; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ngSI9f0kiDWl+YO8rRXsU2IRSVNvxIMeC8SrK3o9F8Q=;
        b=Q4r8YYWnN8sCaY/ODs1yIT8lq7b5mwAQjudMxrtoqP6vQcq4r+8STrumanbHpf3ain
         o6PYhcUcEJyR5K9TdjhA0RThU3nkwkKvSPhI1I3sb6m6/bn99QLYDdHOBBgYhIzt/G7S
         6PEogm7tkiRTcGX6whDNCNlWIqQ4g3wtpZphRlTdhJX0CmT03/EwQAjRVEgRM5xivqIG
         WPBCZ4DNx4AnZh8vOqJJzXqtusiL9soWcNfDPSbZvbAwqQZiMkXKBmENLW4xUr7syquV
         2ViGz3ZyZhv+D/9/+6ir2dfvTYhKdqq0CkpekiE/gW0Sj8Lf+WfBG1fxNZHI43AK0A5G
         EDVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793831313; x=1794436113;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ngSI9f0kiDWl+YO8rRXsU2IRSVNvxIMeC8SrK3o9F8Q=;
        b=KDV8hhhUmtqnjIBpXxjb1yLcArz9XVdu5joCPy8VG20Jkt4R8/32LO/Ae8m0E419hD
         uEsk+K5disSH9td1FduFeho/9WT2zpqiDML4si4c0q37PTyAFvM7NspLX9wraHgE1uWK
         W/hwJ5esuXkR7VaKz78WCnopXAFtexaTDY0z4cBaLN8FRLaEM2Ye2aHTHqOsnyLJ6Kzp
         dDE83LCoUaKxb7yEY92MUyV/ib4H93aKgEg+a25EGlLMgLFBH1I+LP6hQ2biBvvPx0b0
         mh1ghuSEYQq/7oVF/xa+UZAk28/oA7fQKlVVYtlJYsNEIZGA0tUAxsVWylJG6zILo+cE
         UgYA==
X-Forwarded-Encrypted: i=1; AKwUvByU2vs/bcBhm29Q9poLaNNbFBY1akH6rhrNiP16dnfsfsp+AVpkzcFTkKLZguC3wvUzKLyXGtIu1GWkeA+cB3Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aQvKHABc/LYXftk028v/yHMiSsBobY8sDc9dlomh1vo2EKFlF
	ubIdyLHuP3sbZH2aAq92NdKOISzWFRpjZxloVUypfdYMur38cv5iAcw7M5C5aGe/Pg==
X-Gm-Gg: AYBFou1Gs2onS7KnsKoxZUZEa0qijeiXbVBxkYEwH8g6pNXPNeiJdEkZW21SsHf33eG
	ile9Td28K6kQTjoTs/kdMk5Ayh3vlUG6wVkY+BnGoukdLZe9G7sp+xfsjaO0DZO6cRlE+B7RFhZ
	qzWYkv/zeukgJbIa9XS9OidUGHpVJ1um6lk9JVUKlj4Ztd2iIQZpBdefPoj6csP9tOgmwvlgPQs
	ufhhyjQ2yFyf4PzmzIe2ArvUDuQR/AkLytyuaiZo8v2HmZsWdzLOMhoWfSqr1tD8ZEOZyDodGHK
	lm3EW1VPSwZHDaAdy9+75O6wbaKjLnZ6fjQYL/Z7fdhUc9kYdDusOX4xQN9rCazse2Jv9ui4J8h
	9y+ZdJ/EnOyWg0zXRv5tsM/w5o3woKVHiGjNSz5RbA4A5R15jKS4JRwHJmm/z9ecbhkUksPLoxI
	2VyNX2qWaza9KoBPgnd0KrdfNEPwOkNzbs8AiwLkrwdL5Jbbbyl0ehCPm9tXijhxghYA4FD1YgR
	3Fui4pCtkNs61frNvGKJwmTYlmR+mLOVlw1RixdueDoZ57CUyHKQekHH9R7cCZg/t+BrGssnE7K
	+aM4VhDV3us17zgwCJ91jXKVs/uvAEP8sDCiXdEcYHmn+dCwOqUkxTBIO46R6p5K
X-Received: by 2002:a17:90b:4c04:b0:3ad:8a14:bc73 with SMTP id 98e67ed59e1d1-3ae897b519bmr13057533a91.50.1793831312185;
        Wed, 04 Nov 2026 14:28:32 -0800 (PST)
Received: from google.com (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31cf4b6sm710454a91.14.2026.11.04.14.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 14:28:31 -0800 (PST)
Date: Wed, 4 Nov 2026 22:28:27 +0000
From: David Matlack <dmatlack@google.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org, Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Christian Brauner <brauner@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v3 06/10] mm/shmem_luo: Don't make early retrieve
 failures permanent
Message-ID: <auuxi10mmCQrq-y2@google.com>
References: <20261103010216.3447716-1-dmatlack@google.com>
 <20261103010216.3447716-7-dmatlack@google.com>
 <2vxzik2ck5dp.fsf@kernel.org>
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
In-Reply-To: <2vxzik2ck5dp.fsf@kernel.org>

On 2026-11-04 04:01 PM, Pratyush Yadav wrote:
> On Tue, Nov 03 2026, David Matlack wrote:
> 
> > Mark failures in shmem_luo_retrieve() before it starts restoring the
> > folios as retryable, and return the error without freeing the serialized
> > state. If no retrieve succeeds, finish() frees the preserved folios,
> > like it does for a file that was never retrieved.
> >
> > Nothing has consumed the preserved state before the folios are
> > restored, so the retrieve can be tried again.
> >
> > This also fixes leaking the preserved folios when one of these early
> > steps fails, e.g. because the file has seals that this kernel doesn't
> > support. The retrieve freed the serialized state but not the folios, and
> > finish() then skipped the file because its retrieve had failed. There is
> > no Fixes tag, since the fix relies on args->retryable, which was only
> > added earlier in this series.
> 
> If the seals don't match, the retrieve is not retryable. It will always
> fail.
> 
> I think the only retriable part is memfd_alloc_file(), although even
> that is quite unlikely to fail. But I think that also fits pretty well
> with the most important type of error you want to retry on, which is bad
> arguments. In later patches, you check the argument on
> shmem_luo_create_tmpfs_file() or shmem_luo_create_memfd(), so perhaps
> set retriable in those functions?

When retryable is set, LUO leaves the file unretrieved and finish()
frees the preserved folios. If the seal failure did not set retryable,
finish() would skip the file and the folios would leak.

In v4 I can move the seal checks into shmem_luo_create_memfd() and
shmem_luo_create_tmpfs_file(), since the valid seals differ between the
two, and reword the commit message so it doesn't suggest that a bad seal
can be fixed by retrying.
