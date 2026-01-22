Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C347E367F4F
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Jan 2026 20:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769113862; cv=pass; b=YQQ0124aT1c+FnoKnV16DZGUVfB3McY/ayGQYP4tuFwzNRleFeg+GJPMMnsmcycNQYfcxLL+6i1G9+C36CTclvT2ioyKIPqd9pOB3CQdn2YVnc0AahiSqjeHpAOi6oZx8hc5SEuOIgpTq8iy+R8nLix8/TKZigEpjn5Ysj/YRSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769113862; c=relaxed/simple;
	bh=ASZplhRqMNnIuXI0Gmdw3pwrAxGsQ+x5dICWN1yZY84=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SsdxosHwAnbiBKJifD0OsLm2O9CrQMFDja8VWXBXsEc5H719qzdSzLf9ASYG1MR36oxm1TmwWO3/cmIUaZ3W0Spilsc70elMYg1tNKs0+Qz6+4br2cxCaGfYOd1NKjNAtCMgKmwzFs1ZwxJDERyw8gKYi6iIgQGv6iPpZ7MSl7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s9cWSTdk; arc=pass smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s9cWSTdk"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5eeaae0289bso1091141137.2
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Jan 2026 12:30:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769113855; cv=none;
        d=google.com; s=arc-20240605;
        b=I8ho0BULT8+zkhjdO6WjVQU20nabUL4cptnhMIEk73/vTuk3/to/d/SS+kBikuHnav
         VnCD6QTDMlRGJaN9ws6+o9myyI4CZwbwpIC8H9zJMjJ+hDrb4lFhMjycjw4pW/3JrJDr
         meYGlCQ8kKOGGl/BpsH14/5TFnazYcJwiE8PUCsU8kWioM8KqnhUH3C2dGSE/B/KtQET
         vtkDNha8KhGWXEYKuN32r6er8fccI3IFKm1bp7BWMPj3adwyQDeE4YFC9XkQUy9lNvmK
         NppWj9yXeNCZdRGN8ew7EEeqCau7j+D1fnZYPB4/cbDIBxH3+QFFId8CTQV2/rY/nsp3
         J4MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=BQj97zlME5zzETPT7vCk6obWp/pKKcD8Mr+mou6nGos=;
        fh=UWdGmhFxrS5bzxphFJOlKF8PUBIZObbrIGT4LcMaXGo=;
        b=CsvYAhs6bMasR7Ez859JNAybMYzcX3VIVEwyklavxI7baZVgwwhMF/aVXqPjAAViux
         i5f5Vhx098KkpoQi4CUT/pelRWUEnv65EdsVsNeo5UROfljsM+9SBrLpS2CVxRHjaY5M
         ZqsIV1YlgKaIqxhs7RAxUj+1UFVoBhd0bhqyWQZcki4t/cvCFID0IMMkYkWvw/S60PyN
         ih7aqjZdPAHm0orZIvkaQBYJ7skRrPhAtUOyY6wBEiFsf9jFu3FdCjfM4BFjL6+eQEOj
         vYsdqr2B7SqeQzjvAcccjf5MunkW1OiP0oBeK0/c7rP363S8SlEIx/t8b5jW80xtknrB
         SQhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769113855; x=1769718655; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BQj97zlME5zzETPT7vCk6obWp/pKKcD8Mr+mou6nGos=;
        b=s9cWSTdkMw0DTkJpj9RD4xeqwJKTvnEuQS6o2lmxQr8yI+JxygOpcXlQyNkodNWeZN
         QlKZDCW7kA5FN/zuUfMW+HDnPtJb7+ympe2kD78TTtBk3Ck2FvYXAReK2lt1XILLSw5H
         QBh7wNT0aVnhZEGEA9qz8tOTHNL8dWPiJ/VwHvxBkQ4Iw8zhruQzF52rDb9aaAEUrJGQ
         yps1d7pBZmraCX4fYe9cRXLfT55iWdDhZtRb8YG5PeNfs5p2Z5eKu/TyGz2PN2paNK5J
         HBy8zc98eJILnjq8u5EUZT90+sZ4aSreI25/HQbyOqGmDODp8u4zcr2XsIp4ecAuBwL/
         6qXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769113855; x=1769718655;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BQj97zlME5zzETPT7vCk6obWp/pKKcD8Mr+mou6nGos=;
        b=KslpBwyDVS54wzqblCI+uPF6VI/WmwprzlRtwYlSO8EnXbrOc6fgjIMzvy1EVXfMvF
         YcKc0dKQtjoNjdG1c4wjaDan5Z7RjQPdDE3+f6mDjkxCmV09JP/UQDzKdr+9fKJkknyZ
         dU/OEGVdih+Ehqd5vSUpwsHrCsp2e+sC2ZDDmBTwJ5irMEQLoHUFvMGwHXBTIWgjYHtK
         XP7q3zGg873tHiefohnX/Xjfh1cPb9OUThMxV4Uf9Ilt/FJaEmnQmR+otSaWPkgbyQxI
         MI0UJuxeMLwap6+e8RVZZxTAG4qUc7DYEdCp8MpqJMIvm35ksgvxYjkDm9a9NNd9u+vy
         fBQw==
