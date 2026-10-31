Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793475043;
	b=o7N08k8KyMnYGMdwJNvEzCsBhMfiRbQPzl6SqcWc5jZhWmGGyHlKAfSS/PjF6G7HnnVo
	 x2kIAzJVmBnVXdtO2JHT/n9tYdKe2usoTDa6eT05Rr9OnCZKJey8wXH3cHHH8m7Pu9UUn
	 NR5Aw1LYFevsOKR69AJeB0JfLJAJB1Dw3GZKW1/qErtuHsf9ftaCCFQ0gv7Z5Nx3U90F5
	 0eAp1vja8xiArjtZLLw9DKcRLF74+mIEeTY+N2UImeqd4aaQ1lxzFDU6TnP3uA6sEQBEu
	 Vr4nuuV40trZdqUMQraEaV4WBVH+fN6iORtSu8hU0Ofa2InA2k4TDrKyp3YAMtVyO2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793475043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=+8QGpnyPZ7DhkQpiphg595uJGsoBZBg/wk/3XMNmDqI=;
	b=WBT2eBt+Tzi1XxmShkfZS/huaxbUGfDryWELs2nQ7xYPvHUzAncnKXaXH2VPWSJQnA2M
	 Dltm5KMsn2yJE+aWCW8ZTQ91ipPkz+MjbPZYsVjVWTYtFkGDYuSkBCFo3MCzQFGGzxifR
	 k3IiQVrRQ0WyrerN79jMjO84fPLYsAl9OCxEwtmQyq+HXUg/bhGvKHm77lapngWg9Vbw6
	 6zhwELN09cyg5xH8N7lzld8+tb9x8FqLTtbwStqMwfjP0phCp2EALdmOBc0KxHoXAewBV
	 ILU/ZzCTjpDsarhqMvFUDYBlTGjitiEPv533Oma8QiwzQY9LQnmW8V+J+Nrh9zaPakQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a7kLzHFb;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B2C606A31C
	for <linux-kselftest@vger.kernel.org>; Sat, 31 Oct 2026 19:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43B2C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a7kLzHFb
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e9f6a16afcso31735ad.1
        for <linux-kselftest@vger.kernel.org>; Sat, 31 Oct 2026 12:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793475042; x=1794079842; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+8QGpnyPZ7DhkQpiphg595uJGsoBZBg/wk/3XMNmDqI=;
        b=a7kLzHFb1yszRejaXnZrybmPvFYj7onPrb+xEd+eeS8Ujm0n1pZvNl5Ct4Lzp4rzFB
         ZecOI2HdzhFFyuWlRO5GlbB7HPvNdSOJOooNIMoasIuoIpd467vISRd6xVJHR26uz29E
         WQXb8BaWiHtFJtibkG11c41EEoFa1JOXOPNj1qAH+ni8tC4SgtjNKmAKJbwUq9RN8WNx
         ciWBJcRLXO1wonXgk2nrywZraX0rakuRNU3qoICJacoDI46lfooA6zBsAGeTtDzooc49
         r3oEbVGIwW45O45wLJBhax8VqqSXy1SPcA/08V+DbGJxtoQIh6xLJk7xAxjxi4nPOKg7
         g+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793475042; x=1794079842;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+8QGpnyPZ7DhkQpiphg595uJGsoBZBg/wk/3XMNmDqI=;
        b=fjK49V5DdUi8YI1yk1SBLKQTHUX1+VpLkOp4jNlCB+G2NDU+7KZU70GjzJ6+a2oCpo
         FvG5UG2I188Auol4uZy30iN1etrI1ev4PDMosJyZToFsglkZY5HOe7zDdemluE10zKZw
         pVF59vZnknGCx2trAvSMmB+uAlLf3WsYVEFycNsmU9Kxsjt09hhoa9zygPkST0S/iIJa
         WDKrd30T8HEohC6WLVanqcmW3DAYe9tLTyr4+BvDvCyEPuNPFMzxDB9ZQjXoJ+n35v8Y
         xtjF6ReSAKagEf25XcON6lE9CmewUQbeEkdxvr+9VccqlC0NKn+DNQFp3TZM55MUbkMA
         N8qA==
