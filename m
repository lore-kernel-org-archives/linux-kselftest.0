Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208A83EC832
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 13:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984031; cv=none; b=FJ9D/V/2487Yg3/UU9UAJGbg3nvgu8Bscj5pmuesBPhI2w5ZFUoGHvrlnJxCO9qUd2DKKNfF0Xm0m+mVmGpeRhvNtf/ZM3HdOVra82gpCaNiQAx53eZFEILirKDYhaVsxdHEHFtNj4LeIs4Ewj38wuoqx9A9Y8THKmC4Y16MCBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984031; c=relaxed/simple;
	bh=MjCRgyE9WkWJ7iNVJLmJilLk/S+9l7gZMXgxjwM9n/c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rAFaIf9hcOHH1fiQ9KX8GCmZbELTKtvmTBGUkifFRc5N1fOZbt3bKFLPT+M2LBzCFRyBiRZJR2KriNMoOyMX58oAEAFYoBmDQHnSRa5yBI4Tq8+xqQAgs2yktcyPKCKtu5OryTTfwg/ycHhacfDLGDxEYADNE59cCqskvrCiIjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DwBxtAjq; arc=none smtp.client-ip=209.85.208.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DwBxtAjq"
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6afa6850207so1084477a12.1
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 06:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791984027; x=1792588827; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4n9LUBp/94FrA7OEAIK6wGrf06ppdChh63JRq9nGxWk=;
        b=DwBxtAjqUw+Q/FMDhubhETeedq+ybXsKZFd4FbX4UTmZVxzIJDbhQ8T2nkNCoW8a6p
         wpB0VORLqumQsg1JaVBCebAgScoGUgRAFlcmgEG7DRWYRy755c6m0Rs4BMBE4Vc0Lch1
         T70IniOpzea6agz8Nn4NUtGtPnqA4slllxLzr3bxEzTSvJk7FhiAsOAJUeOUpsMa0vn+
         pdyvJxsOKfRMu1iEOxupl8sR6QNA9ueMWRQ9XKMV+7TN/mvGcL2+ReodZgI9M8QbBhDn
         ZFb8wfE0ck0SvaXBTe6icHhn9cqwf86T1ck9HUrR9FDSL2wwOU5X1EEQ1wBvazWWi9HQ
         RiBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984027; x=1792588827;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4n9LUBp/94FrA7OEAIK6wGrf06ppdChh63JRq9nGxWk=;
        b=S2qD/Uu5FCjN8VF7D9Z2Rtm6spOnpq2WQSOKuvvAxkhAC6EzajMBrJfkuXT0fOKPMT
         RPpOfo//Tzsx8aHHqfvwnkA5KMsGgOUyN9KSDpBcb6YDXk2CudTz76aV6Jg+9+YNTyxY
         H2S2RpaNY4eDWcSpgtn3/jAaDtnDGRRwNQuDUteTbdc8qvYnsTObF2iaA+KxREWh/svi
         X2F3jcn3A0CrlXgtp4KpZjX6r2F0qrlblUO6T/F3PzGjA2Wr/4ehgRoEcoJoWnQh13Di
         r3xGWRXKGfQJFslaRoWYy3W06+Dcl0vIZ+gwAVqYYU7b9WukxUCY0nfyn+6cNrWi8Ehu
         5IPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzA5Mgk50KJc1nPpQSt/NlvlNww+i8sZiTctR+G/YeMrTkOP7Gi8D/QZwS/c8V/+I8HPXLFU4chKHXolsWGB9s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQ5hfaeoXxjvWTWpV1rFTaJo715NKLyFDtCjoe8BmnGXqsjTSE
	FwPZTjf+PWARmO769A9K4sfjEc2c9XNatETiawRK5muaCIBuKU3c09ZMwOavXMgYHj6P7ucbQji
	2eVcE6DJHnnvITgz8Ug==
X-Received: from edcpr25.prod.google.com ([2002:a05:6402:c1d9:b0:6ae:21f4:c371])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:320c:b0:6b1:df89:7e11 with SMTP id 4fb4d7f45d1cf-6b1df899325mr5347239a12.36.1791984026642;
 Wed, 14 Oct 2026 06:20:26 -0700 (PDT)
Date: Wed, 14 Oct 2026 13:20:25 +0000
In-Reply-To: <2vxz7bjmkjeu.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260901180713.4185641-1-dmatlack@google.com> <2vxz7bjmkjeu.fsf@kernel.org>
Message-ID: <9huz7bjkmnae.fsf@tarunix.c.googlers.com>
Subject: Re: [RFC PATCH 0/5] liveupdate: LIVEUPDATE_SESSION_RETRIEVE_INTO_FD
From: tarunsahu@google.com
To: Pratyush Yadav <pratyush@kernel.org>, David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <shuah@kernel.org>, 
	Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"