X-Forwarded-Encrypted: i=1; AJvYcCW/KZiCtATHUE3hcjvaZ4z0tgHwRg35hwUYJlCgnLbqpShMYiFYNXTErrQs+VlTcl0EcDRhzSl1cfaB5nnnhhI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlieyl90IkeWYlVxqX/9L1000KQXZvY0BOUFD9mdoCvgiaeHqf
	BO8J2qt211oIiX5aPBEfLJWoTALxaKgSJ+vMCKIcTCpLKrPYeBTGq8Fv20z8Lmyyqi2DpGkyNOV
	FpE8s9t8cwhYFAy4tjJBCJ4TB5M1nWrRgHLXr9y7X
X-Gm-Gg: AZuq6aKggmVsow03EH9DqD9I9rGmCJKIXR+HnoQpyV7C9Pgv+Aw5Cpby1t9ztxAznO8
	xGvyu7kW6TRZJ8qebFsLzAiep5FFM7kdiR6mNwBOSJkg0vXzu7N3x1KBO3J/DOM1YSONVBbNLlG
	N3IvjxuwTxpeef9cIuaFwW4Ka/Z8YNFCfrb14obgwEH1JnXJIgoOmuTcBSPqX8elawTQS5vMpS7
	pmb71pIHRPkbZ0jqAf8sb8vGVTC3/KCvfrweS6YNHUnkQp7iMQ99Qfpnf7zaO+TDXhvdER/7uEd
	dq/MJbstksXlxyCwUQ81KBhM
X-Received: by 2002:a05:6102:d89:b0:5ee:a8c4:18d4 with SMTP id
 ada2fe7eead31-5f54bd0c3f6mr359613137.35.1769113854610; Thu, 22 Jan 2026
 12:30:54 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jan 2026 12:30:53 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jan 2026 12:30:53 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <f2f2a6bd-5cb4-46c9-a0f8-3240670094b5@amazon.com>
References: <20260114134510.1835-1-kalyazin@amazon.com> <20260114134510.1835-8-kalyazin@amazon.com>
 <CAEvNRgEzVhEzr-3GWTsE7GSBsPdvVLq7WFEeLHzcmMe=R9S51w@mail.gmail.com>
 <a2b79af7-e5d1-4668-bff3-606f57d32dfc@amazon.com> <CAEvNRgF46M1jp0+eBu2wQMO7P1afyo00SOkENFwvB2KYX3dnFA@mail.gmail.com>
 <f2f2a6bd-5cb4-46c9-a0f8-3240670094b5@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 22 Jan 2026 12:30:53 -0800
