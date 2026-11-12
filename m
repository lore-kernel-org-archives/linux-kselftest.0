Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794442402;
	b=n9q3MTpwSeNOAkL6ugFF8EimoiDO9/jYhJG0VXI/FnITIYa1teXag5TvMZaA0DgfUkmd
	 vJsVXLH0hmGWcrH8TjWWeSdpvfZqvJIsELa5tTOxF8kPFdhIG+EScaUBIYe6xHMO5Q8Y/
	 RtQmPuOKSfML0YdUJn5bsYVRI/t+/CrVF+grsoSl139leAVmn7/5hxtbNtXILDx2aHOue
	 g1wiB4at6SWJJFwYJxxlI0KUiHmVrfkHZRp0V8HA8biiw62ZHuLNAAcMyCme486c94U0v
	 hM0NSLlbqzabNOHTb7KOXdI8Mt6heNqHGWwzRup41F1yqbNEFmOtXg7ENKaKEGodZHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=x6GQlR97tIMyvsNz+qk5iDCNekyRuVayoebvkV1BUAA=;
	b=RBS13RK6Oxw9H8ZZmCvK3FxjXf7JzgQqatu+u7X1c5VhkAsi83u9WEH7n0xVXFBhViTk
	 OX0t4JSazdq6BLjd/CNxfn+uxoNAkJX4FwHlCNuZLCWPl8WGXOUVHoDjwCcwIjJU8qpHt
	 gKNHpdNTNKRxpbUwCA34YfUwSAuYQkcRh2l4oHSASZBrmFBc4Rc8RjbHECR1Br91hCsUl
	 01mWRM1mKUve3yZWBRjjrhM9BYzaxDgJJPJC2O6wSqUiWiPX//tGV6VWmlqxcgVtqlU93
	 M0D+XgoEmFLWlHXL7Sj9ytJiua4G5cZvN8S/++oMCh8fBsBcqWJFSkrw1dH82kArCsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="iH/wd37L";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C02606A324
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 00:13:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7C02606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iH/wd37L
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b571a45a2aso2595a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 16:13:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794442400; cv=none;
        d=google.com; s=arc-20260327;
        b=ZPtuT0SdDt4nh0q7gBqueF5xErEn7V2uUBeH91I3g1UywOazICYo1QBMVBwo9yWLaq
         N16FVyFsBgS+Zrb2Y5QM4d5pUcZ9GyJAONrNpGkPZA6/VUH9FGqzG6Ih44e2xR9iUj94
         P4BpTimhBzOzx6giTDL8AFzWdTr6TCBYjfCQLIma+AzrGCQ5uCc89IAgaYkXA73bLPky
         44Ezf6EESuUz2SiPglMztUMZ5QQSlBpl1Mg3u8tkA/eoXJ5h0Nh3HESBFRnQIi02I+EQ
         ORzB/azmha0cYA2xp4RZRkTbl0VA6NgwZqptkAaIepeOHLJtVerwop5qUyvDDAuImued
         SpnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x6GQlR97tIMyvsNz+qk5iDCNekyRuVayoebvkV1BUAA=;
        fh=19MsLWOAS43yT9e29eJugjiRnjSenaIEe+YvRF77kKE=;
        b=OUEyd84q2YkPK5fJTu3Kxkg6Y7B62LtsOhGIy+4Co3AP3soNAR3vt+M0RXx2EhDXkp
         1sFJEcrg6hhwAjXDCBdBlwgG8ZGLwbIlInNf9iSfrmsgwpGovqWeQWzplYmm34h6DFA0
         SpfwkwUn2Wagxc1tex4GpQii5weWJtBy7bIpkJbw342XF4HkicRK9g/2L+7e/QgQlpKf
         Ojce5ehGH/5j7RrJRD8IgEDmxIezmijwxsVdh8jRB8V3ZP4vSmiGygwqOcOOm9sKgWBf
         4pOPgYNFKcsRk8UF8c8pwoGHffOww5l8fEn1+oFrmkPfYgiblnmAlpf20sjgYdGN3tpa
         sZ9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794442400; x=1795047200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x6GQlR97tIMyvsNz+qk5iDCNekyRuVayoebvkV1BUAA=;
        b=iH/wd37LOg2hD3TTD1m4q0qaLfhoXoQUtQjEilEqBxnKJxbifvZHG67+MeME0M8WGu
         Ux8INvsQJMiPw/PdFkvNsGCSdtaFu6NBxDAsk1VA6RyZR1qKKE4Ckl/UH6Rig7phjNE9
         WklDOtODfrt37ymWxn1AQUGJUokgTSG1AgdjMwN1gkaesF4YiZ1DgZnnrUJr+yqaPWAT
         UUtWdqd0zZJpy8uuQOIaki113+rawIwWPmfRJmt0rGg8wPGEBlnazc8MLfvWbf9d4Z3L
         zt0wT6rl8FNYicdd1gO8Al8EClUL06yC17IuiUHAhAeEQ1K6vFZhcjqE0SueEd0Jut4F
         XEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794442400; x=1795047200;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x6GQlR97tIMyvsNz+qk5iDCNekyRuVayoebvkV1BUAA=;
        b=amkm53YSXXpmxmSV4zL5q+gKWTR02+cVAlASe0sr2j1Pc87aQ0H6OAL8C7YKeoAAbT
         ypDjeLTyzleb1rQZGLdnfdfzhpTmUIBpyMzTvGgsGe443KNc5L2GzuiXF/Nm37HSMGDI
         LTgBfEyakUgwa0LETKYUTtOg3nyFz1Ln4Po9hYeTGykw0/Y6UnrKEwD2BU6IB8dDFEOt
         ZPe8rhvvd9B136lMaNXwf2IT+fW0Qsr5kOVHxE6ZaGSMO7HAyXN/wTGgUuwHC+zYQ9k7
         OG05Ze/fokGPmzfhsR5Lrto1RjtF/mcrCe0mivAObi9NmPXRhEr86R4NstnjQhFoCmot
         UBvw==
