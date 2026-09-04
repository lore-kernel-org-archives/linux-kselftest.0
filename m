Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44E5428470
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 07:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788505713; cv=none; b=Pzljnj7IGdbkVwbzC4Y9kE3q6VJgXZi1FoiNET3YCuNBy+GljoiAIqIPe/uURyliP5htQXsNWf2q2nB3CG27NbZCCNqszuMynBz2QUe/hZZp6QDR4wdDMNDJ0zPQcirq4X1eCx9P5yUSlQ3XydPOF4ZIXLZcHh00bYNZKJSwuNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788505713; c=relaxed/simple;
	bh=NnQjpzn6CGMRD6O72dRGkPUHGjT4QxWUT9cjQpmy96g=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=NgEpMuzqdSWrKMyeOLUVMM+TN1+9xaN2fUd5GcBm55FjqVgguAMiU6DgQbhxHwikZh7d2oZiTsjqfnPLfmdNoMlqhqlNkIQlG8ZDfbc4mFbOS4leh6s0xTypPMSKt7Vr7pz3eZHewntJxbNewpGGLjqAIq1Oz/SXdLoWWoCP2S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=rTymczZb; arc=none smtp.client-ip=185.125.188.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="rTymczZb"
Received: from [192.168.1.5] (unknown [120.244.199.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 264AC40015;
	Fri,  4 Sep 2026 07:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788505707;
	bh=DYttTYfHxpoEEJlZ2AGa1sb7qtr4zgMWxVBn/4zbexg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type;
	b=rTymczZbQC5z0ujyHNbaoOO0gZnoOXmOB0y0Rol55KwvJ3J43qgCI285ZcpRMzGh/
	 nREGIma2cpoWcvxw7grVfLZVucwM4Css5prmVnFGoWXjTBVeZ6ccHNszXH8XMsVEiT
	 idckFRj/hP/07StYrxr2sm6DqX/BrwZuCsjT50aF6dFc13zW55/w3vm8OgGtujOEeM
	 AEDt1rUpOzYTHlp/vn8Esq1Z5brwSIGzF23/MYAEfOFV8Bd8jLhSwPykB4GUe+ZKYd
	 FTPSL2X6RO6lOq+Ce8nnubPHXmwwdUl+SKseLhXttUjXo6NaNAvoR0HOSBJSDNOliA
	 f0TJKqZt6EZol2fA+2QGNQ3DKjUForiCD3RDjDI3Ih4Ml8nvDEvfQOBizL8Y27WPEF
	 vDBQIgbpDFHxFn7v7rSGjMyhTEFIMfKkaEAJpyNVW1MpOLt8uGZ3wskBgwWTHEt9a+
	 owdIGVb2NUza45JUPyJnlen3LdSw7mVdS5OpAAGPzeFUoovc8jaHS5afNXpl9tROmv
	 67zHQG+6YLVomDsb6cnVYASY/uNyxraYkEVWW5SyfeVlK3mWkyJVCu2Dxva7XzhK2O
	 lWcE2jT//ZbIzJ/G+Iq9ZZkTi64TCjBT9U0ooTeKfrI3I2vVDPpil51gxHxSYvckKk
	 B87zxZIA0s0YD4r0l+ALsar8=
Message-ID: <a057f075-920f-4673-a9d0-5920a41e02a8@canonical.com>
Date: Fri, 4 Sep 2026 15:08:21 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests/efivarfs: skip write tests if efivarfs is
 mounted read-only
To: Ard Biesheuvel <ardb@kernel.org>, shuah@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, linux-kselftest@vger.kernel.org
References: <20260820030101.35982-1-hui.wang@canonical.com>
 <9352c070-753a-428e-90b3-5293f1bf3e8b@app.fastmail.com>
 <c1d93383-aed9-4c54-8ad6-d8e3361d73a8@canonical.com>
 <caf1ec53-fef7-41c0-880f-7e403a75d3e7@app.fastmail.com>
Content-Language: en-US
From: Hui Wang <hui.wang@canonical.com>
In-Reply-To: <caf1ec53-fef7-41c0-880f-7e403a75d3e7@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/4/26 14:44, Ard Biesheuvel wrote:
>
> On Fri, 4 Sep 2026, at 04:06, Hui Wang wrote:
>> The previous mail was rejected by linux-kselftest maillist because the
>> html part is detected. Fixing it and re-sending the mail.
>>
>> On 9/3/26 17:34, Ard Biesheuvel wrote:
>>>>    run_test()
>>>> @@ -74,7 +82,7 @@ test_create_empty()
>>>>    {
>>>>    	local file=$efivarfs_mount/$FUNCNAME-$test_guid
>>>>
>>>> -	: > $file
>>>> +	: 2>/dev/null > $file
>>>>
>>> Why is this needed?
>> The test_create_empty() will be run on read-only efivarfs, and it will
>> print [PASS], but it will also print some noise message with read-only
>> filesystem like:
>>
>> --------------------
>> running test_create_empty
>> --------------------
>> $(TESTCASE_PATH)/efivarfs.sh: line 85:
>> /sys/firmware/efi/efivars/test_create_empty-210be57c-9849-4fc7-a635-e6382d1aec27:
>> Read-only file system
>>     [PASS]
>>
>> This change is for suppressing the noise message and make the output
>> clean like below:
>>
>> --------------------
>> running test_create_empty
>> --------------------
>>     [PASS]
>>
> That does not make sense.
>
> If the file does not exist after attempting to create it, the test has failed.
> But I suspect that this fails even on a read-write efivarfs, given that EFI
> does not support zero-length variables.
>
> Please fix this in a separate patch, or leave it alone. Don't paper over it
> like this.

OK, got it.

Thanks.

