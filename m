Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2EC4219FE
	for <linux-kselftest@vger.kernel.org>; Tue, 26 May 2026 18:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779820751; cv=pass; b=sKmVyMMj0synBKVm67/bFlsnBU8H3Rl0uruL0UUJj+kAZVYfhGTpJOL533F6Cng7YRSFoygXLMwwI8yWNzlSjMkbFQtDTTAKv+XH2EYIITGNXUA8i+faNcxpN2mQ188tzfOnBcv1SrPIKFrlB/1mLWyVjaPMaqgg6QbS4bwVqM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779820751; c=relaxed/simple;
	bh=TQ0YkjZ6DaYWwBevwDIkK78Ix7JVxyhaUN3xT4LANLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VDJb8HrHYeqai3EcId1wIoMSDdwjJnOipfbcS08jdAS8puwYzyqR0ggFR/MPYjQkzhaGZzEIHj17QkzE1ohwhXmBCTbCl8eOAiQw5FvidS6EGnVK0T3LZ+793znX0cjaEYVVPpGv38787O7fRsFBNMHsNjLzB6IE6L5rFBYeHzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MPIsIoVN; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MPIsIoVN"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-671f1a0d0c5so232a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 26 May 2026 11:39:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779820748; cv=none;
        d=google.com; s=arc-20240605;
        b=bvSV1BWOnKJzFsonbtAc5WJ4Czlhx6H8w+bhNhIn9GWyWgosAfFZTV2SAfW67/ZcX5
         7ddcoG86xXdllvhz4q+E42FCMenFDv38O9+c8+NDfiwOLeoE+8mVcj6PTl7q9dRiQFvp
         3JaeHfbfEkVSX9Pfoo8PPDrn/wmDOA3l1H2+j/eFkMK5qu6Mnup21rQ7VnIMoHnv9Y+s
         KZlLLIlP6BVGBwfKDG8zJogzQzTE7SHOmvwN69qLFNzib1PkhR8H5EjSOP8EA8CrP/ID
         O3R1hRAf7kJ3gsfvIMCAH1Hx0SMCkBZyw4tCOrJoBLw4Mi3sUQOSa3T4zeABWdqJWeGV
         mrFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VZrclRlrLw1F8/3daiaKppXoN6r8/1TCSncdy3RzcBA=;
        fh=atvcDggC4NbFz7GUS4YuIpdtUIvkNAiCIWJroBMVjjw=;
        b=IKBsx1nV5G4xHyWvGas9qsufgM2Ue3w7jPc9HwCcs8H5c2hB7FvNMvaAl0UvNdNh9D
         MYLatjRJYswpqsCvzWBOCNiCdCBlNNPzrmpT+BiG/xgCdzSEOEuCV70WEvkPd+qwlZSm
         +fO2rtm/QPdLqpbvfl3kPWVRtl/N1KLTZmm09ln1tnIhFfh9YO0h15u+w1rhABBHBWhk
         Yf5CawFnuHahbUWdwlsq5SAk0kPBfY3opetKB1Z6hJjcSA5juUeUhosx7ybM9S8DwZPO
         MRNbY4zgD7T/6jBC2yI6VqqqmD0RNeSP4a+LnFVtSvbXpP7N2h4MfO3WAXYkWnPJLdF4
         jmpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779820748; x=1780425548; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZrclRlrLw1F8/3daiaKppXoN6r8/1TCSncdy3RzcBA=;
        b=MPIsIoVNsFdVMXJRJ4ZnH14jWU4ca8f7NkGCg6OAxzPUqUSAdfZZWDa+NI/ifUQwpf
         tjJ6pel86DJ6t8+IbHotRq0rZeCPYIOYZgFkReIrfyzzQ4Y6RbAwG0H1hdEH7skxfJU1
         JIyyf9GjoYxXIOiRD0ufFJjooc2+jvhT/gC/yPB35e+f+7yYf43YQ0RXbn2Pgi5M9ztJ
         TO6Otmu2wriiUTSupJpwMGdF6F+I5AJWdiNp9F5qgQmHC3HReDq+V+hm74JqQ4kEduaB
         VUpwR0QMHtHAFlT6elVpKDxw6bWpFFAeP3aEzEPYOGzN9IpsLIgZFF7WtAbFhK6veCUh
         u4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779820748; x=1780425548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VZrclRlrLw1F8/3daiaKppXoN6r8/1TCSncdy3RzcBA=;
        b=UatXK2ZK1FrlpwXFCohqOxeGSEjzVIirwAbd3wbBBb+CG5mRmUDuQWuCe4hnoB9PHd
         Xt2fydtazB6gvpn8q/FvG4nQKQeiYzwAKwwrlZkoP3NOxqomN4G0FJD33HrusP1yetUq
         KYHzPzzrETU/0ptmnUs0FhvE00coFI7GYSGh9ih0nee7M+/YlQIqetDLpHx8tAeRzvLg
         wzJJROvF6U4G7A/d1YGAV4Cf593+Yv1WE+gNgbgzD9FlrioSq9MgkObs+tKMyTqPTtXc
         hi0p6HkvKwkPmZAWPn79s/OoQGMAQHIxNu3Y9C65z0oJpGOycQzgpcngmgUx8QKwtbnU
         b/eg==
