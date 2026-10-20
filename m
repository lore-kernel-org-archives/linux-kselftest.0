Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505147;
	b=J0lybSzhQ6u1Yl6lo1xcW2kIAUEzn6O5LJ30sB4UO40nu/We1EM7EEzeEGKg613H/RSy
	 MLUKQ4wrqfYQHTEckj+o1wbxOv3y1lw87u2qTkrGWuA2CSlnp+DyfT5mMtQNRoI92lqz5
	 GxLbVT4VbpazYziN3ABYAfgPaqjySNYVEyv06UG028PGrluHV+67M+YEHjQ/XamEvIp/P
	 fUHiUYUxPjG9+7uj6lOlf02iaVwnb2vmTUMCpQa44SJ6E8/zu+Ap0n6bXoNJ4isqtdVfj
	 1fXV5BHpicrBuSxUIY1oK5hDvKbt6A9q08+wpMv0gqDeyCzL62z8V9+zJNIoYSdwK0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505147;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=9ykT13PSVdEhkpSDogty+KQ6PO4mrXSOM4DldWxwlI4=;
	b=oFnQr7VisrXtaCWNkE8mYzoIdLX2+g1sW/TuUtsPZirOU/MxvtCcQ/pXuCAc39IIcWFL
	 Iu1YxrR8UkfvNUs40dRK8P4iKpGRXQ4fBxLSF64Ppr09xGM9ojlf0bq/xQhKlEzBCVylH
	 6FyD/w1OsIxMfwtZrq93/fGVPLzgYfikLrjytpReaacudpj1p1c+lgG4OdCygapfjqsXe
	 1uLiRi0pgyAOhfvFPgx+68pEpvzegJFrQsCPwuhJFs3PH0fktRxrWMhC73DjA9tBab08q
	 20OaShiGcVecz+nwmKAua7AulpD78L0j2iomNMYjOkH4DzyyhQJyW1kC5lBjrWZDtag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nt3i5266;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=BVuZOrII;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E974606A321
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 14:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E974606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nt3i5266;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=BVuZOrII
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792505146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9ykT13PSVdEhkpSDogty+KQ6PO4mrXSOM4DldWxwlI4=;
	b=Nt3i5266bYeuVgqKkSRC0hAc8PiaObZbifV92h75U+uebHzPRgBkHDjvvGnPVdGZUGTbkC
	B2pRS/AbJgBjxsDfbZjzIZYLs1SpcDXwHUDGd8i/XbddCTuM7PmcsL5/wnvo4pbThi3x2y
	W8Px53qxTnh6NsQZCIAboO7jqhx+1NU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-mqV_HWb_OFKfQeRT4ZBTVw-1; Tue, 20 Oct 2026 14:05:44 +0000
X-MC-Unique: mqV_HWb_OFKfQeRT4ZBTVw-1
X-Mimecast-MFC-AGG-ID: mqV_HWb_OFKfQeRT4ZBTVw_1792505143
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1f03f2e8aso12584575e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 07:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792505143; x=1793109943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ykT13PSVdEhkpSDogty+KQ6PO4mrXSOM4DldWxwlI4=;
        b=BVuZOrIIRZeNQ7/dQ54GjubARN7Ii/zM6ccftk6Numa1K1g6WTAo2y6KApvG1+TA+b
         VhM6V+oduSJOVU3pQR5H11182ZJL2rPOGYmVpySDisop50RXbEJsCHiNPpmQ1SroM5Y/
         mpCwq+y8luRBaJ5FSwRoHQp8jqg9BUEgWiFAl8l0WRKdpzKALRRP3CMHsWatOHJU2aXm
         inV6qDJwsbNK0pFpnFblyXeiBvUpIknGMLOp9DpWZq7qsG165txoBQnfx4pNgFygcrr4
         Hh+8sedn03eXfvIc56XssmAttSBjVd7lz7fddPOyn2223/Ep8xbANcj5l7vdLbKquic7
         FqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505143; x=1793109943;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ykT13PSVdEhkpSDogty+KQ6PO4mrXSOM4DldWxwlI4=;
        b=Ax6fP8SZAXzKtEnmT4ltlgpc8F2GWhp15C91Un/KVXHHY4y43C0yDEVNxmXZWmzYrj
         RBS6HHIm5L+WGuGH+hiR7NJjYeHiNq4UfullOyfuhIsS2FIMRCsiFngW/5KXlq8yCe0j
         e2159sdzuk0fH+IYT0aAEEdY9EkokF3gy82cucj0IoFm4i1lPK0ygpfa8hJFnisK8lMG
         OVwDdxdpy1VzqvhkPUmRCDu33PGEkj8B6sajcTUfluOgSysm61FKiTJmNmLoEP1v86Ax
         Bkv6OuBlLVAlMRlP8aJeKXJVH5IwGnnYqfu4F7K2nVHaXKxye2g1pRpDPrLuYVka2lCi
         zZ+w==
