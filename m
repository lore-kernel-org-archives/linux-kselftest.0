Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686846;
	b=sILAS+25WSuE2375UJAAc97zIaO4Oa1PLk0gOBamYiCRYV0UeRLLf0/JrSX688zykmYM
	 BiN5S4YBCSHRs+Tpp1fr/2gLQWPbdCNpP0PFYUYWNF2IZWePqCUgvUu+5skxrPdSaIW9A
	 EW6Zym0UvyuiYR4SNJbv7sqqAB1uRd46P7t/nKSEDyEnEMyStvJc1m4yHUSLkRGKH9k53
	 6EQ/Wl39eKS7GjQsyMdmPqPWUiL+6rC7xNF/3LLo6HGmbcjcpwvhoa40BNv9hXCd5uBgA
	 lx5IV6Kzf+8wLQ81Ver6/yfKhWMeur2qnQsn6cc30ll6XT/AZenIXhvE6c85nJs8XMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686846;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=7CCtYtbFe6le29oXXPU1ooKs9Dx0yxyQEI4GjlG+sf0=;
	b=Zo5AkDCUohQuBJfk8zYrxyzolE1Pq7+p2RfOxBtdZun2AQeLmgWVLQ85/JM3kFwcbys2
	 +qNWfRahmd0UoLhfpmAW6S3ZTWxzWB/vgudUZlU91yWIeIPSTsdySKmPYuKi5vlCFRPgh
	 8GcyMjGNdNxgR27B3d8DXJ8IjzGTKaSfH/KL80xm4+e2S60FG7OKb1T5K8qmP2QLwwoMs
	 ly3T5buoUtnnG5HvVqYCMhrOOs+3sdUObYfe/iHeUme9RfRmIZ1b2p+1mPtmY5s8VCWOM
	 zUtks/yxyf7LJAIntIViRboWjaBYdkHyg9h/qTRxaG9axdnU3ttjAxmTrBn94xuhBQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YiiihWau;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=lLANQDpJ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5AB606A6AC
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 09:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B5AB606A6AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YiiihWau;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=lLANQDpJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795686844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7CCtYtbFe6le29oXXPU1ooKs9Dx0yxyQEI4GjlG+sf0=;
	b=YiiihWaunlPPyQivd2jzQAwNt4kxGtfBKvvNRpDzuX4ruCGpEJSUJZOTwcLlJwKHudqYqJ
	hL6aJAmqOZL4d4lEmaMPZb/OwdhrnoNx9fQqSBux8G8X98GjhN+8Flp5sONSAhywpzfSB0
	Mje6FnHx9OiXTMYylgChkQKJGROiwMI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-85t3rqsfNMGuxPcEi1O8OA-1; Thu, 26 Nov 2026 09:54:01 +0000
X-MC-Unique: 85t3rqsfNMGuxPcEi1O8OA-1
X-Mimecast-MFC-AGG-ID: 85t3rqsfNMGuxPcEi1O8OA_1795686840
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4bb68d624baso36792175e9.2
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 01:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795686840; x=1796291640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7CCtYtbFe6le29oXXPU1ooKs9Dx0yxyQEI4GjlG+sf0=;
        b=lLANQDpJub1DKFq7TEwFDOcI3TJRHlZmh/96ElOaxlirzCADY6GEeAAS0Ytz4xY9ac
         5B1akJcEHITQjWhDe8R0Pnm0DnHAKpgdvwivbzSVQMYqVO2uQbxzKM/G0ulUAQBFOCbU
         oej8brmCszD1p185zkHyss2sZ+zOsT6Qvgpub0JOaSbzWMrEqPYip1KYARYYkNnFmv6V
         wu+0jdFe5/Tg9vPOBQ2dyGMB4w72BWETBgiI8GoSNbYX9y1MLJLbhsHuR347/DiYP+eO
         njm3nb5bzAMHRw7otWLdk9Gkb8UUOazx9ZrH/dhp1I6vG5mBOSZjRbcjITQEtmneLnVO
         YnsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686840; x=1796291640;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7CCtYtbFe6le29oXXPU1ooKs9Dx0yxyQEI4GjlG+sf0=;
        b=ek/rbOXZfKGD9XrPP/A2E2oIsmT3O1bQpy3yQ0VWEEtufpFjzQ0VOhudJubj1V2vur
         cf3Ugl7T99dKQpXj3yVp+tIVKw8Gw5V+7Gney4/PmJ+WzNurfASSi3iBotpbMXk8/GN9
         DqUfL09yCWf2Iyz8bcISny2Vtum46KwUYEFVZoPE1uXRnPPA7pjyZW74sIYEfOvOyhod
         kmARA1Nwqr8dBsrxjK5cZ9up7/gdyep2yOVQVMJCK5p3sGF10vAVSCFVwoWLlRAVBE/s
         XW+Vy2y1dSk1t8fOpiFYAjR03wg3Hi65dCSRsr69XyLGgTyKVpVDAUXqN4ZUkTq+7a98
         Rxaw==
X-Forwarded-Encrypted: i=1; AL+hErFjuZjJ9FFO9Y+2fDC/wH8SvEFpyd7zCyi76LqukiWMo1eI4kBZjUwb4gaxSEwy+ESuVdIrvBQ/xXOgMIuv7Hw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AO35o1zAzo9KDGAr4fF6Quh6H1LLeiIH8BHVDWnWo+HA6n8Na
	98ujdjDcFXtnrz/0uQpobHFuC1P15LHb3NSiYsbZPW0WCHR++R6XokUivuNjJk9sa2qA6MQp14E
	m1ifYotJqM63aoW+sAIk3n3cykyzO597/4RXKIovP2vM2G/DWRx+j2tooG9fl2tbBK6m67w==
