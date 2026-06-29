Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20BF12DA757;
	Tue, 30 Jun 2026 15:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782832470; cv=none; b=jfJZuics1OLgv1UF+XyovNE0ofiWkQMM7yN8cKakFPcRHqLis+hYrllVaWaPmTjsl5xhufO6UqY3ZIU0frwIwGcY2VN7qZ9lDA9iF2tjBit5LyiPFs/uifgRAKjQ/iMmls1dghmvkngRLTv7mzxKu8pIC2DLr8Jex6IROH8jS8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782832470; c=relaxed/simple;
	bh=FdbsM7DLT/KQFNdmUTDhKkITX2+Dd51rJOY1UzdzqRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NZLSDWga0gphsjZA8aiA+0vuJrckr5rNEW/p1AgS0AnVCFzXGIyw1g0XgtLPF80wD5dAQlcId1UOivtNeP5Lmdd9+iuG6ND3I6XG8KBad3WfryzV3E83q4wx2ZAzTkXQLXOU8gRoyMix5QJN3ETLywpD2F9c6qOlXWi90Ob3z5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.arm.com; spf=pass smtp.mailfrom=foss.arm.com; dkim=pass (1024-bit key) header.d=foss.arm.com header.i=@foss.arm.com header.b=R2LS44Ny; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foss.arm.com header.i=@foss.arm.com header.b="R2LS44Ny"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4200D2F27;
	Tue, 30 Jun 2026 08:14:24 -0700 (PDT)
Received: from [10.211.55.246] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 04E913F66F;
	Tue, 30 Jun 2026 08:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=foss.arm.com; s=main;
	t=1782832468; bh=FdbsM7DLT/KQFNdmUTDhKkITX2+Dd51rJOY1UzdzqRI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R2LS44NyaxfcvwA0lqU6A4+WLq+krC+5PlN+2wNHJFHyHTKdYyCKfLFrwwZW7a5CO
	 L52rxALNvmOYxZqgI3EvNZii6bJoatpESO+KA5wvmjdsA/56cvxchOQU/hSkYkb4on
	 FRuqRM3V/uAyFr93lu+67FPA87LJwrP8ZqOuE2Qg=
Message-ID: <e581f92d-8b5b-4b07-af88-464bea6a9fd0@foss.arm.com>
Date: Mon, 29 Jun 2026 12:13:36 -0500
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] selftest/x86: test ARCH_SHSTK_UNLOCK
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "x86@kernel.org" <x86@kernel.org>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "shuah@kernel.org" <shuah@kernel.org>, "mingo@redhat.com"
 <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
 "tglx@kernel.org" <tglx@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
References: <20260615195156.257950-1-bill.roberts@arm.com>
 <20260615195156.257950-2-bill.roberts@arm.com>
 <a16de9370b4ff397c4f006b402afad353e28f4bf.camel@intel.com>
Content-Language: en-US
From: Bill Roberts <bill.roberts@foss.arm.com>
In-Reply-To: <a16de9370b4ff397c4f006b402afad353e28f4bf.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/29/26 4:57 PM, Edgecombe, Rick P wrote:
> On Mon, 2026-06-15 at 14:51 -0500, Bill Roberts wrote:
>> +	/* test that we can't use unlock to set shadow stack */
>> +	if (!ARCH_PRCTL(ARCH_SHSTK_UNLOCK, ARCH_SHSTK_SHSTK)) {
>> +		printf("[SKIP]\tCould enable Shadow stack via UNLOCK\n");
> Should it be a FAIL? And if this path is taken the test will crash because
> shadow stack got accidentally enabled and we can't return from this function. It
> can "goto out" and disable shadow stack before returning.

Yeah Rick, we can do that, not sure why I didn't do that in V1 :-p

>> +		return 1;
>> +	}
>> +
>> +	printf("[OK]\tCouldn't enable Shadow stack via UNLOCK\n");
>> +
