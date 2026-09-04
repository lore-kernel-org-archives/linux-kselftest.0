Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E9931A572
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 02:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788487584; cv=none; b=Rx2ZQETqChlNqIXACV/kx14xv0uRL99j9psj4hzkgiwyQglqXSTz209htWif6psBH0kYre/8Ulh2JFhNMLtXDhyyGQN31X18+dva9BXFBnXre/CxtwItDZ1lUNNXINjSA/x+ZlFs8j8jvh/MBoaszZD8P01zkjinQsBLbzStdjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788487584; c=relaxed/simple;
	bh=gJG75J7GlO0YjOG7k2fTYlXcU+vQEavXrf5r9oSCSWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XCoGpsZodKH6YnQKTWFGPtQV76kUg0O/0PT0q7bLEwGVUFK0+4HnS3t+l6TNQbjEiU7qXkCTZoRLs6TOQC8OlW1pcWT3QkMqq5gU8SzQxMjpvLRlYG4oV7saT+LvDhp2L5SIFQfXIO4UnUv+NIad/JsCxPNoh8nZGJ/lMptq5FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=rU86bnqi; arc=none smtp.client-ip=185.125.188.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="rU86bnqi"
Received: from [192.168.1.5] (unknown [120.244.199.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id DCAE8412FA;
	Fri,  4 Sep 2026 02:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788487579;
	bh=nRuzRm0EbV3aU1vB6JTeM55TdgRZLYbX6C8/psiVzY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type;
	b=rU86bnqi6/SCcEa61xvnwEtl0m0U+Wq+1DPJ337cN65vKkiYDBALVMymatbU8oA0h
	 cV9LVbma/JWUK9JBU1UZrfc6z79z5gYl2evUAYmimL+x+snk7quTIaZdng2qLTnNsh
	 fG+9S3SPqYw4P9Gy5/n/ULF7I/pHwNMB+ClFLkYnYbLP6deWeNu1FVXzzAkapz/OmI
	 9NzdMmJLRDvdZ4fbZG3TqLj78Xd7W6IBrcofKR7vTYZFCNbXpiaTE31uW54qE0fNL3
	 XX313j2VYi9w8be2pW7UzdV3dFc8OjLxGIbMDtqepBcNDQt4PYe4QLd8IOTiC5Aim3
	 ke+mxw+IQ0kedoJFlbQL+V0/8yDEhNe+SCOQV/VGjha2yJtkI0UOx+2GxD7XuEC7OB
	 zBwiNq1mgPh9rgw7FvcffKbypsM246iTV1ElNuViocsVMKrPpLv4QHunkYC4X0NWgd
	 OBU0ixCiMRM6JuoHy1b0D1roNJKHj3W/FQbeww7Yp2MfvELVyhbUGvFJY2GxiakGCc
	 sOX8/RtRTE4AV/BQgdaG3VNV+YtnsFv7UuDyh6tBB2fEiWqXFt5D1Jq6OfwmuO9+aS
	 9cAS00su9PYetcyfucdxVSBFlcuLr3AJF3t71fw04hHmyRrPV8rwtHTnjXCjFKZf6Z
	 47fNSpwje7HE5VPf0TPxiBXs=
Message-ID: <c1d93383-aed9-4c54-8ad6-d8e3361d73a8@canonical.com>
Date: Fri, 4 Sep 2026 10:06:14 +0800
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
Content-Language: en-US
From: Hui Wang <hui.wang@canonical.com>
In-Reply-To: <9352c070-753a-428e-90b3-5293f1bf3e8b@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

The previous mail was rejected by linux-kselftest maillist because the 
html part is detected. Fixing it and re-sending the mail.

On 9/3/26 17:34, Ard Biesheuvel wrote:
>>   run_test()
>> @@ -74,7 +82,7 @@ test_create_empty()
>>   {
>>   	local file=$efivarfs_mount/$FUNCNAME-$test_guid
>>
>> -	: > $file
>> +	: 2>/dev/null > $file
>>
> Why is this needed?
The test_create_empty() will be run on read-only efivarfs, and it will 
print [PASS], but it will also print some noise message with read-only 
filesystem like:

--------------------
running test_create_empty
--------------------
$(TESTCASE_PATH)/efivarfs.sh: line 85: 
/sys/firmware/efi/efivars/test_create_empty-210be57c-9849-4fc7-a635-e6382d1aec27: 
Read-only file system
   [PASS]

This change is for suppressing the noise message and make the output 
clean like below:

--------------------
running test_create_empty
--------------------
   [PASS]

Thanks,

Hui.