X-Gm-Gg: AZFdTZcSuNIUSBN46VXXZilUHrSoH07pEU6nyyyjhTOfToWTv95xpnOvdfW3pvU3Er8
	QKtlyw224nl10OVqBya+4XvASo5oq2eFq7SqGau0r7R9IQT/x1X1pFG8KBqmOQge/kVqA5u/+TD
	kczL80LQHHWwJAuCHNgJt5pdvoNTgRcxYqqvZsmF5+p9r2F2MA8UnS0dTDDZ0DMgspBA7g4k9Rx
	nUAk4a+UYx4RuONEVWsLlv5Sz7ysZrAWpxoPxet94I/bJrwjAVJZjEdZfNvioOqqvK8aFnj/q8S
	PmDL20y84pItWg51GJYdwHaR+WmtWemtY09Ajl+hAPcVk+Svnj4VDGCtExEjs1e7YmScDYKqGZf
	XmkW+3Di1beMNztCDHohLruCkskkUPJbUd91W931GxJL2kKVjD8lmm2rICYjZmExz3QiL5PhRib
	x6akgLVC+LHEezp9TsTyG2I88+ZtSeC1R08ho71mJdyYyc
X-Received: by 2002:a05:600c:4e16:b0:4bb:6f77:1e35 with SMTP id 5b1f17b1804b1-4bb88810991mr440507395e9.21.1795686839795;
        Thu, 26 Nov 2026 01:53:59 -0800 (PST)
X-Received: by 2002:a05:600c:4e16:b0:4bb:6f77:1e35 with SMTP id 5b1f17b1804b1-4bb88810991mr440506695e9.21.1795686839381;
        Thu, 26 Nov 2026 01:53:59 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d1bsm41250729f8f.8.2026.11.26.01.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 01:53:58 -0800 (PST)
Message-ID: <34e77fff-c57b-4ed0-9035-b9682ad3914e@redhat.com>
Date: Thu, 26 Nov 2026 10:53:56 +0100
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
Subject: Re: [PATCH net v3 1/2] net: keep the TCP fixed-ID flags on the header
 they describe
To: Julius Bairaktaris <julius@bairaktaris.de>, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 willemb@google.com, horms@kernel.org, andrew+netdev@lunn.ch,
 dsahern@kernel.org, idosch@nvidia.com, ncardwell@google.com,
 kuniyu@google.com, steffen.klassert@secunet.com,
 herbert@gondor.apana.org.au, richardbgobert@gmail.com,
 ecree.xilinx@gmail.com, andy.moreton@amd.com, alex.austin@amd.com,
 linux-net-drivers@amd.com, saeedm@nvidia.com, tariqt@nvidia.com,
 mbloch@nvidia.com, leon@kernel.org, linux-rdma@vger.kernel.org,
 alexei.starovoitov@gmail.com, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com,
 martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
 jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev,
 john.fastabend@gmail.com, sdf@fomichev.me, izaiahsun@gmail.com,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 shuah@kernel.org, bpf@vger.kernel.org, ipsec@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1795284858.git.julius@bairaktaris.de>
 <7c74b2076dc7dee1d481d39a135e0946d5e04145.1795284858.git.julius@bairaktaris.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <7c74b2076dc7dee1d481d39a135e0946d5e04145.1795284858.git.julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/26 19:26, Julius Bairaktaris wrote:
> Commit 3271f19bf7b9 ("net: gso: restore ids of outer ip headers
> correctly") made SKB_GSO_TCP_FIXEDID describe the outermost IPv4 header
> and added SKB_GSO_TCP_FIXEDID_INNER for the inner header of an
> encapsulated packet. Every path that adds or removes a header then has to
> move the flags, and none does. A TCP stream that GRO merged with fixed
> IDs and that is forwarded into an IPIP tunnel, or into an ESP tunnel mode
> SA with crypto offload, is segmented with one outer ID for all segments
> and with incrementing inner IDs. A tunnel that decapsulates such a packet
> in iptunnel_pull_offloads() leaves the state of the removed outer header
> on the new outer one, and the inner header of a GRE or UDP tunnel, which
> segmentation reads at encap_level 0, gets the state of the outer header.
> 
> Let SKB_GSO_TCP_FIXEDID describe the innermost IPv4 header again, as it
> did before that commit, and replace SKB_GSO_TCP_FIXEDID_INNER with
> SKB_GSO_TCP_FIXEDID_OUTER for the outermost header of an encapsulated
> packet. Where a header is added in front of a GSO packet, in
> iptunnel_handle_offloads() and in the BPF LWT encapsulation, clear the
> outer flag, so that the new header gets incrementing IDs as it does on a
> packet that was not encapsulated before. Clear it as well where
> iptunnel_pull_offloads() and bpf_skb_net_shrink() remove the outer
> header. ESP transport and BEET mode with crypto offload set
> skb->encapsulation but keep the IPv4 header and its ID, so xfrm_output()
> copies the inner flag to the outer one for them. Convert mlx5 and sfc,
> the two drivers that use the inner flag.
> 
> Two flags cannot describe a header between the outermost and the
> innermost one of a packet with three IPv4 headers: software segmentation
> uses SKB_GSO_TCP_FIXEDID for it, as it used SKB_GSO_TCP_FIXEDID_INNER
> before.
> 
> Fixes: 3271f19bf7b9 ("net: gso: restore ids of outer ip headers correctly")
> Suggested-by: Alexei Starovoitov <alexei.starovoitov@gmail.com>
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
This patch is IMHO too invasive for 'net' at this point of the cycle.

I suggest targeting net-next in the next iteration

/P

