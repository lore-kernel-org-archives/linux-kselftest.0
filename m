Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE5455C312
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 14:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965572; cv=pass; b=LbI7e761RvQkx5ocrACgodRxI70oTACxPHWAW89xkQs77gGdTUqRJMhbdUK84yz6Al68rDw8DI7DQA53kmFLAtkIItN4TFX3zgB+kPf+Roc0GGwC7Jda34IQcPDDGAMOK02VmXLuVfRdF+FI92AfFYVXWnsJVMPZL8rseqAtZBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965572; c=relaxed/simple;
	bh=nlL495Rwgq5pTxpggaWR4Kyh0bctH6OQcmcJP4kB+LI=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tDa4g06TybbHByR15/OvtQrapuEIRUvb+2UJhkE9p2aXAuLAKhwjlW73pLCtqFWlsEgUM9egfF8SB3uOEawzLY8BzTNPLRd397Zk1mplcuODZFhGG6MnzBakeajr0uS9+2FFLRgIVNF1Gqo6Ghdk3FPLxEn+NfIBOnn7YuVedXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q5GTrBAV; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q5GTrBAV"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-87f4e914a45so16425967b3.2
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 07:52:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788965568; cv=none;
        d=google.com; s=arc-20260327;
        b=I8O8qbY5eoS7jjKO50Z5TIY2nznU5RrqKQjXuNfy0pjZXPDcqqhloxjFmV2M1MvtsD
         c8xfQ2o2tvJtV/3KhmVo9qbGmu5F9ar2uGJsUejemfYydbzlpEfhiyEEzPF0Tl9Ry+8V
         6t09ZlFctCwo9+1XpvEfhFIW8nv/04ioSK/pPKyLH1qzB5IIeubbFd0DHs1lolCePANu
         tgAVk4GOOec7m3W5F+Jh7ZbMZo/U3dA2BLnW3vhfXI1bevULYbbunMIAX1zft/p7oodY
         +DJB5U2p8IILarPZyK9UUexRnhMxedEDy7I69q3gPRaMU7KSuu9+ov3iNN2nACUFhBAg
         BSfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=QRvd1Tt7kpHM/AxQHBaJz2yfsVBadJLI9GFkxk7vpJA=;
        fh=7Te02mplkDAPvVCCRevkpFv2N+2cXtqTKdgaVa3VnQY=;
        b=b7+nSoMPPS+4yMQ+qmDrKTHhujigvBrOW7w5WpFxgDbI4x3gvVmzVHS1keG/Z0/y5x
         YR+09LOnoPrbBpv7DPWSkTEzIKMqWC8c6l9FIcYXbptrvFstl0ic7cA5xHmHTO1DgvQ6
         T21EaINJvk8cvSvRNO0cixtgTv3pZhD7dULpsnJgFrS8wVn0Rvy/4hsm1tx5qcCy53xV
         vmKXeaJdBtIAidN6sdklI15n6ac//mowHl4vhp0VGKJJINajHSc92UxxC6Ky9IuYXf+S
         TiSF8NklbYEenn8Nzo2lrV0iksakH78Wuy+NOnWad6/k8QhrISRtVGFwksyiSqdYFScO
         0Yhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788965568; x=1789570368; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QRvd1Tt7kpHM/AxQHBaJz2yfsVBadJLI9GFkxk7vpJA=;
        b=Q5GTrBAVuRgnaSVcrWzFVkzd27J319+J3uxKhYK+YrU+Fwg95+fZECr2d2y2c5K+Lw
         kDHG13tuaLPopB7H6H/545I/WTq4ivNB1UVAXnvAT8uJDlyMVXf4h0juHkNSoPKLWEhv
         A9POnGoMyhLUqJ/o7ATabpZElMXjm/L4OZfEeyr/nKWSOgW2zODEqpJzY7NfAea4iHeY
         cInlIz5+GztynAVEfGufDv7tI18v0o7bV9ABZA4XPKuO58QSEPLRE8QS0wPAvOCh5D5M
         lczGIov7XpI18Iwr2w1HCrJaeoByt1+ZYhdMTI8KtuQmGWHzpK7ioetpkDq/YQMbOZ/9
         fFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965568; x=1789570368;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QRvd1Tt7kpHM/AxQHBaJz2yfsVBadJLI9GFkxk7vpJA=;
        b=F3wSmh9cFzLoBquqAUufcLIiVwfRkUpeuOOitCrigpRnYay1zIU87rD9JMVDmM/zej
         BC9o8oNt/Vh1jc/RQi0lsvaL4Yt1gL0bQo/ypHHJTAhYB4qu87sWEw+Ge9r+SNguFLtr
         ZCcH0ZlghcwnJ0QHbpQawQVXyaUVjqu2sMMZ8YsLc0IWFGNM3lleHD5ei0pYHVLIFK/f
         knv5Qb00tjUtyQSzm8k1ThzHd6Vk18RdN/y7CX2da8Hy/S0obkThc7RTaFZO5Fw6G5+q
         ALxBtuNokNQQJ4UBLXRztL5aYeh5jEUZG8oeF2R80DuQlcz/pkSLQkEnvhQfzcQfRjac
         Tyig==
