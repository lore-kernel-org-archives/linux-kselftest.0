Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5813624AA
	for <linux-kselftest@vger.kernel.org>; Tue,  5 May 2026 13:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987712; cv=none; b=t4+AoYuPOjtuH5xAAkOHpXH+cMRX3GeadC0etZDrkwQqjA5bR3SUYScKqSpSoMDFAR4Fd89ffgZ8xiLlOC+rx/1rMfGj+p3zQ9Bb2sQq5fpcTg2juOVfUXUXpG86hiHEoGK/qlXVGEVCZivvGu6LxYFeX1x/jyCjoCgFG930svg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987712; c=relaxed/simple;
	bh=x5TgU5SBySfoeXKBw0QL6h3y9dq2clju9sczVk0IMPQ=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qPtWsVYS99WJ0aopm4Qp6K70Eb3UZ22apUuJyCUxoxreLA9JttOmJzVs4JbElQob4X52+MzoTc4QVefbmn9DmKTm6bHRNu0g6OnasNXWjHyqa1ktcfmdDb2vUuEULsG0fTct5Tw2mqcSbCISzMK1QR2o57B2mdXehtc5FB35lkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-bc1f3a393c0so296751666b.0
        for <linux-kselftest@vger.kernel.org>; Tue, 05 May 2026 06:28:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777987710; x=1778592510;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCXgMseI2sOZrSwXLdW2jyT6y6fLj2BxLcRv5Mj/3pc=;
        b=YrcRLEFTxUyBGBvM6Fn/IDr4kb3TbAbwA2yHuN4XFW7MHov3MvE4Kka3bt+XEcSG5J
         TGWBObfWi9guXDryDd3y7tzwZIlUFTNLgly1NJBwhmuQpGIXTQMKrujKFTx37FmKsKAr
         0YhDqmWk2pJ6R+CIe5qgA6PrEaTGoSrRPyOh763J+25Onwz07x9CxG/RIorGbpr83Kpk
         1dDrSX2B/KNKLc0UNmjqklv1wGU8VXDPgYqNw3MrtolW3slGP9XXYKmXsuZgsbB1uNuw
         9DajKcYfXC/WWB51M4v93QXXMWP4swDKNH8HmXRcJNQtIuCM2z1y76kkXex/z9CtfNV6
         We8Q==
X-Forwarded-Encrypted: i=1; AFNElJ9Zfi4KWtTYRMSWL1iTO5R8pFt52pPFJkjFl893EHdR9kkYwX4yy5zZkKuaZ0oPjvVRBNq88QMcFYYlFvx2XyU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN/zi4SJFanc36M6TqVbDp9/WmuOQxMhpIL4A6x5j5TVERzv08
	BV4D8JpJrRN4gsi6q2GLeQjpGDw8ZClOC3r2G4ONcK8+AUceCuowVm1C
X-Gm-Gg: AeBDievG/S39dU9yqUQB9jV7ZHWLfUfSWD/9RgLPqQwcUQgqzsh2V3aBxh8N+f3pvUE
	LvAiUq13JDJCi8INeGTaQvd1Nemk4nk0Fp0MJEZfbmJhslk8wS6RP7qTu2G9az+og8whuuoHxez
	QYSVHGcdVs7gwmUjPQ+O5p4QYwbAfwR65tIycu3o4djJW+KVOOjq6OueG8Ba2UVyqEqcKUPUQnW
	cEWgSKVZOvwtShi3wfntpLNmEZ2YnpQovmwLarBJQkQq87sbKwl9kYYyv5GxcKf7tKdm7iruRmx
	WvMJ/UCAT2EhFQ0zC1QkTlIBtuPDRxNegAdIfmfn4ntLlCHCishnIw40glXuJFBjI7FH2ZK0ML1
	Hj/OOOu4VsfNWFQ/BDCBeMNBT2Ohj7C+upGCgJpaJ2mMM9xAv9MINNeVR6JRKxsvO7kiIP2BVvg
	y5aMh+rNATFGtbUJH5MPHIbSYNSGgXbE9q5qopdCEKyjbirId89jIMIMt+ihAqwHtAFw==
