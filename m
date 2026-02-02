Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705DD29B216
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Feb 2026 08:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770021527; cv=none; b=WWudqsBie2VZ9tMiGa5JXlCpRwrTqZSR4srFgIu4uE+FqDnWuvTUeTu1/r9fEgENF/kbjcg7HDcasVN9ZCeZfwCs3AZfvdVq67RQsok35eC/UJEWa+YZKBof5sSzu5dkiHNzX72BKnhjP6mvkArZrzwcA/OUjvm/rBNKD0b2sO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770021527; c=relaxed/simple;
	bh=217dCEjP4xzP6JJ/pCSzmY/4sbxNR6Nc3X2BXnsH5M4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fly6/r4wOKHw97f3dviJv4swvqnqBH35YDCxBzY0xRc/2Gw3/vkuDp6jdKOmac/ipZq4Le79IGxaJnvO7jttB4K58n5CKvKtipnpY9yFMhptH7g/Up6Zx0xAa+7BWKl2WX8xCkPD7vMu76w11la3OPOwUxGTmV9z9L7zNGiMo6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OYgd+Zwu; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gsEb/PMk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OYgd+Zwu";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="gsEb/PMk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770021524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=43FkWE7of0BopE+Cefop92t49ZPnZzlo7pONPSXSZWE=;
	b=OYgd+ZwuX/beFRjbRbbGSd1paaVlBhLBfcolPIMWN9NrW02ZmENShWOnTedWyLukVC+0he
	j9eIRcQqn+CGfHbdamn6ZpoEf2x5jRxubuymTay10dXivm1PGGj0kQK0Jc4WSazesESwnS
	C5nQaQZDx6M8MqXtbzoXj1U+UnKGniw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-V3-VtmVBMYe5UC37Gxmwug-1; Mon, 02 Feb 2026 03:38:43 -0500
X-MC-Unique: V3-VtmVBMYe5UC37Gxmwug-1
X-Mimecast-MFC-AGG-ID: V3-VtmVBMYe5UC37Gxmwug_1770021522
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4803e8b6007so31452005e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Feb 2026 00:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770021522; x=1770626322; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=43FkWE7of0BopE+Cefop92t49ZPnZzlo7pONPSXSZWE=;
        b=gsEb/PMkqxESfN5hpwDlK8M10222HU3GJnsq4Do/qAFAiG4FiiPkLHsn/pkTQfJMyF
         2IH+O2OndPIFKfgGSh8A4sHTu0dGgPwaeke8vYLSQOeUdPdmxX8YVfQyuK3xfZTYOSRy
         HMsdTGqjIL+KLzykiJNdfk58z2GoY++//M9t4Z6Qc0P/ijtz28LB6VZJ7q4z8+okkm2V
         8tQLkX2Jlo5Z/LUb7UjMVEO/0TYwKnaYnZlxaTBmW5qN/xzAJrObJ5PBoRw39pADFYmc
         hYR5iXGI9zJOo1g9AlvCepS5JBFqP9CkIETxmcFBasu0cqxhXWOTA4qmnUIEg6mZ5QHh
         Da6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770021522; x=1770626322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=43FkWE7of0BopE+Cefop92t49ZPnZzlo7pONPSXSZWE=;
        b=JvTQm0C4hRBCSOWtHoY9xHwdeKpFftcyOzRF2xtwjN6DE/gw5K6FPixmwSw9AUYcvD
         e8oggzJ/WX3fc/wi7Gx4R0jRFS5fswPO8nokE4eSBDmlWLprv4HieduuOzyadW84ZJs+
         BVEMymcvhfc5a8ttTv2FP+qqbemP2CmBIPDTj+jCnk9JfnV1HDy25ERtnYpBjkGpTa/e
         NCUN4ViZ3Og96FLoypa+CEWV+AXz+1Rkm3z+wYqS7xab8rL/AKukG1E5BsOjHbnPBeQe
         5OvDJti4m+jiTwWsLHYOeI9iHlt7tGFFoZ6Jxpffa+pe7v0q9hISuDp3Nl3hLtWljpPu
         3iFQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4aWlWYCfb7WgKCLqQSHI5f/sAjJc2QFYtYvfbF6WwE7f5+9ndzoey2Vn4G10HpCZRClsaA2uEzT74/dhDu0s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyISIFvsB0Ijsc15HPTImGrJPG5efUIKfyVx/ZOiqC1W6TnsRb4
	LgRUx8XPALp0mocN4DPdWHnrCdHyA4DSt8mvjmELvhcRP20XskrJtNpnFYHKZvdfYOnXpIqEiDA
	fYuE+wA3Czw1j3y2Jn/XLSfKepB+VgKuAuokiQktnNToKaY/d8gzwZrp3jdByldwy79aKPg==
