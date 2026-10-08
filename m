Received: from mail-108-mta182.mxroute.com (mail-108-mta182.mxroute.com [136.175.108.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9E133122A
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 22:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791499994; cv=none; b=CKMinAIcn9IayO7NyyV0HQAaxhnfoaddHClUxSFPnyTDO000BjJrsfWREacuHbDwm5LIVA32a6znSRGHsnJjxQ/H6uptrIx36Eu4vLkzVZTaMlL4bA/rRwbMhbycmEszXsNw7D0MH0a3jBuwRDed3I1MOjZganU+YCSrRz8jK4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791499994; c=relaxed/simple;
	bh=Tewqs+3mxTOPi5xQ3CRQVUmoa49UdmviF7M5Ytl4S3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MjqLCguHcW/uLeEJz95K7DvfG4eJXvtVMpHeCjHxXySgQawSujvOpHHSHgULUVC/meaMWM5jxj1GAFtVJsfAIwxh57R2w96ecH6/TDEvq2DR6U/K2O2LfG8L834OQ3D5usPAX4/gvNshuBah47Dwj05KCll0VJfPRe2GPxAFzcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b=qYGO9A3c; arc=none smtp.client-ip=136.175.108.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b="qYGO9A3c"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta182.mxroute.com (ZoneMTA) with ESMTPSA id 1a11db3bab300128b2.00a
 for <linux-kselftest@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 08 Oct 2026 22:48:00 +0000
X-Zone-Loop: ca108f699d39b8fc4c9ef03674c057c03757ee80c3ad
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc
	:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=rPlFkPqk5r54yRG9oU9wRGAKBm27HiIlHGZ2VN8Qelk=; b=qYGO9A3c7jMhRNcNL6nCxjWvox
	alaOYWV7hntjsoYiabEiKgkgWBG1lXhadqAzKeCHKKNfGOMA/FRnR7opv3slkcWuJEl5ssSDY7KaM
	mOh7vKO0k2TisXw9ix2BGNDSadxTE/3ejxgxIWyfohPvF7KLi7Id3as/wrWiXZU7l66EPKEyiYqhZ
	vMLesC5OplSgyvwBfi45WUB52FLV79V3qVsUe4+PhDBUx4E3E0MdakPRczCIVy40Cp/HdnE+gfnWk
	xVTDnr6ddR5QdzktpnlNBIq6/SeDKm9UcX/bHePY29RuL4cR4l4F53DeSafV5Xtnhelg+jvCkDHVb
	qiIpVKnA==;
Date: Thu, 8 Oct 2026 22:47:49 +0000
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
Message-ID: <asgdlclj3MgtGrSp@wii.dev>
References: <20261008201610.1003569-1-ripatel@wii.dev>
 <20261008201610.1003569-2-ripatel@wii.dev>
 <e1a26ac75c39673d043b2860f848827fecbcb843.camel@intel.com>
 <asgQDlpnDwu04oZc@wii.dev>
 <6deab6fec99c65408a19b9036d67ce7f1fab54b5.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6deab6fec99c65408a19b9036d67ce7f1fab54b5.camel@intel.com>
X-Authenticated-Id: ripatel@wii.dev

On Thu, Oct 08, 2026 at 10:34:02PM +0000, Edgecombe, Rick P wrote:
> On Thu, 2026-10-08 at 21:50 +0000, Richard Patel wrote:
> > > How can it defeat protection? If doesn't process the shadow stack sigframe
> > > at
> > > all, leaving the SSP where ever it was originally. What am I missing?
> > 
> > The selftest demonstrates that 'int $0x80' rt_sigreturn from 64-bit mode
> > jumps to an arbitrary %eip in the signal frame (zero-extended to %rip), \
> > whereas the 'syscall' variant raises SIGSEGV if %rip is corrupt.
> > 
> 
> It should just be restoring the SSP from the shadow stack signal frame. Perhaps
> you saw the syscall variant fail because it was not at the restorer. Since you
> are manually calling sigreturn instead of returning normally. So then it was was
> not at the shadow stack signal frame and the shadow stack signal check thought
> it was a forged SSP. And the 32 bit one succeed because there was nothing
> checked.
> 
> But that doesn't have to do with checking EIP matches where the signal was
> generated?

I see now, sorry. Yes, I misread the code, and assumed the signal frame
has a matching shadow stack entry that includes the RIP check.

> > I don't think it matters that SSP is still at the old place. It would
> > only break 'ret' after sigreturn, but the problem is that the sigreturn
> > itself is a wild jump.
> > 
> > "defeat protection" was badly worded, I just meant that the 'syscall'
> > path has protections that the 'int $0x80' path doesn't have, so I
> > thought it'd be worth fixing.
> > 
> > I might be missing something, maybe SHSTK never intended to defend
> > against a wild sigreturn? Either way, it's not a security thing.
> 
> Hmm, I guess its kind of on the line between forward edge and backwards edge. I
> see your point.
> 
> But today setting EIP to an arbitrary point is fairly easy. But even in a future
> case of IBT enabled, shadow stack would still need enhancements for the normal
> 64 bit runtime to prevent this. 

What do you think of creating a shadow stack frame on signal delivery
and popping that on sigreturn? I suppose that would need siglongjmp
modifications and probably break CRIU. :(

I wonder if there are real apps that abuse sigreturn as a forward edge.
If so, they should not be advertising their DSO as shstk-compatible.

> In the past we discussed hashing some amount of the sigframe and putting it on
> the shadow stack to give some sigframe integrity. But this runs the risk of
> breaking apps so would need to be an opt-in enhancement.

Yes that seems a bit excessive to me. At least, the 64-bit path protects
against obviously forged signal frames, so maybe there is still a case
for the patch?

-- Richard
