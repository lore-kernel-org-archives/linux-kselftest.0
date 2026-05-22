Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD5138D6A9
	for <linux-kselftest@vger.kernel.org>; Fri, 22 May 2026 21:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779486442; cv=none; b=UPX/QbCT7UBBhl00mGxecVYssqq2LNmlfrEpyzqJqIYMmUrYMUJ6wteIh+UdtVippPQ4zFVX1YrbEEe2Ml8EGrG56zhTW/1kRQcPVq/76ib0oXcb+jXzI7J1f7Hr4fMpQ4zm5ZmoyuvQ3rHc9ah9xg+LJsfOdMQEWeM+tP2ICNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779486442; c=relaxed/simple;
	bh=CoghQin1KhXux0hst27Dy6jPuyHPo3tWKEEVC3sFXWk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nZAHfuC5rwNsZuLFsfFQXLTkqQ3fKuqWndTMcmkucxtTmaJmpo/1P54uLRdZNlhxm35lN85BcivJVsjdqJHotLw4XgmTNyRXEuyn3B3dPOVtvhnn6g87Mmg1r+L1F4HQyxqNkgYuAXkcGXtdw5gWMDAEejPaWHZhfuUfOroEoVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e/aAXRgY; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e/aAXRgY"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-36603ad6709so6462342a91.2
        for <linux-kselftest@vger.kernel.org>; Fri, 22 May 2026 14:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779486440; x=1780091240; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=W3aVsVjXQJZTTHakYlHvO90VBaY9HPHtidD9aUCTMEA=;
        b=e/aAXRgYPaKlPsD64HYfouTr0vGdw1aCFb/CLvE9sYdInVlULC37D0inMrTJ6LxdbH
         T5MvwEbTcaseCiTNSOjLyVzYEu+NXp1v7RSjL1YDIRQuVeaGV3irMYWXOiia3LxJNkOh
         7M1AKlxKsSuxMmyCaoiMslVA866NSj5+r5AP6zVJidDcnyYrx4pjcem8AF71mv46lbun
         9Uit0ahfiechNWu9/pLk24QygtTq87YuTrs0K5pB32X5+Byx9AzeabVvMWApMAdXOSkp
         1uMCUM4gBvBNqzAB4H1xUL6f3/9SARB19ic0+kAQqaf01ezRy2QTai8DNsnlKg7AZ2Yr
         4mkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779486440; x=1780091240;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W3aVsVjXQJZTTHakYlHvO90VBaY9HPHtidD9aUCTMEA=;
        b=mVjX3EnuA1ez17V3iiV35IZD5MqHPh15B6YH0CKIIKnI2Ibw4NcscuTBQrwrcXMunH
         8PDXJq+89f4sytS59DxRavCq9v5unkM03ggIdyx/veFtfDcl6b2d6gq2/CIrIxAj7/uu
         i/FzDTuISHi1SY3OF6mSopG1eUSxbfwMuS/nf3debLFYmHJEPOTgb652nCMZ2vwutc2X
         wgmoFuFDRUmwWYxlAkIVkG8E+gKUEgBayj1xau7+cxav+uwMR3sKIqX/JFxCcvn71uhL
         6FGGxBEarve4sax3z+33Re11lwUscB8/5cmMubJfEjfe9JktbGC5zyRAKv8o3qXoP06V
         ldYw==
X-Forwarded-Encrypted: i=1; AFNElJ8T3U2sdoHX4FPsQfCxN8EXoGXbgZKavh9iytc5IWH5wmLXM5GV2Fyf8PY18luiDoIc1xv6BtPof3IjdICt3xo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxA4XQdYJjsb4rtKarl2TOXZODvT6UIOo3Aqk6QFpbvpRsnJO2O
	L3H7+DNqWhzVf9xBAda5rm3U7D/OvLsnwjDPR2i1AKmX6apEp/YN8iza6JDkFSRVuBDh8kzSVri
	OYGfVLg==
X-Received: from pgkb12.prod.google.com ([2002:a63:eb4c:0:b0:c82:743c:ea8f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3887:b0:369:a359:b181
 with SMTP id 98e67ed59e1d1-36a6787b0dcmr5234805a91.23.1779486440140; Fri, 22
 May 2026 14:47:20 -0700 (PDT)
Date: Fri, 22 May 2026 14:47:19 -0700
In-Reply-To: <99356a588677e9ff31c1747db1705d9250a2728d.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260509224824.3264567-1-dwmw2@infradead.org> <20260509224824.3264567-28-dwmw2@infradead.org>
 <3ad6cd109480772ade3c11f23b9c1d7a9855d67e.camel@infradead.org>
 <ag-Hf2liLSX9q0rS@google.com> <ab84153e33fbe7c25667f595c56b310d4d5a93ef.camel@infradead.org>
 <ahBQ7mXNaTtouT3C@google.com> <c4b498c401287477402ddd60a0120b0c5a9bf8d3.camel@infradead.org>
 <ahCQluJj59uWlDAF@google.com> <99356a588677e9ff31c1747db1705d9250a2728d.camel@infradead.org>
Message-ID: <ahDO58dKuPt-lj_J@google.com>
Subject: Re: [PATCH v4 27/30] KVM: x86: Add KVM_VCPU_TSC_EFFECTIVE_FREQ attribute
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Paul Durrant <paul@xen.org>, 
	Jonathan Cameron <jic23@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, Jack Allister <jalliste@amazon.com>, 
	Dongli Zhang <dongli.zhang@oracle.com>, joe.jin@oracle.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, May 22, 2026, David Woodhouse wrote:
> On Fri, 2026-05-22 at 10:21 -0700, Sean Christopherson wrote:
> > 
> > I'll send a standalone patch, along with a selftest tweak to verify the fix.
> > It's technically a fix and won't generate any conflicts, no reason to delay it.
> 
> Are you suggesting the other 30 should be delayed? :P

LOL, just acknowledging that it'll take me a minute to page all of that code in.
