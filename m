Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794254388;
	b=3BcYwSK7QtbX4CaERZVxZcJgleU/jqafW4ELbTwsC0MQ9/Yh7sDjiGIutck4wVXqA0YN
	 cVAv4cA+PchVBQWGmMjs6f63+6NmXj+g1Yo2Nh2BkjPY4JYhHRzpKzkhAIEXitU1aF3wM
	 xZddghHkp0tQNuyKslagrtNgp79RpDUTaMMy3VCKrs3YWqxIM7it6N987MiRVRHntOBbn
	 GRGqqIjb/V8EqOxsr7LqEe91scqhzU42X5VqFD8txdt3DYKdRku9aK5lpvCxxuzolVXX8
	 gQs0inbgYO9gCvc485C3yXfHhVCUiNf6tvkI9Tf1BG80HlBGyuv+M0MjGTTuQow/pQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=kOt00kDVnIg1petIk2pRYb9G+8rJXwscwCWERTsP31U=;
	b=vxrezOze7cPtdT/lqFjEKIhUQlklhHr9p14ML5dckeQKcRRcgOaeucf8zgwk8XypgYT8
	 J3B2nP5LAhU5NxIlmLGYibbxKpvfxvO8ywKGocOKViAlQGY9RVYLQqBIcRKKlGZkCO/4q
	 Dd0KYjo3UzYJhf86gHLyBUTpNXqD5xr8rBQ4gTZbaJczXiGcYBfaP01aZvyNwCyAqOudI
	 g0Qc073V8C7V4198VqBQiqE+6mB75qBju0kM0SeImV68RuJWoC1VyEtKj5TQXPzWphP0f
	 LanAdaTp65XTkajWJWTLXCzxrcQRxVgRBrKwWtzqq48/SQ4rgxlsRJfb7Pc04BxzqGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZJxKK6JE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033AD606A330
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 19:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 033AD606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZJxKK6JE
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91ec396c93dso15455986d6.1
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 11:59:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794254387; cv=none;
        d=google.com; s=arc-20260327;
        b=EKrs2/gKqBXPpqpmFy6KfWh+q+rIh/kFyCwR04BWp2reFjNWf47JgDQsDKFAtiJjzT
         H6Z99aPcXfuSZS1adjT+L3vinVs28mul8Qps2xrPfUzMqAJFuGiNJo8E3oW5V83FKesL
         a2/77HuJjmmGFSiN3PooxhQ7+uOyW4K4q41DAl/8MPglW/Ym6QWIApohbpYiyBVmTeLg
         baNJ9KRbObxU/ECCU/YfalFOt+R0v/2jRiZ4KqNVlRk2ACAibVUVEauAjlY+OAE2MU/b
         NChJwqCBLnIvwAnl05KNB+S8vADaeFG/ykvfQ9HtUahyS0tL37dVK5U9ClFapYII3iVt
         cThg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=kOt00kDVnIg1petIk2pRYb9G+8rJXwscwCWERTsP31U=;
        fh=Nomv1OOdk+RILkmmFHAjYWfRmPikJNTxfE1use+CieY=;
        b=DWuHPLw+v/7+dRSl2vS2ylob7TySOVmLVrHPQWNrMGP4A4z46ZZfbFb1s9S88z8LIZ
         PY/j2AneuDns9xB5KZ5tNxQTDlaYDkP9L/f38sGs02HNDVhNJPScqKfYZVrjFI7LTZP0
         y/VnYzfqMfb8uYtq83XDQ/X0+SR15KfvFaBzjqdJHH2F/dod5HeAvoS5gtKyygRWOvQ8
         uPTU937Pn7GAHDgywrMFZ9TorJLEQlvnKzRa18DVQQyvqT6E+wksvKJAdM459+oWI3na
         P5m4RaWzOXIg1YdH+5sdqPJCZYhIQHHdyJruu11F8He0hikvNDciceNGF999KRd3e9Jk
         JD1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794254387; x=1794859187; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kOt00kDVnIg1petIk2pRYb9G+8rJXwscwCWERTsP31U=;
        b=ZJxKK6JEnpFDdDiwDL4cx7CHB+t4t2jIDCE+8esAsw6zjzpvtFUdtuy+Y9Lcpo54Dg
         OF8bXjgBr4CdLb47v1hnaqP7mSQOeJRjRIQxQrzgVVz1rZvUtIQ6BRio4B1ZQ4OvKjzi
         eSlcSsOBocNlecFaWKoFMoM1D9OltBoOMBczdFL2iW70rLVP9QHO4zQCSszv1Do/kVEy
         WzESzHncdOcrhEF/ithmaJ6CyNELwjjA/AQhEkzGHDINTyEt/nTJ2+RU7xKvItQsVYPA
         YtfRVAcUL3zB3iXQbC9y1hmIxwJ8cNhrnXpMdl9oAgNnyKbSRfIWfxAYsUzFlkneQ7nC
         mOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254387; x=1794859187;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kOt00kDVnIg1petIk2pRYb9G+8rJXwscwCWERTsP31U=;
        b=tR5xq9vXEF7flTjrKObwc0G20GcO4e+bB4QYhJwzHxHMBy5qN1XTnGCMTzKfWaUKWa
         hVKgJrejXRGd48El07PMkPrKd8DPi2kot1+29ZR8NDhRyCUgSLCZpXorRns6yE+u2ZOp
         r6T7nYPPTQXHzMKhiHjkzqmMLVdkblfAaFk5UvXD9F9/a/FIEXwDFZ0m1rHfD19UDvnN
         ndUpLm3kewlZvINGjNzoS2WcKudXhgIfLAUv34gj3YdW8g1evRz/+M5qh32ahjPBgmfG
         KrGkMKPnNC0bg5S1G+63vgIAxNpGZn6vT4QFE4PUIyj5rZzjPXd0xg5MlyxVC+36n3o4
         iufA==
