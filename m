Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E20337646E
	for <linux-kselftest@vger.kernel.org>; Thu,  4 Jun 2026 19:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780599943; cv=pass; b=YTI/gi6pjjvc21gK93mv1MY8QocykHMJ4jpyuAGT56E/vAXkwWuSpozzkFFG8/HvWSMvw8zp9E7JOr93xC4o7vSnYV6Cz8QqkpOS/ZH7ZDWTRpAW5I+C4UzafcxX+ygTf9T6JX2EFO+1IEHyMEtVprgMCGoqiBs5WhYJJ86usY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780599943; c=relaxed/simple;
	bh=fPhPRTQvhTqz157LTAZ7B67TGOApX5jgr9r/KxX7Klk=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IQMdSAuAJKcSZxmHMgY2w9RoVsq4iuaKYck/7kFOfAY5A8d47vB3Md45k/+dW8hERwhriAF4VIur6cJw9OiKVA8jCZD/3/Qs66r80PrT257g33gBMvF2cUbWGovSRg2C8yLtAIxzORAr+ReIoDpDCVma2yiOPQk7jT9gubGujtw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Hy1H0EXl; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Hy1H0EXl"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1363fe80fe8so1642005c88.0
        for <linux-kselftest@vger.kernel.org>; Thu, 04 Jun 2026 12:05:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780599941; cv=none;
        d=google.com; s=arc-20240605;
        b=CcmQ/lmRuyba8pS774C53Gy4V/60pIxTF8UEozCRaxt9ylMCP3/MOj1ctBU6wFtRrc
         lZmkrUHKORhjcBPZGDfD+XLLdfHuNwCD8XJ49csssTHYjPiqih4BUhd/8uCF/XOQfZ9+
         nox/WuR3oJqFf2/K02BuRbeZNbYiDWf7z64UQGZDO/+KjX/J6jqyQQzL03IM9yQQC3DZ
         aFy5JC+E/RXgHfT8mLCgejH4IsPtpQmfIk8hpE1UUTZWRvEYr0SRTNNbUUNMyEkCIaHv
         9jwE75sPGFYhnTQuFgToFSlyc5st/YwDmNQuTqrayrDbDqug4KYo7DWnZ1Bg9f4RyHXp
         5HRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=fPhPRTQvhTqz157LTAZ7B67TGOApX5jgr9r/KxX7Klk=;
        fh=eDhFvEPg1HexO4Bz88gPm6GDu58WNwwaP3alEZeHP4U=;
        b=PBIEf7yy0lQsv5LXuX3lJhYpo3C9OjkwYJv9qXOnaCd0k0NlmCvVqLNF/h3hddpPwj
         roomjCQ5E7hab9ngmKSNfuLxqtKsjIcgpmFQIvDHTVTcKyiUkt0vsXrsjfcSuHAYQCQy
         BP7Ge4GLTYSTkxlEbEi0+/HIX62XHVQHMeA/Y0Sx6CGlUj1gQ2BCVKqvCXkB19uH2bP7
         Mad8z17mBjOz6GvQdBtqm2FYi30imfd5dtCOaiGSPUlMRACOGHgDvEUjsmoQoSsLUp5k
         IuLRPQPNh6GJqSxt6/DSK/2iYy9LghFw9JhPjuQXokLPve72TCThyln1TZTj3/cZMuvQ
         bQ5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780599941; x=1781204741; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fPhPRTQvhTqz157LTAZ7B67TGOApX5jgr9r/KxX7Klk=;
        b=Hy1H0EXlnaObJ+zPhxLtsx2B8hXbpEIIxEgfw2HrrVf3MjC/6/kaxnPX0yug8T5tCg
         CxiUVTVYs+ycfk6vAqOsXEDitS4efL+GEGW4Fmlntz8i6GLCFNYGNad67qOMRl47zUPZ
         cXphrgkqUaTkbNqNBcRb6W+eM/RkA+yR4l2qkuu35iyD33qwhM13bU7Cg/9a1PP8TrHv
         HsXsw7bF6rwzlyEGj0tmfhT3dbrTH16HQEVH6OHFPw71eOhOnm1KzAXpRdLXT96ZQDuL
         cjGFxigwWu6m29r9NNGo4eU7OGZ0vsi68TgcnBbbaSJh13XeXoSiYt7PfiyT73yW0exk
         pCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780599941; x=1781204741;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fPhPRTQvhTqz157LTAZ7B67TGOApX5jgr9r/KxX7Klk=;
        b=oPsUJBkxPAK+Sf8e6ALuRzFQMGsduteisyk9YqPJsVHq2WtHAkvT0rCfjx7OOsYToc
         CQYBtjxbLP4b/xQkMuptCqk/MZ+ShvzXNh3oI+sf4ayYaKGiXUbujiXIJJa/KmEHs9yy
         f3rRwHK1HbYK2v1ZvErHsBZ/mHyVs3fRd5i44tMi4D2JFODzYCf9FLqvzZ6GrgQNZu/Q
         SgyvVywY7ZSEZ/xNgDo0YSN3OvpZMtg0uOVZk3c59duiswGwBfGMFvCvjaJxQUWJjovn
         9TrUZhOXLKqq/L2zgrdtFwLgZ6ulIKqwKyM0FudWRm1GgalcpusceNL+NQHBg24nAf3f
         dz7g==
