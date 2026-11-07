Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794055328;
	b=2U7yXNedYKkydNPoJ/XE/Y4MAtAU3vk83kdY/0aSYrz/gr/xAnDbTfAdb+DuW4AnMynK
	 Kp06UBFEjgV3YAHT+Q0y0G5E9dO8zf4A678yJEhVTBa33Z0Snm652dq/lyfGxP2xEdprT
	 9NYywf/osLzDpaOyTjcqEiTObdScpdfENXcaZ7Rp8nregm69+XDSOg3TMHuhjeu0mmLAF
	 SqkhjBJYFvOObkS4ZAga18Qejk8ltlSeKCq4XfL1nZ04ogVUSsemSJUASILs/NpZAf4K8
	 WvwZD67FeAxuZgPkZd8nvkPm0R5FS2mm+b5a9VoqAQWzNXY9flhKuGr8LPrHAeMwYrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794055328;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=cV4x1ttF2piQ+fPr0c3b26+zl31Ni+hq6coRnnOJGt4=;
	b=BYb+xUqSnh3K/KD5IraSxuz8uXqaVpDLjR9OFXFKA/SeP474RNmDQcC2RieoeINQaMen
	 n6UvyXXuibu1oWkPwAhahRgllBznMdUvr1SaW0/dIRBUqYc7Xbbj+OwAzDoJJe87kLu5w
	 gYDGZDNrO82JWDlTHNgaA9YuFUH+zCNTbYSShR7uUpBybdGMIQoiCV+tqEoJtlAgD1Dip
	 GobYOg7PS2CwT8CtWqzXZMOqtYO3pEaXTouZU57pit//HYFFBgfkgw2THVMSd3Jo4aPYG
	 W1SlAuF4NgfwUb5ReXwHmqgziOOn/6pfaBh/5Sxt8Z2Uyp5aoI5y9USlT/e4r63G3xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JgHytq8+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2159B606A326;
	Sat,  7 Nov 2026 12:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JgHytq8+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B6081F0089F;
	Sat,  7 Nov 2026 12:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794055327;
	bh=cV4x1ttF2piQ+fPr0c3b26+zl31Ni+hq6coRnnOJGt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JgHytq8+LC4i1GMMDzJWG+4RP8UfKxpwPDZIewWf+awPTc104SO/aVMbC9ViRPzj2
	 xCfq+Al+UyosK37OFtU99ywsvzo9cVlhMIa019ZVVL2rjoCqO9ZKR2oojIa8ZN2Jhi
	 aWjLJV5Y+ZKdUzXzTB5YgoHxNCGwgDCycLh7cyYV8khgxQ95Gc9iVvK2vXzDNsO30Q
	 Ulf5574S6IHrv0/6HkRvvwsW6XgpwpUgF/eCsUYgSuh/svFb4e2Lo4Fp1K8l/3z9UD
	 DhPNpCCP6XyuDFqK3mCvGX+I2wqcust+6l6qDZb6dJo4RwQ17ze2Nw1gpoq2O6SO70
	 yw9doaEZkuWQg==
Date: Sat, 7 Nov 2026 07:42:06 -0500
From: Sasha Levin <sashal@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: add CONFIG_DEBUG_FS to the config fragment
Message-ID: <au8cno0UHsD_Fxp3@laps>
References: <20261105171801.2189772-1-sashal@kernel.org>
 <179397467526.9397.17872200045070830000.b4-ty@b4>
 <20261106185218.1766376-1-sashal@kernel.org>
 <8fdcef66-3130-4c90-aecb-050ae624f42c@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <8fdcef66-3130-4c90-aecb-050ae624f42c@kernel.org>

On Fri, Nov 06, 2026 at 10:32:27PM +0100, David Hildenbrand (Arm) wrote:
>On 11/6/26 19:52, Sasha Levin wrote:
>> On Fri, 06 Nov 2026 15:17:55 +0100, David Hildenbrand wrote:
>>> [1/1] selftests/mm: add CONFIG_DEBUG_FS to the config fragment
>>>      https://git.kernel.org/mm/core/c/31ea5515
>>
>> Thanks! It looks like this one landed on both thp-7.5.misc and
>> core-7.5.misc:
>>
>>   31ea5515bf59 ("selftests/mm: add CONFIG_DEBUG_FS to the config fragment")
>>   194b63198811 ("selftests/mm: add CONFIG_DEBUG_FS to the config fragment")
>>
>> Was the thp-7.5.misc one meant to be the split_huge_page_test skip patch?
>>
>>   https://lore.kernel.org/all/20261105030242.1241448-1-sashal@kernel.org/
>
>Fixes.
>
>b4 shazam gets confused when patches are sent in reply to patches.
>
>Which is why we shouldn't do it ;)

Remember my gripe about how subsystems are starting to have more and more
custom rules around process? :p

Our docs currently say (Documentation/process/submitting-patches.rst):

	Explicit In-Reply-To headers
	----------------------------

	It can be helpful to manually add In-Reply-To: headers to a patch
	(e.g., when using ``git send-email``) to associate the patch with
	previous relevant discussion, e.g. to link a bug fix to the email with
	the bug report.

I suppose it's okay for parts of the kernel to deviate from the "standard", but
it's a bit hard to keep track of these preferences.

-- 
Thanks,
Sasha
