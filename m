Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F743BC69C
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 15:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783437579; cv=pass; b=fvW2pVdElvH4nEwDCqJ8HevVVhVvmIUhE6nSJNJxU0Y0xkm+oE5RdZCsjEnr7YAKIO7gwt3jrS8dKAy3JVMLWnRh9L7iKqW3Olqqy4v6h/rs9wcHF/H0lp1nck24yNxttzyt7+P1xrRWcox6mCpL2+gq8XvJ9Y4+T0DD3d08N2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783437579; c=relaxed/simple;
	bh=ACNA/Q8YZ4S0/IDVCd742R/sW2YbtzHlXkas+97+kCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J0E4fpF19oTXc1kSYhzycLESi3/cM+ac81eLYAtinDgOLuFrf4dw9sMj9SDmNUkeXGx0BKH9IxWZ/ViXRfvNBL79o4G0YT3MLhK4gL70Ooadmcq1eheOHgM5Q52KbL0S6/gKZTkYAlhElksUZkD4HXO4yfBPxOodFGynngeXjl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l2Z32lUE; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l2Z32lUE"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-69a19eb2e6dso9396a12.1
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 08:19:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783437575; cv=none;
        d=google.com; s=arc-20260327;
        b=H7MaaH5jL7HHVLcaXxBcMq1WCSBHG4w91hBdxz+km8qdhCIN7497sEutFymk4UkcYO
         BHqD3fONrex1n01MbLQCCsnNu7w3vTmFx2MKWpQMLdCfbmaaAAq/eNc1NltO6AWP17rJ
         hz2nPr/PZ1KkeQ8mWvfX/3VLARwyJGr4ByrN4FFXq3RfGz778CWOFklfNGJGiniInypz
         D1DwKUduUYjuI7nN7YqkVIEfF0pyE2OdcJuyKcwEWsgGYXoE4VSugTNLMKuXZBkJaWeL
         Yh8XNT3sVQ1r1rKhaXvF9JowZNlOrbIv77HmJM6qmXDSItno2Din0BegGaUAI8zjJ13D
         gFxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ACNA/Q8YZ4S0/IDVCd742R/sW2YbtzHlXkas+97+kCY=;
        fh=0rap495ZJx7gqIspQWV/FTYDs+wHR/fdPhf1uHkdgDY=;
        b=NqB+WM3iQZxesJGUsVOCzl34MYcx1yYvY8qETcIlFYJPhGS3gruMsdadES9DFO9SUt
         IbU2RbJ7TkeGipa0aOsDrWZxDzM9oMhTWs/UdHWtkOSmQXIS6RL6oowaOMAl/Xvnk7/F
         GE5pOi62R1Ky+nL+i5FEBdfg7M3TtZW/lnvhQLNBtH2pezJO1Qjc4PUbxwKVx9F076h0
         1Y1ap54kGhEoWGms8ZIyPb8auPbQ0XV4/f8kJ7mxGWSNpnaaVsaGvpQx2zmM96wS+UkO
         YkX1LkOnhj7jPRMScjRCrmSizg7c+e3Y6Kq4pTeMTMHK45R7piO5GF+sZFLgYlKRjNxo
         4jKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783437575; x=1784042375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ACNA/Q8YZ4S0/IDVCd742R/sW2YbtzHlXkas+97+kCY=;
        b=l2Z32lUEirl5oc5VLsJtPqcgJ37pIdzlNt/PM/aDIWfKRosA5+dKWZ3aCSdi47zVIM
         J4j+Qw6lNAQXANqnm/plMqdgpn13vTQ+SJNCyok1H99rpnrLzNkWiZX0Z+SAh2O/dvfr
         3QSrCNCx2ewpK38FkzjqpkrDH3UKODpPPl29k19QHGYsU5ZdNyMGcTbMq/qfmkSlc/U4
         GOxYg8q9FbbCn69KAsJ8V7HX/CtcOxdhHKWsWVp4kpmyroqXu/XSWRGTl/EFvKvSpuYg
         HLcRfqAu127tHZe5CndM731FF8v6qzCh5xFa1YuT4zuZMak9qLFnB75TBtN8Pu+/ux8G
         +rEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783437575; x=1784042375;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ACNA/Q8YZ4S0/IDVCd742R/sW2YbtzHlXkas+97+kCY=;
        b=Gt9vPKVl1R50x8Kt4uMCUzR4lkAF4IlJQpkvGtZ0E3BY84tGYcnjj7Lr9PkYHO6lRj
         ctGBDcjiw6fkPM0fL78YeORFrQcubd4LAmyDDSttPysaDlQedy+SEGDYVISjog5FStM5
         BVT38J9iCHVfcH0wP0Au9ULcL4WDPQkKWtzsxrgw2NH0YDaVo5TM/e4pL6MbYowJXiQY
         XPdQpbh963uwX/kEcfomSHShBrZhHN11DO2Og2ZlCpf2/N2csbH2hAgXiNYj2g9dhjmH
         aR8RzZ/3CZ9Qqj/vagGrjhKEH1HF5O5Xt/O0AotdZDLTvIhjq7iMlafqxOT2TtccHHhR
         ht7Q==
