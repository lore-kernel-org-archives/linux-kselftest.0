Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3682C27A91D;
	Mon, 18 May 2026 19:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779132696; cv=none; b=ruB9p6kWFuDcfgQYZ3cCR7jl5wU2k0AHD3hci06nw1DxyUWiA51yElLF10Fa8tkd+mBdIKY/Fw1wFbX6jJ5WEMM2yf4PngyurhkIhm/LTIy0yYI2aRRp3pkM8YNgytvCRrf8BauKGn6K7vMrdfo6U0ecp4VU5xiX4S7m+hW8c3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779132696; c=relaxed/simple;
	bh=BFd2gJFhKogGG53wnUuzmHIf4nW8pYMh1iiJsM1I0UE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ug98/q8lV/xcPfHZenqadkwr84q/ieyqYPy3Xi1U3gwJl1bIIXcCp8z6Hjhq7XRdxR28nIBCZoo+B3iiDS73F/x1k2JY2n65s37UEZSaGNbCfbe8mSVvqUiY7BusfMkff38nx3+T/AhVavJ8UVXobY7wZE2PHzaBPxNWwmHehA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=RmnbWcfI; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="RmnbWcfI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BsLSd1tOIIWQS1HqVtDZP6GYUFhp+ReP+urPRlZEi4c=; b=RmnbWcfIY2ovyHC1O18ybYN3p2
	Th6Jxcjxq/CyVYQZmIzFu5Hnd//s0Sl3//d32tBqhz1g+l8gilSeo/Veb6tG7R8uIMWrje7Nc+aM9
	vTMyZl2h1oPCZ0nyKAsSBUgpd7VrQ/+Gxidrfr+/akfcSwZPCNRpRjWOEGZ1chip8PsjFjR8rpnxz
	3QRs+K7LxY4HahpGgadGPrvBWxtZ5yxThT894U8ikjtDxgHXw1QuGnYhMeankMNDNl/I0/Yg/0nm1
	QBm11StuTn+jcbgKKAz8MLi0q4jetxawoOGgryOiDkpJJp2wOOACbF8JJ045OBP0NmR4HGatbcTcd
	ACi17hug==;
Received: from 2001-1c00-8d85-4b00-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:4b00:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3gQ-000000055Es-1TYV;
	Mon, 18 May 2026 19:31:24 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id EDB3F300182; Mon, 18 May 2026 21:31:20 +0200 (CEST)
Date: Mon, 18 May 2026 21:31:20 +0200
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
Message-ID: <20260518193120.GX3126523@noisy.programming.kicks-ass.net>
References: <20260517183024.16292-1-ripatel@wii.dev>
 <20260518073616.GQ3102624@noisy.programming.kicks-ass.net>
 <ags9hFcExPnQlu8V@wii.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ags9hFcExPnQlu8V@wii.dev>


+ Florian

On Mon, May 18, 2026 at 04:25:40PM +0000, Richard Patel wrote:
> On Mon, May 18, 2026 at 09:36:16AM +0200, Peter Zijlstra wrote:
> > Anyway, the most contentious part was the whole backwards compat bitmap
> > crap. When the dynamic linker composes a process of parts that support
> > IBT and parts that do not, you get to deal with fallout.
> 
> Is it acceptable to do all-or-nothing IBT first? And then do a second
> round of patches with legacy support?
> 
> Until then, ld.so could:
> - start with IBT, disable it upon loading incompatible DSO
> - allow users to manually lock IBT
> 
> I thought this weak form of IBT is better than nothing at all, if
> there's a risk that legacy support derails things.

That wholly depends on how much churn glibc people are willing to put up
with. Added Florian to answer some of that.

> Btw, apparently OpenBSD enforces kernel+user IBT. I think the end goal
> is a user_ibt=force command-line param that locks IBT for all processes
> on startup.
> 
> > The IBT spec has this horrid bitmap thing to try and deal with this, and
> > those early patches exposed that piece of shit to userspace. Then later
> > patches (suggested by me) used the ARM64/BTI approach of using PROT_BTI.
> > We'd use a (software) page-table bit, and upon #CP consult that to see
> > if we should eat the trap or produce a warn/signal whatever.
> 
> Nice, I'm happy to revive/rebase/test any of this if there's interest.
> 
> > I think we were near something workable there when Rick got pulled from
> > this and put onto something more 'important' and things just haven't
> > moved ever since.
> > 
> > Anyway, glad to see someone has time to poke at this.
> 
> Happy to spend whatever time is needed to land IBT. I'm very glad the
> first reaction wasn't "absolutely no way" :-)

Yeah, its just something that fell between the cracks :/

