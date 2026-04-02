Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5B73EF65C
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 16:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775146833; cv=pass; b=SyoZXi4Y+uMTa4WNtPhRU/kuTdnSVzL1DD54vAkSd39bfqKdvC2ZF0NrF4q+t4Kvvj3aj/oGFlTxXW7+HIkx239NBigzu1aDN7btBBXLAc8fy2mdWd/IV7l/Tqb6nyc4USjtOl8NQieTiiygDMyC9Na62U5+qDKgpzMURV5fhnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775146833; c=relaxed/simple;
	bh=j18XohxzMi25YcB7luu3u4i4Qqa/vIrjWdtPngyhd4w=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nB0+nQ8Tp68ZR+O1JXVv09Yvqwa3QOeUqmz7t6a6TjlIR9cI2maNyUWYmHREkYI6w+neJjtHCeMTkGzN/jZ+RZt8yOBuWyTskyWtISVoRK+ZQM/WnuXTjCdP+oW9f5O1JHpzkU7Yc4yAXlv2fzftU7pxoTeYPLVQCL5VaMbLQ6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MUf//50h; arc=pass smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MUf//50h"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-953a26a9abcso333850241.3
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Apr 2026 09:20:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775146831; cv=none;
        d=google.com; s=arc-20240605;
        b=IlgwfG3QcNWo6Zpj6vkaM0tXyg/zZnbaXe6Bw+/NIcBg4kd8NfIUQ3yb3HHHf+cVsM
         PMa/grP69egIWnheCmDTMOU05oTygCCPTH22Pfy6mwshd2CN4/nd2VLCvbWLm56Nv2Nv
         ZtOWDskHBvZCUvjmmZz/bcBeixq6g+0jxJlqF4TP89aixfbrIyqoTAxxOd+vuKbupeio
         270rQ5o8Absm9mBtWbmVHmEslxvaRD4j1mpZWwjCSo5irWlwy9u7IRJErNQMTrLcmd47
         efXo6XP3+FipbttaKkZ4cpqe/8deK5+XDm8yqaj7/LgHxEe1bdHl1TU1xvtZn+JpHtb3
         haPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=XABnzafTexu8r9STfdSEhkFwL2mOaywT8y1TwNRcZwM=;
        fh=ab4gcwWReu0BbHjvVxmXqyy4gxJrylPXBkA10h+st50=;
        b=LpbgvOIpcLSOFsz5vtbR4E3SK3IVrpV2ptPWZoQYv7idRDLPL0DKtAZWY+WlPTO/qD
         X5EoWQbwFjDibEgIq9L9W8zmQkG6hMCXNtTcKiCvwE6zBSP4zRM42t/aRL9Y+Ib36lAv
         /gWh5uDJP4ilfReExiikBFKNim76Bwx0J7TqMi6wW5ZGntWEmfVs4pK+4PPL1/Tltgge
         E1HQ57TBG1r6LJxk3ImFIR8fjS5NhpENtWcz7ZpILYojMgJDvoFVoawFnhM8NK5zn53a
         umDFIUttRCWUbRABTKv4a7LARAjnHf/A10ClVPVe2CbyP4cTOtjlFctJpakJLuvRoj+D
         AP9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775146831; x=1775751631; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XABnzafTexu8r9STfdSEhkFwL2mOaywT8y1TwNRcZwM=;
        b=MUf//50hege10NWZS7vB28cKBNOTHzeZ88qsBTYxrg+1d6hord4uRba8qOtgYCQU0b
         4Ypj3TL3kPBFrvS46bEuoV+TF9i/ScpSyz8buRCn49iRsLFtENRgcgicAKONa1fHWtqZ
         3poH5y9iBmtZazGCNdcy5/Owh+xikXxAYO4OqbFV77Bl2jZuDYRGgLok6+hy4limIu0R
         FaJGoJIyAFI06vyuT0M5mgiBLvWbrN7lEEDJ7+hpyd8SLEluf0M5s7KeH7UkvnhuSYpZ
         mKjdimt359S9hYxLrKLaTqQq+hDurAcE82bzHV3YmQODxpRz6BkzBQIqoqIuKcSJVfFY
         ti1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775146831; x=1775751631;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XABnzafTexu8r9STfdSEhkFwL2mOaywT8y1TwNRcZwM=;
        b=hAYTtpd2CMwNhTMPy7VWoaHBPuX9ah25S5uIUUkWHNvhVfpMa219fsEXol5OADWk9t
         dQxD6zocGBDToVDA36iLgGZ/zqvXQPAKMps68wAThbbG7ckrEipfy6zaO8ekKycWQNhA
         R3+m//XqDXIjFpZej3Y47Yxmzn0CL+6bXE+Hdhb0ziCVQreZMu77mfLLKmoyPr9mxDWi
         wRlfiLATNIFyH5hacxJlasPl2VQDCivmSy47ADA414xhWZffgj4CgDILyNKuPTlfamLr
         sqXYRY/IgNKmKpVXMtbkywtxrCPviTPB8NLH3WLuhYP302x7av156IwHHGcG+KcKzVdf
         L1IQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfbzVXFHWxpY29rZObsAdwDFiZWJxztNjfGBONDGXsufPXW7Qb8RTZYZSiheaOIdv74lyhT7jAL9zwaUg4+fk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDWjsxByiQujk0o0h588Fgf1a1lTMmioen/uMLDRX1avDeSSxd
	lpvzQtSkAus7Rik/REkH2eHgL9WivmfHH+0L9bQidiMkUv4hYFENt0T4BrlyPelG9aP6JDLlwAV
	FK0eYOGhZ4gTTzqC1vpVrr8W0v3f47xfjF7yYiSQk
