Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19583423794
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 16:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783441743; cv=none; b=kwDmqA5hyeF4ioiryzVRWyfdhf5E4E8eTQZZnlmLwfIOXYJmcWiqADd4RHLcyqoNaNguWNgq8fiQDN+bOq+v6qZoGDWKtzPwweA814MZ5/cMLWNgANaSGmVvBCSc1NRRei0ZpGHkTRvIexR9OE9NQ89cioWZKrXfQFZX4gbm6X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783441743; c=relaxed/simple;
	bh=Pp0qV7iJIGkD8ZERgGG/7U3fATFccP86iCdQdnb7Zpc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oLkx3OI9TQkl4znyfSIq9z6hmqGHA2BC5ZpQ1FoST9VevXpxPi++ggXsT50S2H/4L/kxTDua6QvS2ZYB9He/aLYn1G8vBqmaB4psjS1Y3Ch0lnFMvKJNrK/inEilYiQfAg6rEL+rF81d0s2r5iBlnNvdgExCv7hDbIafl1V5Rek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wvz2IrxG; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wvz2IrxG"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso4445068b3a.2
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 09:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783441741; x=1784046541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VJProD775f7GM7y2FjSY8FM8VOVcRqvrm4F2UEaScV0=;
        b=Wvz2IrxGPFtvzddAJipVNPs0MlqWwyhPq8trufh5nCP0xZ712kJmXrQH7mu2FHdh/A
         dOqxPvYjqiV6StT8u/Bzz59x2LbJ9KBGs1tTvBTTJkdWMj+TR1lI/QzTM0Ei8jJBJlPj
         UNn6Hy+nzpid2Apfhk4WIpQWkgPCACffBW0aNG1lYyjCJB4JTvk3FmubLCW8oNIbbO9b
         Foo7bxstQYBKWgvQtjreBdqaQsmjZEOKrR5wogH3oKGxVKVH/tHhN5S88zWLwVXhwIxM
         JGuA4/DBRxWVXW75ctQCB42zG3WuosCXg4PyJq8l2Q47H1Si+BJDt7LhVZDECBMuYFXQ
         bm+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783441741; x=1784046541;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VJProD775f7GM7y2FjSY8FM8VOVcRqvrm4F2UEaScV0=;
        b=tXvVLP7TOyiypEZ1LmM32k6NK8WFB7OqYKLU9wGZdFFbOUWK1GxwT3j1PPBeq5FCMk
         cqS9F9/M+oS6GkoJwut2wMJTKHHhHbkdYI8huGtaoSeZvrOKDqMtFU8Bq5TR0xqaKVP0
         ILpK9hVPficGETIWFh1pY9qEG90XRk1IhLUExg/QY5uzT9QYNYpxqZRKb+hBxOycNbhc
         cyr/cbdppB/x0G2Oi5dr9bnfyFAWzqLWS13VZSeUBAt+ShRBWJewbnKMAZ/Huq+E4v9L
         UHtH45RTE0wPB7aPxxjpGo3PoJ7XqQWbyFYuDSh6sZE/xonbEPsgIfLVABnuuCVWpWhd
         IhOA==
X-Forwarded-Encrypted: i=1; AHgh+Rr7Mo+QZNttkqVs0Ij5QYoTDx+g+DMn/sYcaCAXYOIs0d+D9bt3abCJZ+HbnoDzl2szeOwcwXFbZufAChDUxzE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZlBZb0S3tU0CC/y1utPJYhMpvQvcF6OrlqoYPqZJGandOV9Hi
	fEJEb5dAGI4iQsbQkSgi7nBVaQH/UakZWg/tKIdIL9kQZHGq6Q4wRqaX
