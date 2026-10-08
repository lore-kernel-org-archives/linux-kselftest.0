Received: from mail-108-mta184.mxroute.com (mail-108-mta184.mxroute.com [136.175.108.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0447A3E40F1
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 21:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791496528; cv=none; b=E6jUz+WSEwvG+pnVQTruNepXTUfnHupVvtHcFdtL0c8Ooft3xx4q8RnaCv55EGKCuREofXGGaPQ/D2DYf1qWpXoDxtwh/5dIjAKCrLjDb2A18/h+wNAzi/yn7jofd4B3hMEBe6o16IDi8/UNO/ZjSN/b0UskQ2jH3JUKdLZ7O2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791496528; c=relaxed/simple;
	bh=c4l5RBazXn6/+Pc9tySU9rlkdsVQPHHcOKBG5yyagyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N1++/w5unR0HZvHaE9vesQPacMZGjj1WLbcLm0XadBi3ujqP1Pm1x5qraNe3ng22uSC1ZJAj8hk8cx4TkbTWGO6ewZE0dJGsvnKZihAcDzTqzvGAfcSksCgtmPmN3nZmVG/+PCWBYiD3JJbtahiSnkzvPQNFlj4mG+WR1dm0n+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b=PgarrB5j; arc=none smtp.client-ip=136.175.108.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b="PgarrB5j"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta184.mxroute.com (ZoneMTA) with ESMTPSA id 1a11d7ee08e00028b2.00a
 for <linux-kselftest@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 08 Oct 2026 21:50:16 +0000
X-Zone-Loop: 494897e1e9e4ea4baa40f4c17d44128964ecd21bd9a2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc
	:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=lqea7rGBKvKpY7AYlCRspZQWiphjDKygVuiDmAgiRkQ=; b=PgarrB5jyAE+Ss0Skb/ufVgpPz
	K+gZBVCW+QkwGjsPMSD/uZNCNwojYjkFNhdy8u0+1qAAkgxl4P+t/uJK2tx8Sv13TYU74mUkgmMND
	wIyguSxwyfhIk35X8amp/KkpMGrAhGVBYalPyKfPcLu8KDCQWgIwdM/lINrxuwD6rmAbtHlf4MX/L
	49STTu9u/2jWi2W0iRBqlPNNO33cmyZP65H48vs38/9kHIwZ/A6OLkXCf9cNk0nD9VizZNHLmeFc9
	riKWPCs0rNoCRVHqCgbLi5yNmCAqMiFZ5skdstt5ANHSZPLYvLanmv0mdMNNbY/32P82YaE+pslqF
	g52DrJYQ==;
Date: Thu, 8 Oct 2026 21:50:06 +0000
From: Richard Patel <ripatel@wii.dev>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "x86@kernel.org" <x86@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"tglx@kernel.org" <tglx@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"kees@kernel.org" <kees@kernel.org>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH 1/3] x86/shstk: ban ia32 sigreturn when shadow stack is
 enabled
Message-ID: <asgQDlpnDwu04oZc@wii.dev>
References: <20261008201610.1003569-1-ripatel@wii.dev>
 <20261008201610.1003569-2-ripatel@wii.dev>
 <e1a26ac75c39673d043b2860f848827fecbcb843.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1a26ac75c39673d043b2860f848827fecbcb843.camel@intel.com>
X-Authenticated-Id: ripatel@wii.dev

On Thu, Oct 08, 2026 at 08:59:57PM +0000, Edgecombe, Rick P wrote:
> On Thu, 2026-10-08 at 20:16 +0000, Richard Patel wrote:
> > When returning from a signal via x32 or x64 rt_sigreturn, the
> > shadow-stack-restore token is validated, but ia32 (rt_)sigreturn
> > do not call restore_signal_shadow_stack().
> > 
> > With IA32_EMULATION, 'int $0x80' allows ia32 sigreturn in 64-bit
> > mode, which could defeat sigreturn protection.
> > 
> > Refuse ia32 sigreturn by forcing a SIGSEGV instead.
> 
> How can it defeat protection? If doesn't process the shadow stack sigframe at
> all, leaving the SSP where ever it was originally. What am I missing?

The selftest demonstrates that 'int $0x80' rt_sigreturn from 64-bit mode
jumps to an arbitrary %eip in the signal frame (zero-extended to %rip), \
whereas the 'syscall' variant raises SIGSEGV if %rip is corrupt.

I don't think it matters that SSP is still at the old place. It would
only break 'ret' after sigreturn, but the problem is that the sigreturn
itself is a wild jump.

"defeat protection" was badly worded, I just meant that the 'syscall'
path has protections that the 'int $0x80' path doesn't have, so I
thought it'd be worth fixing.

I might be missing something, maybe SHSTK never intended to defend
against a wild sigreturn? Either way, it's not a security thing.