X-Gm-Gg: ATEYQzzgdKHLFGNj4l3ykaw9osc8sNvD3/YrKmMt5D5f3MyfcCF1ZZZJqKF5sqa9UTY
	zDkg2FCxYPeToLbclDXiSUuBVfLlZ+faYJVSunaEeddKVRS8jrXBHKPs4HeJokI19N2Qy1DRtQn
	u3YbaOvrYgMCBwla6rKhFSa6PpyUQ1TAZ3sqZ/Bbr2Mod+5+DZ9uxE7CcHltDF61FoOxCHDl8jj
	RPwYYoe/ksVR+WsSEwrbvE655T5SN7YZX+hgItIERgvn44WGYXsmu9oxlVUu9ZAv2CWWCVdPqT5
	bM8L0VPSQ54Ra+rKzZ9vu4h2g3nd2cJVUquF3kQw9s6lFZNhBZvQP9+jIw1wgfu3vbhzvhS51lx
	GfqQ=
X-Received: by 2002:a05:6102:3912:b0:5ff:9d74:967b with SMTP id
 ada2fe7eead31-60567f98c75mr3137498137.20.1775146830774; Thu, 02 Apr 2026
 09:20:30 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 2 Apr 2026 09:20:30 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 2 Apr 2026 09:20:29 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CAEvNRgFkusZeKxGctUpTTbYjdi7nZL1ZZar-gT7XRUOCZ2xtpw@mail.gmail.com>
References: <20260326-gmem-inplace-conversion-v4-0-e202fe950ffd@google.com>
 <20260326-gmem-inplace-conversion-v4-10-e202fe950ffd@google.com>
 <2r4mmfiuisw26qymahnbh2oxqkkrywqev477kc4rlkcyx7tels@c7ple7kdgpo3> <CAEvNRgFkusZeKxGctUpTTbYjdi7nZL1ZZar-gT7XRUOCZ2xtpw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 2 Apr 2026 09:20:29 -0700
X-Gm-Features: AQROBzDMmtxznwwWBs0nZ4oqZut-IIYidHQDWkMKzAfittGrfvUDuSGnGYqXsAk
Message-ID: <CAEvNRgGm9icDK8sK5ZfqHEOEqSbvjwtihE4p9d3vpBq-NfVjmw@mail.gmail.com>
Subject: Re: [PATCH RFC v4 10/44] KVM: guest_memfd: Add support for KVM_SET_MEMORY_ATTRIBUTES2
To: Michael Roth <michael.roth@amd.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jroedel@suse.de, 
	jthoughton@google.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng <ackerleytng@google.com> writes:

>
> [...snip...]
>

>> In the case of SNP, there is a
>> documentation/parameter check in snp_launch_update() that needs to be
>> relaxed in order for userspace to be able to pass in a NULL 'src'
>> parameter (since, for in-place conversion, it would be initialized in place
>> as shared memory prior to the call, since by the time kvm_gmem_poulate()
>> it will have been set to private and therefore cannot be faulted in via
>> GUP (and if it could, we'd be unecessarily copying the src back on top
>> of itself since src/dst are the same).
>
>
> [...snip...]
>
>
> Btw, if snp_launch_update() is going to accept a NULL src parameter and
> launch-update the src in-place:
>
> + Will userspace have to set that memory to private before calling launch
>   update?
>     + If yes, then would we need some other mode of conversion that is
>       not ZERO and not quite PRESERVE (since PRESERVE is defined as that
>       the guest will see what the host wrote post-encryption, but it
>       sounds like launch update is doing the encryption)
> + Or should launch update be called when that memory is shared? Will
>   launch update then also set that memory to private in guest_memfd?
>

Update after today's guest_memfd biweekly:

guest_memfd's populate will first check that the memory is shared, then
also set the memory to private after the populate.

KVM must not make assumptions about any memory that is private, so it
should actually only be operating on memory that is shared. This is
aligned with pre-in-place-conversion, since before this series, there
was no way to populate from private memory anyway.

>>
>> [...snip...]
>>