X-Forwarded-Encrypted: i=1; AFNElJ9L5dZl7CWYDNl0WG05//HlcH/D+UMMNIJPJH281EUHtKMw+LBeaiLZWmmIWxHc1suvYL0B0PBAmPQ4fBIgvAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLK9rDRngkW5/JwGd3BTfD92SyYl19np/vh9YLf4o7ttuXsr+x
	fKBNY1Pu+DcpHa5vdP9ig6eiF/H49is5F361uPVznUjI7NEWwv3okmCVU1xQK1wBvfqIQ4A75dQ
	XcWdbmU6c93nFvt3ORMbSgORm+p8n6DVBiX5rhcBf
X-Gm-Gg: Acq92OFn5VYOKVzckYSDdrwN8lzLhpPgSmg+TPK8FTBrKiZ+zOoU0nwRgvOkYWWUnDA
	2fmxEXa4FExCyC67ghMeUUnzDRQ+mC0V8frBerk4L+8joCESg1aK+UjEzkp9KOQtmGoMSXHxZua
	5hhZajgFmPQFpqGuV29/4gHtfJkHm6kDJl7pxHvzBiDYsbtjj3VGznSJWwBmxzXZLAw4nPPubj2
	qFSEZxXEedN4fSNnaaT56XADdYb8NVFDhLtVQQtsbtzwfHRsdnmAd+za9W7FaAKYIZ/gjFvqdfu
	WdmOUl5/Sihbb2xsfYkX1NnXiWrKBgUZhnNeKt96YsvvSLMZGg2dlbG2c/WKnuernjYCE3CAuep
	IgEi+HHRFq/dVcQ==
X-Received: by 2002:a05:7022:fd05:b0:137:64ad:a625 with SMTP id
 a92af1059eb24-1380676002emr151447c88.39.1780599940562; Thu, 04 Jun 2026
 12:05:40 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 4 Jun 2026 12:05:39 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 4 Jun 2026 12:05:39 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <9d15479e-e36b-4865-804c-7d93eb339e4e@arm.com>
References: <20260522-gmem-inplace-conversion-v7-0-2f0fae496530@google.com>
 <20260522-gmem-inplace-conversion-v7-20-2f0fae496530@google.com> <9d15479e-e36b-4865-804c-7d93eb339e4e@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 4 Jun 2026 12:05:39 -0700
X-Gm-Features: AVHnY4IdCk0L71RC2xDPMs_Z7be_JnLSsAktCF5S5h3trmfsblKVtct2b38am_0
Message-ID: <CAEvNRgF43RBv77RgM67kXRRHDnQw4L5uwQTuvkJHzkHJWB1mag@mail.gmail.com>
Subject: Re: [PATCH v7 20/42] KVM: SEV: Make 'uaddr' parameter optional for KVM_SEV_SNP_LAUNCH_UPDATE
To: Suzuki K Poulose <suzuki.poulose@arm.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, ira.weiny@intel.com, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Suzuki K Poulose <suzuki.poulose@arm.com> writes:

>
> [...snip...]
>
>> +In the case where ``type`` is KVM_SEV_SNP_PAGE_TYPE_ZERO, ``uaddr`` will be
>> +ignored completely. Otherwise, ``uaddr`` is required if
>> +kvm.vm_memory_attributes=1 and optional if kvm.vm_memory_attributes=0, since
>> +in the latter case guest memory can be initialized directly from userspace
>> +prior to converting it to private and passing the GPA range on to this
>> +interface.
>
> Just to confirm, so the sev_gmem_prepare doesn't destroy the contents in
> the process of making it "private" ? i.e., the contents of a SNP shared
> page are preserved while transitioning to "SNP Private" (via RMP
> update).
>
> Suzuki
>

The following is the guest_memfd perspective, I didn't look at the SNP
spec:

Do you mean specifically for KVM_SEV_SNP_PAGE_TYPE_ZERO, or for any
type?

guest_memfd has no plans to do any special zeroing based on type.

guest_memfd decoupled zeroing from preparation a while ago (Michael had
some patches), so zeroing is supposed to be once during folio ownership
by guest_memfd, tracked by the uptodate flag, and preparation is tracked
outside of guest_memfd. So far only SNP does preparation.

>
>
>>
>> [...snip...]
>>