X-Forwarded-Encrypted: i=1; AKwUvBzmplBCi91uIfLVCxAV/dk+clZfBCODqpjtVP9ewg5zTcDnfx/bq0lHX799R5HXpZwBGkor+sSbADZW4nPJJrg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/6XuphRBXHR8jydHRlRYyCKON8EsMj7w5R8/Z6cFWrlsTkV35
	8W2GpaWGC2BnrjziUFMSzjvf2SYd7TRXaPDSrj2Pe0gSI701+AyG6eYSfhYfseRPZw==
X-Gm-Gg: AYBFou2YU4gnm4Hw0s9VtDTjTST5+LZU09veB0s7d2J5LL/iLwjoeHqNn35LontQvqk
	CZUGSDoXjo4zkfp19+/+FHPPkqh7/a4IY44UasOnQhrSpOLD9N+LdnNTm5CE+PUTUpf3bKkXTTY
	FzeQ3u5xJeHsS9Nq8XLwyY6AQvI/t49fFfiVmJXa1qSYnHyxdXt2HyGOQdLRatUbKErzWkBBkQO
	Bk1B+wNLmjRrASEmd1rp8ifrB6Vre7pLcRJ4VKbbUROr09Ff0U61W2Wu+B8/CkS3q7zpTHNxNZg
	EIm1Kt+mhAZBRyRInkmk+QFcJ69mqjjBL2Y1b7Flz7TKrzTB+Jgl8o7hETe8qDET6ABSVfHS6uh
	0uiHtPKgioqgTq8TcUWFbTAxq5xYbKl2BQngitjInSXnZkZGZdGjAyeiapPI6r2mWfsWKHeDci1
	PvIheIfeTV4wunusqbca9xxpIXAtDr+fVGOOU5teCJDJOjqe7NxkF26I7UVzBs8YLdRNjhByWUi
	5F/TSsFnQ6j+KCB3Rddc4AtoZFUvt3xrnfiUCL6LnvubfMU/CqBZ72fznRYiyoxxBlk0OVZt2KU
	UyPaLPtWenqWcT1xNsZme3t9qXWyIfowWOQ8EjKOgz0nS/+oClgvwEbONdGV328UEJlH9cZsS8J
	qS2gwQ+j8QbHUNnHRzpbBfQ==
X-Received: by 2002:a17:903:3904:b0:2e2:d665:6ad8 with SMTP id d9443c01a7336-2eb1b81b9e8mr16615795ad.4.1793475041906;
        Sat, 31 Oct 2026 12:30:41 -0700 (PDT)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9b1506sm12552004a91.15.2026.10.31.12.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 12:30:39 -0700 (PDT)
Date: Sat, 31 Oct 2026 19:30:36 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Jeff Layton <jlayton@kernel.org>, Chuck Lever <cel@kernel.org>, 
	Alexander Aring <alex.aring@gmail.com>, Shuah Khan <shuah@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, Jeff Xu <jeffxu@google.com>, David Matlack <dmatlack@google.com>, 
	Pasha Tatashin <tatashin@google.com>, linux-mm@kvack.org, linux-api@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] mm/memfd: add F_SEAL_PUNCH_HOLE
Message-ID: <auZAViCjlzN3gd6g@google.com>
References: <20261026220546.3114241-1-skhawaja@google.com>
 <d4891333-43ea-4d74-9fb9-6ad8dac1a446@kernel.org>
 <20261030121113.GB3889730@ziepe.ca>
 <2c7aa5c1-3af3-4654-b244-1257d05c9d45@kernel.org>
 <auTR9SnDLsLVmnJ7@google.com>
 <CALCETrV5eqg6d9=+BQhCpRwBNe3aCQiut8vxPBs8b7PToqjaHg@mail.gmail.com>
 <auVRLPmbWYvMnly-@google.com>
 <bb50fcfa-9d71-4905-a76a-ab7bc149d62b@kernel.org>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <bb50fcfa-9d71-4905-a76a-ab7bc149d62b@kernel.org>

