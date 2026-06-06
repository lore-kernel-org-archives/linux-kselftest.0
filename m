Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E96223707
	for <linux-kselftest@vger.kernel.org>; Sat,  6 Jun 2026 15:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780758762; cv=pass; b=aRZjyLMs3T+/YU+C+aSXAhuLCcHO91PRDDcOjF0osXVJZJEPPLN6eyruXKv7ES3X9svcpXLirg0Wb9BZEgUyKM5kdlA18HDr7+FlsLj3CLzTCO5Jb544GwrHADr/4mAlpB97eFAVFJwsYLQsURrFFf2a8ayJt7tbfacSx1orNLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780758762; c=relaxed/simple;
	bh=In996MaRK1b1yryCiDiuIu5JXDlTrgSFPed3GJ9VBus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X66bjORadMU+G1JyQGS6VMjdqJuCW+f/4jrw0lYutQ70zUKz/RZy89isXOj0Gms64nNX/Suqga0D3m0CBPIV+PwpgaPRQifOVeFfUbCoh9TS8T/fEOckgIZBUbQAGv5pST+W6OddwuAplGDFGjGZuNgOys+eav6NJBS3tZD9RB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OhcrVXVO; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OhcrVXVO"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-68d22476e88so19454a12.0
        for <linux-kselftest@vger.kernel.org>; Sat, 06 Jun 2026 08:12:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780758759; cv=none;
        d=google.com; s=arc-20240605;
        b=GJywPklodnwd6j2ACVB2WyredcKRdyY45uDNmYcY/9+q93J8iqbi0S9QiWB6pL0Rdb
         +zocxAD9dpxytY3lFLBmE27XOvRfkVV5/6BdmcPjfYD/xWyhYnd5/QwuWMS39e66A7Cr
         yIBDDikgNnfV5dK9B/p5BsH0A37cpS3yS/5rDXZPUzYvtPt13VU+C8i6ymdZ+74ISIGe
         BJFpdDCqQ7iZ0pSKKNjEnp4LZLBCgp8X2v7muHiJCBx0Qvn+Dk5/ncWkjbDvAwdxtg0f
         JFAUhcpuJEpqhAdeDmimRYY9Gqg9clCQjhKwIq3AjDWg0F8jsOAsLG+CFI9USBOjpEWe
         6atw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yaXDAm37FQ0K2c4b/udh9SWP+t2z0xMe7ch2lO/r3W4=;
        fh=Q9KUlTsKQ0aX8/QsUhqaEkeQgAlk2BXQg8eBsUdR7ao=;
        b=K+ws6oLOkYbiSpfjUt1HUPB84aN6r+WCb7Hih7Em0A+8H43PF+wkAvLmMv8B976Bw/
         BdybLJzza8AkZ3d3n2c+QvWOwFBLPM3foH0E29lcsmqdEef+ZJ2bIpYitrh77R9JKYT4
         OCXrIu3dKbXXWDHUcBr2D4qjHojEeeb/SA0jv0/VIK0zIYevQa5ahDe1toJUAU/CAhW5
         x7ZEdHZghc7R3mHHhxyf/JoV7owF/5cwvSoNL4PvZ/cko3Pvz0fop41RTQ5zjNxLbOxL
         +APlJDk0W5lBMxMUi+Bj0KA5UHcdv7g45Bj/CugzhjNiuo8f1AwHgN2rmvgzBG4fNT6N
         r7lQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780758759; x=1781363559; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yaXDAm37FQ0K2c4b/udh9SWP+t2z0xMe7ch2lO/r3W4=;
        b=OhcrVXVOl4qt2NANBJfhglGH8mS4/L4fjXNODD/2p32cAultMvdJceT7adS9ERy46N
         9xhczzDCLrA+2WMorhvuP4pybQLk74LZFcFvIxYqipfywO89BvgpW26Gnf7xlYqCGR3O
         bDSIO2gqhZnBeMFsOAZSRNuKHYvkIFKJYrIFWeVLSd84GdfENf2jxLGZqJefdQ4eh0Fm
         oJ66RruaN9ALTufcpS2H3svjJypVYFXZGkL1a4HuirEFTbAUU4HceTHJprjg7nBgNNV8
         rRPGtDYRVdYw8DobDzvzYlBOLwEqQLyOK5JqJGPd7GU/YsJ8d0YA+UBa8pRtovEnE7zq
         hLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780758759; x=1781363559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yaXDAm37FQ0K2c4b/udh9SWP+t2z0xMe7ch2lO/r3W4=;
        b=A8XAvnXdn2dduoK7Ni5Y/bmDll/tklTw8H3AJlizYCd1hgVakcfg7IbAAdph4djzlw
         uHz4KEXj4Dbtq6cO+pynlYBcrYTAqlidNZNzcBy0NGd2qsZlycV9KGgZ0pmUk5odWajd
         83Hs2T+SzAGHxmva5OAoqfOJNsnEqE2o1AqQX1n5fPVzHwRay0Gpf5JY7rMNOwtUbvG7
         VycEk1uRwEDOyIIT4VcqmotfRswnOC7JtjWOvVdAncFRH4onatWEarZe4XQqQac/eFy3
         eLHjSID3ZZWptfgsdRw0rWtWReq/Ma4CkD9ZxVuIeBwta9Bxbn+nLsigOlVpWV9KAGoU
         akxg==
