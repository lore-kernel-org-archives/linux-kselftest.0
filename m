Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A4834753C;
	Mon, 23 Mar 2026 19:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774295007; cv=none; b=MRASc3h6tRIT5dajXR5Q0gfgoeGWY9nPgU12BZDJiiarsV6e8S38ibGdZTacsT7fZwlnL5wEPI/rK4F9W9sG8/OMia05stcOfYip9OHKjXBPhIV/9X4OZcow4Us5sXV5MD9hdg2HcXeAd6cKC/ylao8QKeBqTjk52b4ARTs0J4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774295007; c=relaxed/simple;
	bh=bPxTwrQvPmZF7zlHtcE/MnVVENNisuIIsLLmAyCGS9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=olQzVo9Lf64wAIpN4XUDFLx0WiH1wg1Wv6XnreCars7KFT6lJEEn/k4WFNrIhgxmlAWaRwH4i7Y6hlUciDcd3pgko1xH/HFvCJs5xvFP9fRT7XdURFiYr1wS0wg8V23/6iJ+HTjnDQ4VvNP7caeJjN0knuR17aywA1loPgD7u/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=I9eEhS/A; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="I9eEhS/A"
Received: from [172.27.2.41] (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 62NJBDbH3010886
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 23 Mar 2026 12:11:13 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 62NJBDbH3010886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1774293074;
	bh=p2bI4B4/nnLxAFUx2pczg5PYw4esGnznXnAB/JRNjh8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I9eEhS/ASrMI6u5tNoSOC99KIE5N0POfWDNztMLKhPc3RoCaiqkjyrbivD6Wws3VC
	 JbxlAONKxpQZrFnjGWZo3O8fOwwKcUv6sGDp1oukA/H6N2C6/MZ4oImc58LPgFBHrk
	 SRZOUCuw7wOPVhtgyjhh+SUJPi0NfheWm3avivsmrWwUOfuFt2t+yll3Mp5RiSHlsH
	 IlZueMXFs8soM/0OyJLtuv4Rxj6pzegDsDIOTIceMJtVSPCAb6gpZs4U9iHFpT8yym
	 LHfW5x2+294YM4H9AGxZ35q5HCxDN4CxcvJHg0Nx15lJFIdlcveDAs8MIqXfe1Sxjt
	 zHSW2G2bDYhKQ==
Message-ID: <ce764071-6670-41a2-923a-88f1cd04b238@zytor.com>
Date: Mon, 23 Mar 2026 12:11:07 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/x86: Fix sysret_rip assertion failure on FRED
 systems
To: "Lai, Yi" <yi1.lai@linux.intel.com>, Xin Li <xin@zytor.com>
Cc: Dave Hansen <dave.hansen@intel.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>, yi1.lai@intel.com,
        bp@alien8.de, dave.hansen@linux.intel.com,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        luto@kernel.org, mingo@redhat.com, shuah@kernel.org, tglx@kernel.org,
        x86@kernel.org
References: <c6c2ad7c-c307-4e8b-b2de-55e807f2c41f@intel.com>
 <43f2c5c2-6327-4546-b204-5c66b704042e@citrix.com>
 <568aa6c4-6802-4eb5-b412-e3aa93ed9b29@intel.com>
 <91590BC4-A54E-40F4-A223-A07FBA386A9A@zytor.com>
 <acDYXtVgSKbbAuGs@ly-workstation>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <acDYXtVgSKbbAuGs@ly-workstation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-03-22 23:06, Lai, Yi wrote:
> 
> Thanks for the context and links, Xin.
> 
> My patch is a simple, focused fix to unblock current regression in
> 'sysret_rip'. The goal is just to ensure it doesn't falsely fail on FRED
> systems by skipping the IDT assertion (R11==RFLAGS). 
> 
> Checking Ammar's patch series, it indeed looks like a more comprehensive
> solution that not only handles the difference but also adds specific
> test coverage for consistency. Is there a specific reason it didn't
> land in the mainline kernel? If you think that is the preferred
> direction, I would be happy to contribute to that effort
> collaboratively.
> 

So for what it's worth, I have used this sequence to probe for FRED, but it is
basically probing for the effect you are truing to test for here:

#include <inttypes.h>
#include <stdbool.h>
#include <linux/unistd.h>

bool fred_is_on(void)
{
	const uint64_t sentinel1 = 0xfeedfacedeadbeef;
	const uint64_t sentinel2 = 0xbeeffeeb1ef00d1e;

	register uint64_t rax asm("rax") = __NR_getppid;
	register uint64_t rcx asm("rcx") = sentinel1;
	register uint64_t r11 asm("r11") = sentinel2;

	asm volatile("syscall" : "+r" (rax), "+r" (rcx), "+r" (r11));

	return !((rcx ^ sentinel1) | (r11 ^ sentinel2));
}

	-hpa