X-Gm-Features: AZwV_QhoTAbsDcZFNCQXVZ12J6m5MEBpBa-k8I2xwSPIY6AXvlNDgQnkgPrJ79I
Message-ID: <CAEvNRgEd=Uh09dU_P7_vvzRpOyMYd=OKazpkxzr=VLe5HcQhGw@mail.gmail.com>
Subject: Re: [PATCH v9 07/13] KVM: guest_memfd: Add flag to remove from direct map
To: kalyazin@amazon.com, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "kernel@xen0n.name" <kernel@xen0n.name>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, "corbet@lwn.net" <corbet@lwn.net>, 
	"maz@kernel.org" <maz@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>, 
	"joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, 
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, 
	"will@kernel.org" <will@kernel.org>, "seanjc@google.com" <seanjc@google.com>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"hpa@zytor.com" <hpa@zytor.com>, "luto@kernel.org" <luto@kernel.org>, 
	"peterz@infradead.org" <peterz@infradead.org>, "willy@infradead.org" <willy@infradead.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "david@kernel.org" <david@kernel.org>, 
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, 
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "vbabka@suse.cz" <vbabka@suse.cz>, 
	"rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, 
	"ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, 
	"andrii@kernel.org" <andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>, 
	"eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>, 
	"yonghong.song@linux.dev" <yonghong.song@linux.dev>, 
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>, 
	"sdf@fomichev.me" <sdf@fomichev.me>, "haoluo@google.com" <haoluo@google.com>, 
	"jolsa@kernel.org" <jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, 
	"jhubbard@nvidia.com" <jhubbard@nvidia.com>, "peterx@redhat.com" <peterx@redhat.com>, 
	"jannh@google.com" <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>, 
	"shuah@kernel.org" <shuah@kernel.org>, "riel@surriel.com" <riel@surriel.com>, 
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>, "jgross@suse.com" <jgross@suse.com>, 
	"yu-cheng.yu@intel.com" <yu-cheng.yu@intel.com>, "kas@kernel.org" <kas@kernel.org>, 
	"coxu@redhat.com" <coxu@redhat.com>, "kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, 
	"maobibo@loongson.cn" <maobibo@loongson.cn>, "prsampat@amd.com" <prsampat@amd.com>, 
	"mlevitsk@redhat.com" <mlevitsk@redhat.com>, "jmattson@google.com" <jmattson@google.com>, 
	"jthoughton@google.com" <jthoughton@google.com>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, 
	"alex@ghiti.fr" <alex@ghiti.fr>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, 
	"dev.jain@arm.com" <dev.jain@arm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, 
	"hca@linux.ibm.com" <hca@linux.ibm.com>, 
	"Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"pjw@kernel.org" <pjw@kernel.org>, 
	"shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, 
	"thuth@redhat.com" <thuth@redhat.com>, "wyihan@google.com" <wyihan@google.com>, 
	"yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, 
	"vannapurve@google.com" <vannapurve@google.com>, "jackmanb@google.com" <jackmanb@google.com>, 
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "patrick.roy@linux.dev" <patrick.roy@linux.dev>, 
	"Thomson, Jack" <jackabt@amazon.co.uk>, "Itazuri, Takahiro" <itazur@amazon.co.uk>, 
	"Manwaring, Derek" <derekmn@amazon.com>, "Cali, Marco" <xmarcalx@amazon.co.uk>
Content-Type: text/plain; charset="UTF-8"

Nikita Kalyazin <kalyazin@amazon.com> writes:

>
> [...snip...]
>
>>>>> @@ -533,6 +580,8 @@ static void kvm_gmem_free_folio(struct folio *folio)
>>>>>         kvm_pfn_t pfn = page_to_pfn(page);
>>>>>         int order = folio_order(folio);
>>>>>
>>>>> +     kvm_gmem_folio_restore_direct_map(folio);
>>>>> +
>>>>
>>>> I can't decide if the kvm_gmem_folio_no_direct_map(folio) should be in
>>>> the caller or within kvm_gmem_folio_restore_direct_map(), since this
>>>> time it's a folio-specific property being checked.
>>>
>>> I'm tempted to keep it similar to the kvm_gmem_folio_zap_direct_map()
>>> case.  How does the fact it's a folio-speicific property change your
>>> reasoning?
>>>
>>
>> This is good too:
>>
>>    if (kvm_gmem_folio_no_direct_map(folio))
>>            kvm_gmem_folio_restore_direct_map(folio)
>
> It turns out we can't do that because folio->mapping is gone by the time
> filemap_free_folio() is called so we can't inspect the flags.  Are you
> ok with only having this check when zapping (but not when restoring)?
> Do you think we should add a comment saying it's conditional here?
>

I thought kvm_gmem_folio_no_direct_map() only reads folio->private,
which I think should still be there at the point of
filemap_free_folio().

>>
>> [...snip...]
>>