X-Gm-Gg: AZuq6aIdHLrgoHzDnJXsLpqiL1n5fxKheNFRt5BSHfX8lUTHSMtCAHbTxSQalIyD0MT
	SyIoHl4QRn4t+PdIXxJjL5vaoM3ERliyyjL/1EmfrsRXyE73Se8vOuhwRngUjWoXLvl/QOA8n1c
	EK8gpfD+TQZcXeSvKCCRrimK4Pmwq4Afr+bSEpLiT0oVQ35jZjnkAxFsyADFPhNninfXejT9er9
	4XC1OJ/BA49fOe7GmFIvfkIsK8efanU+Qks1nSvDnNSdpaHTx5bCG+04Flw3eyEvwkws8pe+piv
	B8GYjEv1gxZoYvfISCPxwSv4UMB1vdeax/2vPF7nv08T+Riak4U5pO7cxNT1F9wC+ULIABsVvA6
	+5/A33GUa+kA=
X-Received: by 2002:a05:600c:1d23:b0:45d:d97c:236c with SMTP id 5b1f17b1804b1-482db47d46dmr127034155e9.21.1770021521850;
        Mon, 02 Feb 2026 00:38:41 -0800 (PST)
X-Received: by 2002:a05:600c:1d23:b0:45d:d97c:236c with SMTP id 5b1f17b1804b1-482db47d46dmr127033855e9.21.1770021521458;
        Mon, 02 Feb 2026 00:38:41 -0800 (PST)
Received: from [192.168.88.32] ([150.228.93.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066bee687sm673189845e9.5.2026.02.02.00.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 00:38:40 -0800 (PST)
Message-ID: <d59cb0a5-567a-4422-bd91-b85cc4130e78@redhat.com>
Date: Mon, 2 Feb 2026 09:38:36 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 2/2] selftest: net: add a test-case for encap
 segmentation after GRO
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Willem de Bruijn <willemb@google.com>,
 Richard Gobert <richardbgobert@gmail.com>, linux-kselftest@vger.kernel.org
References: <cover.1769771825.git.pabeni@redhat.com>
 <276270cf825431817e46f6744d9b26d3ea954869.1769771825.git.pabeni@redhat.com>
 <willemdebruijn.kernel.14968a7a11ed8@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <willemdebruijn.kernel.14968a7a11ed8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/1/26 11:19 PM, Willem de Bruijn wrote:
> Paolo Abeni wrote:
>> @@ -260,6 +293,38 @@ for family in 4 6; do
>>  	ip netns exec $NS_SRC $PING -q -c 1 $OL_NET$DST_NAT >/dev/null
>>  	run_test "GRO fwd over UDP tunnel" $OL_NET$DST_NAT 10 10 $OL_NET$DST
>>  	cleanup
>> +
>> +	# force segmentation and re-aggregation
>> +	create_vxlan_pair
>> +	ip netns exec "$NS_DST" ethtool -K veth"$DST" generic-receive-offload on
>> +	ip netns exec "$NS_SRC" ethtool -K veth"$SRC" tso off
>> +	ip -n "$NS_SRC" link set dev veth"$SRC" mtu 1430
>> +
>> +	# forward to a 2nd veth pair
>> +	ip -n "$NS_DST" link add br0 type bridge
>> +	ip -n "$NS_DST" link set dev veth"$DST" master br0
>> +
>> +	# segment the aggregates TSO packet, without csum offload
>> +	ip -n "$NS_DST" link add veth_segment type veth peer veth_rx
>> +	for FEATURE in tso tx-udp-segmentation tx-checksumming; do
>> +		ip netns exec "$NS_DST" ethtool -K veth_segment "$FEATURE" off
>> +	done
> 
> fwiw, tx off will disable all the dependent tx offloads too

Going over the features in this order is intentional to prevent ethtool
from emitting messages about the additional features disabled by
tx-checksumming.

>> +	ip -n "$NS_DST" link set dev veth_segment master br0 up
>> +	ip -n "$NS_DST" link set dev br0 up
>> +	ip -n "$NS_DST" link set dev veth_rx up
>> +
>> +	# move the lower layer IP in the last added veth
>> +	for ADDR in "$BM_NET_V4$DST/24" "$BM_NET_V6$DST/64"; do
>> +		# the dad argument will let iproute emit a unharmfull warning
> 
> unimportant but minor typo: unharmful. Also above aggregates -> aggregated

These ones were not intentional :)

> 
>> +		# with ipv4 addresses
>> +		ip -n "$NS_DST" addr del dev veth"$DST" "$ADDR" \
>> +			nodad 2>/dev/null
> 
> nodad probably only matters on add?

uhm... yes, left-over from c&p.

There is no rush, let me send a v2 addressing the above. Thanks!

Paolo

