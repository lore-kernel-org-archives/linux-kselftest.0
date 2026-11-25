Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600046;
	b=v1aQ4GcfDgzzHGKA6RrUePfYv31NvdiO72QtEwXJw8v1/mChsuaCrL2CE+igFhuykJkr
	 TRj7zzc50bSdGS9kKNNn1lJDsgo/u+ws0AVNFxxExKJv5Bk/2Ql9hn0RogvwdfwFclY+N
	 mf6xYq3My0jeDVTiNurTftZfpmS8L3Ljgr+Vym7FI3YaM2r4yKZtW5cVySy7Ahf6fZDdm
	 9Z9zMq2Sl+L4IZJ6U15UbZaUXnoFy4GjMJJ7jJJZY5vyJiD7bfq2F082TCP+xiuhOfvjY
	 wtVgzzK69RHYUj0ST6+KhqD7rg3BvBq1VLN7LFe4nLXNA7StC/ZKfTcroh3tEvPNEEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600046;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=WkQtg4o+HEohpzTCn9QEYPwbpcKVcB7YKdwlB0VCIcs=;
	b=Bz5JJ87yvVs63TT+etDb1bafAH/lWd92A4pbzXXlCHe6OcsPjIvLAPRt9pHkqZWXe8Ho
	 Tp+drjLK2AvKEe2MVLC69Ay8Obwg0X/VZ254x4nYEz6Ke+19J9hyVzt2R6mb2w8LsjLFv
	 TmyUTOzuaRfsJfHJi+M219SqAD/tUSQfFaiKDCxqs8MfoRCsq8E0qVvAIAxglUbFv577h
	 yBMGNP+G85vxZle51R0QIHe45UjlaDcxtlT35xwRA6t1MxJe0i64Y6/TqaDGesNbB/Fwr
	 xyq15a+gSSHN26JgYxTYqzlMS7tu0apHLPYnWeQCArVWEa8cII2aWJhbJOUCwi1cC+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z5qpcrjy;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=SbV+VjzN;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3B9606A32C
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 09:47:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B3B9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z5qpcrjy;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=SbV+VjzN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795600044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WkQtg4o+HEohpzTCn9QEYPwbpcKVcB7YKdwlB0VCIcs=;
	b=Z5qpcrjy4vNSY2GGB568YNneQzNKrrPCb6fAF5YqwQ5udfNoI9hLryFirVPe2rAbIKlmR3
	yYiaVzHcV9hOpY9JXOdSPrYP6fopeBKaKlOokid5PrJCSyyKdhIjwFbS1JdQ1W7p+BegeR
	MXm6oeDUjvQBKN6/jUiQmhePsFlU0kI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-578-680J7oMnOeyni6qrjpgxhw-1; Wed, 25 Nov 2026 09:47:21 +0000
X-MC-Unique: 680J7oMnOeyni6qrjpgxhw-1
X-Mimecast-MFC-AGG-ID: 680J7oMnOeyni6qrjpgxhw_1795600041
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e0fc747a7so3751806f8f.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 01:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795600040; x=1796204840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WkQtg4o+HEohpzTCn9QEYPwbpcKVcB7YKdwlB0VCIcs=;
        b=SbV+VjzNyPZ7gYbuTVl5EMIW/ZYyAW0LO3nHpvbnYlnPlYbZCZ7FoBbrc8v4fZ1LNy
         w6SIg5rKpiZgjz0EulivS6ZSMHRpwlmULB7yjmV5qgoIVneCjM67fuER2QgVllKbKgzz
         YEq4nj07m+SutXXKm11TPB5PGymKiK6ydZ3JmIbijDk3IkvLvfRjX/FQ6LERsiGbQ5z3
         vXjg7FmQ3BUM3ICySAkC9PvUz7fWTFLccJ/HLrf6C1+5CB4YnGGr/XRoqodkNy9co2H/
         ah0bw/x9LIxSZaFudklZF3MWcvlazTumu8HGGposVKkEPFy0BcNfrllpxfc5hHh8QC9r
         GuGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795600040; x=1796204840;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WkQtg4o+HEohpzTCn9QEYPwbpcKVcB7YKdwlB0VCIcs=;
        b=ul74rTjgRmRI4Gn9Ubq9k53pJt0NeFBPucm4FInJdwhEjUaMxmibwDUF5iW+2pXpVy
         gdMoBKGIUbPmX+XwXewbgGV95YklvpUrZC5Dn5rcCs/IgnXfS++sEEGeV66nds99cmPI
         Pa4MSlTjyLmfk9EKIJ45/M5NRF6CXI1TUXDh4vmewWyqA9jdTbVzOVnM3y7PZM53WVBX
         0SJehjLUe6zs1by3Fyw/zLNQppPvSw/LXiUARKTgIlC7MyQy+An2eQwzprzAw0CR7fJx
         QATOIHSU/XOi8I4OEdDLmHuMP0j0CPpR4J4Vp2aw3tkSUbiePjYKY/cDoj4zO7QDE/M8
         v3uQ==