X-Gm-Gg: AfdE7ckA/GUror2l+rzYTG+b2odqYZ+IpE6S84uFjKMXxE9hA/WtlQeDBdrztfHJS19
	1knFWaTbMhgYJGbvqCxuCOEfQu0o4hd1jW4+KgLYMOCPxG1st1ivraBEjC8M0SM18XjSZxpr3IM
	wP0V06N6J4zpMY/j4WTpaAaI9OUZGI2NTI+lIFB7t0pPfxM9YrRIh0pntM4aM06JtXvH2nHYHu4
	IoOzKHJ52omLg754dhWA1GgHBIYhzSQakkAevEumzLiL7z2TWCCR0g9LtwTKhj/XyAvbS7gsGtZ
	nndy7p4AKgj33aNkAt/BrNf2QaJGtOP9ZqWhsi0q+YsGL7/8pZ8h4CcxzebgMk1ZOZGl1YYU162
	htBYNJrS25mH0fpPQpRkD3jJ6VggV3uByCkOYg9exaoSs7urdQHv9AFP5fSYc42ooyR7U/rXG2h
	YiQYmJg8GgNRsp0ulNYfRO8hMn4i4h5b+P5IK+2PF3o5ys1mqHl0PmiR46sZyQpA5lPFVuZCWRv
	faJ4LXJhubCWoJx1ELRODHVNmkHnsj3FM+wTOHblI/7CuxpZ+yHUpAaS6Z/WUxUk9RW4g==
X-Received: by 2002:aa7:88ce:0:b0:845:36a0:9eb2 with SMTP id d2e1a72fcca58-84826e83e79mr5520232b3a.34.1783441741256;
        Tue, 07 Jul 2026 09:29:01 -0700 (PDT)