X-Forwarded-Encrypted: i=1; AKwUvByqNQkqPNRyJ+H/+imwa9yX2+6xzOo1y++JowRxNL6rZCJkNqx0DyaD1wGOqG/a4DE8SoGq95GjrskSqfuibys=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvKULd9MamDhDif171uG707FVOLIKKwE82OuT/zq8ezRRcTt7t
	YeKjXNuw2H4MS648dJUlcz6HcDqm+99wMOnj9H2uzaDCymjNrm9k9eAkvjXfteh4Au9locDguWp
	8lfK0DzkRZhlDtTQCIQ0bDLdpEdhqbDu7TznSEU+cWdq1vctBuWpR5r+UdxuERaac/zc2TQ==
X-Gm-Gg: AYBFou2GNP+SgYxb9/SVBnyVL4QpVt0nqdKDNJ2A5M0hdLehqKcNfDwXoSjzXIrtaS4
	hN7TQGCvY3+dmr1yIPvKBObuqnu1hX/q8xTi5LWT7Y5c4FgbdD7P0CgqjWZ8BzS7oNc7/gt1Or/
	5q2d+DDIvD9Sao48vS7gj11YDuMDDyhv6h9xyt16hrp9ixWZfD89NY+D4KwvUnC9M4KFladkz55
	daBpUYLoLrnEq5tRjWNTSbd/t05UP9LuccVqNVbfbD4RAo1TrLPjWEft78s+DpJQVpfMGFrYyFj
	G1muN/EPez22pwoCX5UXvV3XJm+Edrz8FuKwYQkZ650KqJEBOo1uw/vJ1uVjiTLZD6fDxmiS3Gz
	LXQ34p3/oFPqZ2ISrne8UcHqNLG8mNFv47DnOzhf3jTRJ3hwQ+VDTtJK3mq9dNYOS+DmrX+jrAg
	==
X-Received: by 2002:a05:600c:3f0e:b0:4a1:fa33:441a with SMTP id 5b1f17b1804b1-4a1fa33452cmr18514445e9.2.1792505142687;
        Tue, 20 Oct 2026 07:05:42 -0700 (PDT)
X-Received: by 2002:a05:600c:3f0e:b0:4a1:fa33:441a with SMTP id 5b1f17b1804b1-4a1fa33452cmr18513575e9.2.1792505142147;
        Tue, 20 Oct 2026 07:05:42 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d43242sm69875765e9.9.2026.10.20.07.05.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 07:05:41 -0700 (PDT)
Message-ID: <7ceef2dc-717c-44f5-9974-1ed8f0440fa3@redhat.com>
Date: Tue, 20 Oct 2026 16:05:39 +0200
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
Subject: Re: [PATCH net-next v3 0/7] ipv4,ipv6: convert the getsockopt
 switches to sockopt_t
To: Ido Schimmel <idosch@nvidia.com>, Breno Leitao <leitao@debian.org>
Cc: David Ahern <dsahern@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Shuah Khan <shuah@kernel.org>,
 Eric Dumazet <edumazet@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, david.laight.linux@gmail.com,
 kernel-team@meta.com
References: <20261015-sockopt_expand_out_v2-v3-0-7d05ef2df448@debian.org>
 <20261019081907.GA2725184@shredder>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261019081907.GA2725184@shredder>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/26 10:19, Ido Schimmel wrote:
> On Thu, Oct 15, 2026 at 03:05:29AM -0700, Breno Leitao wrote:
>> This series continues the migration to sockopt_t, as described in [1].
>> do_ip_getsockopt() and do_ipv6_getsockopt() still take a sockptr_t pair,
>> and everything they forward to now takes a sockopt_t, so convert them
>> both.
> 
> Acked-by: Ido Schimmel <idosch@nvidia.com>
> 
> Given the user visible changes, the fact that the merge window is now
> open and that this isn't the last part of the conversion, my preference
> would be for this to be re-posted after the merge window.

I agree on the above, also clashiko noted that patch 7 lacks an additional

CONFIG_IP_MULTICAST=y

/P

