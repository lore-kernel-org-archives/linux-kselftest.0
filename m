Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23E712F8E98;
	Tue, 30 Jun 2026 15:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782832244; cv=none; b=fifNcf0Ahu2Wdfuqw5wfa1rVH/cbrOT6EPc8pKOT3ikpG9OgXYx3Eci2k2oTiatnMrPlpBObw8rhkZJ4T9ODqryt0XvjKZTWifQhi5QsoHXVZcP9svvXLhEO74qBMPbAYu0Rh1yPEov6TivVGNFVs6dO7BOWggrAJaqKnsc+8Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782832244; c=relaxed/simple;
	bh=IJN8GCa75tXNOusahS2SS6FLKbmYA/g4TDhS1/Bnexs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r91qeY0AnnUge0EOT1SB9Wr5BI2XbOEaLwfU39mY4jbdhY8peRdjTx8mdv2CBdn9CRvNHwLXcGGsnknue9870ifMQSWUdLuKH93hFY26RD1luVphqVpBU1SS1kd/ZX8b9hvgs4GVHww5R6NQxLOEDb1DWx9nRzZvbotP/OF7fz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.arm.com; spf=pass smtp.mailfrom=foss.arm.com; dkim=pass (1024-bit key) header.d=foss.arm.com header.i=@foss.arm.com header.b=N4rTq1+X; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foss.arm.com header.i=@foss.arm.com header.b="N4rTq1+X"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2599E2F27;
	Tue, 30 Jun 2026 08:10:38 -0700 (PDT)
Received: from [10.211.55.246] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EEB233F66F;
	Tue, 30 Jun 2026 08:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=foss.arm.com; s=main;
	t=1782832242; bh=IJN8GCa75tXNOusahS2SS6FLKbmYA/g4TDhS1/Bnexs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N4rTq1+XJ5MZWK5epRjs6xByi4TTG70VNWthnJlC8jJwI278e2E1e/fm+cNZq3Pft
	 L/NAG87p9H2OJSj9kmTzGAcN40zWWlYJEdxtMCi/744noD9aXOZHYMM0wOHhVMN+iZ
	 WtxMPaMyFplX6WXbGMItHU3P+/VcJG1TikDZ00+Q=
Message-ID: <9e3ca6bd-bd05-40b3-9b6f-85552009537a@foss.arm.com>
Date: Mon, 29 Jun 2026 12:09:27 -0500
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
 <67e700c8bed2e082efaf68de33ee2c46d16033f3.camel@intel.com>
Content-Language: en-US
From: Bill Roberts <bill.roberts@foss.arm.com>
In-Reply-To: <67e700c8bed2e082efaf68de33ee2c46d16033f3.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/29/26 4:46 PM, Edgecombe, Rick P wrote:
> On Mon, 2026-06-15 at 14:51 -0500, Bill Roberts wrote:
>> One should not be able to use ARCH_SHSTK_UNLOCK via arch_prctl to twiddle
>> feature bits, test that this is the case.
>>
>> Signed-off-by: Bill Roberts <bill.roberts@arm.com>
>> ---
>>   tools/testing/selftests/x86/test_shadow_stack.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/tools/testing/selftests/x86/test_shadow_stack.c b/tools/testing/selftests/x86/test_shadow_stack.c
>> index 21af54d5f4ea..82a5fefa9df5 100644
>> --- a/tools/testing/selftests/x86/test_shadow_stack.c
>> +++ b/tools/testing/selftests/x86/test_shadow_stack.c
>> @@ -979,6 +979,14 @@ int main(int argc, char *argv[])
>>   {
>>   	int ret = 0;
>>   
>> +	/* test that we can't use unlock to set shadow stack */
>> +	if (!ARCH_PRCTL(ARCH_SHSTK_UNLOCK, ARCH_SHSTK_SHSTK)) {
>> +		printf("[SKIP]\tCould enable Shadow stack via UNLOCK\n");
>> +		return 1;
>> +	}
> More generally, we should not be able to use ARCH_SHSTK_UNLOCK here. Can we make
> the comment generic and not checking for a specific bug? Because it does more
> than that.

Hey Rick, not really sure how I could make the git commit message and 
the comment
more generic, as they seem really generic, can you please be more 
specific or give me
a blurb you're looking for here?

>
>> +
>> +	printf("[OK]\tCouldn't enable Shadow stack via UNLOCK\n");
>> +
>>   	if (ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_SHSTK)) {
>>   		printf("[SKIP]\tCould not enable Shadow stack\n");
>>   		return 1;
