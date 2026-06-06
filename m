Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002372777FC
	for <linux-kselftest@vger.kernel.org>; Sat,  6 Jun 2026 16:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780761643; cv=pass; b=keihkhxdQrg8o/dHn9B3GRcyuP4wOXGOROeMeVo+Eb0k3aPluS4ddm/ntA/aktDeTFf+mQtwnD5GKer2+Mcmz6Su1MedutHS8yPueNkVPMXJ5KmOfcoisw1FpSGqugHC2FpeCp2knRS22n+7Qnx09zlisVIWh/KNnsytrglSBHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780761643; c=relaxed/simple;
	bh=i4rew88Flxyki9IDpI/92K3Ph4V2Q1lSJDrrGN9sl4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F+vIKRnWxxiMVlnkd9YO1q9RevNXa9VkRcqOxZ7ZkE9yo9gQAxBHkvKxhfyxvabfNhRGPsFPCNK5nWEAxWfMuxP8NhLBZm+LhICz14LoNK7W7oLQXuFqLiWz1kyse+n7jDf0QFwHJYF35xMFJJkCgPI0gmfyrZJYyrIKfflWnlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qtmzFbMc; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qtmzFbMc"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-68ced08613aso19696a12.0
        for <linux-kselftest@vger.kernel.org>; Sat, 06 Jun 2026 09:00:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780761639; cv=none;
        d=google.com; s=arc-20240605;
        b=RpI7dC5hD7vcP5cn8MoBe+cRA75+b3bntQtemjSWBs3yMVk3DrDD4fcdMEFBcp27Dp
         mG4EUbh+OmC3GS7J7ITVTRv5Nuabp3WNvCa6Z4LdhTmOMNDVuuOlJTwKiavpImQJ3I/B
         ue5kCl2aNKbSbcOt590qAEpG68CAo813NwYGuaIRqaKGk5UcTP/R05snpmIoAXKlyp00
         WFZyUfwsIkCS9vWGcopNENhLjEVwJNWcTVWUs1uDdrC1gywAbabByuRIz38oECXn4fXF
         ibuQIdi+H0Ubsx/BKq29RQpQIXr0SRQj9RxQYZW9tRR4Cw+9pefw0/A3TIrPL/W+8iLl
         qU0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=57MeYUfE5UfGozU/Hio7UqMWK4IkSftfIzxvJeTlNdE=;
        fh=7F2+Xs4v4I+PG/0RHQMS8Ny+ueIgy6wP0QCWDk9rl+g=;
        b=FjvF6kkvkWarIcNg2Lo9SRdOwdi268UcjP0/qkrUQHWIgBVlzkie0CHGNJMsC+cLc9
         nCuXMkSjo15oreCZqV00uWDfKjc/yrEKyOR8sbnSi2M8xxZCD29WZNwy0iobM15oxQ6I
         NOhcsopY7eD5+bQeYhUVUrBliZGjzPZIsPHzAwCnWGsHXnqNQXCeJFYXWBcTaRL/O9K6
         O6wha3vndTiJWJsH1AgcZeSIf7YArSLUwNVN+AFKBUxTTr/EzLgwY/fcXEGu5z84ZHVa
         rX9UfuSgWrlqwUoBqNMEhCd+MUrdZncO0tHJybsY/cqzaO75UkkZq6xZ0Wc1OAXw1GG/
         SsYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780761639; x=1781366439; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=57MeYUfE5UfGozU/Hio7UqMWK4IkSftfIzxvJeTlNdE=;
        b=qtmzFbMcf5OQlqYiqmSnF1htmq5vzpPoEgjr24mt4U+OLIDxUfcZEhVpd3EAD42bVF
         r6IG9gxEvBLklC7TGpZR6aU4NBZhQ1soZ9qFh5AGplnNjLDFrblsq54Z/J3pxU/VlyEl
         Ut82gkV5bcvViQfrSHzVbpmFfoTl5gOlhlg40U4UNek0eeI7IoUza85oFrkKwFn3OHCt
         ZDvTgaix2zc2V6VhysyegIENaYrFH3jHClszFsE9afOxtudQYxfEM7s4GRshiMhXZG4u
         sqMgKjBPCKKlHGD8zFujh/jldoR7eciG+uO7FL7if9LTHoaSSsGC6Q0ovkDZVNLDPs+I
         VH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780761639; x=1781366439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=57MeYUfE5UfGozU/Hio7UqMWK4IkSftfIzxvJeTlNdE=;
        b=mVsMr15y2u6fMC6q21o6bRE1gOn96QLGrKSHtctF6e17FxsW4yebLjyHeBjsYw4X4i
         3RpNsGLouiRLm7oo0QwrQKvhVGlmQ8Wl8NRE5x2GLa8uP+M8Q6tQmFPHqF7meZrGqC00
         HpZWMoQOoblJrb2oPyup3+++y9CjolfZfGnn6PZCekPefRkMR6K8v9FrSnZV22WCY2uj
         SHVGhHf04/epUeYA1zq7+gJ1xJjqLGVCk8sxpPyUl8TbLQofH9Z5Zf6bdQRGfuyIX7C1
         TQjPD3KCBhhDhQMmkZSnPo7m7jcCCztDVHJ4MnBghOMVBjiX76Hu0dBvGpmqF0W8kv9P
         vvfw==
