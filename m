Received: from mail-108-mta185.mxroute.com (mail-108-mta185.mxroute.com [136.175.108.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8137B364EB2
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 23:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791502482; cv=none; b=pcfyN5WHF+xhCQhq0UOJp+C7I9eUWnhR24Aij6JmiCsKRVYEXWP8BwwSKuH8DgckDK4w1xhutMDJBquQ/RcDpn3+xn3glDoAhTOI/rmGk3BOM7n1d3wfdXmZYQGcAeWuiVrRlZon+hNq01yV+qprBbBaSnhBJjabj8vGYk1T5GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791502482; c=relaxed/simple;
	bh=Jml+hzCinC+mK0nigKPvQH66XyJt2EgUCilcNIGlf4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=opr007mo9YvDn1H7LilQJ1oR7E8XMz6Hk/InrhikF3XS1N/Mkpzgui7rdRKBs80FjCo7Bex8/W2NJF3jT8AjlH5sNBpSopZS+F4RkyBpVhDJtJEejeOv7u9NMALuOhv/00/ZXjoYVvXQtA1xIkfTA4d49wpvCqA+MZ1XHxJlTNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b=tuAOQ0OF; arc=none smtp.client-ip=136.175.108.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b="tuAOQ0OF"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta185.mxroute.com (ZoneMTA) with ESMTPSA id 1a11dd9ad3b00028b2.00a
 for <linux-kselftest@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 08 Oct 2026 23:29:27 +0000
X-Zone-Loop: 66dec502cdcd90e5fc59e4114ac1268abdd66b35a6e0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc
	:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=23+ZhvGSrfv+9UjXuR54FKKvpMz+PAsmhJMU+SA7Fx0=; b=tuAOQ0OFa5rSxbnawpvQgsDlxi
	SRJnRQaa71rC8Du8yBOrxMXTyCNQNIgDHZWIydlKikbPeMeNPJq22+3yXKiDeCHx5PzWlppIFHo6A
	uBWA/HLFsR0GzEy1SQRmA/mmZtr3J0r+YYQT0qdT6bZlm+qSrdgf4j44FRRa3E6FKlJUh7pCFOWrL
	4qEdcm0NcahsQgan+nq2XWK9FP0le0CPFtV5Q68r97z65+D/9hIC42uLdiqfPU6dn7YRBb8Z2GX4L
	PzEH8aQJ1qElw77xGjOnOxim3xgqiN16ZVf7Ug2CmGFu1xFgilAJpzXl+Xg32C1esM3eIqFo+3FqN
	7Q6VY3fQ==;
Date: Thu, 8 Oct 2026 23:29:19 +0000
From: Richard Patel <ripatel@wii.dev>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "kees@kernel.org" <kees@kernel.org>, "x86@kernel.org" <x86@kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>, "tglx@kernel.org" <tglx@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH 1/3] x86/shstk: ban ia32 sigreturn when shadow stack is
 enabled
Message-ID: <asgnT3mSOGZ4HIlX@wii.dev>
References: <20261008201610.1003569-1-ripatel@wii.dev>
 <20261008201610.1003569-2-ripatel@wii.dev>
 <e1a26ac75c39673d043b2860f848827fecbcb843.camel@intel.com>
 <asgQDlpnDwu04oZc@wii.dev>
 <6deab6fec99c65408a19b9036d67ce7f1fab54b5.camel@intel.com>
 <asgdlclj3MgtGrSp@wii.dev>
 <f78ade122593ecdd686ec1b29340b0124b925c48.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f78ade122593ecdd686ec1b29340b0124b925c48.camel@intel.com>
X-Authenticated-Id: ripatel@wii.dev

On Thu, Oct 08, 2026 at 11:11:41PM +0000, Edgecombe, Rick P wrote:
> On Thu, 2026-10-08 at 22:47 +0000, Richard Patel wrote:
> > On Thu, Oct 08, 2026 at 10:34:02PM +0000, Edgecombe, Rick P wrote: 
> > > But today setting EIP to an arbitrary point is fairly easy. But even in a
> > > future
> > > case of IBT enabled, shadow stack would still need enhancements for the
> > > normal
> > > 64 bit runtime to prevent this. 
> > 
> > What do you think of creating a shadow stack frame on signal delivery
> > and popping that on sigreturn? I suppose that would need siglongjmp
> > modifications and probably break CRIU. :(
> 
> Yes I didn't know they did not parse the shadow stack signal frame
> appropriately. That is unfortunate. But we can still evolve the shadow stack ABI
> by adding new modes to the enable prctl if we want.

Will send libgcc and CRIU patches for this.

> > I wonder if there are real apps that abuse sigreturn as a forward edge.
> > If so, they should not be advertising their DSO as shstk-compatible.
> 
> The wishes from the glibc/distro side were to support as many apps as possible.
> The other way would be to create a more locked down mode where developers need
> to carefully verify their apps.

I'll have an AI scan through all Debian repo sources to see if anyone
is doing naughty sigreturns. Even if so, if we evolve the user shstk
ABI, it might be worth breaking that (via opt-in arch_prctl), if it
helps with security.

> > > In the past we discussed hashing some amount of the sigframe and putting it
> > > on
> > > the shadow stack to give some sigframe integrity. But this runs the risk of
> > > breaking apps so would need to be an opt-in enhancement.
> > 
> > Yes that seems a bit excessive to me. At least, the 64-bit path protects
> > against obviously forged signal frames, so maybe there is still a case
> > for the patch?
> 
> For the 32 bit signal blocking patch? I'm not sure why on the security grounds.
> I think it depends on how much we want to deflect ia32 mischief vs just ignore
> it.
> 
> To me it is a cost/benefit thing. Having to think through which syscalls matter
> was the point of blocking 32 bit runtime in the first place, so this evaluation
> seems too high on the cost. If we do anything more, it should be another small
> and complete thing. Like blocking all 32 bit syscalls.

Conceptually, I think shadow stack should authenticate all return
addresses placed on the stack. %rip in the signal frame is a return
address for any non-crazy use, but it's not authenticated. And IMHO that
should be fixed.

Unfortunately my patches fall short of plugging that gap, so I agree
they don't have a security benefit.

I'm eager to fix it and authenticate sigreturn rip, provided you think
it's worth doing.

Cheers,
-- Richard
