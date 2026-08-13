Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0840437114
	for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 18:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786645808; cv=pass; b=SbgQL3/9RK2mmCTN0k3RsU5hhJyq36sIEO4JYre4eGjiLL/evWPImizirQJsb1rm6wEZU/nhUlLKAxtha8Rps2WlLs9BH7dq7gkfFaQ5+ABpSCZ/WVfa2HJ65y5DgQmS1MwLPlZXrj6vGfkTvJ62I43KJNnpDfteR6LzmaK4as4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786645808; c=relaxed/simple;
	bh=Ska3VU67p+Zg8LuYPgjyex6VZBA8Ya8GmJinliOkbPU=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AHL2Vl8WOGypXvTf7QXP8H9EjvS/f7dev93lfSL/S/gIWpEZq9mWFkWlEtcHC87koZzsjTyndErmmS0KOot5neZymFo2yfegAs/vVbOB0H771hYTywaxtto16SApGR5vM2Hmq9GEByZEr3Tze53gW2aGRqbwSGAWCl+xclBGgfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FxSeiGNo; arc=pass smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FxSeiGNo"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so1022564a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 11:30:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786645806; cv=none;
        d=google.com; s=arc-20260327;
        b=XIBpKgmunSmn/6Ioyzw65fpoYL32USs+14sNlPEy76NroqvhqBEK8mQqPi6zfA1Dc+
         8RVr38SOeJeJCdrqNPReWbeCmsSUYJeO+TzYsvY+LZw1O2GJdb0+IatF2t2/sqBbqJuR
         ycPh2HaAybdwOVxDD4hT6k2H0plrOAQYlZ0IYvi9O31My1F9j52RDiRq1PLdFWNzTv3g
         kopy5l+CnHtrjefyC2Lm7MeIp8Ah4JpcokX5xvU0wCOsXHp1XBki/GHcHJpg7AUe2V43
         n9j1QjIHitpfPMnuuoXW97iN38DrqrbvxGhQe/EsVyJLBLzUPW8t2Ym7YeCy6y2NMpwq
         AbhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=trV1VhVsvTuMN0KspJ0QoTvh0FqK6gua+XSXYlaI3MU=;
        fh=nlg8PsmENm/zlVhQmKie5WhINYPpOJhHezWrYRZ5Ioo=;
        b=mVb3k/dIlzkHe+BYfjDCHU4dVCoLV7/2424gdACHbjne3ADzTCYkAjNrPR+vPlDqNi
         926A7DGtYa2xkPrmotNekU5MH4uiEjMImvyBXhVMB9LCuTNdXwktwXV5lRVRiPlu8OFJ
         9In6lWWnJSOO0bXIYSIC5yZ9oOK2MvBInJvWA72OU0+6nKg8FMge/3wDLpGZOlBpSKlb
         izzMhNDm4CiIQAWi2yLaWzzbVTIf14NGG1sW20I2cIRzS2EvAD65HuCCnEIcVeZUiusS
         MhPuRkXwBy9tx/WaHZTpIvBIogDi8MRpOggcfUhdYgkFkZGQUXNRS7u+l1dRROyLHgDU
         Jf+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786645806; x=1787250606; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=trV1VhVsvTuMN0KspJ0QoTvh0FqK6gua+XSXYlaI3MU=;
        b=FxSeiGNoTbDkQ5btiixJQf6+qIPgn3wjc/zjD7iSumTCzWzYCGiQxPJYKAsQ2wQzYa
         wup4t3QdhSIa7XDAsMw9t3AR745AQjJSWPdOfo3BLCJtz5kZdEm8K5l4MeaNdjmzNLQX
         O6A8uUVHT7GJzd3p9ZdTNhYUG+M7E8Zt658Z0+fxNzEVb6tz2eeMal02dalzeiZuU2Sp
         /PCSQeFi3PO3X8FBJUQaLpZc5RvAO5TLNtg9ujVJwhiH1Yt684UULON+yFrPVqWQAs+K
         CxlaMl0Dm0zdYykzqs0RY6zXglWnNRTq3lc2BElABhkjiktcKj7RE4Pa0Og6jhT8PwHe
         k/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786645806; x=1787250606;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=trV1VhVsvTuMN0KspJ0QoTvh0FqK6gua+XSXYlaI3MU=;
        b=Z0waGsR1jnO4VAlKPy1DN6rMq4Uzi5sYEPytDEa/pQlayKXyVY9rbvsFTYQX4uoG5t
         OA87ZdiE/oTcigclySxcU1BOSRGdi7nxmpPicitkG9PnhZv+5+slNybnPyl619i93HHH
         wGnvxdeH5vhYOLhRVp3/qfnn6DIFBidvPE/JftKKs7CTFXTNAxlb/wSUz62wwoUfyFsh
         xNYaTiaWYvJiXp/A+1NgUgvhLz0mAS3PPxZWsLR3UofP/xQJRASLPv0j3yuiP9E+APhP
         9X8hEjoYb0InAhIccTKaDpmMxSGROQ/mzimjPT7oxKCD3X8OzMjsSwk7C0ybsIlxZ01q
         uJ+Q==
X-Forwarded-Encrypted: i=1; AHgh+RpDm44k4Seg8Y5QoRzPSwHpbox1+rzONE6zoMf+Me967o1ateSI4F3/lUzfLtVRJ9fB/VCyfEs02osQFLpgU2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh5QWs6v8Pn0+c4d4olQmmj/LeqcHJyPJP0zM4QLZhJae3B/w0
	IbAT3ohAnjuoMvKPlX+9gM4Xy4GubmHF/yncytTFVhhOBTNXgJ+fMXGXrM9blorZnnLtl5FL8f5
	bxHjynyvz0J+IqFP8ZJG6mc6Adzy59/peUFXTbcmA
