Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793415808;
	b=PdZHevmh8/sZA6J3/Zn7rXWbOdtCkWavuoyoU8P+ZRwqrgdrCgcHwZvFBflBB5Ooiji6
	 x2aGHxFq5ZEhTHsHZRunWUklCEoiW/a1Q6VmjJ5v+ZMIBXy8kWjr+0CMr1wZRB09LLGVw
	 U32nHA6KVug/fIJffm4jsogBNWkWi6hdon/FO/4uOyLt9ks9l1qdHJOJrkRczmZbypw8q
	 6zrtT+f2HXj4dNlbJt1yBhw7uoRNkmAjLjB84HLNUJiy01GSWMfTAsHYOIwxrFVPc50pl
	 iL8Q7fLjVm1inrMI2XrXzemq3qv/KhTAmv/G4puMvDOMbny9DmEkNI5fq+r+3tE73Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793415808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=CykDRQmyupGap9MJ8JD7H5K9Ycd/s3V7wlgI2ffH55o=;
	b=Q69lW9uyDu5loGqFZnDzndGnwOMilTvcFVuYERia2iaelBih3m5g0dJSzL6CKoD+QYNU
	 fVw/5wao61idu0HNhdZuH+p1rH5kOne2GMnADsw0OUzFj8DFJ+Xv0m/bu7gngxOUOLePX
	 iKIaTXcMFEWJ1mYI1mPCgqo9rM3x1QDk3+TddF6PRi07J+/pyvOrWI7M86yQ5gJTRRsKh
	 GMIa32CAojXDYj9zsd2VFt3taWnExkcpsbMWZ1/Bvdmp5NJnl3c5A/0d2TfEmexBjULI0
	 nEb7V+XXcryY4nZExKXumEHze3N5uH74swiYzLivqHYvniVYsIKzXW5VK0UWyfWPyGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="fbY/DWFs";
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBB1606A31E
	for <linux-kselftest@vger.kernel.org>; Sat, 31 Oct 2026 03:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CBB1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fbY/DWFs
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ea7f9c11e6so27525ad.0
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 20:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793415808; x=1794020608; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CykDRQmyupGap9MJ8JD7H5K9Ycd/s3V7wlgI2ffH55o=;
        b=fbY/DWFshOR+Qk4YSa5bnbgsLqeA3wOLvaoB1liz0pQjjyiEZ63rEoNXs/eFRxMnWW
         eG0Wy8C+OetD4ESLbiKc8xstEQJiutXddJ5NW3M+3bZKwwgXPaH9cSBM83QZ9qG5FJBg
         jtEo+DKCysGkRP8fGCN5eDNRSgnhW/WRmEFik7C8RbrQpPb58+DFg+2bOTxFvwICCbOM
         KZW3J1UyAKzEZKQtEzLk607Wkpa0VjJWO2IqFP4ecNxrX7hSlSl7eay3qwypxG08F3Nx
         CfPz2ZP7dol0pk7QkkLkCV4gNQ27TNRWFA5JfshSvQxT0QnSPBpIpHDB80O+xj7cipSv
         kwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793415808; x=1794020608;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CykDRQmyupGap9MJ8JD7H5K9Ycd/s3V7wlgI2ffH55o=;
        b=TcfAbqGpQh1Z+OJZypxFYrlVLMypEjXN6cur9i1JRiNBjIwQF52YRvumPWGbtuJxG4
         L1051BtUxmmf+MNQFt5SXEyxEhDygIOvCIBE5VrG5Bhg/7wBBzjNAkoFsvpFE5yh/3hx
         fN6W1oxhWrrmNuMPjDGqhnxB32vzHoN2ctzQMA8NUtSzD5AffpVDDH/kBtPffBTygBYu
         6OFgJCyelx8hDB2sGdxBv8DL3eNZxe7semryUn7jwZEbQntTIpVPUryuLkSr9U4hZkVs
         r5EASZEOvHL74E2S+M2FYPr/8F552ubpNxVrZgArns9R1k/7QZPL/6+EgVOJVwy3iuTJ
         3V1g==
X-Forwarded-Encrypted: i=1; AKwUvByBXSUpBIpeHSzy0TOUO01fc4/ZEsoZGMaxNHz+W3Zawn5hkcL8B79HqZDeGk3Fw4BRhmkXkN0/Ysq7LjKaQOY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrmiILvyi4NOwh+JmVewvX98qqJOOIRwP5+Whuvnw81jiuQ7ja
	y3oWWH5pnXEgdUipJtaORSUbNaSDH8uICREk+WSBWmcTdUVauImnaMoINi0RySDo8Q==
