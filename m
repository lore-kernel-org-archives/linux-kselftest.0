Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793141725;
	b=L1B8iFUvC/jBjGdXXLBmXphvPsFBZ1DE7LwULbXBMy5SUi83VOObjxSCGJMeXeaXqPH0
	 k+Gmvbvn5zMGLL0smEzVaF7t5W0V1rkzcJb5u+/WGL4X1+z8hU2HXb0czftuP8vq5jJVd
	 NDWQ9lfTaZsNQx7oT9EJ45393VPkd9Jfxv3xmZBQbF3Yhiu53FbXDzn6PfpZ/g1mZVv35
	 VOGLJTHjPSWrfrvGLVMLX4oDYHYwf8mtUx5+zze5CQzz2johj88E7JZ25KbOE5GtWbe2U
	 62etSWhEZDEG3zurTNG+YgDWqP3+oBxkjnbEELGMSQE7tu6jGBhxWv59If+MTJ6GZoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793141725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=KTV8eg2on2B99kAeZJ8uQmhlFR662/OZM2R8QtayN34=;
	b=brg17USoGE6EH/VGNDZiIzZVu1o2s3EhZ0ucqjUQtEwWQsrOM3XmGd0XtOsWJnASBRll
	 YrWLbzyz43ZleDgNkQA0gpekEs413Yl6ftGKebDesT+DaWOsQK+cN2kw/9jfbi+llZXmI
	 28qDMWAqZpZB6u6w+SXc+nmcarJgDb/Hg/DvhHkoUAnFOA4yTcyhtcpW5wJldGrP6geyo
	 KznrTHWYE8IuOb8gL4w1lsgWNCq8URLPsf47r5oJJ3ZlKf90a7jJUU01cwGyypZGkeoXj
	 7peZpC9Mq0yACA3EhHQ2heFmKOq/hKimyw6mqgS8AxcAx/OnZ4TyL0hJ+jZ7LmX0DBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DC3FJv8+;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75903606A32A
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 22:55:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75903606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DC3FJv8+
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2db33db4de9so27075ad.0
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 15:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793141725; x=1793746525; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KTV8eg2on2B99kAeZJ8uQmhlFR662/OZM2R8QtayN34=;
        b=DC3FJv8+i3On134fP2jAv4hX43hfN+7oCq00cQxNIJfVMQaiGXTB9eJvWw3odQ2Ogc
         oTfb5SDyzrAtranJahrV7HJLjnFqzp/UATmFYw1gOq4AD15jqGjlzDsZ+eVthKApk/ga
         Cv5KzWzWMSynaBKwZZEIMhz17QQ2BQ0VQDR/VATKEwtM/9a1I23xpnESAeT7xsZRE5dW
         +r8akfqeupcuBAFwvLH5L1o9fPyb4hy5MrE8mAgQKUgvz7kFR9JRX279bOpLNKmth5sl
         XPtvz5eOAEh1COKBQIqY0XpTtlCCy45xdU4CRSVdY8NC97nsctjiaMG5KNBGZv/sHii8
         vRwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793141725; x=1793746525;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KTV8eg2on2B99kAeZJ8uQmhlFR662/OZM2R8QtayN34=;
        b=X+mzUybUjEWadBJWkUxFjNkrZ775rcQghcm1b/mquX3AbPfYwrFaXpLB38/0at51I9
         g2vgyaZ8WDQF43ABZzVCj6PFeDJ+Zw20uS5qOfreXPuqCjx6yqpG9HqM9UeU+040Jwy9
         n9fJ95l/SfwLTAaHDP5860kGJEowuP+A359lQdNuvOyeZuQUcXq08zY2tw0/AasM3nnI
         gNj80n8McBnb5WASkJy/nDzJHtUAKUURscCDe0H3n6t8zkjo99RYjWfejjuI8zpXSU7p
         Z447hGRlyUlJ1C3Z+gVUvjUWBgg0efGv0dMDz1+eH3xix8HyHJgQJxUjhujYABf9swUg
         4geA==
