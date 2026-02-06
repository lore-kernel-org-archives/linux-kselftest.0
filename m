Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897B2428849
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Feb 2026 19:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770405292; cv=none; b=Wu9bJPY/XWjIdxcBi8BW+34V+rcSQYDzqJ0n8o+CTEY2R1ghIoAFhXf5XcyJc1yEIQmaWXfuibjykhEsSvXLMkS0TIBkW2Ia660kvVCBN5F4WxEd9xOYTApSt1++WUvbcuS3bv46K4WRrXsNv/o/M9Q4EypGDFaBm72OqSzcDJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770405292; c=relaxed/simple;
	bh=XDqbaL/+ZwoNANIBsWT9QQUJxMyPsyI1W2EXJqKiKlQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MtqWRf225dU5xTHNpn5I+xs1uL74LGz3XRzBBiXBwrG6GAbNKga/LcLSxoyW8X51SLkH6ocdCK3p7zMUh27JfK9mEhgUWS2qHJe14dDNvUmJpc222fxNpYsb458TM2/NOsQcRQpJk9D0GS1KVbEHrGIiJIPKJlYXet5sW2I5hM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tMkCePIV; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tMkCePIV"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3545cc84ab1so4945386a91.0
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Feb 2026 11:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770405292; x=1771010092; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tSxSO9gGa5ljx02Wj2q4xRxhtqlPATJqyadJe+h3DJk=;
        b=tMkCePIVQUQTj38p5+kZI4K/uAvpp54JOVT0lZVG04A4QZ8lHnoTSnQrZPq/cqunQf
         mxgOGbrypPCM6k2Fgandd2vwBDuO0PetkIwdjVhCRuh/oRpWaDPD4cVjvmWtyxoki0aN
         kcblFRRqy7FwByT8rFFHIGYjRtCME3A9fBxETFnu5938st2RNiM52GASFrD87c9ES/k4
         09TsqsyeJQBtbWrgRq+0H/kPOhwsQnNBXcwyY5hclHj5PxruRVLkYVzBCLhkX8pDIKiU
         MGbatxNkz2YSLj1Ui4okgYBHnVQqdtl23VI8CcyFwEC5XbgrT4+OosbNiy+dxuirwHgl
         M6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770405292; x=1771010092;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tSxSO9gGa5ljx02Wj2q4xRxhtqlPATJqyadJe+h3DJk=;
        b=BNF58/5OTn/iOqZGjdumRBDjr50bvWgnqiPitSIIaUL11xj6J0dRSxCLOG+JVoVyyM
         hl2dLf/w/pdgM9s8PazRf3Z1yrADApnzF9PEP/NkwQ0mCnpAvnQWzMFr1Wv0SuVPIDOc
         Y83Hq2SxAV0mSE7SO/CrikNymDior+YjQ0TtZRwp9WU/46OwRaQVSEP20ZUkdh+QVjup
         IzGxsbawirzB4Ad/Pt805IkyMMyJvFdzq6VEL0hxMj0pxkb/zkiuQ4ox92XO+hKNNiv9
         jnF7sX4zM6uD7/s+QTTdz6e+vWc6ciOr5xUyB07kFRy5/av5RzrLwdVUHwIhic08ybmM
         LjDg==
X-Forwarded-Encrypted: i=1; AJvYcCXgt7OmETq56yxVqGifKHfWIGmhyvBIQ6QHRXKGlFqqO9mGO3/77juGpUB6rT1JXXTdwQRF2Y16yUWmdeCDzdI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+AlqdPiPMxUBE4GGal1tkYwzaeCpThPh5wsz1xxVbyFx5rpOs
	9igDGNDzI4o0DCCWErYO2qkAMSZxkjmaf06av51djcJUnmGTrNRTpPOqIfibQleIszkKiLke4Cw
	rtwj5mw==
X-Received: from pjbkx12.prod.google.com ([2002:a17:90b:228c:b0:34e:b8c4:7cb5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5281:b0:354:9b26:cdf7
 with SMTP id 98e67ed59e1d1-354b3bce641mr2873691a91.14.1770405291868; Fri, 06
 Feb 2026 11:14:51 -0800 (PST)
Date: Fri, 6 Feb 2026 11:14:50 -0800
In-Reply-To: <0468715595718af34a8a3551663cffa79dd3ce2e@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260205214326.1029278-1-jmattson@google.com> <20260205214326.1029278-4-jmattson@google.com>
 <aYYxh8EiLrBTiq0L@google.com> <0468715595718af34a8a3551663cffa79dd3ce2e@linux.dev>
Message-ID: <aYY9qhsOMv_M9Ray@google.com>
Subject: Re: [PATCH v3 3/8] KVM: x86: nSVM: Set vmcb02.g_pat correctly for
 nested NPT
From: Sean Christopherson <seanjc@google.com>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Jim Mattson <jmattson@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Feb 06, 2026, Yosry Ahmed wrote:
> February 6, 2026 at 10:23 AM, "Sean Christopherson" <seanjc@google.com> wrote:
> > >  if (svm->nested.vmcb12_gpa != svm->nested.last_vmcb12_gpa) {
> > >  new_vmcb12 = true;
> > >  @@ -656,6 +653,19 @@ static void nested_vmcb02_prepare_save(struct vcpu_svm *svm, struct vmcb *vmcb12
> > >  svm->nested.force_msr_bitmap_recalc = true;
> > >  }
> > >  
> > >  + if (npt_enabled) {
> > >  + if (nested_npt_enabled(svm)) {
> > >  + if (unlikely(new_vmcb12 ||
> > >  + vmcb_is_dirty(vmcb12, VMCB_NPT))) {
> > >  + vmcb02->save.g_pat = svm->nested.gpat;
> > >  + vmcb_mark_dirty(vmcb02, VMCB_NPT);
> > >  + }
> > >  + } else {
> > >  + vmcb02->save.g_pat = vcpu->arch.pat;
> > >  + vmcb_mark_dirty(vmcb02, VMCB_NPT);
> > >  + }
> > >  + }
> > > 
> > To reduce indentation, how about this? There's a consistency check for
> > nested_npt_enabled() vs. npt_enabled, so it's guaranteed to do the right thing.
> 
> You mean the one that goes away after this patch: https://lore.kernel.org/kvm/20260115011312.3675857-16-yosry.ahmed@linux.dev/?

Heh, still fine.  All that matters is that nested_npt_enabled() can't be %true
if npt_enabled is %false.
