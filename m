Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8626F37AA74
	for <linux-kselftest@vger.kernel.org>; Sat, 18 Jul 2026 13:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784381460; cv=none; b=Q5WSo68kOHBQg0lbotluYLyPjapB7/VnYMS8WpTIMxgwC7LTDy2Tv8Lgy/F2SN2WY5q24I2bGw0otarwTQeLYOd0m4CeTFNgYqFjFLp/GKz5Lstn4nq23bBPuZogGjv7Dzy+yGQ1HDzFtbApylKlJpv5Nt97ZvQtXKaW7hPjYRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784381460; c=relaxed/simple;
	bh=gQs5POHdONT3YFPAMms0/iLYO69THG8mBGvtn8dsLsI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OxS+JlUnFwO3q9dFH+/36yW/0jUvB7LyD43Vly3bHj2csWOI9Y/SuymsXd8jTvVY73TXLBFomX3QQG5MloRvba059s5oP2TXhmL3TFzVNANgnAcgvXHfZhb1Qm4zQYv5T7Luz44ybQdhPVTWSOrGsh/ltBBzkbjXtLyWDcQac4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pbVX/NFr; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pbVX/NFr"
X-Forwarded-Encrypted: i=1; AHgh+RqGyHjriotQP9TWTXBwzww9Ehn/slHCwrpkzowL+m3C3r9SucPMjaEXySborLHyEXj+E0xPtLNCzNsTHriT+C0=@vger.kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784381456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pqtJZUk5qJxMkA61YT8ypQ7TqHYl3mzM3Ijtm1HishM=;
	b=pbVX/NFrNUJCscLVwgcExH6NhAcM50uszjRRkTzxsCcLNk1TNOgiz933csKRTZo2Hn4Beb
	iyVHhA2akqnyVnOcPmfNLmN/Zmg4/zZS31+T9u8UV6tMo7WkiwoBq+UaaS5tDu1E4v4whR
	s3UmiBRk85vxzmLNXNzh+tYsrnsNOHE=
X-Gm-Message-State: AOJu0YzCO9mZczmNNm0v7rioSOOfCvhZSXDS/60e6g7nOcg14A8DbNDX
	pvB/3geDdf838kSkjYsAgE+Ljc2KPQIusVSGC5271cGtJX02Xu8xNbH1mrJIysah7klNQ5easWm
	suuE/3S5PqmP1c64Dd1bXm47Y4+qnDKUts01e+yEM
X-Received: by 2002:a05:622a:244a:b0:517:64f6:3365 with SMTP id
 d75a77b69052e-5223a857400mr7094371cf.4.1784381441644; Sat, 18 Jul 2026
 06:30:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709-kvm-arm64-sme-v12-0-d0301d79ef58@kernel.org>
 <20260709-kvm-arm64-sme-v12-2-d0301d79ef58@kernel.org> <ali39DG6qie7XTuD@J2N7QTR9R3.cambridge.arm.com>
 <15a9ae14-395d-472a-a5be-9e46524fb493@sirena.org.uk> <3c76650f-ddda-47ae-a676-86016d8e39a6@sirena.org.uk>
In-Reply-To: <3c76650f-ddda-47ae-a676-86016d8e39a6@sirena.org.uk>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sat, 18 Jul 2026 14:30:04 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw9rGvQyev-4i7zkO5bPPZKGYn858485dCs8iHmCi0t3w@mail.gmail.com>
X-Gm-Features: AUfX_mxZ-9J4gmHZMd8M6CPDldWUxrDTcSR7f3kR1-CUFXH7d2lH_8uznFFC9qg
Message-ID: <CA+EHjTw9rGvQyev-4i7zkO5bPPZKGYn858485dCs8iHmCi0t3w@mail.gmail.com>
Subject: Re: [PATCH v12 02/29] arm64/fpsimd: Update FA64 and ZT0 enables when
 loading SME state
To: Mark Brown <broonie@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	Jean-Philippe Brucker <jpb@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Peter Maydell <peter.maydell@linaro.org>, Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT

On Sat, 18 Jul 2026 at 01:35, Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Jul 16, 2026 at 04:28:02PM +0100, Mark Brown wrote:
> > On Thu, Jul 16, 2026 at 11:52:36AM +0100, Mark Rutland wrote:
>
> > > >           if (test_thread_flag(TIF_SME)) {
> > > > -                 unsigned long vq = sve_vq_from_vl(sme_vl);
> > > > -                 sysreg_clear_set_s(SYS_SMCR_EL1, SMCR_ELx_LEN, vq - 1);
> > > > +                 sysreg_cond_update_s(SYS_SMCR_EL1, task_smcr(current));
> > > > +                 isb();
> > > >           }
>
> > > What's the ISB for? That mysteriously appeared in v11 without
> > > explanation. It wasn't in the original code, prior versions of the
> > > series, or my suggested rework with the task_smcr() helper.
>
> > > I don't believe it's necessary to add an ISB here.
>
> > I can't remember or figure it out, I'll delete.
>
> Actually I remembered: while SCMR_EL1.LEN is self synchronising the
> "without the need for explict synchronization" wording is not present
> for SMCR_EL1.{FA64,EZT0} and this is no longer explicitly just an update
> of LEN.  It's possible I'm being overly paranoid here, I'll leave the
> isb() and add a comment for the next version.

I went through the ARM ARM (DDI 0487 M.c) on this and I don't think
you're being overly paranoid, I believe the isb() is needed here.

The self-synchronisation wording in the SMCR_EL1 description is
attached to the LEN field only: "An indirect read of SMCR_EL1.LEN
appears to occur in program order relative to a direct write of the
same register, without the need for explicit synchronization." There
is no equivalent wording for FA64 or EZT0, so they fall under the
general rule in D24.1.2.2: "Unless otherwise stated in its System
register definition, a direct write to a System register requires
synchronization before software can rely on the effects of that write
to affect instructions appearing in program order after the write."
Table D24-1 has direct write -> indirect read as "Required".

And task_fpsimd_load() does make indirect reads of both fields before
the next context synchronization event: sme_load_state() executes LDR
ZT0, whose execution at EL1 is trapped when SMCR_EL1.EZT0 is 0, and
when PSTATE.SM is set sve_load_state() executes WRFFR, which is
"illegal when executed in Streaming SVE mode, unless FEAT_SME_FA64 is
implemented and enabled" (from the WRFFR description). The MSR SVCR in
between doesn't provide the synchronization, since SVCR's
self-synchronisation wording covers reads of its own SM and ZA fields
only.

When the write does change FA64 or EZT0 (once KVM can disable them for
a guest, and possibly on the return from suspend path now that
sme_suspend_exit() no longer writes them), K1.2.4 "CONSTRAINED
UNPREDICTABLE behavior due to inadequate context synchronization"
applies without the isb(): "the behavior of the PE is consistent with
the unsynchronized control value being either the old value or the new
value", independently per use. So the ZT0 load or the FFR restore
could take an unexpected SME trap (EC 0x1D) in the kernel, depending
on the implementation.

FWIW the other call sites look consistent with only this one needing
it: in do_sme_acc() nothing ZT0 or FFR gated executes before the ERET,
which is the context synchronization event, and ZCR_EL1 only has LEN
allocated.

Cheers,
/fuad
