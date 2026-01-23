Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4666E2C15BA;
	Fri, 23 Jan 2026 08:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769156409; cv=none; b=uo/I1fACgj8gu2qzx5M8Pzz40/GQmFiVN7mxKsH8HJE+MBk6z57dHFVJe8ntIEK7+9tXKC3l0o36cGYIZmof0R3V13rT1krIo7LDrLWF6y7bAJFPlOacC1un5FgGHydj8KfSpmHZdfNOSxhOEUU+WLECWJw3CW8vyi0DcUzc8D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769156409; c=relaxed/simple;
	bh=0deuW28KSaoWy7PTKK5okwioX4S3riFCZfOsngN3MNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N5seMRqdOQd5VPCUrQi8IESQEwmyLHUNVVjnuU5vDALVBc+0B+rMb0WonogpIGKuVucfioaEIxXhvWeVetnLpRbs2D35exPsQPkCXEVU9dRtS3QASszwztBN0S5018z96+Bi9X1i/DVpuyhoL0ZrmPssS52919/55U5wxN46OI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0834F1476;
	Fri, 23 Jan 2026 00:20:01 -0800 (PST)
Received: from [10.57.50.81] (unknown [10.57.50.81])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85DAF3F740;
	Fri, 23 Jan 2026 00:20:05 -0800 (PST)
Message-ID: <2f84676e-e0c5-4355-9276-b275c75938ce@arm.com>
Date: Fri, 23 Jan 2026 09:20:03 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] selftests/mm: check that FORCE_READ() succeeded
To: Usama Anjum <usama.anjum@foss.arm.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Mark Brown
 <broonie@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Shuah Khan <shuah@kernel.org>
References: <20260122170224.4056513-1-kevin.brodsky@arm.com>
 <20260122170224.4056513-6-kevin.brodsky@arm.com>
 <ab021f50-60c9-4d5c-99a0-255ead6e2288@foss.arm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <ab021f50-60c9-4d5c-99a0-255ead6e2288@foss.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/01/2026 18:36, Usama Anjum wrote:
>> +static bool populate_page_checked(char *addr)
>> +{
>> +    bool ret;
>> +
>> +    FORCE_READ(*addr);
>> +    ret = pagemap_is_populated(pagemap_fd, addr);
> Very useful. Maybe extending FORCE_READ can help the entire suite?

I considered it but one needs to have a pagemap fd around, so we'd have
to open it for every test that uses the helper. Maybe such check is not
so essential either (see David's reply).

- Kevin