On Sat, Oct 31, 2026 at 10:32:32AM +0100, David Hildenbrand (Arm) wrote:
>On 10/31/26 04:03, Samiullah Khawaja wrote:
>> On Fri, Oct 30, 2026 at 03:43:53PM -0700, Andy Lutomirski wrote:
>>> On Fri, Oct 30, 2026 at 10:40 AM Samiullah Khawaja <skhawaja@google.com> wrote:
>>>>
>>>> >On 10/30/26 13:11, Jason Gunthorpe wrote:
>>>> >> On Fri, Oct 30, 2026 at 11:20:30AM +0100, David Hildenbrand (Arm) wrote:
>>>> >>>
>>>> >>> We have the exact same situation when userspace maps anonymous folios
>>>> into vfio
>>>> >>> and then desides to MADV_DONTNEED the pages. Or any other memory backend
>>>> that is
>>>> >>> used for such purposes.
>>>> >>>
>>>> >>> User space must not zap/punch things that might be pinned elsewhere.
>>>> >>>
>>>> >>> That's not specific to memfd, udmabuf, iommufd or anything else.
>>>> >>>
>>>> >>> I don't see a reason to make userspace (that should not shoot itself into
>>>> the
>>>> >>> foot) a kernel feature it must activate itself to not shoot itself into
>>>> the foot.
>>>>
>>>> Agreed, for normal use this is userspace's problem. The seal was meant
>>>> for the kernel to cheaply verify at preserve time that nothing was
>>>> punched.
>>>>
>>>> >>
>>>> >> The issue is live update doesn't preserve those background punched
>>>> >> folios and now we have created an UAF attack on the kernel across
>>>> >> kexec if you don't do something about it.
>>>> >>
>>>> >> There was some notion here that with the right sealing flags we could
>>>> >> tell if everything was 'live update compatible' and then know that
>>>> >> these attacks are impossible.
>>>> >Just remember that there was any hole punch and refuse to live update this
>>>> instance.
>>>> >
>>>> >We could likely implement "we saw hole punch on a pinned folio" as well, but I
>>>> >don't think that's required initially.
>>>>
>>>> If I understand correctly, you mean recording on the memfd that a hole
>>>> punch happened, and refusing the live update if it did? That would work
>>>> and is much cheaper than what we do today, where iommufd walks all the
>>>> mapped pages at preserve time. For truncate, the existing F_SEAL_SHRINK
>>>> is enough or I can record that also on the memfd. I will send patches
>>>> for this.
>>>
>>> This entire situation continues to give me the willies.  After much
>>> prodding and contemplating (in my own brain), I got a friendly LLM to
>>> report:
>>>
>>> --- begin AI output ---
>>>
>>> IOMMU_IOAS_MAP_FILE uses memfd_pin_folios(). Collapse [MADV_COLLAPSE
>>> or khugepaged] checks the old folio’s reference count, so a pin
>>> acquired before that check makes collapse fail.
>>>
>>>  The problematic interleaving is:
>>>
>>>  1. collapse_file() locks and unmaps the old folio, then passes its
>>> reference-count check (mm/khugepaged.c:2446).
>>>  2. memfd_pin_folios() (mm/gup.c:3483) obtains the old folio from the
>>> file’s XArray and pins it, without taking the folio lock.
>>>  3. Collapse copies the contents and replaces the old cache entries
>>> with the new huge folio. It does not repeat the reference check or
>>> freeze the old count.
>>>  4. IOAS retains the old physical pages; accesses through the file
>>> use the new folio.
>>>
>>> --- end AI output ---
>>>
>>> Is this correct?  I haven't personally verified it.  But this whole
>>
>> Yes, I think this is correct. memfd_pin_folios() pins the folios
>> directly without taking the folio lock. Other page cache lookups lock
>> the folio and recheck folio->mapping, e.g. shmem_get_folio_gfp(). Only
>> memfd_pin_folios() misses it.
>>
>> This scenario is different from punch hole or MADV_DONTNEED where the
>> user decides to remove the pinned memory. Here the kernel is removing
>> the pinned page without the user knowing. Collapse already checks the
>> refcount to avoid this.
>>
>> The recent fix [1] by Chris already takes the folio lock for !uptodate
>> folios. I think we can take the lock unconditionally and recheck
>> folio->mapping, that should fix this. I can send a patch for this fix,
>> if folks agree.
>
>I have another patch from Anthropic on my "rework schlop" queue that should fix
>this:
>
>"mm/gup: pin memfd folios under the folio lock".
>
>
>We'd do just what we do in other context now, which is checking under folio lock
>whether the folio was truncated.
>
>Care to send a proper fix?

Sure, I will send a fix.

Thanks,
Sami