Pratyush Yadav <pratyush@kernel.org> writes:

> Hi,
>
> On Tue, Sep 01 2026, David Matlack wrote:
>
>> This series adds support for LIVEUPDATE_SESSION_RETRIEVE_INTO_FD, a new
>> UAPI to enable preserved files to be restored into a userspace-provided
>> file instead of a kernel-allocated file, and uses this to support
>> preserving tmpfs files in-place without any changes to the LUO ABI.
>>
>> The Live Update Orchestrator (LUO) API currently explicitly returns a
>> new struct file for every preserved file during retrieve() (e.g. via
>> memfd_alloc_file()). This then forces userspace to use anonymous memfds
>> for all in-memory files it wants to preserve. This works reasonably well
>> for VM guest memory but does not work well for other types of files that
>> userspace may want to preserve (e.g. in-memory logs, binaries,
>> configuration files, etc.).
>>
>> Preserving entire tmpfs mounts in-place would require a large amount of
>> kernel support and would effectively make tmpfs an ABI, which is a
>> non-starter (or so I hear). Instead, we can delegate the reconstruction
>> of the tmpfs mounts (directory structure, permissions, etc.) post-kexec
>> to userspace. The kernel just needs to preserve the contents of tmpfs
>> files and provide userspace a mechanism to restore those contents back
>> into a specific file on the filesystem after the kexec. Hence,
>> LIVEUPDATE_SESSION_RETRIEVE_INTO_FD.
>
> Based on the discussion at LPC, we came to the conclusion that this is
> the path forward.
>
> Before reviewing the code, here's an idea that Pasha briefly brought up
> briefly at LPC, and I more or less agree. I'd like other opinions on
> this.
>
> Should we make the interface more generic by allowing userspace to pass
> extra arguments to PRESERVE_FD and RETRIEVE_FD? This effectively gives
> each file handler an additional uAPI of its own. The upside is that it
> would be more extensible and we should be able to accommodate more use
> cases with this. The memfd/shmem extra uAPI will take an optional target
> file to retrieve into.
>
> For example, the guest_memfd patches might use this to tell the KVM FD
> to retrieve the guest_memfd into. Of course, KVM needs to see if this
> makes sense (alternative being preserving the KVM FD too), but this is
> just an example of how it might be used. I think VFIO also does some
> workarounds by using an anon inode on retrieve. It perhaps might be
> useful there too, though I don't understand that problem well enough to
> talk in more detail.

I agree, While developing the guest_memfd preservation support, I also
felt the need of upgrading the preservation and retrieval ioctl to have
arguments which will make it flexible. And help decouple the VM
preservation and guest_memfd preservation. I would love to see where
this argument idea goes.

~Tarun
>
>>
>> An alternative approach to restoring data to a named file would be
>> supporting a zero-copy sendfile() that can be used to convert named
>> tmpfs files to/from memfds across the kexec. But this poses significant
>> challenges on the *preserve* side since the preserved file might still
>> be actively in use. The benefit of the retrieve-into approach introduced
>> in this series is that it does not require dealing with two different
>> files. There is only ever one file that owns the preserved memory.
>>
>> By leaving file and metadata allocation purely in the purview of
>> userspace, programs can create the target files where they want, with
>> the names and security permissions they desire, before directing the
>> kernel to restore the preserved folios into them.
>>
>> Currently, only tmpfs shmem files are allowed as valid target receptors.
>> Attempting to target populated files, or anything other than an empty
>> shmem file, will trigger -EINVAL. HugeTLBfs files could be supported in
>> the future.
>
> I suppose we should rename all the memfd_luo_* stuff to shmem_luo_*?
>
>>
>> The coding work for this series was done with assistance from Gemini. I
>> am not sure what is the latest recommendation is with respect to adding
>> Assisted-by tags, but I can add them when I send out the real patches if
>> this RFC looks acceptable.
>
> The latest guidelines per Documentation/process/coding-assistants.rst
> seem to be "Assisted-by: LLM".
>
> Although in _my_ opinion, I'd reckon most patches these days are
> assisted by an LLM. The code might not necessarily be generated by an
> LLM, but I think a large majority of developers use LLMs in some
> capacity during patch development. So "Assisted-by: LLM" doesn't add any
> value to me. Other people seem to find it useful, so please do feel free
> to add it to your patches.
>
> [...]
>
> -- 
> Regards,
> Pratyush Yadav
