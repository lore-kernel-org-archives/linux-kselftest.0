Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974475;
	b=C022sNh7yJ4vD0qtDRL/uX/ZC0XepC7ain6wtLcBtmNblLa0xPGEf7h/TR9APDYZwaHI
	 t8LGlp+X9U17fIA3ErnujTDTHnUtDOFplkuaxc71HE73nlJScDXdpB06zi6LX+JhiaUX/
	 jTqZE6x6FZEFJ7pa80Jlf4R+ivWwsmoyP/untM9UmIhXn+KeLWr/Og1o6gLof2DSL28sd
	 acWJlxlQD/L2J/80K5i7SlX8OkmB7N/spMLFbCt9s6iA4t9BjeC+GM0QOV8EKBj8eYZyr
	 TUxh4DPxJ/w+RCqXXNSU8fLADONUtAD3bVVhR15oltvLCaS6xeinBI3sIlVBoZB0qoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974475;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=RDov0eoVo/jXZsEH8waw4PclHfxr4UeOoI1jJZ0wFVU=;
	b=MD3uCQKhfOt5A9AnJtpZX3VuVKvQ0HpqcCGnbGK37fzRx1oHE0j0RoqIHqMUJotQqhVt
	 yw8fmgWg1wiXSV5JKek5jGbkjlXLDF+ETS6x2Hya8oTiKvFJtIXFI2NS137WoK3kO1VaV
	 O3FtRPDfSpN7uA+Oh0Kyhwgey/CEKzAW+0c/asnXQp4AMZ3vs/FZSmeW6Wr5Ayph8DEst
	 n1/OB78SsWHVcUDUEr2m8fPP/6P1SJg5t2OsLdk0P4LW1fJ6C5sNP4rk+Pj5GFGTl7/Oo
	 USLBRfLZROFDTZWBrzI2DCs09UrurfcV875GdudLkFks/GnUpEtItIyohLfR8BvQDlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QZiZxI9G;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C69606A32C;
	Fri,  6 Nov 2026 14:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QZiZxI9G
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9485A1F0089F;
	Fri,  6 Nov 2026 14:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793974474;
	bh=RDov0eoVo/jXZsEH8waw4PclHfxr4UeOoI1jJZ0wFVU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=QZiZxI9GAjrir92IAFfKGitZXVtY1jvK5zvkVio451cKaNQy+4alLSBiO8n4IXk5a
	 FeU8B/aZpr2kFUdrrLErUTcJxOy0VJSqfsasS4uw81KAuNjyZAdjxKj1wiOj7JAxBR
	 mbCHQFfN6Q4wIrn+IpBW0KIgDBUhwENIZc64nO3QfIl87WE6M+kj1UTV6sgxuXYxMn
	 NBH9mBHcgEDIzbAvb8xyON+HXQ/hi5v/jPOplklBmwp+o7m+ZKVqOoBmQIYtXJQb1s
	 3Or4fuYh0VQ6PHIfJzhif/V26peoD/pmRt4Txg9M2arpzKsXqRwdmfeKOE1qfqnC9v
	 wxbaO2Ww9a69A==
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
Subject: Re: [PATCH v3 06/10] mm/shmem_luo: Don't make early retrieve
 failures permanent
In-Reply-To: <auuxi10mmCQrq-y2@google.com> (David Matlack's message of "Wed, 4
	Nov 2026 22:28:27 +0000")
References: <20261103010216.3447716-1-dmatlack@google.com>
	<20261103010216.3447716-7-dmatlack@google.com>
	<2vxzik2ck5dp.fsf@kernel.org> <auuxi10mmCQrq-y2@google.com>
Date: Fri, 06 Nov 2026 15:14:29 +0100
Message-ID: <2vxzo6c2hwsa.fsf@kernel.org>
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

> On 2026-11-04 04:01 PM, Pratyush Yadav wrote:
>> On Tue, Nov 03 2026, David Matlack wrote:
>> 
>> > Mark failures in shmem_luo_retrieve() before it starts restoring the
>> > folios as retryable, and return the error without freeing the serialized
>> > state. If no retrieve succeeds, finish() frees the preserved folios,
>> > like it does for a file that was never retrieved.
>> >
>> > Nothing has consumed the preserved state before the folios are
>> > restored, so the retrieve can be tried again.
>> >
>> > This also fixes leaking the preserved folios when one of these early
>> > steps fails, e.g. because the file has seals that this kernel doesn't
>> > support. The retrieve freed the serialized state but not the folios, and
>> > finish() then skipped the file because its retrieve had failed. There is
>> > no Fixes tag, since the fix relies on args->retryable, which was only
>> > added earlier in this series.
>> 
>> If the seals don't match, the retrieve is not retryable. It will always
>> fail.
>> 
>> I think the only retriable part is memfd_alloc_file(), although even
>> that is quite unlikely to fail. But I think that also fits pretty well
>> with the most important type of error you want to retry on, which is bad
>> arguments. In later patches, you check the argument on
>> shmem_luo_create_tmpfs_file() or shmem_luo_create_memfd(), so perhaps
>> set retriable in those functions?
>
> When retryable is set, LUO leaves the file unretrieved and finish()
> frees the preserved folios. If the seal failure did not set retryable,
> finish() would skip the file and the folios would leak.

Yes, but in that case you free the folios on the error path of
retrieve().

>
> In v4 I can move the seal checks into shmem_luo_create_memfd() and
> shmem_luo_create_tmpfs_file(), since the valid seals differ between the
> two, and reword the commit message so it doesn't suggest that a bad seal
> can be fixed by retrying.

I think it is important to signal to _userspace_ too that bad seals
aren't retriable either. So I would really suggest doing some sort of
non-retriable errors for bad payloads.

-- 
Regards,
Pratyush Yadav