X-Gm-Gg: AR+sD11PBITWGupwDCLtPGbmrX3B3uT0PGVkYg1HacOz0VH9FFNnHXSOwbvrvGkmbJZ
	JhEF21Eitcce4Pp+mbSPcvnlIGMZgQBh/v+OOzFM2MHGMbeTCjZ8KwFEKqqqVTyQTx1vEZBygre
	0wbLsE6Y5PvNBpTvXGUwa6w9gp04ocVHvqhHeyKwVWl0g/gmzgP/W7HWVIG//gOEaHt48wJPaKP
	OGV65of5rIUWK+SQwElanSuIhdjc4oxDbzkY4ya5+QcRpJQ/J1lBmbOUBGTGUvUKyO/x10PigLi
	jNK9YvfOsvKRjctfpxxanC37V3/XyF9GgE0fj7M/pTDYLvIXiNuXyja7q3rLMMiaP2B4w5Q/78f
	PAgQ5l6AluhflNrsKDNFm+igVIglU4d0=
X-Received: by 2002:a05:6a20:3949:b0:3b3:3506:cf3f with SMTP id
 adf61e73a8af0-3cc572e1e2emr8851350637.1.1786645805191; Thu, 13 Aug 2026
 11:30:05 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 11:30:04 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 11:30:04 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <anzm_YLft-J7pxiy@google.com>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-7-2fc18ee6d3ba@google.com>
 <ed483d25-d908-4248-b8c7-862dd35dc6d4@kernel.org> <annnrGR1noVuBkCc@google.com>
 <69c86172-9175-46cc-895e-9ecd449332cd@kernel.org> <anzm_YLft-J7pxiy@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 13 Aug 2026 11:30:04 -0700
X-Gm-Features: AUfX_myERGap35A1bA3IvemF8mP2h9L2MeL4s3gAw6GC_Dq7e6Qb6MukNKA94AI
Message-ID: <CAEvNRgFGt2Unre=iuXhdg+ZFjWQcewObA54h-R4mBcpfksXdKQ@mail.gmail.com>
Subject: Re: [PATCH v10 07/41] KVM: guest_memfd: Stub in ability to enable
 in-place shared<=>private conversion
To: Sean Christopherson <seanjc@google.com>, "David Hildenbrand (Arm)" <david@kernel.org>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, Xiaoyao Li <xiaoyao.li@intel.com>
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Wed, Aug 12, 2026, David Hildenbrand (Arm) wrote:
>> On 8/10/26 17:01, Sean Christopherson wrote:
>> > On Mon, Aug 10, 2026, David Hildenbrand (Arm) wrote:
>> >> On 8/7/26 23:52, Ackerley Tng via B4 Relay wrote:
>> >>> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
>> >>> index 65fbce46b63f4..9477ecebbbced 100644
>> >>> --- a/include/linux/kvm_host.h
>> >>> +++ b/include/linux/kvm_host.h
>> >>> @@ -2580,6 +2580,8 @@ static inline bool kvm_vm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>> >>>  #endif  /* CONFIG_KVM_VM_MEMORY_ATTRIBUTES */
>> >>>
>> >>>  #ifdef kvm_arch_has_private_mem
>> >>> +extern bool gmem_in_place_conversion;
>> >>
>> >> Is there a "supports/has/enable" in there? And should we call it "kvm_gmem" for
>> >> completeness?
>> >
>> > It's kinda stupid and definitely more than a bit inconsistent, but overall I think
>> > I actually like "gmem_in_place_conversion" the best.
>> >
>> > gmem_has_in_place_conversion and gmem_supports_in_place_conversion are misleading
>> > because it's not just that guest_memfd has/supports in-place conversion, it's that
>> > that KVM is tracking PRIVATE in guest_memfd and so in-place conversion is the only
>> > option.
>> >
>> > On the other hand, while gmem_in_place_conversion_enabled is better, it's not
>> > quite accurate either because userspace isn't strictly required to do in-place
>> > conversion.
>> >
>> > As for a kvm_ prefix, IMO gmem_ is sufficient for a namespace, and not having kvm_
>> > is consistent with most module params in KVM.
>>
>> Maybe we should have a helper function instead of accessing the module parameter
>> directly, then the gmem_in_place_conversion could just stay file-local and
>> kvm_gmem_in_place_conversion() would be used by other code that wants to obtain
>> the value.
>>
>> Instead of the
>>
>> #define mem_in_place_conversion false
>>
>> We'd have
>>
>> #define kvm_gmem_in_place_conversion()	false
>>
>> just a thought ...
>
> FWIW, I'd rather prefix kvm_ than add a wrapper to get a boolean.

Could you elaborate on the rationale for a wrapper? I don't really see a
reason to encapsulate this boolean since this flag should be global to
KVM, it toggles between tracking shared/private status at the VM or
guest_memfd level. Since KVM is a module I guess it's already global
just to KVM?

On the naming, Sashiko did point out somewhere that
gmem_in_place_conversion as a global might end up shadowing or being
shadowed by something else.

Prefixing kvm_ was one of Sashiko's suggestions too.

I don't really have a strong opinion on this but I'd like to know what
to put in v11.

Will using

  module_param_named(gmem_in_place_conversion,
kvm_gmem_in_place_conversion, bool, 0444);

help? The module param doesn't have the kvm prefix but the variable
does.
