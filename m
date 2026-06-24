Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABA83E557E
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 21:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335038; cv=pass; b=s2/XIgzpkYcVHxdlzl0I0DaaXQhKEqTfWuuCRc4sXdVN5w/tFkWNV2MALjH1efGfDsq1Qe5R0E3OUVQGPzl8JsyhDdTCCCD3Xlh76e9Q8DbOTb16d+/cgS44Q8xZXplxD/o6BsbSU2m9OMPHTCar/r4m/s7VVjOQUAa1Y7C0L+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335038; c=relaxed/simple;
	bh=ZP8N6p4zyFdYhpwemtjmNbpSTSjuQDSqD/2oIp/CY0o=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jTyuLM8/rP2pOtUqsf+U0fTUGndxAyD4yu0shM3jIS8UV33PIAgff70xz+17pFn+2Z8OsjlH1zKtsCFWMPLgDxsMmL+6SWNWattKX5M7hWWBanX7eMN/SulgMFXw9waz7RiqEAE7gmyWdqN9YkmBTmhMz65FlCOmYz2VcK8aZe8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mVsKYsqv; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mVsKYsqv"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1363fe80fe8so3034378c88.0
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 14:03:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782335036; cv=none;
        d=google.com; s=arc-20240605;
        b=WPdRUm1xWKB4KZEx0K3FRZoxLRF1RHv54/82vvSJ5Vs1JxrI6S666omnQWY0jz0Q9r
         PE6uDXNtsK26asf3op1jQ9NkTH4amLe6bkB1eLLkrEApwqlUWMiDXhPKb5Rlah4ZVm7v
         QVCe2Kd8k1ozMYEnK88utwl24ipaG0GEsB/PUOJpxQVUiEF0YBkQCz0CAqW5XyBnyCey
         fYj2BWWopja8lsK9KUAWS9W6nv6yOzw/OH03Xr5Zc3+Kezk9pZutu5zvJjAJnGfNUTrs
         QOfM1pzDFrgkvQf4cOZpBeneeEbbAoNKf1Z4EHoF3MlBd7FqEFx61mwZe+ayaCNDb/ky
         cI6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=JtXqtocb1qS3/K6xnMYZSBV/6kQD50+mfkfO7ut81Ek=;
        fh=FKflYPF0NF6tPcVOZFIXrjOMk/so6NcKT/qUA5H5/YU=;
        b=clezn4SixhKO7+rzM58S6Xi/cItVPmKfoq/lRAvNpSvJ+pf7aY+w7CJAenrIRzmXPz
         icbCeSJl9Ko8GhadKlMxG4mduDuJEqjfnFpe6CBW4YMALPSkcHZuxPGeybK2PIlEoVv5
         HE+gSpwsjtBfAuxJO7KNZ+bSHHOkuFPh07z4t1iKT9hIP+WneJHlwuorDqqw4za7wBgK
         fnXnvwTtW6nxPy5VzsrO+p57nirR+497RtkHhQUU0K6OIoG6K/yeVR5n9hyTbDpJ6xWi
         Xsj25rh8jIu58XUBhbFMaW73RgL/NZTtRS0XM4gs18732kK4WbxwDrQCp2M03USUomxP
         pdng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782335036; x=1782939836; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JtXqtocb1qS3/K6xnMYZSBV/6kQD50+mfkfO7ut81Ek=;
        b=mVsKYsqvPnhHjkscTaVCL9NTaVRlQl5cUFxwec1BgKw2e+JJbfVjYFYSqGXsnKgZZ4
         mgFjofxuxGoQHwYeFQmqtz4VvaZvmgkejICgYod+Nh/Puuxa2c1tfntjNkhSiibGXEHO
         cAAvplbvP9mkRidKcFPah2Eti5Q8uI692spAczkb3xxP6jCJP8K1uUGEWXghE36w56qB
         YYyUej/zpfG3cbyB7u9b3qVdn22p9nigT2CHRyTUvjDVHz08eqRBAPNMmzlPxgd9bvFq
         7aiIxVdqTM0VRDqvM69Isr7h6eEMHwZdHiTvNN1EU6aDMDFn02Zwo8qBsIjimCBXWsCs
         CrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782335036; x=1782939836;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JtXqtocb1qS3/K6xnMYZSBV/6kQD50+mfkfO7ut81Ek=;
        b=h1MvP4gz6q4EkTA5C5+heN6N2XlrWELEds/fc1LxyW1ehtX6GG7oJH/G9v1IxBiwFI
         KLWkFzKE0eZhzOUixTEIMmHjdjR8nD6P+uiWITdZwkHCxwbdhkl8Cvd1eWayFsRMm+Va
         72LJYW1k9bwbtpAxHTPJhAP1B/e03Xd8H08fDMDk8h0+c6a527aXX6cW6s0BsG8NK32S
         tOQENsaTOhoJKZchmvIAX2fwhWE/zKwcwHwVhAT4GlaUh1cPr3U5ulVzRHjwZw/lmONw
         pYXz7W1Sdsn5j1yJ988OzirG4gNufiZbDWWt+Z+ZGsCZUSWcOm2MZ2OU/SoM3vzCJjNQ
         /8SA==
