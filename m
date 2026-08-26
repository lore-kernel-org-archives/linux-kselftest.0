Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A1903126AD;
	Wed, 26 Aug 2026 08:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787732742; cv=none; b=XrZbZiaN+0BgoFDBm07aLEuL3jaDny8vBX/oOm8zdOW4ZIYgDm1iIoet9ID6NXISwffN4V/K+YikG4NT6Gq7xIZ4s6WqHdU3Pf4QV5ETgWIqcDhzIY1V7kK2loJNQrw+kl96nKYp4ee3dov1hE8sTNmkOGG3Qvua3304i20OMgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787732742; c=relaxed/simple;
	bh=/qvgTJwV6a7RRKEJGCn6RmbAbGidDAJ61ncdiy0rFi4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GSViqmEye3KkkHJXpBmG4egS9/WFCafO6WvozzVuUhwqin82lzu3wpmreURhGP3IePTzRzqxr3JzS/uKuZf867Kzx4G+0yrRNCLug4qHmylldT+S6J3jSuM+XU7VwNjUzvfB6AXqohhn0yHBJjx2Aedwy7AMWnlR+/v8B5Tl+BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=HDkya+zA; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="HDkya+zA"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CE8F176A;
	Wed, 26 Aug 2026 01:25:34 -0700 (PDT)
Received: from [192.168.7.252] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F4943F7D8;
	Wed, 26 Aug 2026 01:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787732737; bh=/qvgTJwV6a7RRKEJGCn6RmbAbGidDAJ61ncdiy0rFi4=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=HDkya+zAwu96qjyLCBT76C8TraqshnqO1tEjhNXtSxSVo5V5pnS25KF/gYiMQb4h+
	 OopT5ac07dH7QZkmqP1jKpEf21NULxDv8sZhyPX9ssLcDqHcgaBhi/5yUnjIYAz43K
	 fBmerG1MszKb/tvOhOGuxgqwVlAf0FPPkYtraF3E=
Message-ID: <fe6096b4-d906-4c1e-aeb3-7ca5cd164cab@arm.com>
Date: Wed, 26 Aug 2026 09:25:35 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] selftests/arm64: Print missing MTE TAP headers
To: Muhammad Usama Anjum <usama.anjum@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Amit Daniel Kachhap <amit.kachhap@arm.com>, Yeoreum Yun
 <yeoreum.yun@arm.com>, Mark Brown <broonie@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
References: <20260825111929.2882324-1-usama.anjum@arm.com>
 <20260825111929.2882324-2-usama.anjum@arm.com>
Content-Language: en-GB
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20260825111929.2882324-2-usama.anjum@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 25/08/2026 12:18, Muhammad Usama Anjum wrote:
> Most MTE tests set a TAP plan and emit results without first printing
> the TAP version header. Direct execution therefore starts with a plan
> such as "1..20" instead of "TAP version 13".
> 
> The problem is particularly visible in the GCR_EL1 context-switch test.
> It prints its plan before forking 1,024 child processes. When stdout is
> fully buffered, the plan remains in the stdio buffer. Each child inherits
> the pending "1..1" line and flushes its copy from exit(), producing
> repeated plan lines.
> 
> ksft_print_header() prints the TAP header and enables line buffering.
> Call it in every MTE test that is missing it. In the GCR_EL1 test, call
> it before the plan so the plan is flushed before the children are
> forked. In the remaining tests, call it before setup and prerequisite
> checks so early failures and whole-test skips also retain the header.
> 
> Fixes: 29f080881601 ("kselftest/arm64: check GCR_EL1 after context switch")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

...
