Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDA033374F;
	Mon,  8 Jun 2026 18:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780942319; cv=none; b=BBF4MTD+ObvRq3QDdWyUxOj+Y7JoAHo2WxezWKK1qoSN2N4zeJLfM6vXZjGKFT9XYpo4e5OEfzgSHOp5Q44Lf0sTEpfrzcVQdxGB0nHjwL1wuBPKdCu0aMiJLzqtNqEi8sF6ZCFRU3Ah2DiBmCHUbb54EqMc5kFagzVzYZshfBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780942319; c=relaxed/simple;
	bh=NIDWctcnMXHS00X5BSUXBlXTGA2u8Q+RfWHm0b2wvG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zx5/lesRiA9W/P/rNv6X1StHp/eVFfQe48D6QvEUY/IFCMwwgJ9//7O5M/coNnSoE1QGlXzYLHeSizXwO2TMYnVxCSU4qsfUBVIKWoyUgfpZBwqLQl3KKeIkDguqorTV5dfblffWMLy+PSErmJn1g9zjM1fyph8uwYkj/fIiikk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N9+AtIrL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N9+AtIrL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D1171F00893;
	Mon,  8 Jun 2026 18:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780942317;
	bh=nXMkgjQY8cbSjj7UUHQBkhIgTYx0L9j6jxNKCSfRR/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N9+AtIrLVQpdc7MYuoue+QqGfo5pWl788/MHNHc6lOM1bD+gv64RDVH+TxAKvSbxd
	 YoNHx3+wVkZZyLTaOmcRplnw41gXKBAib1vmW94Y2TNA/2Tk+WIe0N4RwfUYliKrgx
	 7MaDHa/wyLC8WjeDldPVh1plY1PRvZgTmKK1b+Hyu9Z99LjNvEwXhldXxtbaDMyLwo
	 KQlOpSqNDbXH2EMqN+/mqB4b3XjF8F469+PJCReqy6MKcmWtMuOnC4u43FzetLriwU
	 4R+NN8OPZHpInZG0LaX0/Kzam7F1FkaEYSxSscKPwloEHf7GWBAlfBF1d1TDnIKYqW
	 pTC14H2pJewFA==
Date: Mon, 8 Jun 2026 21:11:49 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, shuah@kernel.org,
	akpm@linux-foundation.org, linux-mm@kvack.org,
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	jasonmiu@google.com, linux-kernel@vger.kernel.org, corbet@lwn.net,
	ran.xiaokai@zte.com.cn, kexec@lists.infradead.org,
	pratyush@kernel.org, graf@amazon.com, rppt@kernel.org
Subject: Re: [RFC v1 0/9] kho: granular compatibility and header decoupling
Message-ID: <aicF5Sa11B4ujfSa@kernel.org>
References: <20260605033235.717351-1-pasha.tatashin@soleen.com>
 <178083348872.1648214.17778188633648887952.b4-review@b4>
 <aiVp5RlbWRz5VnPB@plex>
 <178091437240.1648214.10761111570005003901.b4-reply@b4>
 <aibYJvzQQnpoN6YW@plex>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aibYJvzQQnpoN6YW@plex>

On Mon, Jun 08, 2026 at 04:12:56PM +0000, Pasha Tatashin wrote:
> On 06-08 13:26, Mike Rapoport wrote:
> > On 2026-06-07 13:43:09+00:00, Pasha Tatashin wrote:
>
> Keeping all of that in a single KHO file is the wrong approach and goes 
> against how other logically separated subsystems in Linux are organized 
> (e.g., mm/vmap.c, mm/vmalloc.c, etc.). Yes, there are some messier 
> places in the kernel as well, but keeping this in its own dedicated 
> kho_vmalloc.c file makes complete sense to me.

Either I hallucinated or b4 ate a paragraph from my reply ;)

Regarding the code movement
- splitting radix tree makes perfect sense to me, just the documentation
  part needs more care than mechanical move
- I'm fine with abi/vmalloc.h, presuming KHOSER_PTR() is not part of it
- I can live with kho_vmalloc.c although I still consider it unnecessary
  churn
- I'm against moving vmalloc APIs from kexec_handover.h because they are
  very close in nature to folio and pages. I don't see core KHO as
  responsible for preserving physically contiguous ranges but rather as
  preserving allocations. Not sure we'll ever support kmalloc(), but still.

> However, overall enforcing the use of KHOSER is unrelated to this work. 
> I have my own thoughts on this, and perhaps with proper versioning, 
> using KHOSER_PTR everywhere would be appropriate, but let's keep that as 
> a separate work.

This is a separate work, indeed. But regardless of the versioning it's
already better than plain u64 because it provides type safety.

> > Actually FDT "compatible" handles versioning nicer than composite strings
> > You can have
> > 
> > 	compatible="kho-v4", "vmalloc-v1", "radix-v1", "block-v2";
> > 
> > and check fdt_node_check_compatible("vmalloc-v1") for vmalloc and
> > fdt_node_check_compatible("block-v2") for block.
> 
> That is actually very similar to what I am proposing—individual version 
> tokens (which in my current series are concatenated into a composite 
> compatibility string separated by ';').

Yes, you reinvented the wheel :-P

The difference between FDT-compatible and the composite strings is that the
strings are all or nothing while FDT is "any of".
But that's only a side note, we're not going to use fdt-compatible.

> But let's not get too fixated on the composite string formatting. I 
> actually really like what you are proposing: using integers for versions 
> and having each registered component carry its own "NAME" and version 
> number in the KHO FDT.

Yeah, something like that.

> Pasha

-- 
Sincerely yours,
Mike.