X-Forwarded-Encrypted: i=1; AL+hErGejJ5g7p2kXsCtbpJFazj06nFzGYjlIoT5sIvhxD7/uF3I2XU7Zt+wQad0MvQqGsawmMlJiAoGpYe7a0kXNE0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eNdELsmB/FsyRubZrYpsgf2NYBoByUHg1u5fZdmo1vffalz7/
	nWkzWh6zJHbKWO88SKG/46jS7wGlave5AD5LWiAwYvFYSdtPCVMkRB/GpwB8sfUexFFJxthi5Cz
	efmHOIYxS2Q7r2Dlt2MLA48ryWTt+opTGM3BJMkmx
X-Gm-Gg: AYBFou14VJRTcHJtYeaajzLJj+4x3DGJArsJgWAUhvsgcXZRWkJknp9816yrD93oS7X
	gZMEcfCBbEOFhPGybNvBpUVvkxPUwDa9jmiJZK6Q6BNQa2OKqP0w/6V/MzMwRwqznEGggfCggEe
	lcr86mKECRWqre+xoHCpivivIChppx3RrL+RiUSNAaqYOQcRsR/zewqHD1h5f414zzTI+A73Vng
	8Es8PLCxzDUCEFpTJ4TfEzsAt7eSMJuU2MZUYgrdj2mg6N+peUSeh8W+7wQNEkVT188YjJZVMnU
	ujlimX3IO4VLk7qK1jcEkR2DH4BHLB0nIOjOTLXXRZ6/SwGHNaea1ea/Lq1QFOsdKy6l5lUo4A2
	IRqCgeclhzZyPLV5NL8Id8oxloYYCN3pjlWiiGbWaFMRS3TBKdYI+7/gDYV+RJSzHZVVS+1XBS2
	au9wk/8Bu5FqxczNYY7JGnDk4=
X-Received: by 2002:ad4:574d:0:b0:91e:a16d:7a30 with SMTP id
 6a1803df08f44-91eef808c9emr12577566d6.21.1794254386073; Mon, 09 Nov 2026
 11:59:46 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Nov 2026 11:59:44 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261105-tdx-selftests-v16-12-2024e8fa517a@google.com>
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com> <20261105-tdx-selftests-v16-12-2024e8fa517a@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 9 Nov 2026 11:59:44 -0800
X-Gm-Features: AclHuK90wR_z4yVrzO4MfdjN_1RfU4RbtNS-E8SukabdQfjTq985Vre6DirfMaI
Message-ID: <CAEvNRgEkS=aNPcWn3NPRL56ibPvFS1d12Rvbx6gCE-yonVgLXw@mail.gmail.com>
Subject: Re: [PATCH v16 12/20] KVM: selftests: Call KVM_TDX_INIT_VCPU when
 creating a new TDX vcpu
To: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Lisa Wang <wyihan@google.com> writes:

> From: Sagi Shahar <sagis@google.com>
>
> TDX VMs need to issue the KVM_TDX_INIT_VCPU ioctl for each vcpu after
> vcpu creation.
>
> KVM_TDX_INIT_VCPU has a strict prerequisite for the CPUID state. To
> satisfy this requirement, call KVM_TDX_GET_CPUID and KVM_SET_CPUID2 to
> pull the CPUID configuration from the TDCS and commit it into KVM,
> allowing KVM_TDX_INIT_VCPU to succeed.
>
> Additionally, unlike tdx_vm_ioctl(), tdx_vcpu_ioctl() doesn't check
> hw_error. KVM's vCPU-scoped TDX ioctl handlers don't propagate SEAMCALL
> errors into hw_error: the error is handled in the kernel and only an
> errno is returned. Checking the ioctl's return value and errno is
> therefore sufficient.
>
> Signed-off-by: Sagi Shahar <sagis@google.com>
> Signed-off-by: Lisa Wang <wyihan@google.com>
>
> [...snip...]
>

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