X-Received: by 2002:a17:906:eec1:b0:ba8:28de:697 with SMTP id a640c23a62f3a-bbff8ed484fmr782134566b.9.1777987709601;
        Tue, 05 May 2026 06:28:29 -0700 (PDT)
Received: from [192.168.88.241] (37-48-40-237.nat.epc.tmcz.cz. [37.48.40.237])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc17f1eea7asm263903966b.58.2026.05.05.06.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 06:28:29 -0700 (PDT)
Message-ID: <aa08ff00-ba0d-4f1f-a85d-8afc2c6fd11f@ovn.org>
Date: Tue, 5 May 2026 15:28:27 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: i.maximets@ovn.org, Aaron Conole <aconole@redhat.com>,
 Eelco Chaudron <echaudro@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Yuan Tan <tanyuan98@outlook.com>,
 Yang Yang <n05ec@lzu.edu.cn>, dev@openvswitch.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v2 2/2] selftests: openvswitch: add tests for tunnel
 vport refcounting
To: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org
References: <20260430233848.440994-1-i.maximets@ovn.org>
 <20260430233848.440994-3-i.maximets@ovn.org>
 <0f5da49c-7ed6-4547-9f89-bb3c3d62c3c3@redhat.com>
Content-Language: en-US
From: Ilya Maximets <i.maximets@ovn.org>
Autocrypt: addr=i.maximets@ovn.org; keydata=
 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
In-Reply-To: <0f5da49c-7ed6-4547-9f89-bb3c3d62c3c3@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/5/26 3:25 PM, Paolo Abeni wrote:
> On 5/1/26 1:38 AM, Ilya Maximets wrote:
>> @@ -830,6 +831,42 @@ test_tunnel_metadata() {
>>  	return 0
>>  }
>>  
>> +test_tunnel_refcount() {
>> +	sbxname="test_tunnel_refcount"
>> +	sbx_add "${sbxname}" || return 1
>> +
>> +	ovs_sbx "${sbxname}" ip netns add trefns || return 1
>> +	on_exit "ovs_sbx ${sbxname} ip netns del trefns"
>> +
>> +	for tun_type in gre vxlan geneve; do
>> +		info "testing ${tun_type} tunnel vport refcount"
>> +
>> +		ovs_sbx "${sbxname}" ip netns exec trefns \
>> +			python3 $ovs_base/ovs-dpctl.py \
>> +			add-dp dp-${tun_type} || return 1
>> +
>> +		ovs_sbx "${sbxname}" ip netns exec trefns \
>> +			python3 $ovs_base/ovs-dpctl.py \
>> +			add-if --no-lwt -t ${tun_type} \
>> +			dp-${tun_type} ovs-${tun_type}0 || return 1
>> +
>> +		ovs_wait ip -netns trefns link show \
>> +			ovs-${tun_type}0 >/dev/null 2>&1 || return 1
>> +
>> +		info "deleting dp - may hang if reference counting is broken"
>> +		ovs_sbx "${sbxname}" ip netns exec trefns \
>> +			python3 $ovs_base/ovs-dpctl.py \
>> +			del-dp dp-${tun_type} &
>> +
>> +		dev_removed() {
>> +			! ip -netns trefns link show "$1" >/dev/null 2>&1
>> +		}
>> +		ovs_wait dev_removed dp-${tun_type} || return 1
>> +		ovs_wait dev_removed ovs-${tun_type}0 || return 1
> 
> FTR, here sashiko laments that if the reference counting is broken and
> the del-dp process hangs, this could leave the background del-dp python
> process running indefinitely.
> 
> I guess that if reference counting is broken inside the kernel, very
> likely an host/VM reboot is needed, and the above does not matter.

Yes, I have a note about that in the cover letter.