Received: from ?IPV6:2001:b011:2005:986c:7892:641c:1789:73b1? (2001-b011-2005-986c-7892-641c-1789-73b1.dynamic-ip6.hinet.net. [2001:b011:2005:986c:7892:641c:1789:73b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d49614sm5741332b3a.35.2026.07.07.09.28.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 09:29:00 -0700 (PDT)
Message-ID: <e51399ad-c604-47db-bee4-fa61302f59dd@gmail.com>
Date: Wed, 8 Jul 2026 00:28:58 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kselftest: cpufreq: Backup and restore governor for
 sptests
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: rafael@kernel.org, shuah@kernel.org, linux-pm@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706161430.16949-1-s921975628@gmail.com>
 <qtcyti7hqhr5sgzkhp2rt6h4kh3lfxmgjx5spi4nn7il63ckvl@woiclsimqqqh>
From: Yiwei Lin <s921975628@gmail.com>
Content-Language: en-US
In-Reply-To: <qtcyti7hqhr5sgzkhp2rt6h4kh3lfxmgjx5spi4nn7il63ckvl@woiclsimqqqh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/7/2026 1:19 PM, Viresh Kumar wrote:
> On 07-07-26, 00:14, Yiwei Lin wrote:
>> After executing cpufreq sptest, the system governor
>> will be overwritten with the governor switched
>> during the test. Restore this setting to maintain
>> consistency before and after the test.
>>
>> Signed-off-by: Yiwei Lin <s921975628@gmail.com>
>> ---
>>   tools/testing/selftests/cpufreq/governor.sh   | 21 +++++++++++++++++++
>>   .../selftests/cpufreq/special-tests.sh        | 13 ++++++++++++
>>   2 files changed, 34 insertions(+)
>>
>> diff --git a/tools/testing/selftests/cpufreq/governor.sh b/tools/testing/selftests/cpufreq/governor.sh
>> index fe37df79c0871..5d105ab9c9222 100755
>> --- a/tools/testing/selftests/cpufreq/governor.sh
>> +++ b/tools/testing/selftests/cpufreq/governor.sh
>> @@ -16,6 +16,12 @@ source cpufreq.sh
>>   CUR_GOV=
>>   CUR_FREQ=
>>   
>> +# Per-policy backup, keyed by policy so multiple policies can be saved at once
>> +# (backup_governor/restore_governor also keep CUR_GOV/CUR_FREQ for callers that
>> +# read them directly).
>> +declare -A SAVED_GOVERNORS
>> +declare -A SAVED_FREQS
>> +
>>   # Find governor's directory path
>>   # $1: policy, $2: governor
>>   find_gov_directory()
>> @@ -39,11 +45,13 @@ find_current_governor()
>>   backup_governor()
>>   {
>>   	CUR_GOV=$(find_current_governor $1)
>> +	SAVED_GOVERNORS[$1]=$CUR_GOV
>>   
>>   	printf "Governor backup done for $1: $CUR_GOV\n"
>>   
>>   	if [ $CUR_GOV == "userspace" ]; then
>>   		CUR_FREQ=$(find_current_freq $1)
>> +		SAVED_FREQS[$1]=$CUR_FREQ
>>   		printf "Governor frequency backup done for $1: $CUR_FREQ\n"
>>   	fi
>>   
>> @@ -53,11 +61,13 @@ backup_governor()
>>   # $1: policy
>>   restore_governor()
>>   {
>> +	CUR_GOV=${SAVED_GOVERNORS[$1]}
>>   	__switch_governor $1 $CUR_GOV
>>   
>>   	printf "Governor restored for $1 to $CUR_GOV\n"
>>   
>>   	if [ $CUR_GOV == "userspace" ]; then
>> +		CUR_FREQ=${SAVED_FREQS[$1]}
>>   		set_cpu_frequency $1 $CUR_FREQ
>>   		printf "Governor frequency restored for $1: $CUR_FREQ\n"
>>   	fi
>> @@ -65,6 +75,17 @@ restore_governor()
>>   	printf "\n"
>>   }
>>   
>> +# Save/restore governors for every policy at once
>> +save_all_governors()
>> +{
>> +	for_each_policy backup_governor
>> +}
>> +
>> +restore_all_governors()
>> +{
>> +	for_each_policy restore_governor
>> +}
>> +
>>   # param:
>>   # $1: policy, $2: governor
>>   __switch_governor()
>> diff --git a/tools/testing/selftests/cpufreq/special-tests.sh b/tools/testing/selftests/cpufreq/special-tests.sh
>> index 8d40505dc4682..c7eddadd047d1 100755
>> --- a/tools/testing/selftests/cpufreq/special-tests.sh
>> +++ b/tools/testing/selftests/cpufreq/special-tests.sh
>> @@ -40,7 +40,9 @@ simple_lockdep()
>>   {
>>   	printf "** Test: Running ${FUNCNAME[0]} **\n"
>>   
>> +	save_all_governors
>>   	for_each_policy __simple_lockdep
>> +	restore_all_governors
>>   }
>>   
>>   # Test 2
>> @@ -56,7 +58,10 @@ concurrent_lockdep()
>>   {
>>   	printf "** Test: Running ${FUNCNAME[0]} **\n"
>>   
>> +	save_all_governors
>>   	for_each_policy_concurrent __concurrent_lockdep
>> +	wait
>> +	restore_all_governors
>>   }
>>   
>>   # Test 3
>> @@ -68,17 +73,23 @@ quick_shuffle()
>>   		echo ondemand | sudo tee $CPUFREQROOT/policy*/scaling_governor &
>>   		echo userspace | sudo tee $CPUFREQROOT/policy*/scaling_governor &
>>   	done
>> +	wait
>>   }
>>   
>>   governor_race()
>>   {
>>   	printf "** Test: Running ${FUNCNAME[0]} **\n"
>>   
>> +	save_all_governors
>> +
>>   	# run 8 concurrent instances
>>   	for I in `seq 8`
>>   	do
>>   		quick_shuffle &
>>   	done
>> +	wait
>> +
>> +	restore_all_governors
>>   }
>>   
>>   # Test 4
>> @@ -112,5 +123,7 @@ hotplug_with_updates_cpu()
>>   
>>   hotplug_with_updates()
>>   {
>> +	save_all_governors
>>   	for_each_non_boot_cpu hotplug_with_updates_cpu
> Don't you need wait here too ?
Right. Sorry for missing that there are processes running in the 
background for sptest4. I'll submit the fix for this.
>> +	restore_all_governors
>>   }
>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
