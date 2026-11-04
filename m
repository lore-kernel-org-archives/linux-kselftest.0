Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804488;
	b=ShGCBlowH93ZBC/K2zE2h/rC7Sp4Itbc7sJWMYE/SSAEeKS4GZ0wQ5zpen+bxi8vr6JO
	 tgYONwm06Sxbj6I8+PyyMd9IMVSXPi6bPMHMaywogzBf2vfWuPgSGt1wlM/Pmyr5e5/5n
	 W3Dn9//VW9WxXMuLSBLnz/VgqebSa8USomrwpXjYI0hOLZw3wATOKyEimS0RyCZx3E/Cq
	 /NIcbZEqxm+GVbNHYqgcmUG3drKH/ZMgIEsbIoVQt7yLhHhlytzEWftPFC0ek0E1OLnRs
	 SQGYy/Ih3a+7bSI5QZFUJyQkR0HCvDIN5ikcwOpkd2cmMPW5cCCw8hioAhKvrT/tQtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804488;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=6YxOPHeBFVzKRVOWsijIHFAGxsh3bvwNNvRfegWSMFo=;
	b=vIyYpirhmkY4hhjtwvh/m25fK93krM4nuq0ivbOfvvf05jnAk1AGyEei+uLBrEd4dl1b
	 1StcfqNCGTIUj9Nci4iK50UN0i9mG2UW8l4o3MxilV0x1Z7oxUAjnI1iQ41Ok7hF9y9s8
	 wTfKdxJFhWReYUisdJHTfG6Dmm50jRvbP6ju73sRGIs5PcOE9bSEuVpyTTldz+bj64qaV
	 jCAv0/C9oe2XRQZlqD1md5KC5D6Z2OmxlP9sOsFhBkpt8WAgAU5VpXSk9RFUGvvl7O+iS
	 f8cjxdDAZyvuChmYaFzcyHbjv1NlTyO3fBUU3U34Bl0hE2WifXgeb3pMM0w7f8xKI3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OwJnxig3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB1A606A337;
	Wed,  4 Nov 2026 15:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OwJnxig3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C76AF1F0093A;
	Wed,  4 Nov 2026 15:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793804487;
	bh=6YxOPHeBFVzKRVOWsijIHFAGxsh3bvwNNvRfegWSMFo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=OwJnxig3rfoGKDzHfgnzBO3NMi8sr2bi7nZPcIXsVfqDqD2ml4RCvESVjw64EXsZy
	 0Iq0Rveie9/lMNePvdQHltK6+H2sKsmqZo/VM8NHEF1vn0ybRJsZeSpdeNVHnfYK9I
	 9JSalFL53Wpknx1cYHqboIWo9jjPjXzonHiRjCgG23CusXijz7xRveiT4cnAjU9Yc6
	 0GnKo5RyD3TENvFcCjOcQWx53fWl25tXPxDWbTew6D7VkfDMp+7jSrhY5l+qRtjJJ7
	 eMAeeBXN2mLzMiJ8zChNdFZCpdrJH2V2dbL3LkaeTJ4ePFuK4SZctGZZtlmPPCnOTn
	 aEEiOhq83RuYQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org,
  linux-mm@kvack.org,  Alexander Graf <graf@amazon.com>,  Andrew Morton
 <akpm@linux-foundation.org>,  Baolin Wang <baolin.wang@linux.alibaba.com>,
  Christian Brauner <brauner@kernel.org>,  David Hildenbrand
 <david@kernel.org>,  Hugh Dickins <hughd@google.com>,  Jonathan Corbet
 <corbet@lwn.net>,  "Liam R. Howlett" <liam@infradead.org>,  Lorenzo
 Stoakes <ljs@kernel.org>,  Michal Hocko <mhocko@suse.com>,  Mike Rapoport
 <rppt@kernel.org>,  Pasha Tatashin <pasha.tatashin@soleen.com>,  Pratyush
 Yadav <pratyush@kernel.org>,  Randy Dunlap <rdunlap@infradead.org>,
  Samiullah Khawaja <skhawaja@google.com>,  Shuah Khan
 <skhan@linuxfoundation.org>,  Suren Baghdasaryan <surenb@google.com>,
  Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v3 06/10] mm/shmem_luo: Don't make early retrieve
 failures permanent
In-Reply-To: <20261103010216.3447716-7-dmatlack@google.com> (David Matlack's
	message of "Tue, 3 Nov 2026 01:02:12 +0000")
References: <20261103010216.3447716-1-dmatlack@google.com>
	<20261103010216.3447716-7-dmatlack@google.com>
Date: Wed, 04 Nov 2026 16:01:22 +0100
Message-ID: <2vxzik2ck5dp.fsf@kernel.org>
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

On Tue, Nov 03 2026, David Matlack wrote:

> Mark failures in shmem_luo_retrieve() before it starts restoring the
> folios as retryable, and return the error without freeing the serialized
> state. If no retrieve succeeds, finish() frees the preserved folios,
> like it does for a file that was never retrieved.
>
> Nothing has consumed the preserved state before the folios are
> restored, so the retrieve can be tried again.
>
> This also fixes leaking the preserved folios when one of these early
> steps fails, e.g. because the file has seals that this kernel doesn't
> support. The retrieve freed the serialized state but not the folios, and
> finish() then skipped the file because its retrieve had failed. There is
> no Fixes tag, since the fix relies on args->retryable, which was only
> added earlier in this series.

If the seals don't match, the retrieve is not retryable. It will always
fail.

I think the only retriable part is memfd_alloc_file(), although even
that is quite unlikely to fail. But I think that also fits pretty well
with the most important type of error you want to retry on, which is bad
arguments. In later patches, you check the argument on
shmem_luo_create_tmpfs_file() or shmem_luo_create_memfd(), so perhaps
set retriable in those functions?

[...]

-- 
Regards,
Pratyush Yadav