X-Forwarded-Encrypted: i=1; AFNElJ/QtfEDNa5yccvx+rt7aDsNvqyywwta1svrwrIRiyDmg5IdIqRCmxxSuSYrTpoUvhGypwKtl4CxlAHRvnKppJQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxexioyjX3t9JCmA2kFBTiEqGfEt/Di981ZvHP+U4enrMRpJyGl
	KMX8FHEEMdBedmjqKDrWVYYbxMikj30i1eC5/p7yJiYisMyQHryPSsa6PgLVzU4xoYTkfjfB7Dw
	arouSipi7UgpWBkQPp5nGoHhNadISpEWxATwu70Jz
X-Gm-Gg: AfdE7clvYeIq+ZdhYfsz14YMPkxgpbujupdIRtnxKBGJzCo2te6Bk/Rg3mNHBZ4/RHt
	N6MfsKS2EbWutPPfO5NhE7f7q14Kk3U+tKpgm160EJE5OG5w1QLrqiZlDMCTt2S041ykrEauw8x
	v/i+yBJoGjzu4oFV6IGCIOZLe3oUwQaUfZCtRGzHZREQQ7/lvpr/AzAoT9PumjBHMjeqmNhts9j
	ceX1jRZNeWdgOD9XNMKN4xsc5OM+ndtvFCbi+f4+GLlrn3pMJF8zwNW6i3xPRf2U9+iz/81fQhV
	kS5qJYmetZF2jECJEPN0CDNfXcUWQd216njl2J8ZstglLKieS0Px8g2hZFI=
X-Received: by 2002:a05:7023:a57:b0:139:d82f:2fd6 with SMTP id
 a92af1059eb24-139d82f32c6mr811137c88.22.1782335034214; Wed, 24 Jun 2026
 14:03:54 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 14:03:53 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 14:03:53 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CA+EHjTwLPCvZJgPv=8u3pgp+kwEwQbsXn_13FL3xUbJ7HRfXzw@mail.gmail.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-13-9d2959357853@google.com>
 <CA+EHjTx2xKjheiW5VzHw_TdWFUqdJqfgu=dOPa=_yaYBMY8uyw@mail.gmail.com>
 <ajnRxuJ19OzZ8zJC@google.com> <CA+EHjTwLPCvZJgPv=8u3pgp+kwEwQbsXn_13FL3xUbJ7HRfXzw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 24 Jun 2026 14:03:53 -0700
X-Gm-Features: AVVi8CdCAqwoqTik6utb0yHbQZV7yiwfOGNo-KA9dUnC-gGzh63Sika6JXlmCvk
Message-ID: <CAEvNRgFDcwXAx0YYZOGzA+adVhtMLXaR6KkYtW=p4xL-Hp4pjg@mail.gmail.com>
Subject: Re: [PATCH v8 13/46] KVM: guest_memfd: Add base support for KVM_SET_MEMORY_ATTRIBUTES2
To: Fuad Tabba <fuad.tabba@linux.dev>, Sean Christopherson <seanjc@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
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
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Fuad Tabba <fuad.tabba@linux.dev> writes:

>
> [...snip...]
>
>> >
>> > Note sure if it's user error on my part, if I'm applying this to the
>> > wrong base, but I found a build break here on patch 13:
>> > kvm_gmem_invalidate_start() doesn't exist in the base tree. The
>> > function is kvm_gmem_invalidate_begin() here. The rename
>> > (190cc5370a8b6) landed via a different merge path and isn't an
>> > ancestor of the stated base.
>> >
>> > Patches 19 and 20 have the same mismatch. Fix for all three is
>> > s/kvm_gmem_invalidate_start/kvm_gmem_invalidate_begin/.

I took Sean's patches (off-list) and tried to combine it onto my
existing state. (I'm using b4 [1] to manage these series and I didn't
know I had to manually update the base-commit. Will try again next
revision.

[1] https://b4.docs.kernel.org/en/latest/

>>
>> Ya, Ackerley used a slightly older kvm/next to send the patches.  I at least was
>> testing against kvm-x86/next, which does have the rename.
>>
>> Other than noting that this should be applied against the current kvm/next, I
>> don't think there's anything else to be done?

Should I base v9 on kvm/next, or kvm-x86/next?

>
> Agree. Sorry, didn't mean to be nit-picky, but this really threw me off :)
>
> Cheers,
> /fuad
