Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA66F3D6463
	for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 09:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787651515; cv=none; b=dunOShb6uCRnFbRra4QWgIcViY1Bvuoo+oTPaM8hN8TVm6mULNFB5BHkTn4Mfy4lmdZgiEUeTscSzXQQEgbUsrRZFBcKPcOqX5Cm/BhbF/vJ4iSG9JOHdZl2JBbEHTBEfuQuFWdJxOxioAekWcbexDQjwjIi9bUYJxshb9r9Pjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787651515; c=relaxed/simple;
	bh=Dze/0V4lpvpJ8dgBgEec0OyEi5W0JaTBStw0Pykhz3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ClLrpY5NPnf4fwJJJ1gKhzLL3zDfXoVtOGVI3tSzQ2IKq6fxj/EARtHls9/5L5pEMmAgS/Jjb380Zjj7qf3qikdj6I4Qb/ZeHNFUlb9BP/+/zyRnLyU5l/3wJMS1wzmpCk2KS9ZTJi0a2So4ej4kgiiXQVO7kNpAgfBGn01lRN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fPMRGW3H; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=khH+zKNz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fPMRGW3H";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="khH+zKNz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787651512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F12vgLpt3VeSlU+EZ5SZNPvJRlBTjpsVmjmguo1/iVU=;
	b=fPMRGW3HnwB+007SVhE48/rRe7zDD1FuetPPoSIHvKyGey+mahMcSL+yzsSIrC1+BuirmP
	v1jMsvNMZ9gAbNgxSBFXAyjKHhjFj+aLidPxS6by+SGTeXnDGzflbKDV4OhNYRmd6WmpLc
	N5cHf9q4UpAMFbE86zI1sckc+EGBI4M=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-ryrybpCrOUuotAYB6bXpOw-1; Tue, 25 Aug 2026 05:51:51 -0400
X-MC-Unique: ryrybpCrOUuotAYB6bXpOw-1
X-Mimecast-MFC-AGG-ID: ryrybpCrOUuotAYB6bXpOw_1787651510
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c16711b9473so387982866b.2
        for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 02:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787651510; x=1788256310; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F12vgLpt3VeSlU+EZ5SZNPvJRlBTjpsVmjmguo1/iVU=;
        b=khH+zKNznmcK5WQa/cUAuTfX3buYvUluonfVFmkGXP+zvd39HXZ6pwtH7h+dqu56aV
         yRjaWiWF1F4AgK/nCWSejxIwbtiosxH148z1MzClQCY4p7zWfO6X3J35NKoQYKJx+6gO
         msDRoi9JM5+5mDZ5hspZ7gv7i7rWvSkR6164Kb2x78sdqpUEbQOWXBPNlMEWzo6HZNTE
         Io4e8P6yBOvqP6bo9GCGwzLdy0GAR+6eRTq57p+f1/tEV9wYwmjMvZwR1jXPHB/zk5rO
         +N4f+0j1qjDDY5aObFVJAVe2lw8k4MlTcPNNC7iT6u6xskaD8AQpbH37kTIfo8XejWkH
         9idg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787651510; x=1788256310;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F12vgLpt3VeSlU+EZ5SZNPvJRlBTjpsVmjmguo1/iVU=;
        b=sWV1cEhPbcG7mvy/OQlIb2VeemEGT38z46LPawFSDrBXxeDWwY18dR49e2WN18JCyl
         yAn0NLjWvofdZxE3qyF49TSS+pPa9ghGrehvf0nj//0lhz50Z46bdaQXbARTcO5UR3jf
         PfGf9fdZQAwP8LgjPf8wfX8SWJ1HvB8+IeF23kSWylfX66rXYA6sOLu2bg0/CuLV9vtr
         ankJ0lXJfQkEI7s1WWy1QOiLJMMXW3WuDiFKG0891Gjw2CbiVo+t3XfsVryT6TNF128j
         dILq8ATuxYRjo5yDkmMc+UIWmYRaWjoaP8ZtKBC4ykzO+WbvB7DarK7mPzGh1sp2Ao8s
         qvUA==