X-Forwarded-Encrypted: i=1; AKwUvBzbHoLFXgYBZVTHhgrMK7T6zvXPIwfeFHPLlOLbEzlH0mbiilEPIk65fK0Zl+oXfFoLkOcAtp+U7AVcvC7rqMg=@vger.kernel.org
X-Gm-Message-State: AFuF++k8++TJGNzAFDgKSPQR5rnvOugWmUx2Sl9T+onvaKkkpR3v7Yci
	Kk5TIr0CK9Mdetk0x6AAu9PFY9xrwwtA+LmIMsTKdVD67R4B76mWQVZCOMes64rjf5zMFTRUdW8
	b4nKPIDyawpeNPLZDy6JOOAAankUeWio2seZ58iAB
X-Gm-Gg: AYBFou2io03xS42yGB8z9DtKv9EuytdTxfa/1Wr7qfDknySbWytEIDTlCEqTYoOGNwR
	uR77vfHY3/+tAeE50q3JaOQlvqmyXtZ/Jq26+/xa+RjpxrWsCx4JFCLxrQVAFTVCgEXhjHaCjqF
	wXT3OkhYHQEE4CllTJ6INtUAx5UaiE47UnUbP0bwCRH5nrUGVW/0PqX3ZWAKAfvJUIgcywocCB8
	PtrfAKPrpa1V6cMTIf1hTBF0spsUdUfGcSiThkn7sijqwcuA4pSMrKLKQo7osQGW9vy88x9GpDS
	/JAllR5apqHdNqH6ZGtkhxUBDtF8aLIDrpQaXELHCo5c1svSR/u5lWTOt/N+d730Yx3XXIXsB9w
	3Rds5yYfKLMo=
X-Received: by 2002:a05:690c:6b88:b0:845:ddf4:a3a7 with SMTP id
 00721157ae682-87126aa77dcmr145268997b3.16.1788965563207; Wed, 09 Sep 2026
 07:52:43 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 07:52:42 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 07:52:42 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CA+EHjTyU1Ldbw-qqdQOx_P8jrt85QEcKSGae2h+AahsDQdbmLw@mail.gmail.com>
References: <20260830-gmem-inplace-conversion-v12-0-85e5fd25252a@google.com>
 <20260830-gmem-inplace-conversion-v12-14-85e5fd25252a@google.com> <CA+EHjTyU1Ldbw-qqdQOx_P8jrt85QEcKSGae2h+AahsDQdbmLw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 9 Sep 2026 07:52:42 -0700
X-Gm-Features: AcwNN1XhqWHW23-sQN5ajMsWY1WhBdcubAUAi4IgbeOekiJ8g-YJ7YTjJ4UYzFA
Message-ID: <CAEvNRgG36aXk8UW=Mi7ey-6vUe1EOKnkgNRNzdSUz-QJih4uAw@mail.gmail.com>
Subject: Re: [PATCH v12 14/45] KVM: guest_memfd: Add base support for KVM_SET_MEMORY_ATTRIBUTES2
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Randy Dunlap <rdunlap@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Fuad Tabba <fuad.tabba@linux.dev> writes:

> Hi Ackerley,
>
> On Mon, 31 Aug 2026 at 01:25, Ackerley Tng via B4 Relay
> <devnull+ackerleytng.google.com@kernel.org> wrote:
>>
>> From: Ackerley Tng <ackerleytng@google.com>
> ...
>> +.. _KVM_SET_MEMORY_ATTRIBUTES2:
>> +
>> +4.145 KVM_SET_MEMORY_ATTRIBUTES2
>
> This section number collides with the existing 4.145 (KVM_PPC_GET_COMPAT_CAPS)
> below, so api.rst ends up with two 4.145 sections. One of them needs
> renumbering.
>
> ...

I'll add KVM_SET_MEMORY_ATTRIBUTES2 as 4.146 below
KVM_PPC_GET_COMPAT_CAPS. Thanks, good catch!

>>  4.145 KVM_PPC_GET_COMPAT_CAPS
>
> Cheers,
> /fuad