X-Forwarded-Encrypted: i=1; AFNElJ/eGp94d8eoQwdhyXdEP0TjO7k8y51khOk08veuQ/X1GaJp0csig93wXNm/HBZfio2Jk8v+qINfAgL5cuZxmMI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4NtrbuHTYFXY7Em4rthcP0PI8Z74PrTWSHLw++NVAFzGZ1fdF
	pG/MPfnIkxGStM0RJIgjEVSJHRrAhOc70HeJ3gb3xTkiuNDywg7oRTtJ+l4dABW2kIIjubWyTTw
	1OaO6t7hnoehFwAa1pcfNxSskHYktYAhis2I52yfU
X-Gm-Gg: Acq92OEcwJcX2vEfCO5QqV9UxYN5XM9qvigEF/V65YY24Xm9nvNIES8CDNYIiyWz2CY
	Hp7/Xb52ZICiaYSd/Y4RnpyU0GOXo7kOqqySzAME+7ZKRNhHUTx/2YMUJt+nMPDqvOVa1Cm6qoT
	AZAxp4a287vVXF+zOEN1iROKJegWNvu10tTB59Xal8goPoeKnT6pqzXCVO/qjC0dotPF5aOshvv
	oR5DwEE2y5JP6iqepueY3TH40y7IcU1dDWCk4JZrPaOozEgoK0TEdyESIEjUu+yCXoGPvFwT9YL
	2R9jTzcQp8oKV63cDQ==
X-Received: by 2002:a05:6402:5356:10b0:66e:e3f9:ebb6 with SMTP id
 4fb4d7f45d1cf-688fd0d56f7mr134060a12.4.1779820748207; Tue, 26 May 2026
 11:39:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513224608.1859737-1-jmattson@google.com> <20260513224608.1859737-4-jmattson@google.com>
 <CALMp9eS4s9tsOmvDUDeqS7oph0mSHyhxBiULQdwHVaG+7gXLSQ@mail.gmail.com>
 <agXcKDjnJc9DPcyr@google.com> <CALMp9eS831M153QmAgjzJcR2dFY_wCCCzDisd7_T6GyS3-gAFw@mail.gmail.com>
 <agX2SJF3rJSkIqDe@google.com> <CALMp9eQTSxFkVf4vV83yNYvv2AjseHYiD3M68mcc951L4U1Jxw@mail.gmail.com>
 <agX5v1utAfyMadPm@google.com> <CALMp9eQqbHrcV1_WM+5xUR16OpGk+unxoZGi+=t55cqVhFgAfQ@mail.gmail.com>
 <DS7PR12MB82016B1B310BD994C83B35D294072@DS7PR12MB8201.namprd12.prod.outlook.com>
In-Reply-To: <DS7PR12MB82016B1B310BD994C83B35D294072@DS7PR12MB8201.namprd12.prod.outlook.com>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 26 May 2026 11:38:56 -0700
X-Gm-Features: AVHnY4KO9YpPS3F4eK2yFsOKV_kGxdvJkMqyQHd9reQ58QYwde_VG7jCuT3Sxr4
Message-ID: <CALMp9eQ2SLq2bVngJ1RHEfkFe5yaTDrFxXT0KNTgBZY6WRMDbw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] KVM: x86: Virtualize AMD CPUID faulting
To: "Kaplan, David" <David.Kaplan@amd.com>
Cc: Sean Christopherson <seanjc@google.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"hpa@zytor.com" <hpa@zytor.com>, "shuah@kernel.org" <shuah@kernel.org>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "ctpence@google.com" <ctpence@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 11:17=E2=80=AFAM Kaplan, David <David.Kaplan@amd.co=
m> wrote:
>
> This appears to be a bug, as most other instructions (e.g. INVPCID) that =
have CPL checks do the CPL checks before the VMEXIT checks.  I'm following =
up on this internally...

Did you learn anything from the internal follow-up? The ellipsis
suggests, "stay tuned..." :)