X-Gm-Gg: AYBFou0fDj0ycB6Oo38gAzEQz7w2wVE8fzAeBvFsuTEQVHozDqznws684VJFOrzTHv/
	2MsDsYlhWvjlhgWIDqGsqJenR+Xzg4EmDWR31zI3fsGS1n0rSmopEIwoY9/vC47oyg2p0V0949G
	D8XrhhBSPq/PxGzIlJPiPPNkovSkobwToyU6gSAr8Abm+A+acEYGKznxANwVLMkgry+iC4Riw7G
	ZElIoGVrtZBVIlgApAVWLp/TNZGClfe1JR9om87YQyvrliBpdqY6ZTTUkX3bgcyAXEB8fHB5ISi
	awO3PX2r+xIF5hWQYDSONsw8Ze2zO02WQ2J2o88vKMTEmjTI/jZ/sG7a8M5o5CeXjyP6Nl9ENu/
	TkjjtxSeRy09lbUUHGdYNmsQvAgzgiB9rDWqq+3BHcU9+lGob14akufFlttOxvvZVenx/kgMl+/
	cgjA5tDqdytgUMd3t/6MteEnBa+uXaIWmm4QyzXZdI2RXkoO2whiSxAjwJwrh2tOGG1LSNRv4YR
	t9d0ONH5O7LHLoQhD94bYJnTs9gkP8/0YcG4JotZzP2AWi74/eLUqFQLFPQ73IpAqHk7HLRK1lD
	G11gr3TIhyzk4D3G+oENipqR1Bch+ae4O1VvBH35qNA1YPL+TQ4vBFmkBf7WzSbkLSI2otaQN6/
	fK882skOuiGg+CUgjOc/f/jMx9Miwq8H9IX/u47arjOc=
X-Received: by 2002:a17:903:2c04:b0:2c9:b404:b55 with SMTP id d9443c01a7336-2eb1b8c1cddmr13716365ad.6.1793415806880;
        Fri, 30 Oct 2026 20:03:26 -0700 (PDT)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845429e6sm5927972a91.6.2026.10.30.20.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:03:25 -0700 (PDT)
Date: Sat, 31 Oct 2026 03:03:21 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Andy Lutomirski <luto@amacapital.net>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Jeff Layton <jlayton@kernel.org>, Chuck Lever <cel@kernel.org>, 
	Alexander Aring <alex.aring@gmail.com>, Shuah Khan <shuah@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, Jeff Xu <jeffxu@google.com>, David Matlack <dmatlack@google.com>, 
	Pasha Tatashin <tatashin@google.com>, linux-mm@kvack.org, linux-api@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] mm/memfd: add F_SEAL_PUNCH_HOLE
Message-ID: <auVRLPmbWYvMnly-@google.com>
References: <20261026220546.3114241-1-skhawaja@google.com>
 <d4891333-43ea-4d74-9fb9-6ad8dac1a446@kernel.org>
 <20261030121113.GB3889730@ziepe.ca>
 <2c7aa5c1-3af3-4654-b244-1257d05c9d45@kernel.org>
 <auTR9SnDLsLVmnJ7@google.com>
 <CALCETrV5eqg6d9=+BQhCpRwBNe3aCQiut8vxPBs8b7PToqjaHg@mail.gmail.com>
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
In-Reply-To: <CALCETrV5eqg6d9=+BQhCpRwBNe3aCQiut8vxPBs8b7PToqjaHg@mail.gmail.com>

