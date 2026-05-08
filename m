Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D15D3FE37D
	for <linux-kselftest@vger.kernel.org>; Fri,  8 May 2026 21:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778275301; cv=pass; b=Zz2TyOw5UWS/7a+BLdOhJ31eW+p91ZUkFPGFgYMOb7Bs4uGbsGC8SZiTFMIsvWoX4EdXXGvuFI4btE0mdsI58jmGRFVgAqVrhuMJztwfszZCGrqe3ixflogHnCGa1jB6bCqbqO5QK0NUTJ/QsUOgO46LYbs++ATLNuSF9o2Pu68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778275301; c=relaxed/simple;
	bh=DwVpQtg2nQbOTA132JfDdSVfFAB6KCJ3Mceieu5x3bI=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C2YluDpAIz3UapcVWrYMahsCcuLAAjjMfSMrEuu8yrLdEiS8eFfMu/7DEcekdMxVoNDfciUzSrJ1WY4ofc/DKYcWkvTsWyLy5qlSt1QV0rumAWCs9ErRFLJIXzvPZ+z7F+rXnSMHL0/OVz7zD5O3FEGHL1D/X1nmUELRSLMSIzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UBSIVYV+; arc=pass smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UBSIVYV+"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-631a7868228so116516137.0
        for <linux-kselftest@vger.kernel.org>; Fri, 08 May 2026 14:21:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778275299; cv=none;
        d=google.com; s=arc-20240605;
        b=AvJphNj54BaoU+zpfUatOfB/RnWksl+Omr8pLBPHLbfJFusvJYuZTmAVSSKyHFu9Jy
         MhJcXzl3cLcSiYfgAPMUNTjFc1idpy2c1Oa01oOfFt1/Rmc2/wTpCuLvhd4W0haJY+61
         u8K9NfLcJJDIK6toR6BV9stnQGixCmEcQq0DFIELlhjaakDQPeiZVveezIlOBh5do4LB
         b+JEr0LIpEZb1ivAOAi21TjC39oFgdCMhIpdC2lowmMDVSvuh6wc2fEQEMMUwZymWL+d
         u/LcMsRX/HKLUX399D4UF8iuR4QIlT+GZmkL2Gp8cWIVKuRWBo1zDvUnM1Yfw8okL8CP
         i6/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=DwVpQtg2nQbOTA132JfDdSVfFAB6KCJ3Mceieu5x3bI=;
        fh=wyz+iDZ4092WuS57mAdYmJ7cfGNK2YsmIBfspYiYsc0=;
        b=gkkqXsSpe2xcbShFgHx8m77eF7CpZMTxO7/yHBii/usSE1EhwEi+xKkFqZ8eCX2aVg
         QplpI8yeEioHgJ0KVqtEJX8hs/MXTJ9hdI3FPXWV4mf9UaUFc/VhtUJxtS8Vxs0TDvcF
         IUzQ5vZqjnv4nKxc9yVsAfeki3egQcmKEXVYhrBskfCsUkGEcQRQ7j4M476ia/61nY+j
         xCiiziR+GaP7pCJqHkkUxibUP885snIyKDiJdwXqWh5SBiZ+BhirUKMtFwRJY4qEZjcS
         wuiGTR8ocEEVBPbqj/MioohaGvgO/isTnFGl+ZUyb8DuvJJAMisyUzRHE6pQYNEV9JLh
         5P5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778275299; x=1778880099; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DwVpQtg2nQbOTA132JfDdSVfFAB6KCJ3Mceieu5x3bI=;
        b=UBSIVYV+DWGpniUTgfToZNAWd5wYknlbdg+jHa8ib8fuBYefruu53HdoscKhtUpTfF
         +FIyWQKOigzjLNooN8kmf4/QhFvDUVDYc1DUcEwGtTp4qHY19snvIawBSOEjY9rjxDAW
         E3hergxglpxvyoFLcNuUevBTJBOMui9j01AzYJ291EqYmksQtJmn1/DabVkI+CKc0zCu
         Z4YpJuyo1aHi8DACkQxc9lzxhTI2w3n2lp2v8tpBUyXyKIdRR4r/MKldOCN8M50cUoMS
         4iWjyCjMuorgsaXskKpwTX/0DXt6udn4RiGrk6SX/h/fYRWj7lxKdYbiKdgQcX9bbXJT
         ZGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778275299; x=1778880099;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DwVpQtg2nQbOTA132JfDdSVfFAB6KCJ3Mceieu5x3bI=;
        b=LYbMCbB7WY240+2rFkAbxMjEmpPzjrzQU6VIKilItCCVN5rL3OvzmKsBupYLZSGSDm
         P2Tr0clciBP/LXQ5wEIYtp7e95TScRcAP5lt3f+tTx5vbbM48hLGXUqfblIwOsvbBG6a
         dzdD/T7znVsiCvMoISDW3/kcwBdUzzwHGONiC4uT3BdwaljFYZgSk5dhUd2qS+gxkNrX
         rrACQkVhUKsU8l2o4Ap8wjDvoelTMsqUUUoZZtKFzuNNV8wVGmj9fAGjs5ygWAWIrY8g
         lAE3+zLNYz9r4NdyR/D4WGPpWV1BeSHaUdTUQchTzj1ZdNRISgZMGst5ZSQqEa7RCsWE
         cqjg==
