Received: from mail-108-mta202.mxroute.com (mail-108-mta202.mxroute.com [136.175.108.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E193FDBE7
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 16:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779121560; cv=none; b=Lz4bSlhMttXe6ZpniI3LagdmyKiXMzkhBODFBDOmfUtBVW+NL7PG5dUVjYKyOHEJHp0mOwdM6juioQHCAcJoYLkEdPLu5XHpC9l0eJYgd1jsjtSNcGqUNjgGXqQjIqCOjRr5MqbkveSsAU+5BPnFs0aZo0EGKNdABJiIB0WclnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779121560; c=relaxed/simple;
	bh=0BPmgMtJS+bcF+/mesQQXQyUq8KaoDpdOp1lJOPwks8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ioKjNrf/JoEcGPX3KbmG0NcZWEL8rLi3dxPXBW7Av5v0mHwMZIDUWdJXkE8YxYt3VJ9CGB7cqm9nO8CAJN5TwEnB3IWKWODY8Nt1qlbIWsXUTRKS7YW0ffP2srBmiyzvMe9sZdziH1MBRz9drjTKT/bCT0o69bNvvNazmikLHB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b=D9KhCic8; arc=none smtp.client-ip=136.175.108.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b="D9KhCic8"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta202.mxroute.com (ZoneMTA) with ESMTPSA id 19e3be884fb00067f7.00d
 for <linux-kselftest@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 18 May 2026 16:25:54 +0000
X-Zone-Loop: 867fff870f6be7140c1c29175d53b0deb5e9d3c88f28
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc
	:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=qnSxJKEl0qRPArxjJpQ7k4Ogs6rey6KiQ78uKuOSg9s=; b=D9KhCic8jBwhkAzRIy/FQuz/SU
	3Tzo1JQahaiLepIv9gotvicNZu08ujluNWhyek4IEKCdfZmeqsJoGzz0FGz/raqa2yONt1EZXeoW7
	7IELTE2mj5YW0Gu2dOKPp8zoXeqxi/9X9AEGvv0itCWCD7wClKSgnBI85/QFEmIzRBqUsaZhDqiUk
	qzaVk2hXGI0Iyl48pp5npGTpJWtRzbufEXaekZ8nrhPjfSeBnzCAnjxRe4nu2qphAI7cCe+sXtHfY
	Lz5zdh5Lck0L8G9i1ZchtEMan7kE+Tbqnvmyhq0/rbft2r2qauorHiElTuSjjHW9CjgBlViIde0TN
	anmx9hUQ==;
Date: Mon, 18 May 2026 16:25:40 +0000
From: Richard Patel <ripatel@wii.dev>
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>, Kees Cook <kees@kernel.org>,
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] Usermode Indirect Branch Tracking
Message-ID: <ags9hFcExPnQlu8V@wii.dev>
References: <20260517183024.16292-1-ripatel@wii.dev>
 <20260518073616.GQ3102624@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518073616.GQ3102624@noisy.programming.kicks-ass.net>
X-Authenticated-Id: ripatel@wii.dev

On Mon, May 18, 2026 at 09:36:16AM +0200, Peter Zijlstra wrote:
> Anyway, the most contentious part was the whole backwards compat bitmap
> crap. When the dynamic linker composes a process of parts that support
> IBT and parts that do not, you get to deal with fallout.

Is it acceptable to do all-or-nothing IBT first? And then do a second
round of patches with legacy support?

Until then, ld.so could:
- start with IBT, disable it upon loading incompatible DSO
- allow users to manually lock IBT

I thought this weak form of IBT is better than nothing at all, if
there's a risk that legacy support derails things.

Btw, apparently OpenBSD enforces kernel+user IBT. I think the end goal
is a user_ibt=force command-line param that locks IBT for all processes
on startup.

> The IBT spec has this horrid bitmap thing to try and deal with this, and
> those early patches exposed that piece of shit to userspace. Then later
> patches (suggested by me) used the ARM64/BTI approach of using PROT_BTI.
> We'd use a (software) page-table bit, and upon #CP consult that to see
> if we should eat the trap or produce a warn/signal whatever.

Nice, I'm happy to revive/rebase/test any of this if there's interest.

> I think we were near something workable there when Rick got pulled from
> this and put onto something more 'important' and things just haven't
> moved ever since.
> 
> Anyway, glad to see someone has time to poke at this.

Happy to spend whatever time is needed to land IBT. I'm very glad the
first reaction wasn't "absolutely no way" :-)

Thank you,
-Richard
