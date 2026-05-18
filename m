Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4902130567A;
	Mon, 18 May 2026 07:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779089786; cv=none; b=sutfxu0osz8cJjF1rV4mC6gDL4vEUmwHJ2GA62F1NKejD6Kng6nrTRyUpuOfSrFRJEkbrFcD97bhaQteCs2HLVqWTYxEzW9gbrehFSC/eh4zdldxzmRB0MYtvgoypVPPRzM2vwsaCr6UC3M5iJZ8kCULvIkNXj7sZzHoDDXfeXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779089786; c=relaxed/simple;
	bh=0RmsoeoqEBdCwscuQohJgSW+yc5VGaU8VIYM5D4T7s0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t8LOYF4DqOuL4ssV8/m8JASDw3t8ObMQVafh+wjZriZRrD3AdTDEOgZtkIlPjcTNUd/uH+pLKFiPsONH6BfHAzIOVxZiHOpla9Gbl+3LFdTFHIngYzuGhu6s0g+SCfjVxtCe7UgEQcZv6sDyvoUpId1ccXn0nyrtrrH/9T2Y0FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=rv/UrFjA; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rv/UrFjA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XLXOvIKJsur9URmqw+rYawOKy5SFXzC1LIy9xw9RSJ8=; b=rv/UrFjASlo2Ou4mbIOw0dKtGq
	sgbxvv07/Wp46GDC38oDGsATqXgxtGi0GRUNce934DEbXTfGGpuLE6Bw3FrzmoVixTPd3igrT7OGO
	tdsfWSeltEDZRyRSH3wfupsNopwVgQZ64VBrNikA5yhqDfQnnRuO+SnBUd5HrUYTMxXAsFxWS6vHq
	5r/PpxUbgmm4DT3h+oDnOodx7T+CWTODPA3xnI4NTUeDXqQJ5lziKo1QjAurPj4DnQpKs2dc/mtkK
	9Meog1AyCewokhwOTX8CoB/9EnhQD1nlEbTb9LwJ8+T/T9Lrl+IDuFSDwLF/TCjYhchdoS7nfdyl3
	Na/izfLw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsWQ-00000004Tx8-29RL;
	Mon, 18 May 2026 07:36:18 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id F324B3007A4; Mon, 18 May 2026 09:36:16 +0200 (CEST)
Date: Mon, 18 May 2026 09:36:16 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Richard Patel <ripatel@wii.dev>
Cc: x86@kernel.org, Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>, Kees Cook <kees@kernel.org>,
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] Usermode Indirect Branch Tracking
Message-ID: <20260518073616.GQ3102624@noisy.programming.kicks-ass.net>
References: <20260517183024.16292-1-ripatel@wii.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517183024.16292-1-ripatel@wii.dev>

On Sun, May 17, 2026 at 01:30:17PM -0500, Richard Patel wrote:
> I was quite surprised that the Linux kernel still does not allow
> userspace to enable x86 IBT (indirect jmp/call integrity).
> 
> Compilers and linkers have been emitting 'endbr64' IBT markers and ELF
> support notes for a while now.
> 
> The hard work was done years ago by Intel:
> https://lore.kernel.org/all/20210830182221.3535-1-yu-cheng.yu@intel.com/
> 
> In summary, usermode IBT requires 3 things:
> 1. Set the CET_ENDBR_EN bit in MSR_IA32_U_CET for each IBT-enabled thread
>    (PATCH 2,5)
> 2. Back up the WAIT_FOR_ENDBR bit across signal handling (PATCH 3,4)
> 3. Provide a way for usermode to enable it (PATCH 5)
> 
> This builds on top of Yu Cheng's work, with some adaptations:
> - FRED support
> - Implemented the existing prctl(PR_CFI_*) API
> - Removed ELF parsing (can be added later)
> 
> Unresolved questions:
> - Is there a cleaner way to do the WAIT_FOR_ENDBR XSAVE fallback?
> - What to do about 'notrack jmp *rax'?
>   I leave CET_NO_TRACK_EN enabled, which weakens IBT, by enabling a jump
>   prefix that skips the ENDBR check. GCC emits it for jump tables
>   (-mcet-switch). We could introduce a PR_CFI_IBT_STRICT bit.
> - There's some obvious overlap with arch_prctl(ARCH_SHSTK_*).
>   Happy to use that API instead.

Right, I think the problem was mostly one of ABI. Various distributions
shipped with 'early' patches using an ABI that hadn't seen upstream
review much, and when it hit we went uhhh, no!

And then glibc and distros were like, but uhmm, it has to be.

So here we are :-(

Anyway, the most contentious part was the whole backwards compat bitmap
crap. When the dynamic linker composes a process of parts that support
IBT and parts that do not, you get to deal with fallout.

The IBT spec has this horrid bitmap thing to try and deal with this, and
those early patches exposed that piece of shit to userspace. Then later
patches (suggested by me) used the ARM64/BTI approach of using PROT_BTI.
We'd use a (software) page-table bit, and upon #CP consult that to see
if we should eat the trap or produce a warn/signal whatever.

I think we were near something workable there when Rick got pulled from
this and put onto something more 'important' and things just haven't
moved ever since.

Anyway, glad to see someone has time to poke at this.
