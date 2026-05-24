Received: from mail-108-mta138.mxroute.com (mail-108-mta138.mxroute.com [136.175.108.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B8137B3F1
	for <linux-kselftest@vger.kernel.org>; Sun, 24 May 2026 21:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779659938; cv=none; b=naLVMUzkYIO+HlJSnd9xwzNQmfdtZLpTR963Y4tsdmj4SOm2pUnT3IRY3G9AJ2TW9FFADPxwX1WkWENJdQxBJDvxsR9yNk6mD66ZxSbszd46ittfrgeFr01Q9Czagpv/Q+aQUd8slIzCegfkyXcU/4Ea0fCsw709LEpdAj9Sz68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779659938; c=relaxed/simple;
	bh=mxVOuiCh+BL3io+Qi2agThF0OkoIpWnReYRLxgZQT0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D5P3oALffMqtmB4pp45hboZve/BUi8ZTHSFJ/r/NQTzyjAbZPAn6pSluCdzQIXfo7O++DUYD54C2ogFZ1bs9yEG/DZ01JrbVIb41pxJgzMlTv+5vzU7Sr+JvgehR9UeKahAK8pf725chBL1UlxTK/c4P2TmmmY6OxCaNCS7qyXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b=hl15lOfB; arc=none smtp.client-ip=136.175.108.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b="hl15lOfB"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta138.mxroute.com (ZoneMTA) with ESMTPSA id 19e5bfac62d00067f7.00d
 for <linux-kselftest@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 24 May 2026 21:53:41 +0000
X-Zone-Loop: d65c3c2dd43e941a5f8766006a0756cfa4a253be7b54
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=r+uzi58aXD4a+eEqhT0q403gwxh8U/2zfYWPcqMEd0o=; b=hl15lOfBgxmW2PlvWMRSEN0iPB
	OVJEEPaDD7wP9s9q0godR1EGcXPNro+N4kQ9u8DPxmbakXJtPeuy10jgDkd+yGlpf0oYDpXOblfIh
	F3DN2+ezxrB+9I8foXlpG910I3+ikPq7OcvGQxtW1/UGpEOBggVZTtXXmDfWLdCBXGYMQNLwwr7BJ
	dCD9RoxOlDLXCOtg6csVq5DLNokH+Q+VXZepUskw6xWHWoy/0CQyFKcxBsWm9/bSjsV9uvGBOBzQG
	DHA/OxtepjjXToz1PGcRS1OqHT9stC1juMrkcbzGbA3fhDy0geIAc5Yqdy83RhbPmFPX8Rf6ZAvar
	5j9c3oRg==;
Date: Sun, 24 May 2026 21:53:09 +0000
From: Richard Patel <ripatel@wii.dev>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: x86@kernel.org, Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] x86: ban 32-bit sigreturn when user IBT enabled
Message-ID: <ahNzRYro0gOkaXDZ@wii.dev>
References: <20260517183024.16292-1-ripatel@wii.dev>
 <20260517183024.16292-5-ripatel@wii.dev>
 <F10D66BF-C851-4B14-81D7-E5F1E15A325B@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <F10D66BF-C851-4B14-81D7-E5F1E15A325B@zytor.com>
X-Authenticated-Id: ripatel@wii.dev

On Mon, May 18, 2026 at 01:22:19PM -0700, H. Peter Anvin wrote:
> On May 17, 2026 11:30:21 AM PDT, Richard Patel <ripatel@wii.dev> wrote:
> >diff --git a/arch/x86/kernel/signal_32.c b/arch/x86/kernel/signal_32.c
> >index e55cf19e68fe..7cb76d794366 100644
> >--- a/arch/x86/kernel/signal_32.c
> >+++ b/arch/x86/kernel/signal_32.c
> >@@ -143,6 +143,11 @@ static bool ia32_restore_sigcontext(struct pt_regs *regs,
> > 	regs->ds = fixup_rpl(sc.ds);
> > #endif
> > 
> >+#ifdef CONFIG_X86_USER_IBT
> >+	if (current->thread.ibt)
> >+		return false;
> >+#endif
> >+
> > 	return fpu__restore_sig(compat_ptr(sc.fpstate), 1);
> > }
> > 
> 
> Dumb question: is there any reason not to just enable it for 32 bits? It doesn't seem that it would be that big of a delta to Just Do It.™
> 
> That being said, I suspect the number of users will be very small if any.

Hello Peter,

I researched 32-bit user IBT support a bit more.

Intel's original patches used uc_flags, which is not available in the
legacy 32-bit frame (breaks sigreturn(2)).

But you could also store Intel CET state via XSAVE into sigframe
fpstate, like for Arm64 BTI.

Unfortunately though, this includes both CET control flags ("is IBT
enabled?") and user state (WAIT_FOR_ENDBR). Since fpstate is writable,
XFEATURE_USER_CET is in XFEATURE_MASK_SUPERVISOR_ALL.

So, we have 3 options:

1. Include CET in both XSAVE and XRSTOR, but revert user changes to
   control bits before restoring.

2. Include CET in XSAVE, exclude CET from XRSTOR.
   Parse XSAVE and restore IBT state "by hand".
   * Breaking XSAVE/XRSTOR symmetry seems like a bad idea?
     But the user can already remove xfeatures bits, I think.

3. No CET in XSAVE, instead abuse uc_flags to save this state bit
   (this patch series).
   * uc_flags does not exist in sigframe_ia32, which hasn't been touched
     in 10 years

IMO: Option 1 seems crazy. Option 2 worth a sketch. Option 3 is ugly.

Really curious what you think.  I'm going to send out v2 today with
option 2 (CET XSAVE, software restore), and if anyone hates it,
I will revert to option 3 (CET software backup and restore), and at
least add rt_sigreturn ia32 support.

Btw, OpenBSD doesn't do any of these and discards IBT state.
So, if you spam signals on OpenBSD, you can bypass their IBT.
That is, uh, option 4, I guess.

Thanks,
-Richard