X-Forwarded-Encrypted: i=1; AKwUvBy03hauW9k4mdjCNBNcXd+3AwZaZdPMhMaOhHZq30U3RPK892lk8GFl2Uo8/0m6TmsQyLpkSYos6TcZ5CjveXg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIljVzuOnD4Df2dAtoiBGfr3b1CDT70hUUG16dnVd1FS0wKplQN
	z6Hkb5gGkgtOu67IuoEFh9VK0JIr1TwLZBXStDXiScD7Oj3sCOklkuJWpPvgBIZ9+A==
X-Gm-Gg: AYBFou17xaSrzNM5BUImmTmZeLii0gpIkQgMKiGPGnMVjLufZ8VJlStUVpc4TnWfLfl
	2bN4KZa2qGH+vvi3sKBKOYgCpMS7dhvxpVsjDQf5cS3yuEZXvtrV8quNYcsO8OiRu0WBNBcXfIg
	FI731MqCUIWaEsyj+QL6O8zHpyDaoGxF9PGdfvJlLfebcq4MaZ1rep97i3BDs9/gAI2mudmcVvb
	mGN8gTIyoFwlJwiuOVGCvycfOUujYgesL7KFU2cw2jiA8KW28wAReavUxz+5dRYaM1ozSg1SplN
	W48qAVi3U+MEQp0kfIcrrk3TbkXkPuVh1/rfAYH7I7Wt7iDrrzIHKAp2rnf8+BwhCVg+tHQHHEd
	vQe3K+TQb0nbRLTTmh19+1AL9WuaaGzQ09Xnczr2JI2gcmPZ8xsFd5JKbkfoOHL0BclAMAdNonL
	6nLijd4crY0nznvQNbGeRHuuRJPGJ8lOe0xagffhRuttz8qVAUQcYK8gCP95aeEgtH7EuPee4nx
	/mOkHvHZr2Nugg0C0vSj3Uq8UVOA1lwTWMq10vF3gvV0fwKzishv5Dd9HyjIlEGfNUi6SnFiFru
	MJWa45YctmcvI0jmEoySsOtqPDqMJc9Wg9sfRpfvptbp/RhXQB9jcLDaJZkOp4LRdSn8NrX4I/I
	xrBltHU/+VAKyErcrxWSTPg==
X-Received: by 2002:a17:903:11c6:b0:2bd:3bfd:74f1 with SMTP id d9443c01a7336-2eb0029f8a1mr1832445ad.2.1793141724187;
        Tue, 27 Oct 2026 15:55:24 -0700 (PDT)
Received: from google.com (163.1.145.34.bc.googleusercontent.com. [34.145.1.163])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a662e1fcsm516911b3a.30.2026.10.27.15.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 15:55:22 -0700 (PDT)
Date: Tue, 27 Oct 2026 22:55:18 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Andy Lutomirski <luto@amacapital.net>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Jeff Layton <jlayton@kernel.org>, Chuck Lever <cel@kernel.org>, 
	Alexander Aring <alex.aring@gmail.com>, Shuah Khan <shuah@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Gerd Hoffmann <kraxel@redhat.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	Jeff Xu <jeffxu@google.com>, David Matlack <dmatlack@google.com>, 
	Pasha Tatashin <tatashin@google.com>, linux-mm@kvack.org, linux-api@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] mm/memfd: add F_SEAL_PUNCH_HOLE
Message-ID: <auEksxfAi9lHFXmT@google.com>
References: <20261026220546.3114241-1-skhawaja@google.com>
 <CALCETrXNEWQNPjtuHnTfVFOafeJ7APXq288Cq16Q5adDNYx9+A@mail.gmail.com>
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
In-Reply-To: <CALCETrXNEWQNPjtuHnTfVFOafeJ7APXq288Cq16Q5adDNYx9+A@mail.gmail.com>