X-Forwarded-Encrypted: i=1; AL+hErGmINT5EcuLbqqjpQRfV/pA2mxWxBJN5BOCsLQ4qHgnCLxpD+AXZJNgl26OjpRk2BCOaoaa8cGtcKAAYf8aldI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Awv/FjPSlN4lLRhjF5eA2keYQwdSFaWak/n6q1qbZt5Ie0xk2
	6Zd4uc7h+cjwt10ntCdejYl0EziqemkK0hOrex8XRfkNyKHDNwIxPF+m0PRTsmXfnXKK7oQSUcI
	DVpRaiZccnyFziP0+KJUNVRcZ2KJteG+9mSJHQwYHfeEmEZVyS4HJb5rLv5iBBf7FgqDmNQ==
X-Gm-Gg: AZFdTZeBMuOYj8vuRlJYnhPoBHmxEU/lrjK90DBXRonEoh+HA2jkdc3ARZ2aTh+EyGd
	IOx2RaLAJBw9Vbc+hC/xyZZLybNgCR/DoK0uWILM3wuI0GFhKc1luNvOhnbgqh0Pxf1RIu9/0jM
	69FLQ5Si1h9HkhIoQY8lQdjjjofQ9Re89GsZs1km6W/Zx2lx1zWse+NtBUNI8KOQkZjvyQtFkKB
	YHDEK/v0hjTcdacjp1LC6H9d3O7sPPCMgGfJaTIHzspeSk1TrgYy0uSvd60mt9H+Ot8VBi1z3jN
	CV652BXd+cehNN50Jwf4AhMrsn55SNTeb64btyvSnuasaK8iyhpUa0ntOIaQJ32cpEXzxQjis/i
	vIkKw0Cwzs3+GljE+OCe+ijHKRz/Zi3m/QlbHIPKc6uYllkoeU3Ol8007cAJfFa4LDZyAuwATeO
	9Z95wZiBoL7XlRGVlr77SSzJ7h0paIRtwddK+HAzNEvPoC
X-Received: by 2002:a05:6000:29d6:b0:491:fd47:5e02 with SMTP id ffacd0b85a97d-4abb2ce4db9mr21688030f8f.22.1795600040530;
        Wed, 25 Nov 2026 01:47:20 -0800 (PST)
X-Received: by 2002:a05:6000:29d6:b0:491:fd47:5e02 with SMTP id ffacd0b85a97d-4abb2ce4db9mr21687997f8f.22.1795600039986;
        Wed, 25 Nov 2026 01:47:19 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm32143693f8f.36.2026.11.25.01.47.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 01:47:19 -0800 (PST)
Message-ID: <3e2585ec-00dc-4884-84be-51162a4d782a@redhat.com>
Date: Wed, 25 Nov 2026 10:47:17 +0100
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
Subject: Re: [PATCH net v4 0/2] ipv6: Honor suppress_prefixlength in
 fib6_lookup()
To: Ido Schimmel <idosch@nvidia.com>, Leonard Lausen <leonard@lausen.nl>,
 kuba@kernel.org
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Simon Horman <horms@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>,
 Shuah Khan <shuah@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261117110813.9894-2-leonard@lausen.nl>
 <20261124162628.GA3992049@shredder>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261124162628.GA3992049@shredder>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/26 17:26, Ido Schimmel wrote:
> On Tue, Nov 17, 2026 at 11:08:10AM +0000, Leonard Lausen wrote:
>> This revision removes the cached-exception patch and its PMTU test, as
>> requested. The series fixes the nftables regression introduced by
>> 1c32b24c234b and leaves dst-based prefix suppression unchanged. The
>> cached-exception work is deferred to net-next after the fib6_lookup()
>> fix is present there. Interface-group suppression also remains deferred.
>>
>> Patch 1 makes fib6_lookup() honor suppress_prefixlength while preserving
>> terminal reject results, including blackhole nexthop objects. Patch 2
>> adds six checks to nft_fib.sh using its existing fixture.
> 
> Paolo / Jakub, do you know why this is marked as "Rejected" in
> patchwork? What changes are requested?
Thanks for the head-up.

I think Jakub changed the state, I'm unsure why. I'll re-evaluate
this series ASAP (nowadays can't be very soon).

/P