X-Forwarded-Encrypted: i=1; AHgh+RpatDP2TjMgwDzQZC2kS/p+bjwtdMYtDeUATF5Vy8A4xX8XIGlMNmfO3y9Ueor8XLezpnYXPad8N5qB5q/57xw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVmiWvizsAIYWbKl5IzR8WCCGW78qsyHVCU7C6LTbRoMHS2spd
	VMV1zBapKFw49IbYC/eFsFc8aQOFG73dsKtyREKWv+nsuOcKwov7uKmVr5lHaPO0vWOxwRs325o
	+3BA3ri+kighvpTyLsCDqGgmqJKVfw/taEmU8G7KM
X-Gm-Gg: AfdE7ckFXXIXdc+NeHyGL1gmsxmcPRg565+WW99anrZ3ubCgcHZaByfJC14zz5kDsjR
	BbBlfkYS6BLTTWiME5CnyjLu/stsf9fb+SSA10iId2DBoTJkDTs/7Q+7eI5RJJu3Ldv6YCKUGcM
	bNctwanRFJQx7Nwg5jk9KIQokCagWkNtP/3FU1RVwzZLTlfhpTt3kfQgctRlLsnH8SXlzXmY3Bk
	Vx7s0IZti8FKJ4LlVtv92/7ZV3Q4nujbm66q4wCQXU4pnErxcAMlTDMSu2L8j+pG+2Y0tCf
X-Received: by 2002:a50:8dc6:0:b0:697:5678:bc77 with SMTP id
 4fb4d7f45d1cf-69a913a7174mr40955a12.9.1783437574125; Tue, 07 Jul 2026
 08:19:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629125205.52394-1-zhang_wei@open-hieco.net>
 <CALMp9eSLH7pT7X22es+AotxhRMQ1VyziWWELQu6_ZRsyuQ=xzw@mail.gmail.com>
 <0e576fd8d8cd2ed1739cee36eba393fea7745506.camel@redhat.com>
 <f70b4a3b-1ac1-4269-ab7c-0ed1fb42c357@open-hieco.net> <CALMp9eR5jVLGeQck89kro1ocEX5aZcovdGMK+fuzXjqK1NR7kQ@mail.gmail.com>
 <d5645a47-c346-4e63-a5c6-c88bb39a3ee1@open-hieco.net> <akxwt1mX6blSnkxI@google.com>
 <CALMp9eTr0iJ5QgbZJ0YtOZg89XVFSesbyoGGdtkz+f8c60DcDA@mail.gmail.com>
 <CALMp9eQXGYevLQJnEV+Kx6hvp84vPQ=2U8AfZHiZrZj=CVM2hQ@mail.gmail.com> <ak0QYnYvchKTnwxS@google.com>
In-Reply-To: <ak0QYnYvchKTnwxS@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 7 Jul 2026 08:19:22 -0700
X-Gm-Features: AVVi8Cc6lIIBt5CRHwGeZ2r-_zLxB-gN4Cuzj750XAPKtpyteKuQgIRdSaJTEL0
Message-ID: <CALMp9eTK-Dg24geFN6tnkoD3rc4ct6eZcHCBv3EvPYOhBvaFaw@mail.gmail.com>
Subject: Re: [PATCH 0/2] KVM: nSVM: Expose DecodeAssists to L1
To: Sean Christopherson <seanjc@google.com>
Cc: Tina Zhang <zhang_wei@open-hieco.net>, mlevitsk@redhat.com, 
	Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	zhouyanjing@hygon.cn, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 7:42=E2=80=AFAM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Mon, Jul 06, 2026, Jim Mattson wrote:
> > On Mon, Jul 6, 2026 at 8:25=E2=80=AFPM Jim Mattson <jmattson@google.com=
> wrote:
> > >
> > > On Mon, Jul 6, 2026 at 8:21=E2=80=AFPM Sean Christopherson <seanjc@go=
ogle.com> wrote:
> > > >
> > > > On Tue, Jul 07, 2026, Tina Zhang wrote:
> > > > >
> > > > >
> > > > > On 7/7/2026 9:32 AM, Jim Mattson wrote:
> > > > > > On Mon, Jul 6, 2026 at 5:02=E2=80=AFPM Tina Zhang <zhang_wei@op=
en-hieco.net> wrote:
> > > > > >
> > > > > > > I will take another look for the next version and try to hand=
le the
> > > > > > > remaining pieces properly, while also making sure we don't ex=
pose stale
> > > > > > > or incorrectly synthesized decode-assist state for emulated e=
xits.
> > > > > >
> > > > > > Naples erratum 1096 seems to imply that the instruction bytes s=
tored
> > > > > > in the VMCB are not necessarily the same instruction bytes that=
 were
> > > > > > fetched and decoded to lead to the #PF/#NPF. Hence, in the case=
 of
> > > > > > emulation, it might be sufficient to read the instruction bytes=
 quite
> > > > > > late in nested_svm_vmexit(). That would certainly simplify the
> > > > > > plumbing.
> > > >
> > > > The plumbing doesn't seem all that complex though.
> >
> > What about the case of a userspace-injected #PF while running L2, when
> > L1 intercepts #PF?
>
> That can/will be handled by the fallback logic of reading the code stream=
 on-demand?

Could be, but I would prefer consistency.
