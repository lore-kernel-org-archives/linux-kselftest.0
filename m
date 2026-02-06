Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C378428487
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Feb 2026 18:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770402744; cv=pass; b=DKiYDvWDWqMQgQ9iTfwBrv5k7fiUJfwLxsl2J6+WymVI62FFWB0ND44AjaHkc3ivkOPQ3A9ajnXWaP50D3dvp4sGwweVn1SFz0Qa5BB4Wq9hk9XxddfKaFkt6daqPis6jKBwig9Zb12EKZ/1VZ/OZ1/S3i2dP0Enaqzr8NbQzKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770402744; c=relaxed/simple;
	bh=Vzw7v7bPDRTIVw0dZ1wnY8pgBBayoVrZVHG2W4iXQtQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vc81R25w/sG2Be0qi7Xdbiihk/cSJAoBehJ6PqETXqLqmFsVaRNwdGJOKBMmVcyq3JMHS83Hi2RigyR0Ap2F4CcXXYVzw0DQajJQzBbZiV8K9ega9fJvixd9q95Xm4nLR8a0PEWnqDbPFanPmObauTqyh1n2bC9Khm8l/Sb1nbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f+jU3zqC; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f+jU3zqC"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-65821afe680so457a12.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Feb 2026 10:32:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770402743; cv=none;
        d=google.com; s=arc-20240605;
        b=JzDPgLYepqwo/WPk0+GUbpc9lTHFYHvNemFMA0zhk/DF3z4Iw6FNQiD/p5eRLKEx93
         IERHIBAtwx8v2+OIahpQTyfvvEH6bmLxBWeZD1ibQJvhUP4YBJVJXs4sc8+uoxUxhTAe
         8FFAYgldbM5hw5noslElRmsyq/MRVuEFvXuLDqjyzDY9AsaIN9gEPc1XokbSYUB0dZWm
         Fz0ZIdUMtpesfPHRuhg5ZBe+D4Zvd5XjgDtrRnDnz3WqoNMffdgfRb2B/u2R0v9ZGLCi
         D/vrefet+p3dMzijbPwKk3gAOG7EBo2deq/+1wEs6M6fI+kNwzIh3sBX/5TCpN/JRKIu
         84Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZGsqnAoPnb6U7VcQ9CuxGhV5U/BoNRyL76jStHctGGg=;
        fh=4Ls5bdbI/mASFDUUqUO+wxy4efkubuFuYO94dB7F+3A=;
        b=lN1iQyxe/LKSLmCUoI24+Bs15NjM67n5D71q+SHLMKBlsvUZ/0FqA/NFSgs5eSBhlr
         L//Ivhbau5E2zaJB3BDSyTRkmQpo5YOLMeOrvFV71XkIVScj//vSX0c+zQ2vc6aC345b
         Brkisr/cntnFr5Guiw/xErD4jA96HMrAPi0D/x3mEDW6uL8DMmFFSIewn1jU/HZGx/JB
         5kF5FtSQ+/f5rAEQS2FLC5VvvaeJdfeVTTYqgP81Pp6dABphnxq99omrwxAS+R8XvSDl
         QmZl/0aGBA9my86jUzgC2nOsim5ISc+kWGx4yKXXkGLo8aZPB4nSGvaaVd8NkQhirByH
         txzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770402743; x=1771007543; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZGsqnAoPnb6U7VcQ9CuxGhV5U/BoNRyL76jStHctGGg=;
        b=f+jU3zqCfM70VUhS3DTpo5Gp9caRkDCnkegTz3jd+CJbq9JJWAL5p6AMdi5F2NKHVY
         7iHwfEWzhdOWde1UPlQnohtC7Rb++6QbjpsnLN2+9fhvQQexxMagBmt8ZgoSCNY7aKDg
         pXWRbmM8cuMCK1vtCPgbglsMqB3oIeSbbOwzVn0pJ38HcWQL75MVEFDFSXvsgUC23hrT
         +aXmSTESh4cobnUL2EC9XU3S6oOKwnP+LX7L7P/8+2jnXwKdZfslDJoy974+OBlggwyN
         ZPqQa2boY6O8lP4jyCMP50LuiTSGG3z/JLEq4Hkz5au0+WKanzunuYbac7ng7s2xlTLE
         UZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770402743; x=1771007543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZGsqnAoPnb6U7VcQ9CuxGhV5U/BoNRyL76jStHctGGg=;
        b=MqnrrIz/av8H3VH0kjHUQ8aduzK4HhHYEp6WcvgQMZAp/DtKF52qz+BVJGlTMc2e6v
         58flvYdGQLVe2yeneuvoaok/X0xx8Q2X2XTrHSRtY64a+HtjX2fO6JsnWySQxTQDvfjh
         hODsSk6vYreOVyOYh2gFx864c7Crvv7mWDqjAyqE4BsjlFZYBtyI3UF8aI/7RnWgTjNo
         tFktJTfSZEaVEyZuesYoC4JuVjQSwdDZqspJRp/dCMXqJqTvp3kDK4rHjfxXxP0wAcpc
         ChcB0vuOx0n3KLHnrbaimxnp/KpF7OyXpgsa5Pw35VPD/LfHWjI+UpePLN4SBdbxPX7q
         q4eA==