On Mon, Oct 26, 2026 at 03:46:34PM -0700, Andy Lutomirski wrote:
>On Mon, Oct 26, 2026 at 3:06 PM Samiullah Khawaja <skhawaja@google.com> wrote:
>>
>> This series introduces F_SEAL_PUNCH_HOLE, a new memfd seal that prevents
>> holes from being punched into a shmem or hugetlbfs memfd while leaving
>> the file fully writable.
>>
>> Background
>> ==========
>>
>> Drivers such as udmabuf and iommufd (via IOMMU_IOAS_MAP_FILE) use
>> memfd_pin_folios() to pin the folios backing a memfd and hand them to a
>> device for DMA. Pinning keeps those folios allocated, but it does not
>> keep them in the file. If userspace later calls
>> fallocate(FALLOC_FL_PUNCH_HOLE) or madvise(MADV_REMOVE) on the range,
>> the folios are dropped from the page cache while the device continues
>> to use them. The pin holder is never notified, and from that point on
>> the device and the file silently diverge.
>>
>> The existing seals only partially address this. F_SEAL_SHRINK prevents
>> pages from being dropped by truncation, which is why udmabuf requires
>> it. Hole punching, however, is only blocked by F_SEAL_WRITE and
>> F_SEAL_FUTURE_WRITE, and both of those also forbid writes. That makes
>> them unusable for memory that must stay writable, such as guest RAM or
>> DMA buffers, and udmabuf explicitly rejects memfds that carry them.
>>
>> Proposal
>> ========
>>
>> F_SEAL_PUNCH_HOLE fills this gap. Once it is set,
>> fallocate(FALLOC_FL_PUNCH_HOLE) and madvise(MADV_REMOVE) fail with
>> -EPERM, while reads, writes and resizing are unaffected. Combined with
>> F_SEAL_SHRINK, it guarantees that userspace cannot remove pages from
>> the memfd while the memfd remains writable.
>
>How does this solve the problem?  F_SEAL is about a userspace
>contract, and if there are existing users of the APIs in question, it
>makes very little sense to start making those users fail because they
>haven't taken the appropriate seal.

It doesn't change any existing behaviour, nothing starts failing for
users that don't set the seal, and drivers wouldn't require it. It's
opt-in. Userspace that wants the guarantee seals the memfd, and a kernel
user that pins it can check for the seal and rely on the pages staying
in the file. For example, the iommufd live update path could skip
verifying the pinned pages at preserve time when the seal is present,
and do the full check otherwise.

https://lore.kernel.org/all/arVYa_90j0oN1hnu@google.com/
>
>Would it make more sense for the drivers in question to set some flag
>(refcount?) on the file to block hole punching?  Or perhaps to have
>the hole punch code notice that it's trying to punch out a folio that
>is pinned or otherwise referenced and to refuse to do it?

The pins already keep the memory alive while it's used for DMA; the
problem is only that the page silently stops being part of the file.
Refusing to punch pinned folios on every file would change behaviour for
existing users: fallocate() would start failing whenever a page is
pinned, even briefly by O_DIRECT. A flag set on the file by long-term
pinners would avoid the short-term case, but it would still make punches
start failing for existing users of those drivers, which is why I went
for an opt-in seal.

Another option, closer to what you mentioned, but opt-in, is instead of
sealing the whole file against hole punching, a seal that only protects
pinned pages. Punching, shrinking and truncating keep working on a
sealed memfd, except where they would remove a page that is currently
pinned; those would fail with -EBUSY. Files without the seal behave
exactly as today, so existing users are unaffected, and pinned memory is
guaranteed to stay part of the file.
>
>To some extent, the issue you're describing is maybe broader than just
>the APIs you're contemplating.  If I open a file and then do something
>in thread A that GUP's the file and punch a hole in the file in thread
>B, I'm doing something weird, and I can imagine plenty of ways it
>could go wrong.  (Especially if it's GUP for write.  I hope we already
>get that case right.)
>
>-- 
>Andy Lutomirski
>AMA Capital Management, LLC

Thanks,
Sami