X-Forwarded-Encrypted: i=1; AL+hErH0IteM5gwXrFfVy3xQm2ayMt/JOwnHfeNIQUIpe9OM3Q3lnoKKZyQoZ0iFf2dFzCpOcfkEH/GhL73a1w9HLts=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3IOtZA3L8FdmNAVURBazS8zU/RcDUOf7HUYJxuIuTAf//kwQz
	bN1bQ0sxMTE+CQdvcSETwU+g4Bg7X4ZBhlYO95v6wTqFhxBtdWetr5IudcirGY7tHwlTiLY0eBD
	Aip8nXgtVm3Fw0isXcLcR34GVYzKHxodHrXzIb6rY
X-Gm-Gg: AYBFou3PV9hTPbSk7TtEDK9kbjBq+72Efh+jXFO9E1jWOkb5Bo2ZGN0T6M46/4/9Ez5
	GudOQRywyMmooqxyzMAaVoBdDM5XzfQxHwf3RonAyIyUHowU8VqgZyYfbg7ZfH0ppR2x2XuUXHt
	wDLWhku1cquY777u9x63kjWCxRyrQxJZDG+BjPY2vnBrY7+1l18wpuosw1CXaHWCJX+Xf/zoBkj
	EMeDnIwecqohzCPyeEC/xPjYOWo3Du1FqrjSzPWsm61WOM8e/Oa7SQYEbAQFSt9ekbJ2zitA2tQ
	NHBWJtTcNtSISaWk4/3vec+ImKKBT+r2t5pckwgFOd7c2nfNMEgmyeFc1YA+G5RFI62E9yyFqCG
	wFJ7RkJp72L1IIccPDcMRdAmONTnTHaD0L3l+rjovDzT3TG52M2tGgC4Ia0Ec7fWz4jB0KemK
X-Received: by 2002:aa7:d1d7:0:b0:6b5:77a4:e7c9 with SMTP id
 4fb4d7f45d1cf-6b79f51181fmr33260a12.2.1794442399569; Wed, 11 Nov 2026
 16:13:19 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794374897.git.zack.rusin@broadcom.com> <e08e3b6d0a8dcd25f1ee3e97a64acc1cbd3c0f1d.1794374897.git.zack.rusin@broadcom.com>
In-Reply-To: <e08e3b6d0a8dcd25f1ee3e97a64acc1cbd3c0f1d.1794374897.git.zack.rusin@broadcom.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 11 Nov 2026 16:13:07 -0800
X-Gm-Features: AclHuK8odVhxcsphtnxehMA2gTchgOO8TDhX7Llo8FUPPxJ2xf2wIKtREyW4NxM
Message-ID: <CALMp9eQ5CAZ5GASL80qQBB-86nKskdiadFinbw+6g0=9ycYXGw@mail.gmail.com>
Subject: Re: [PATCH v3 01/12] KVM: x86/pmu: Honor enable_vmware_backdoor for
 VMware pseudo-PMCs
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	Doug Covelli <doug.covelli@broadcom.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>, Xin Li <xin@zytor.com>, 
	Francesco Lavra <flavra@baylibre.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	Liran Alon <liran.alon@oracle.com>, Arbel Moshe <arbel.moshe@oracle.com>, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 10:08=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.co=
m> wrote:
>
> Check enable_vmware_backdoor before kvm_pmu_rdpmc() hands an RDPMC of a
> VMware pseudo-PMC to the VMware emulation.
>
> The pseudo-PMCs are part of the VMware backdoor, but only the
> emulator's check for RDPMC at CPL3 with CR4.PCE clear honors
> enable_vmware_backdoor.  An RDPMC that KVM intercepts at CPL0, or at
> CPL3 with CR4.PCE set, returns the host TSC or time to any guest, even
> with the backdoor disabled.  Inject #GP instead, as for any other
> invalid PMC index.
>
> Fixes: 2d7921c499af ("KVM: x86: Add support for VMware backdoor Pseudo-PM=
Cs")
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
 Reviewed-by: Jim Mattson <jmattson@google.com>
