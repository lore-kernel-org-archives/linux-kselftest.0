Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A95144D6B2;
	Tue, 19 May 2026 09:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779183665; cv=none; b=l/FrVWk9M1okDi00bF2zQx3v50uHo2vMotan953XakDE20JPskPReJ8wyh9IGuC7K0HPAkuOe3n5rGhAhSpRqYJBNk8GJCnc0uWJ454Isefm3F9GvRfbU+vn1p3nkh3aaeCAU/N1vb1Y5LGtfQn8Q5zCcNLKFJXuWSUvjppg8Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779183665; c=relaxed/simple;
	bh=epAqHvfUxHc7xQN+P1+akKwtMKIULuo7YTz7c1IMk+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pgLZosDpjoJy+g48xC/olOyi4dpzC5SAJeLGWKfg30qzuEmvelGDnRAPTntgZ69PW7jmWQPu9Z2KtMzrBhWtjwWcAcMFoePIYtyuGDxjSIaMPwyCFq6syn2bjFka568/ohk+0Ha2A4rC51gSu//3ErCOxErO6My7J8gridqAWxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=cvmbVAZ7; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cvmbVAZ7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IBr9isJBV3r7AccvqIO/m5eAYif4fW4waDsioQyTz+o=; b=cvmbVAZ7kkUXGtSnMN7zJ4sSF8
	lOhYsBrEn+1om9IUc5vp0qVYM2rrmkmV59fkxoKTvJa8p9f2pKrDl9mv54y0RIiq183YWcFBaUjWh
	5wDBIik8qu7RKHoPmfK6w4L8H3mAcUlcfLHR5EyvIjKT0ooHGbzqZBpoKgPjrCDHZyolRS3ZERyDl
	901SO1xpCO0Jc41BbTbHmX+zR1t/spxC5y6HJeGVLLhckf0EA/AUb79TU9+YT0TiIvdTGVUTheTGA
	vz83Stw+krSA3tUvDeueYfp2AgjC2Hb/v6qhXDrBkiJdve8ojhSxeQzzydpx9cfTUWbdshbDKbH0Z
	lPngFMSw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGwW-0000000DjwR-0aB8;
	Tue, 19 May 2026 09:40:52 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B89F2300F47; Tue, 19 May 2026 11:40:51 +0200 (CEST)
Date: Tue, 19 May 2026 11:40:51 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Richard Patel <ripatel@wii.dev>, x86@kernel.org,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>, Kees Cook <kees@kernel.org>,
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] Usermode Indirect Branch Tracking
Message-ID: <20260519094051.GB3126523@noisy.programming.kicks-ass.net>
References: <20260517183024.16292-1-ripatel@wii.dev>
 <20260519103345.49e52ceb@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519103345.49e52ceb@pumpkin>

On Tue, May 19, 2026 at 10:33:45AM +0100, David Laight wrote:
> On Sun, 17 May 2026 13:30:17 -0500
> Richard Patel <ripatel@wii.dev> wrote:
> 
> > I was quite surprised that the Linux kernel still does not allow
> > userspace to enable x86 IBT (indirect jmp/call integrity).
> > 
> > Compilers and linkers have been emitting 'endbr64' IBT markers and ELF
> > support notes for a while now.
> > 
> > The hard work was done years ago by Intel:
> > https://lore.kernel.org/all/20210830182221.3535-1-yu-cheng.yu@intel.com/
> > 
> > In summary, usermode IBT requires 3 things:
> > 1. Set the CET_ENDBR_EN bit in MSR_IA32_U_CET for each IBT-enabled thread
> >    (PATCH 2,5)
> > 2. Back up the WAIT_FOR_ENDBR bit across signal handling (PATCH 3,4)
> > 3. Provide a way for usermode to enable it (PATCH 5)
> > 
> > This builds on top of Yu Cheng's work, with some adaptations:
> > - FRED support
> > - Implemented the existing prctl(PR_CFI_*) API
> > - Removed ELF parsing (can be added later)
> > 
> > Unresolved questions:
> > - Is there a cleaner way to do the WAIT_FOR_ENDBR XSAVE fallback?
> > - What to do about 'notrack jmp *rax'?
> >   I leave CET_NO_TRACK_EN enabled, which weakens IBT, by enabling a jump
> >   prefix that skips the ENDBR check. GCC emits it for jump tables
> >   (-mcet-switch). We could introduce a PR_CFI_IBT_STRICT bit.
> 
> Isn't using 'notrack jmp *reg' for jump tables actually more secure?
> If an attacker can write code it doesn't matter.
> The jump table in is RO memory so can't be written.
> But if there are ENDBR on all the jump table targets they become
> possibly useful code addresses to arrange to write into some RW
> function pointer table - which might be useful.

One of the many reasons the kernel is built without jump-tables.


