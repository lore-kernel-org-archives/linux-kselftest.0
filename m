Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793385548;
	b=yY4wb3k7o9WC9g5X5ft/1yypHymCdz9/D4ycZVHLOKnuI5tVZPE5bpxuxvrpUw8hJs9Y
	 O8KAE+P3of9jEl9AVUAiWpxi3c5ZU2l2MDKPvSfst1FR/gn9TQvpFJqBUWhtZpEz/66Ng
	 uw+X/QPSDdoKOP5LFrgVQ/nq2esfBUOIemdqzTzpbhgqmyDXMnry2G3g16NrSbML1+yQs
	 wXKXsMF2yNPrCnkqsamzRCarXs8yRzFwdMun3uH4e8ktvevRt9OipOF6fxOe+1KKhyxn0
	 wqYU/gvzv+VDAkobppqEMIQwrNBhv+IsQOew+5Kk0rx9HqbQZpQcdm8DUnGNDUvbeag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793385548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=cM+BvkDxP8fM78hQZg5AYrn5YUAQx7WN9vYLoZ70OUo=;
	b=FbJb2etzIwWB1iKZQJ9RgFg8LuDleqerMLaKRi5b6xovkMURt5ZsnTAHu9Ap4o6Xsgqp
	 9RzqkEf6OC5L64yDs5SgGsbain8Wstp+uM4Y9CbHceNRk+WuSrhgeKb3YnMAltjfpb5Rc
	 2e/WRMiTndZPreeTg7MKoZxKgy8JIA3dtF2Z5PhD3YT0WHg3Tm/59UmSpMNG95sU/9uQQ
	 Sb5mJ19T1uQlFfhPsCoS4hVovIkpDM6fCu8Rc/8SRpcnfu8sr1k2SfjoYnj4TvAyb3go1
	 DHP8/2ZUPo/WNPqWjTIYrzkLIZoH24O3XtL+PBnUt4a2zy7XfQS4ylImKxe6k1CPwcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t0jDxw+g;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF99606A31A
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 18:39:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EF99606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t0jDxw+g
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a3c08d6928so1338460c88.0
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 11:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793385547; x=1793990347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cM+BvkDxP8fM78hQZg5AYrn5YUAQx7WN9vYLoZ70OUo=;
        b=t0jDxw+gwG9FlkDiEEVKvJaGAMnA0fNNcq4vgNLzqnEQ0wgefhM8hHDjvJHbU4urig
         ZK/LbzZbDDXFxa5we+5dvRUq34ibd/Er8cHs3w5LD2Cc6ZnLoMubT9It4w7KF20N5xY4
         itU//CqLRqBco9eTk66evHlYiF0s7qxOhR8cm1Js5PMWBoAT6KS6LYbAl1EKBW2is0IB
         1hvxsNSEXCXS+Cf5IZsGZWIoongcTVYTGGsIJ+KrgT8eDM+Ylb29+k0yvtbpGPAGwrAl
         SDQVoEbP+vAn4gtgCUB0JeUzIR99YqVXZTy+YbU0AQ8TI2VqBAgGqI1Cof9PYQGgOwLA
         D4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793385547; x=1793990347;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cM+BvkDxP8fM78hQZg5AYrn5YUAQx7WN9vYLoZ70OUo=;
        b=snM7/pulzTnIA2mOJ0omiJwwG/Pn/7wzzJUTeP+vkrYnbfEwaTWB6TVT2aEAQmYDWb
         lAWWaN1rytPdCTLy9TPXhIOVVXk6lrvRwWtL9l9aaqeil371EZQajoLK4in1ffoaS4Q/
         vI5V84XMkn223HM9vzeetEkle/hp1MF2Blj2+mhH4tQ7IZ6NhuHP72BBK3/aQ8P9Jjz9
         09kuhj/C+eQ2xL4hQb8hqjGINRejZMd4cmExMlSMY4g28kCHh4XPch1et1sMHo7L5wgI
         dNSmVmSsgX/pAbeL4iMNkaBB6pdPT1giPT1gSj8zSwh0P1iPiHRcARzBZA5MMMVG5Dr/
         hv9w==
X-Gm-Message-State: AFq9FYKBS9pFIrDKwreUVFTIZI4Ub9YKa+B0+JjtfUoJKyrcXa37gJ33
	9/gBPW1xjQUVMIzjPbEg/6eGqpxuKc2qYh2cddqdLQDfb07SMCSQrXt6