X-Forwarded-Encrypted: i=1; AFNElJ/G+qufnwcdQlvm8/v2FHuxmBsMiAOdMWlw7XrwrXy3rysg6dLqDmOd9MGklLBE/hz9h8ovGKQfS3dE4I6D5og=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOH2MsC1R5xw4HhsPJNy2rAD3TeCan+cK00YN7EiRvRvBcqQ0w
	IIdp012w0kWd8qGAyRDo6qIRaqbUB1ivBVBmFNfDky3pZJzn+oA+PVusQZtacJrBkZuIP5VZYLf
	FvpYP6gZy0yzSydlUB4KBkvlpca1XbVlfmdfaLviA2prSacDJ5buHIJziCBc=
X-Gm-Gg: Acq92OEpuKytRnOmNwznEuM0aNbFphSepW8QjaAAOf3/3CVXCDbAVOxbS1EzM3wNjVQ
	/OrlQlPUtLrLX1KnFBpf4Kxg6QeX4Ufx2aPwWgsYQCFE3mpo7yryzxG23lf8m0GJ/5omUOBAkC/
	rPlnDmvSlFcx2lc/NLt3RTGiudzoEYNzIw00x36hBZ0GocwziPdH2fe7kxsHQOfCX+jbVoc+8kf
	mA9S63o0MA7FOzfTkjixpUA/eM48pLo8VbGtScIl+IZAG33O9Zrlwo7oDyQEqwUvryJguhjaBwI
	dXt489s6c78xTJh+nQ==
X-Received: by 2002:a05:6402:a382:b0:67b:7d05:60b8 with SMTP id
 4fb4d7f45d1cf-68fe9275289mr115181a12.10.1780761638922; Sat, 06 Jun 2026
 09:00:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527174347.2356165-1-jmattson@google.com> <178009472318.880870.7878635650921105255.b4-ty@google.com>
 <CALMp9eQ-8h2F4HO8S666mJF3QzyH=0b30kC=n_9p7SMbBhxCMA@mail.gmail.com>
In-Reply-To: <CALMp9eQ-8h2F4HO8S666mJF3QzyH=0b30kC=n_9p7SMbBhxCMA@mail.gmail.com>
From: Jim Mattson <jmattson@google.com>
Date: Sat, 6 Jun 2026 09:00:25 -0700
X-Gm-Features: AVVi8CesUChtR-NwwSdAcU77cBFMJbKq7QwRjpAY4cHdu5oVJkkbFJqIsISYYVc
Message-ID: <CALMp9eRHC-N7x2ZK3_dk0xg5WaokQFeGuL5qoAQGqpG60bJY4g@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] KVM: x86: Virtualize AMD's "disable CPUID in usermode"
To: Sean Christopherson <seanjc@google.com>
Cc: pbonzini@redhat.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, shuah@kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, ctpence@google.com, David.Kaplan@amd.com, 
	binbin.wu@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 6, 2026 at 8:12=E2=80=AFAM Jim Mattson <jmattson@google.com> wr=
ote:
>
> On Fri, May 29, 2026 at 3:47=E2=80=AFPM Sean Christopherson <seanjc@googl=
e.com> wrote:
> >
> > On Wed, 27 May 2026 10:43:42 -0700, Jim Mattson wrote:
> > > AMD's "disable CPUID in usermode" feature is analogous to Intel's "CP=
UID
> > > faulting" feature, but it is advertised and activated differently.  T=
he AMD
> > > feature is advertised via CPUID.80000021H:EAX.CpuidUserDis[bit 17] an=
d
> > > activated by setting HWCR.CpuidUserDis[bit 35].
> > >
> > > Add virtualization support for the AMD feature.
> > >
> > > [...]
> >
> > Applied to kvm-x86 misc, thanks!
>
> Oops! You haven't sent a pull request for this series yet, have you?
>
> Our internal Sashiko asks:
>
> > In kvm_set_msr_common(), the MSR_PLATFORM_INFO handler uses cpuid_fault=
_enabled() to prevent the host from clearing MSR_PLATFORM_INFO_CPUID_FAULT =
while CPUID faulting is enabled:
> >
> >    case MSR_PLATFORM_INFO:
> >         if (!msr_info->host_initiated ||
> >             (!(data & MSR_PLATFORM_INFO_CPUID_FAULT) &&
> >              cpuid_fault_enabled(vcpu)))
> >             return 1;
> >
> > If a VMM restores MSR_K7_HWCR before MSR_PLATFORM_INFO during live migr=
ation, and the guest had enabled AMD CPUID faulting, won't the write to MSR=
_PLATFORM_INFO fail if it doesn't have MSR_PLATFORM_INFO_CPUID_FAULT set?
>
> Sadly, I think it's right. Even on AMD systems, MSR_PLATFORM_INFO is
> enumerated by KVM_GET_MSR_INDEX_LIST. It does come before MSR_K7_HWCR
> in that list, but userspace is free to restore the virtual MSRs in any
> order. For any sane AMD-hosted vCPU, MSR_PLATFORM_INFO will be zero.

Never mind. This Sashiko observation was on a backport to a branch
that doesn't have commit 1ded7a57b805 ("KVM: x86: Remove ordering
check b/w MSR_PLATFORM_INFO and MISC_FEATURES_ENABLES"). Everything is
fine at tip.