X-Forwarded-Encrypted: i=1; AJvYcCWKNZTtx+6qwtTsa6NAM2J74r0v5U/HlqQarFB9IS1RbN2k0Ho+7ENWd17PPWokXO+KVUptUI+MnoDlfdnBuFY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv+M2FHhNjW2iy7ZFZ8A2BAnbBGzwvJe77izw2j2xEzUUSB9x3
	uQUIfEB/TS87xDgweuwjC91QqfpHCFv65eHbrHa+Fe6QyxVcidwIHU+XO/jqc9EUS8+Hs8cvvWo
	/CbiBMWRz3SRpSkf+mV7HNW1ZG4YaMBIOBIpAhoHo
X-Gm-Gg: AZuq6aJrhA+2pi4eDJ57GvBh769h5QmVonIp1QnAAnM7xBsphmrgNmoYeEDAdOi7h3Y
	9Od3e/1rh7KneapqW1V/shpzBotEAC4POwkMTY8tvrPD/bSReyznBZhjqnPBQvhS3WQT0pDk2mL
	3vImj247TXXhb+GrugKeHREzRwtDNDtt+mbPx/XAltLTy3sfIye6nWPCJnuwDGdhnJzWM+XoVnx
	puSYoFY0inMo8dH1qMxfbEyPMf6H9Mf4naaLzB0wfuFzId7qHIrskNcMCzj6dmVkOaTWzc=
X-Received: by 2002:a05:6402:20d5:20b0:624:45d0:4b33 with SMTP id
 4fb4d7f45d1cf-659a7833c00mr509a12.7.1770402742687; Fri, 06 Feb 2026 10:32:22
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260205214326.1029278-1-jmattson@google.com> <20260205214326.1029278-3-jmattson@google.com>
 <aYYwwWjMDJQh6uDd@google.com> <fb750b1bb21bd47f85eb133d69b2c059188f4c05@linux.dev>
In-Reply-To: <fb750b1bb21bd47f85eb133d69b2c059188f4c05@linux.dev>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 6 Feb 2026 10:32:08 -0800
X-Gm-Features: AZwV_QgSwjEHCKKLsNVHr66h4_s2X5yMqUGSxhymGkYa-20CddEHZe7K1CxjwBw
Message-ID: <CALMp9eTJAD4Dc88egovSjV-N2YHd8G80ZP-dL5wXFDAC+WR6fA@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] KVM: x86: nSVM: Cache and validate vmcb12 g_pat
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 6, 2026 at 10:23=E2=80=AFAM Yosry Ahmed <yosry.ahmed@linux.dev>=
 wrote:
>
> February 6, 2026 at 10:19 AM, "Sean Christopherson" <seanjc@google.com> w=
rote:
>
>
> >
> > On Thu, Feb 05, 2026, Jim Mattson wrote:
> >
> > >
> > > Cache g_pat from vmcb12 in svm->nested.gpat to avoid TOCTTOU issues, =
and
> > >  add a validity check so that when nested paging is enabled for vmcb1=
2, an
> > >  invalid g_pat causes an immediate VMEXIT with exit code VMEXIT_INVAL=
ID, as
> > >  specified in the APM, volume 2: "Nested Paging and VMRUN/VMEXIT."
> > >
> > >  Fixes: 3d6368ef580a ("KVM: SVM: Add VMRUN handler")
> > >  Signed-off-by: Jim Mattson <jmattson@google.com>
> > >  ---
> > >  arch/x86/kvm/svm/nested.c | 4 +++-
> > >  arch/x86/kvm/svm/svm.h | 3 +++
> > >  2 files changed, 6 insertions(+), 1 deletion(-)
> > >
> > >  diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> > >  index f72dbd10dcad..1d4ff6408b34 100644
> > >  --- a/arch/x86/kvm/svm/nested.c
> > >  +++ b/arch/x86/kvm/svm/nested.c
> > >  @@ -1027,9 +1027,11 @@ int nested_svm_vmrun(struct kvm_vcpu *vcpu)
> > >
> > >  nested_copy_vmcb_control_to_cache(svm, &vmcb12->control);
> > >  nested_copy_vmcb_save_to_cache(svm, &vmcb12->save);
> > >  + svm->nested.gpat =3D vmcb12->save.g_pat;
> > >
> > >  if (!nested_vmcb_check_save(vcpu) ||
> > >  - !nested_vmcb_check_controls(vcpu)) {
> > >  + !nested_vmcb_check_controls(vcpu) ||
> > >  + (nested_npt_enabled(svm) && !kvm_pat_valid(svm->nested.gpat))) {
> > >  vmcb12->control.exit_code =3D SVM_EXIT_ERR;
> > >  vmcb12->control.exit_info_1 =3D 0;
> > >  vmcb12->control.exit_info_2 =3D 0;
> > >  diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> > >  index 986d90f2d4ca..42a4bf83b3aa 100644
> > >  --- a/arch/x86/kvm/svm/svm.h
> > >  +++ b/arch/x86/kvm/svm/svm.h
> > >  @@ -208,6 +208,9 @@ struct svm_nested_state {
> > >  */
> > >  struct vmcb_save_area_cached save;
> > >
> > >  + /* Cached guest PAT from vmcb12.save.g_pat */
> > >  + u64 gpat;
> > >
> > Shouldn't this go in vmcb_save_area_cached?
>
> I believe Jim changed it after this discussion on v2: https://lore.kernel=
.org/kvm/20260115232154.3021475-4-jmattson@google.com/.

Right. The two issues with putting it in vmcb_save_area_cached were:

1. Checking all of vmcb_save_area_cached requires access to the
corresponding control area (or at least the boolean, "NTP enabled.")
2. In the nested state serialization payload, everything else in the
vmcb_save_area_cached comes from L1 (host state to be restored at
emulated #VMEXIT.)

The first issue was a little messy, but not that distasteful. The
second issue was really a mess.