On Fri, Oct 30, 2026 at 03:43:53PM -0700, Andy Lutomirski wrote:
>On Fri, Oct 30, 2026 at 10:40 AM Samiullah Khawaja <skhawaja@google.com> wrote:
>>
>> On Fri, Oct 30, 2026 at 03:39:40PM +0100, David Hildenbrand (Arm) wrote:
>> >On 10/30/26 13:11, Jason Gunthorpe wrote:
>> >> On Fri, Oct 30, 2026 at 11:20:30AM +0100, David Hildenbrand (Arm) wrote:
>> >>> On 10/26/26 23:05, Samiullah Khawaja wrote:
>> >>>> This series introduces F_SEAL_PUNCH_HOLE, a new memfd seal that prevents
>> >>>> holes from being punched into a shmem or hugetlbfs memfd while leaving
>> >>>> the file fully writable.
>> >>>>
>> >>>> Background
>> >>>> ==========
>> >>>>
>> >>>> Drivers such as udmabuf and iommufd (via IOMMU_IOAS_MAP_FILE) use
>> >>>> memfd_pin_folios() to pin the folios backing a memfd and hand them to a
>> >>>> device for DMA. Pinning keeps those folios allocated, but it does not
>> >>>> keep them in the file. If userspace later calls
>> >>>> fallocate(FALLOC_FL_PUNCH_HOLE) or madvise(MADV_REMOVE) on the range,
>> >>>> the folios are dropped from the page cache while the device continues
>> >>>> to use them. The pin holder is never notified, and from that point on
>> >>>> the device and the file silently diverge.
>> >>>
>> >>> We have the exact same situation when userspace maps anonymous folios into vfio
>> >>> and then desides to MADV_DONTNEED the pages. Or any other memory backend that is
>> >>> used for such purposes.
>> >>>
>> >>> User space must not zap/punch things that might be pinned elsewhere.
>> >>>
>> >>> That's not specific to memfd, udmabuf, iommufd or anything else.
>> >>>
>> >>> I don't see a reason to make userspace (that should not shoot itself into the
>> >>> foot) a kernel feature it must activate itself to not shoot itself into the foot.
>>
>> Agreed, for normal use this is userspace's problem. The seal was meant
>> for the kernel to cheaply verify at preserve time that nothing was
>> punched.
>>
>> >>
>> >> The issue is live update doesn't preserve those background punched
>> >> folios and now we have created an UAF attack on the kernel across
>> >> kexec if you don't do something about it.
>> >>
>> >> There was some notion here that with the right sealing flags we could
>> >> tell if everything was 'live update compatible' and then know that
>> >> these attacks are impossible.
>> >Just remember that there was any hole punch and refuse to live update this instance.
>> >
>> >We could likely implement "we saw hole punch on a pinned folio" as well, but I
>> >don't think that's required initially.
>>
>> If I understand correctly, you mean recording on the memfd that a hole
>> punch happened, and refusing the live update if it did? That would work
>> and is much cheaper than what we do today, where iommufd walks all the
>> mapped pages at preserve time. For truncate, the existing F_SEAL_SHRINK
>> is enough or I can record that also on the memfd. I will send patches
>> for this.
>
>This entire situation continues to give me the willies.  After much
>prodding and contemplating (in my own brain), I got a friendly LLM to
>report:
>
>--- begin AI output ---
>
>IOMMU_IOAS_MAP_FILE uses memfd_pin_folios(). Collapse [MADV_COLLAPSE
>or khugepaged] checks the old folio’s reference count, so a pin
>acquired before that check makes collapse fail.
>
>  The problematic interleaving is:
>
>  1. collapse_file() locks and unmaps the old folio, then passes its
>reference-count check (mm/khugepaged.c:2446).
>  2. memfd_pin_folios() (mm/gup.c:3483) obtains the old folio from the
>file’s XArray and pins it, without taking the folio lock.
>  3. Collapse copies the contents and replaces the old cache entries
>with the new huge folio. It does not repeat the reference check or
>freeze the old count.
>  4. IOAS retains the old physical pages; accesses through the file
>use the new folio.
>
>--- end AI output ---
>
>Is this correct?  I haven't personally verified it.  But this whole

Yes, I think this is correct. memfd_pin_folios() pins the folios
directly without taking the folio lock. Other page cache lookups lock
the folio and recheck folio->mapping, e.g. shmem_get_folio_gfp(). Only
memfd_pin_folios() misses it.

This scenario is different from punch hole or MADV_DONTNEED where the
user decides to remove the pinned memory. Here the kernel is removing
the pinned page without the user knowing. Collapse already checks the
refcount to avoid this.

The recent fix [1] by Chris already takes the folio lock for !uptodate
folios. I think we can take the lock unconditionally and recheck
folio->mapping, that should fix this. I can send a patch for this fix,
if folks agree.

[1] https://lore.kernel.org/all/20261029-fixes_core-v2-20-a64ce7f83abb@kernel.org/

Thanks,
Sami
