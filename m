Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1017351C3D;
	Tue,  9 Jun 2026 14:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781015614; cv=none; b=VvPN4CcNGNEq2xDxqMGVtCMFihMdQXNGjBB2tAUrzA7oc7gEWztAVCdprJNaWYzW/T6RqZPCmUg8Q66ujXBE/vW93P4fuMCyDUuNjWT1S5dPgZTArvXaDIrQCB4qvF3mGDgajJPQYaYX8oRtVQlmrTZMamdtyXG4IcLOYT7sYLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781015614; c=relaxed/simple;
	bh=ORW/2GpIPRkAHzBFyJq9/xzqQrVB0ifakLjJK8Gpntg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JJEfGcxTae52pDrtMcrDafA+DkwQF4izJjUWj2z0iMYnmxlMEXF66hju57Vvq60/JWfWKu+K9q+8m7A3ca/oXaysEdY5oFbrMKymrai7mpBVyJNf9+lHmvRL0I6KUXFknIkcLy40cbOI2vLc8ZyIHXYu3N/bcyD+uxfR0mrIbco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jR6h5cLR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jR6h5cLR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4439C1F00893;
	Tue,  9 Jun 2026 14:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781015612;
	bh=yAwQzCcKV6xIGEtBzqxQ3COTqDOfT90qmmiQBuBzWZU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=jR6h5cLRTujiltPSm689nN920+3X6yo5OD4R884+TkTANE/D6veFgcNFK8J9g6K2Z
	 OK4at4p99jOAG8zdRm8aWzewXlItlUeUEUh4JkkNSplo/jRskZZ7h9b8BE80utgoTy
	 bLGqLeqXxHFzP92wW/MtMiSWEXdUaJPdXhHOz2+E+Ay4Hm8rGEzjykfbW2yqIX1ItT
	 DXJ1F54Fyvux8kMJiS9ZauKV9V5vnjHC4ZC7fKP1PnC/Ht0w1fWeGT4xRMewWcwo5e
	 xK4sOtVyJOp8m4bnjyXthx/HCjrBBH6toZ87zTvyau3Fy/kYJFCwBdBOKl2G/rEO9B
	 +BP2y6GDEmaMA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Mike Rapoport <rppt@kernel.org>,  linux-kselftest@vger.kernel.org,
  shuah@kernel.org,  akpm@linux-foundation.org,  linux-mm@kvack.org,
  skhan@linuxfoundation.org,  linux-doc@vger.kernel.org,
  jasonmiu@google.com,  linux-kernel@vger.kernel.org,  corbet@lwn.net,
  ran.xiaokai@zte.com.cn,  kexec@lists.infradead.org,  pratyush@kernel.org,
  graf@amazon.com
Subject: Re: [RFC v1 0/9] kho: granular compatibility and header decoupling
In-Reply-To: <aidnjw5pH_z45gJT@plex> (Pasha Tatashin's message of "Tue, 9 Jun
	2026 01:14:53 +0000")
References: <20260605033235.717351-1-pasha.tatashin@soleen.com>
	<178083348872.1648214.17778188633648887952.b4-review@b4>
	<aiVp5RlbWRz5VnPB@plex>
	<178091437240.1648214.10761111570005003901.b4-reply@b4>
	<aibYJvzQQnpoN6YW@plex> <aicF5Sa11B4ujfSa@kernel.org>
	<aidnjw5pH_z45gJT@plex>
Date: Tue, 09 Jun 2026 16:33:28 +0200
Message-ID: <2vxzjys7ss07.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jun 09 2026, Pasha Tatashin wrote:

> On 06-08 21:11, Mike Rapoport wrote:
>> On Mon, Jun 08, 2026 at 04:12:56PM +0000, Pasha Tatashin wrote:
>> > On 06-08 13:26, Mike Rapoport wrote:
>> > > On 2026-06-07 13:43:09+00:00, Pasha Tatashin wrote:
>> >
>> > Keeping all of that in a single KHO file is the wrong approach and goes 
>> > against how other logically separated subsystems in Linux are organized 
>> > (e.g., mm/vmap.c, mm/vmalloc.c, etc.). Yes, there are some messier 
>> > places in the kernel as well, but keeping this in its own dedicated 
>> > kho_vmalloc.c file makes complete sense to me.
>> 
>> Either I hallucinated or b4 ate a paragraph from my reply ;)
>> 
>> Regarding the code movement
>> - splitting radix tree makes perfect sense to me, just the documentation
>>   part needs more care than mechanical move

+1, separating radix and KHO block makes sense.

>
> Agreed. I'll also pay closer attention to the documentation.
>
>> - I'm fine with abi/vmalloc.h, presuming KHOSER_PTR() is not part of it
>
> Yes, I will move KHOSER_PTR() to the shared compat.h in v2 so it's not 
> tied to vmalloc.
>
>> - I can live with kho_vmalloc.c although I still consider it unnecessary
>>   churn
>
> Appreciate it.
>
>> - I'm against moving vmalloc APIs from kexec_handover.h because they are
>>   very close in nature to folio and pages. I don't see core KHO as
>>   responsible for preserving physically contiguous ranges but rather as
>>   preserving allocations. Not sure we'll ever support kmalloc(), but still.

FWIW, I agree with Mike here. I also see kho_preserve_vmalloc() as a
memory preservation primitive, same as kho_preserve_folio() or
kho_preserve_pages(). So I think it belongs in the main KHO header.

I also think it would also be nice to have vmalloc in kexec_handover.c,
but I can live with either way.

>
> That is a very reasonable compromise. I am fine with keeping the 
> consumer-facing function declarations in kexec_handover.h so they remain 
> grouped  with folios and pages.
>
>> > However, overall enforcing the use of KHOSER is unrelated to this work. 
>> > I have my own thoughts on this, and perhaps with proper versioning, 
>> > using KHOSER_PTR everywhere would be appropriate, but let's keep that as 
>> > a separate work.
>> 
>> This is a separate work, indeed. But regardless of the versioning it's
>> already better than plain u64 because it provides type safety.

It would be even nicer to have some sort of type safety for KHO vmalloc.
On preservation and restore, you lose the the type of the array, and it
is very easy to make mistakes. I gave it a try some time ago but
unfortunately couldn't come up with anything good.

-- 
Regards,
Pratyush Yadav