X-Forwarded-Encrypted: i=1; AFNElJ/IEaoVEOEarKyogj5cy27Ug/U4hsSGApzGO6JN3QT1RusUgueiRotFKNYPIU+wr7SkIF66XeA/LDU/35Wicw4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEb66X6uonK/xaLVxwspNVQ5IMpnnbV0CutbsmxN8mPINEg5c9
	vDnYBMVLG42qtF+HTrWLWN51iljIDOD7KkQYcjOk7p6Zv7Nlj9wFTq9wT6HBI67gciizvZGjLU6
	NHeEmhJg6HJOeGgoMCFJwjnjI8Ep4o9z7zStI7p9N
X-Gm-Gg: Acq92OEWVMSmrNE9Rv+qbk0leXBNSXXkvG+fgAeQmKVKEm570W3YkNp994WceICOUt9
	BXjtKezJMTDFC0CtvhWsT0EfC3W4zAv/xXf+JDFGlfnTu7Qi4ONDHSDPn28/Q1TD1txtpEtxLbZ
	Vf+5Q5eOdeHs7leEMDOUdHgZiPE4Yq6luPzhIxS6WsY8RPC3LujCx9T4ZeFlIvsMLZpbbyuwhKI
	xGCU3SeBxcJYSEClbYqMXRXCmaoIlMY2JMKagococarrUItDHpQ/rW0oXzhNZMBy67UzthbX7+t
	xPIprLCBRaphlGfOfErEqYLGTxqT
X-Received: by 2002:a05:6402:4249:10b0:678:93b4:1fd3 with SMTP id
 4fb4d7f45d1cf-68fe8c55bc9mr79664a12.6.1780758758706; Sat, 06 Jun 2026
 08:12:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527174347.2356165-1-jmattson@google.com> <178009472318.880870.7878635650921105255.b4-ty@google.com>
In-Reply-To: <178009472318.880870.7878635650921105255.b4-ty@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Sat, 6 Jun 2026 08:12:26 -0700
X-Gm-Features: AVVi8Ccv1u_7HnXyuP6YGCfDy3Eax8Y6OgqoRW_J3t3Bw-oamTD9jbnsNtAMOy8
Message-ID: <CALMp9eQ-8h2F4HO8S666mJF3QzyH=0b30kC=n_9p7SMbBhxCMA@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] KVM: x86: Virtualize AMD's "disable CPUID in usermode"
To: Sean Christopherson <seanjc@google.com>
Cc: pbonzini@redhat.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, shuah@kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, ctpence@google.com, David.Kaplan@amd.com, 
	binbin.wu@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 3:47=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Wed, 27 May 2026 10:43:42 -0700, Jim Mattson wrote:
> > AMD's "disable CPUID in usermode" feature is analogous to Intel's "CPUI=
D
> > faulting" feature, but it is advertised and activated differently.  The=
 AMD
> > feature is advertised via CPUID.80000021H:EAX.CpuidUserDis[bit 17] and
> > activated by setting HWCR.CpuidUserDis[bit 35].
> >
> > Add virtualization support for the AMD feature.
> >
> > [...]
>
> Applied to kvm-x86 misc, thanks!

Oops! You haven't sent a pull request for this series yet, have you?

Our internal Sashiko asks:

> In kvm_set_msr_common(), the MSR_PLATFORM_INFO handler uses cpuid_fault_e=
nabled() to prevent the host from clearing MSR_PLATFORM_INFO_CPUID_FAULT wh=
ile CPUID faulting is enabled:
>
>    case MSR_PLATFORM_INFO:
>         if (!msr_info->host_initiated ||
>             (!(data & MSR_PLATFORM_INFO_CPUID_FAULT) &&
>              cpuid_fault_enabled(vcpu)))
>             return 1;
>
> If a VMM restores MSR_K7_HWCR before MSR_PLATFORM_INFO during live migrat=
ion, and the guest had enabled AMD CPUID faulting, won't the write to MSR_P=
LATFORM_INFO fail if it doesn't have MSR_PLATFORM_INFO_CPUID_FAULT set?

Sadly, I think it's right. Even on AMD systems, MSR_PLATFORM_INFO is
enumerated by KVM_GET_MSR_INDEX_LIST. It does come before MSR_K7_HWCR
in that list, but userspace is free to restore the virtual MSRs in any
order. For any sane AMD-hosted vCPU, MSR_PLATFORM_INFO will be zero.
