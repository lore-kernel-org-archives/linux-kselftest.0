Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F23FF3C7DEB;
	Thu, 21 May 2026 12:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779364883; cv=none; b=YdE2tbme7RxcOAdLjpwckqfxEw4u3He5Foof3lEgYFdANZHI+zrpEglqnr0e6xn/QgnjU/2CvvjN7P29YusHBbt+YGqRSPyfRYEzmZ99kuUl/1w6ckh+W1R773Tly/kL2QvEbUpdNuqobjhIM7UvbB+KS7/Q9YvJGfcJne94hgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779364883; c=relaxed/simple;
	bh=AKox+I3lfcI7F4Zd1m11OMejg4p8pbjFloWjUNceEro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UoGHaDIY3xZbX3O4RLOry6BaTqq1MeXQQWbICMIYgxfeQ21oJf16yVNAxxup8th7XRue+9N6Y46Xehh+yzxxxJvgNLFN44XA9twXfm6aizAv1+eaW+U7Chahj9oXMKYnGi5/3OmIAj/A0gCVY5/NLcaFpiATJ4rImGk9DmWXJNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=inUFKYNu; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="inUFKYNu"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 336DD35FA;
	Thu, 21 May 2026 05:01:16 -0700 (PDT)
Received: from [10.57.91.210] (unknown [10.57.91.210])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FF063F7B4;
	Thu, 21 May 2026 05:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779364881; bh=AKox+I3lfcI7F4Zd1m11OMejg4p8pbjFloWjUNceEro=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=inUFKYNuwBXm2ITxleIMuYo8OlLrBV5ZX56ZvsglK23uoBnzOYxGy9jglFtf9Xwj6
	 iaasWDrS0c/gjMrHsajAiSmp3i935puDPddekm5/K2wexEFlnAwtnKpkMjmDCKW98I
	 lha84eQI3hGwv9GYba3f81qwwMQ6qV5LX6zUEQZA=
Message-ID: <c140c0da-4ad7-48ed-ad83-663ada282b14@arm.com>
Date: Thu, 21 May 2026 14:01:17 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] kselftest/arm64: Add test for atomic futex uaccess
 with POE
To: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Joey Gouly <joey.gouly@arm.com>,
 Shuah Khan <shuah@kernel.org>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260521-poe_futex-v1-0-1da286b8f9b2@arm.com>
 <20260521-poe_futex-v1-2-1da286b8f9b2@arm.com>
 <8fc7713d-6451-4f05-86cd-df833cedd94b@sirena.org.uk>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <8fc7713d-6451-4f05-86cd-df833cedd94b@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/05/2026 13:22, Mark Brown wrote:
> On Thu, May 21, 2026 at 10:42:31AM +0100, Kevin Brodsky wrote:
>
>> Add a new test to ensure that atomic futex uaccess succeeds on
>> memory mapped with a non-default POIndex/pkey.
>> +	ptr = mmap(NULL, size, PROT_READ | PROT_WRITE,
>> +		   MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>> +	ASSERT_NE(ptr, MAP_FAILED);
> Doesn't matter while there's only one test but we should probably
> munmap() this when we're done.

Fair enough, I was being lazy :) A pkey_free() is also in order to be
comprehensive, another wrapper to add. I considered using
../../mm/pkey-helpers.h but helpers there aren't implemented inline...
Maybe refactoring for later.

- Kevin
