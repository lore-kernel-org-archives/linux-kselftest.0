Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285DA4D9548;
	Thu, 15 Oct 2026 12:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792068625; cv=none; b=sxJ/FSEaAPvPbdxdeSXlV642PUUDbINajx0/lrcUToYxWV1y+nDvVtGzoJz9zI5dPO12V6JsAukTTGYnQpbwQLZtxr70CEj5ysyfDwyGl3mL1/tbeXe/Zv1ucP/jK+9vBR+iVdyFhWi881MkPRjXN5nDCbP0jA2KTioDJqjFtYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792068625; c=relaxed/simple;
	bh=SEpgzntgEPHRuXvcdui6euMbJyEw+3T8hDjcZn1B+gA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z6yRK3cFS8ikWD70G6b2zxLWvUj5QdNKlK5Qjlsb6X2IY2PYnEjow2GQzwXuLtYvHpw7zsgXDO4UQdSWGRHkg3kSVFfVAL4xXhUAIVDnDLiarpg/xRLnxbFaVxyo/PTPM08nnN/5zNSDUnL7TN5NVmOWbpLTLWqODucSaPU8vEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dWzPLxc9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dWzPLxc9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AD471F000C4;
	Thu, 15 Oct 2026 12:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792068624;
	bh=7Uuv8oceQ5V16SKxprCAkG9sIZe7FyXEiMnVrbqOp6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dWzPLxc9NQjdkysD/upQJDiHcjxi2Jsn8Rts1ELBMd0oE7adXWYHG2ta4n+CWHeWt
	 2T2HhmCuCWrfareXUveGJpyf4exzODx+B20sl1x4vZAnJzaRGnzWG+znmFJ1ryYVph
	 Wj8WTa/7KxzIReHWBXIYSdAsDd53Nzy4cgeTe4YZHKOK05ACs2NLiUY8tHaYFxybk7
	 30PfG5nU9vvoUGYuChw95G/3Y6QYt0E7eKTInhau7qN+u3fwc5wjrxhk1TpZi/J3Vt
	 PO/8td+TkeundvyMSGWO1HbrFbHxOHRbk2zia2VrJq9/adrei6OCKy+kGc4iRcF618
	 /Tr/JZgTo/fQA==
Date: Thu, 15 Oct 2026 13:50:18 +0100
From: Will Deacon <will@kernel.org>
To: Koba Ko <kobak@nvidia.com>
Cc: Breno Leitao <leitao@debian.org>, catalin.marinas@arm.com,
	robh@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	fenghuay@nvidia.com, tdave@nvidia.com, kaihengf@nvidia.com,
	rupakr@nvidia.com, mohammedk@nvidia.com
Subject: Re: [RFC PATCH v2 1/3] arm64: add CPU prefetch and cache modulation
 sysfs interface
Message-ID: <atDMCsj4yVnwhocf@willie-the-truck>
References: <20260825181701.3-1-kobak@nvidia.com>
 <20260825181701.3-2-kobak@nvidia.com>
 <aru9Rf7BzW3-vcm0@willie-the-truck>
 <20261014061745.40032-1-kobak@nvidia.com>
 <as9HWuAhOGMfH1Ty@gmail.com>
 <179206734688.387067.11244555739178101423@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179206734688.387067.11244555739178101423@nvidia.com>

On Thu, Oct 15, 2026 at 08:29:06PM +0800, Koba Ko wrote:
> Thanks for explaining the rebase, rollout and debugging costs of carrying
> this out of tree. That's useful context from someone using the patchset.
> 
> CONFIG_EXPERT plus tainting on use could make experimental use more
> explicit. Those safeguards alone would not establish that firmware
> access, virtualization and runtime register updates are handled safely;
> the local restrictions still need validation against the hardware and
> firmware requirements.
> 
> I'd like to hear Will's view on whether this opt-in approach could be
> acceptable in principle, and what requirements it would need to meet.
> I'm not planning to submit v3.

No, this isn't something we should be maintaining in the upstream kernel
and if we take this then we'll suddenly grow a zoo full of this stuff.

If Nvidia has imp-def controls that they believe are useful to expose to
userspace, then I suggest working with Arm to get something architectural
that we can support across different pieces of hardware and which would
integrate properly with the rest of the architecture (including things
like virtualisation and debug).

Will