X-Forwarded-Encrypted: i=1; AHgh+RpW524FRZt/NlohnAUqAwtxIJIzgs0Pul2V/G/+a9b+MbZoWgTvdWfTMMZX8ycDkcs2nTsNsTdPwFIIcAcBYkU=@vger.kernel.org
X-Gm-Message-State: AFuF++mIS1l0OfCioBXvADxU/c3VUji2+zHHg6iw9Rme8clYnO7nQRst
	e6gYQmi/AGKsIqgjCxIWiPVEITMm03dN//jfYxEoL6KvWKRQQzF908aTRPnWRlIJcBgygF2K/m9
	SyR4OJpnz3dRSzm4B+dt0+VO2f3SBNoX1MoojJSmmulzTygV1mtOoNAl4dFiv2SHZF62yRg==
X-Gm-Gg: AR+sD12BQI0GGR33H8WO8gJ4U73t7mRdPiEed25R3/muZWJAGYusr2MyG+5e81GZ6Hg
	BMSjUVLcBco3BI+QEtruZKUiIUQe1wYvHEjo7RhLoRQnxRbUipwynm4PQV8cDhGoChOUvLM/XWA
	Vxwq1ac/1ZkSQBTHtk4O59+CllgaryzqFxm+jANEXpCyZ0re+wv+V+qSLa4kttUWC1l1Fo85XBg
	x5+Z8FF8bu7YwHEmlBDhSK/cdRY1uIwC58qCWP8iHgkYqtn8A5ZZYnwpY+PNWkA0vzBF2YJYOMD
	0Dlrally1jQuXJBtfH5/7ny+1pVSEJEbILO0MqsHa6MnEtZZzGveRusHcSaRIJTH5vUW7OVF32W
	jCwkHlU14gzGjCrzcLKAVWKyy12hnXcbi/MxiLvw3w8mGDWkS4MN4KxpB5g1OSnN9kZXtM2ev
X-Received: by 2002:a17:907:9445:b0:c21:6f8c:2335 with SMTP id a640c23a62f3a-c24e5ff7a2bmr655365866b.16.1787651510105;
        Tue, 25 Aug 2026 02:51:50 -0700 (PDT)
X-Received: by 2002:a17:907:9445:b0:c21:6f8c:2335 with SMTP id a640c23a62f3a-c24e5ff7a2bmr655358366b.16.1787651509713;
        Tue, 25 Aug 2026 02:51:49 -0700 (PDT)
Received: from [192.168.188.103] (ip46-47-231-195.pool-bba.aruba.it. [195.231.47.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606b59fsm1922062766b.12.2026.08.25.02.51.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 02:51:48 -0700 (PDT)
Message-ID: <e94063e0-bea4-4fee-b4b0-2934b3bb66a0@redhat.com>
Date: Tue, 25 Aug 2026 11:51:47 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/2] selftests: openvswitch: SCTP flow key
 coverage (IPv6 + NAT)
To: Minxi Hou <houminxi@gmail.com>, netdev@vger.kernel.org
Cc: aconole@redhat.com, davem@davemloft.net, dev@openvswitch.org,
 echaudro@redhat.com, edumazet@google.com, i.maximets@ovn.org,
 i.maximets@redhat.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, shuah@kernel.org, horms@kernel.org
References: <20260823020942.3101898-1-houminxi@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260823020942.3101898-1-houminxi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/23/26 4:09 AM, Minxi Hou wrote:
> The SCTP flow key test merged last week covers only IPv4 and only the
> plain forwarding path. This series extends coverage to the two paths a
> regression would otherwise ship silently on: SCTP over IPv6, and SCTP
> across conntrack NAT (where OVS re-extracts L3/L4 on the recirculated
> skb).
> 
> Both tests verify the association and then push a known payload across
> and confirm the listener received it, so a flow-key bug that matches
> handshake packets but breaks DATA chunks is caught rather than passing
> on the handshake alone.
> 
> Full OVS selftest suite runs 19/19 green on a freshly built kernel.
> 
> Minxi Hou (2):
>   selftests/net/openvswitch: add SCTP flow key test over IPv6
>   selftests/net/openvswitch: add SCTP flow key test across conntrack NAT
> 
>  .../selftests/net/openvswitch/openvswitch.sh  | 183 +++++++++++++++++-
>  1 file changed, 182 insertions(+), 1 deletion(-)
> 
> 
> base-commit: 91ec2035134982b98fab0609a9fd8480e8217dc1

## Form letter - net-next-closed

net-next pull request for v7.3 has already been merged, and therefore
the net-next tree is closed for new drivers, features, code refactoring
and optimizations. We are currently accepting bug fixes only.

Please repost when net-next reopens after Aug 31st.

RFC patches sent for review only are obviously welcome at any time.

See:
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
-- 
pw-bot: defer
pv-bot: closed