X-Gm-Gg: AYBFou1mjWw8Ve3ox8Y2mEZsdeXumVJo3jh9zxXGXUjQlEY/Zpv1CpRleaaiTx1p9zR
	2pewJ6/fA7MSAryKqdbQtad+h/P9JuZS+J3QNFuJb+Fx+V+Z4wzeV0GpEBQCmUdjEfUElFbC8FG
	q4lovmUIDL7E5IYW+CQacXnUsw6QFANdmfc+07E4k+mU5944nooBfm0k90kFpEOgThaHvtfxe5F
	2MPj7rO7IgQDnBsFKm4WK1aUllJyXnjbga8pwldxbZFBZLztSpe5uBsJ10d6swhK4VmvrVJJWeh
	A3aUmZhGPHgvrTJlaqI/GK+OusTjuzt+Jsb28qmJvU9jxhzHrdm1hOCBwRdpMNgmzY4I2DQnRmB
	wZFXP5Xms+Ow8+EBeI39Gm4svftGDOjLqoL9nUlC6xeMdz+s6/P+HToThMDRxSO+94IOkloNuZB
	+R/p5cXyWJUMax8GsSKj5bPRfsWgu5wbEMix07l9NXq4cZKrKxSnz+gLDcurgJd7O1tUKgdGPiG
	GLXow82LoHGJqVlF2JZMjdq8GDEemcYD0ZmJubNNcBX72EXQQH6yNXoiVanqZ0c6ynM9XoPA9MV
	LUC/hhhbPyWViycwJZbxcm+LySFgDpoCNz/9NELoLDGvsAN2MqQoPs3q9STHRXuNaoBvsB8LXUJ
	s
X-Received: by 2002:a05:701b:4213:10b0:1a4:fac9:aeee with SMTP id a92af1059eb24-1ac56d95c0amr4153882c88.4.1793385547176;
        Fri, 30 Oct 2026 11:39:07 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1151:15:c56:221b:35d5:85f? ([2620:10d:c090:500::4:2e7d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac194b5437sm9886300c88.13.2026.10.30.11.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 11:39:06 -0700 (PDT)
Message-ID: <7cd99851-5bc0-4db8-a44c-a664c3f824b1@gmail.com>
Date: Fri, 30 Oct 2026 11:39:05 -0700
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] selftests: drv-net: pause: Skip support tests without
 link autonegotiation
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org
References: <20261030173516.1002250-1-mohsin.bashr@gmail.com>
 <701c6f7e-e715-4647-bddf-48a1485afbe2@bootlin.com>
Content-Language: en-US
From: Mohsin Bashir <mohsin.bashr@gmail.com>
In-Reply-To: <701c6f7e-e715-4647-bddf-48a1485afbe2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/30/26 10:54 AM, Maxime Chevallier wrote:
> Hi,
> 
> On 10/30/26 18:35, Mohsin Bashir wrote:
>> From: Mohsin Bashir <hmohsin@meta.com>
>>
>> Devices without link autonegotiation support may reject both link-setting
>> requests in pause_test_support(). On fbnic, all four variants then fail
>> in cleanup when the deferred restore of unchanged link settings returns
>> EOPNOTSUPP. Removing the restore alone would report PASS without running
>> any pause checks.
>>
>> Fix this by calling require_link_autoneg() before pause_setup() to skip
>> the test when either interface lacks link autonegotiation support. This
>> also skips devices that support only forced link configuration.
>>
>> The issue was observed in the fbnic CI/CD pipeline. It was reproduced and
>> the fix was tested on a local fbnic device.
>>
>> Fixes: cbd8a536cd6d ("selftests: drv-net: Introduce a selftest for ethtool flow control")
>> Signed-off-by: Mohsin Bashir <hmohsin@meta.com>
>> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
>> ---
>>   tools/testing/selftests/drivers/net/hw/pause.py | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/tools/testing/selftests/drivers/net/hw/pause.py b/tools/testing/selftests/drivers/net/hw/pause.py
>> index ca4a55e59c30..1537f88e0e77 100755
>> --- a/tools/testing/selftests/drivers/net/hw/pause.py
>> +++ b/tools/testing/selftests/drivers/net/hw/pause.py
>> @@ -466,6 +466,7 @@ def pause_test_support(cfg, pauseparams):
>>       supported fields.
>>       """
>>   
>> +    require_link_autoneg(cfg)
> 
> This helper checks if the remote supports aneg too, so it's too restrictive.
> 
> The goal of this test is to check the local device's behaviour, without too
> much dependencies on the remote, so that we can at least have it test some of
> the local driver behaviour even when it's connected to a dumb remote or a switch.
> 

Right, it may be too restrictive however cleanup handling is still 
required on both interfaces even when the DUT accepts the configuration 
and runs its checks, the remote can reject the deferred restore and fail 
the test. Ideally, this test should not depend on remote config in the 
first place.

> Maybe the sane thing to do is to allows the defer() calls in pause_setup() to
> fail silently with "fail=False" ?
> 

IMO using fail=False would also suppress genuine restoration errors when 
settings actually changed and can leaving the interface in an unexpected 
configuration. No?


> Or maybe a bit more clever, have a quick check to see if the device accepts
> an ethtool -s XXX command ? looks like fbnic will refuse all of'em as it
> doesn't have a .set_link_ksettings.
> 

Yes, checking whether the DUT accepts ethtool -s is one options. We 
could reuse the existing autonegotiated and forced-link attempts, and 
report SKIP if neither allows pause checks to run. Alternatively, we can 
add a remote arg to require_link_autoneg(), default to True, and pass 
False for this test so it checks only the DUT’s autonegotiation support.
