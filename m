Received: from mail-108-mta187.mxroute.com (mail-108-mta187.mxroute.com [136.175.108.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98701221F1F
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 00:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779150010; cv=none; b=b3fdl2zAMmlVRO7tKeu3pTkDQCKW/BdCB/btusEGJXaAu1Y1NOcb5zRm8ywtFXqa94/Ks9Q+Hu8TDGP9mMLxQg6jPofaCtvQDSai9YtjLVqCfAeJ7gmEem0KsdDHrWvDGdFPoyvbQQ2zW2Y3XRbVSHHfNoiW002sTn8PuZ3dUsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779150010; c=relaxed/simple;
	bh=MdUU1wqw7M7+hjy9Kiscz6aK6KJgNl83gpqCLEt4HGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjC7CYfTj+31Sj5HxZCFaMwOCHre0xRD3lXA9ggvu6UAxuyrz7KKK3ytT1gSjuyW3aG0QTuLLc30jQy/qRzuQ1UkeWlawsGY3Eo5QmsRrFPKPhDDxnvzAY9EoWZhP1UaVnETf9buKeHJvVR781tY9e7ra0OVjEmctXmCs5ZZj+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b=aLZICZu7; arc=none smtp.client-ip=136.175.108.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b="aLZICZu7"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta187.mxroute.com (ZoneMTA) with ESMTPSA id 19e3d95f2ce00067f7.00d
 for <linux-kselftest@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 19 May 2026 00:14:57 +0000
X-Zone-Loop: 87554ce25c4daa70790573e03a0908d2869f6f58aeb5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=fMA0+wZo70MBMLEaecLU1LClg4illspgGkTP+hxG9bw=; b=aLZICZu7bpj6wuzhlp7SxDTkN9
	N0QSkc9ujoCSGiVBHwj5qEqCz3VxHlVYp1DHXkeNZna4RfgrkcCE+UqPNK/kto2IzX5YqlA7DraXs
	xDHE9PYL+iTkqBX7hCNKMYQKuXvyBbOhy5FbA4dVr6D3nUPLBFBOjWj+DZCUVq/kBabFXFWd+/lsc
	1vS8B4F+poYohn9Cf4KCgMLM19fpmJG96W92uvvJ8/6Xgvj4fv8Nm8yPMHse1xASKHmvs/n80wkhD
	yzyCrfltB2Ce4tLrzBqhRcG/yotOX/k0h4CtQ8q3CTsBUwrczkjJCylBkUmQWD5YXLTD0Ioyj2htj
	q4R5/3Ig==;
Date: Tue, 19 May 2026 00:14:34 +0000
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
Message-ID: <aguralnvvMKzIDxH@wii.dev>
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
> >IBT is not implemented for 32-bit and cannot be enabled using a
> >32-bit syscall. However, a 64-bit thread could far jump into 32-bit.
> >Therefore, 32-bit sigreturn must be banned until IBT supports that
> >environment.
> Dumb question: is there any reason not to just enable it for 32 bits? It doesn't seem that it would be that big of a delta to Just Do It.™
> 
> That being said, I suspect the number of users will be very small if any.

Yes, partially, good call. It'd be tricky for legacy IA32 signals.
sigframe_ia32 would need to be modified I think. For rt_sigframe_ia32
(rt_sigreturn) we can put it in ucontext_ia32::uc_flags.

I'll fix it in v2 later this week and add tests.