X-Forwarded-Encrypted: i=1; AFNElJ9CHmx4BgEd0bO/XBAmisz6lswnykBSq/ttanrzVITvAnI5V7FqrO39QaY0E4nJb3syb90SDwpV2tcXjlCrC30=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbVP/l4y99f0Ytfh2XUnoCxiDOmEIL65K8hPSxfFTPJjimpRV8
	/WmbnCYAVqHEQipR9eEd0+8l/RvwEt1K99DC49LFNYnIRAHpV8LpY3RnhOcQFxnq8S7ThdeVGbK
	1dVjXHqSnhG5AMLVxgQJ/ITzuqrIOiTpYHkIpTyGs
X-Gm-Gg: Acq92OG74RSnW/JgSIGt0df3Tt2iOzynHrZgufjzNEz/NPik6zMcPNUJyHf9A5Eq9yc
	sWwpJ7C4NQVU5D9PDpPDendArkFKoqOEghRF7Oznan5/fQnckrp6bJCy4DeIaNq+t+6RV1nAzIq
	1PELLuMONqcG6+Ecec+6sgtHNvHV8pE+r8hJrDKfEWnEySDthie1EmjWXSbATln9Au7gUys2SVB
	W1/euLogLNunTPg44PCx0ilPXIXrDYWDV4VwWWatIEgO9nIn+UZDATAWsBa/dpGic+U0ZtDcajO
	AevZiPOo1ba+jpAVWGMCeQ2nHN/V71LF/VKOXsO+5QKQnhX1Urhx0CgQHO5wVdEuW/i8hetz25s
	pxD0Nt/cOUivqWUM=
X-Received: by 2002:a05:6102:2ac7:b0:631:8bae:f74d with SMTP id
 ada2fe7eead31-6318baf205amr901736137.28.1778275298534; Fri, 08 May 2026
 14:21:38 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 May 2026 14:21:37 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 May 2026 14:21:37 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <af4gJ6xZ3e7UXOuO@google.com>
References: <20260326-gmem-inplace-conversion-v4-0-e202fe950ffd@google.com>
 <20260326-gmem-inplace-conversion-v4-10-e202fe950ffd@google.com>
 <2r4mmfiuisw26qymahnbh2oxqkkrywqev477kc4rlkcyx7tels@c7ple7kdgpo3>
 <CAEvNRgFkusZeKxGctUpTTbYjdi7nZL1ZZar-gT7XRUOCZ2xtpw@mail.gmail.com>
 <eiiecl7jvywvqb4drq7cchmcabcrdka25wxr77uavxqineeedm@rfcnhdz6xoxf>
 <3blpenhpvysb2ig7efegedx4v3flppl5ftnz6vhpqlatfk3ycn@vmmhs7mvjieg>
 <CAEvNRgGbMhkX310CkFY_M5x-zod=BDTiuznrZ0XvFPUK7weL1A@mail.gmail.com>
 <foi2zvv5qrfdcspnx4fstrvzl74m6xp6zrsw5omlbprxh4jrhx@vxnwk7fr46gu> <af4gJ6xZ3e7UXOuO@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 8 May 2026 14:21:37 -0700
X-Gm-Features: AVHnY4KoLAXwUd272WSq8KkXYOzbLX3Fym78BjF7-ccyQZ1fkjgts947Mu_AiDo
Message-ID: <CAEvNRgGOCUL-MzBmXZNZHYEiFdVmeL_K0itPrSRex2f+FazGGQ@mail.gmail.com>
Subject: Re: [PATCH RFC v4 10/44] KVM: guest_memfd: Add support for KVM_SET_MEMORY_ATTRIBUTES2
To: Sean Christopherson <seanjc@google.com>, Michael Roth <michael.roth@amd.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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

Sean Christopherson <seanjc@google.com> writes:

>
> [...snip...]
>
>
> Summarizing this week's PUCK call[*]:
>
> Scrap PRESERVE and ZERO, and simply rely on vendor specific semantics.
>
>
> [...snip...]
>

Thanks for the summary! Please see v6 here:

https://lore.kernel.org/all/20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com/T/
