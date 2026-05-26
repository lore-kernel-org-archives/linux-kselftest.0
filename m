Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD301C84A6;
	Tue, 26 May 2026 15:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779809031; cv=none; b=Z0GIXoK2dJ5TB83Uap3zoojPBKhJjCG6yuv/wzgxx4J59268XGsG54E4aElE82L8gVhkG7708nWJKvtn/3ioW1gy7irEUbmh7EVVasq+Ue+93ZOhD0ua/oQh0IJeRXLJsa5Jw7tZQs9Jq5zP3zDg1xcYapn26rSRHRpmcMMd4OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779809031; c=relaxed/simple;
	bh=3e1zqRl6zwuIULkAIQGfKTuvCcLwuUU1UmQkPmbiYyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MyC3rK13LpYZVXM8LjBrUMTvo5nEExI+6R/nNvzboQyJff371jxE4w9waj3uzD8zhnCCn6DP+nMI8etWP306X1SiKMDJTVpyENfKuSbQQO8HuyAqpGi+MSUhY79l8C+gM0L3bRl3Uav4SCZQaFrxcvNSlcWeH83JXw20AS4HpCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=h+MbZAcN; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="h+MbZAcN"
Message-ID: <7b39dacb-6c4c-430a-9bc8-4d53d4f1f404@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779809026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2nMO/6+hfT/3RY3sEQzw7Qj/Aa7bcOJh/efr+qadybA=;
	b=h+MbZAcNxDO5wsXuQqSje6WXoMPIskPmshBO1G1lCShxXvRfpeMmBHejkMhiqzZN2ii8b2
	il/jgFUUkpd9QCq8eUkbs06WZ62i1L0JPFH48jaJQZDBHrg+ToqUElMvkTJzoQf5oJovvz
	kDZXNgN5UDQAdSPnUFri5Jox5ptwIFg=
Date: Tue, 26 May 2026 23:23:36 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next] selftests: net: add socat syslog for PPPoL2TP
To: Matthieu Baerts <matttbe@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-ppp@vger.kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260526014152.532505-1-qingfang.deng@linux.dev>
 <60b50562-3351-49da-ab6b-953270380314@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <60b50562-3351-49da-ab6b-953270380314@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/26/2026 4:10 PM, Matthieu Baerts wrote:
> Hi Qingfang,
> 
> On 26/05/2026 11:41, Qingfang Deng wrote:
>> As done in pppoe.sh, start socat as the syslog listener. In case the
>> test fails, dump its log to see what's going on.
> 
> (...)
> 
>> diff --git a/tools/testing/selftests/net/ppp/pppol2tp.sh b/tools/testing/selftests/net/ppp/pppol2tp.sh
>> index 5b592785f1f9..96786267ccc7 100755
>> --- a/tools/testing/selftests/net/ppp/pppol2tp.sh
>> +++ b/tools/testing/selftests/net/ppp/pppol2tp.sh
> 
> (...)
> 
>> +# Dump syslog messages if the test failed
>> +if [ "$RET" -ne 0 ]; then
> 
> This only checks for errors with the first test, not with the second one
> below. Should you create a new helper and call it here and below? Or
> only once at the end, using ${EXIT_STATUS} instead?

I'll move it to the end, thanks.

>> +	while read -r _sign _date _time len _from _to
>> +	do      len=${len##*=}
>> +		read -n "$len" -r LINE
>> +		echo "$LINE"
>> +	done < "$PPPOL2TP_LOG"
>> +fi
>> +
>>   # Recursion test
>>   RET=0
>>   # Delete route to LNS IP
> 
> Cheers,
> Matt
> 

