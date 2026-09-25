Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A59B3812DB;
	Tue,  6 Oct 2026 20:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791319231; cv=none; b=qrkH6ajYKytHbmgV/eBqG3BhhE0KvwxBW6nqqS6WB9iVmDYz83HSV0Poh9CGxny+OQFmIxCsHwBYW/Ci4T4ynkU5VIRImd3efou0BFmQ8mm+TzcxDz8SEySFMsBGbUzH54kTV/YY+UqsPHK/6umXPyXrvskO97Ftm4DMfa4Qy1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791319231; c=relaxed/simple;
	bh=ky+mKliKhEVovZWz02c5m0P4qkXwqsESsKOGhrKT7Rc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k48S7fm2jpPHbwlxEebUuBOfmuEyn/yQIUWz4EbE3LE+TJew0brusq6Rj8/sifz4LzPIyZGRhS/G0TEmTfO/SEoLXKfgS+zmXy/fMhDlFLKmQ8hCNRFxj3kzsTw2aHJ1vgq6j2wWLLoQBOfWslanXX/DcxXuLYYM6MpiLFd1cV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.arm.com; spf=pass smtp.mailfrom=foss.arm.com; dkim=pass (1024-bit key) header.d=foss.arm.com header.i=@foss.arm.com header.b=S+TM+R44; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foss.arm.com header.i=@foss.arm.com header.b="S+TM+R44"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1F2B1516;
	Tue,  6 Oct 2026 13:40:24 -0700 (PDT)
Received: from [10.211.55.7] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7709F3F66F;
	Tue,  6 Oct 2026 13:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=foss.arm.com; s=main;
	t=1791319228; bh=ky+mKliKhEVovZWz02c5m0P4qkXwqsESsKOGhrKT7Rc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S+TM+R44BRJ+mIXKBODQZsUDIolThvjnEFKqYp7JbT5qr5IMiHprlR0xXUt+xEKhU
	 qmoxVe2SLNr5pJCOa279ptm38LV9WQsNndxQQs7JkroNoRlcE+3vGkWeE4eOjmGFr6
	 JJfqHphR+96jQ1fONlmXnCGY4TGdpELdGMT2QgxE=
Message-ID: <58ba1c2a-c6c3-476d-aee0-5ec7a2ed5207@foss.arm.com>
Date: Thu, 24 Sep 2026 20:55:24 -0500
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: gcs: Return -EPERM when changes are prevented
 by locking
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260910-arm64-gcs-lock-eperm-v1-0-d88e51855c9f@kernel.org>
 <asUIWgHk3hdaLEu5@arm.com> <asUQdaTtMF1X_Hsa@sirena.org.uk>
 <8c425dac-11f0-4267-8745-d23d6391a6b1@foss.arm.com>
 <asUiaocg44i8n3zA@sirena.org.uk>
Content-Language: en-US
From: Bill Roberts <bill.roberts@foss.arm.com>
In-Reply-To: <asUiaocg44i8n3zA@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/6/26 11:31 AM, Mark Brown wrote:
> On Thu, Sep 24, 2026 at 03:49:14PM -0500, Bill Roberts wrote:
>> On 10/6/26 10:15 AM, Mark Brown wrote:
>>> I was intending to do something soon to pull more of this code out into
>>> some shared place since especially for RISC-V and arm64 where they're
>>> using the prctl() rather than arch_prctl() interface so there's less
>>> reason for things to be duplicated.
>> Bear in mind that I do have patches out there, for x86 that enable prctl
>> for them as well. I looked into doing the lock check in the prctl call path
>> before
>> it gets dispatched to the arch specific backend, it does require a common
>> interface
>> into the threads feature bits that each arch would need to, trivially,
>> implement.
> Yeah, it'd be great if that could land and we could hopefully eventually
> end up with a shared interface for userspace.  We'd still need some arch
> hooks no matter what, but the userspace experience would be much more
> pleasant.
OK let me clean the patches up, and ill send em when I can. Does anyone
know how can I test the risc-v path?
