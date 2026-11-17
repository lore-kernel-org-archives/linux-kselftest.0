Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933036;
	b=0t8NJK5Yrf8Mwl5anZjHMgOKl5RyfqQPtOSuDnyiuubtuVsFtNWbetNXO6nCTWId1+Pd
	 yaNIfvSb64/IFHRxjodGozs2S/7lfMPdDt0RlKikoEzeYBqoj/pSdZwA4arILyYT0Eab1
	 mSXDzC4/nznpSn20VcvbGEhWrtpydHU0xex5Qy5/Ndcp3O9QjUYy8L04RXCgZeSjBj6sJ
	 0HcywbnkvN9hjVfSMEqGMa9khz0K4NlkMQHUAvZh6lT/458oZhfLGSrSHMB3v+G2kJJMI
	 vQ+UIooWbcQfv0Snl1DQwgOozOmKjrabq3g2L5DV1+2NvJM54UL9xIAZIav+Lrsv+6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933036;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=gzNj9YY/nz5fvfy6gpTsHNPiMT4iZgLl23IUytoqvOw=;
	b=K55I77QcCbb4HqKva2J3QJ9LLcPjWGCzCrzFPsdcLTQOBrFOnpEzTMsRJhWbvYPwzhsC
	 lPvt4dq94oLaaXlysrUGOQxHts1R104Ll5dyDcszoizW5ZlxPnuzoDFG3SRozyWWE/yCj
	 prD+cYuRaf0k695HFLOEqRtgEScxMyJ6LU35OwHBKr3w8h/RTJEXaAcK5IO6In96pbLbi
	 nTAIC+dB1oJRKN6kvc8cXFjFzcZH6R5Kt7SrvJ6MraLTOLkvvGYP9lSqz/VrwV6utJJF+
	 Cnem5hWSyU1XI6/50MpliTp3El2RqnCXwi5PRkfT5YsR8udpWNr1vZPdqFaPgvxbWKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V5r4QaM3;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qf60IkSA;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D736606A880
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 16:30:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D736606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V5r4QaM3;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qf60IkSA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794933035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gzNj9YY/nz5fvfy6gpTsHNPiMT4iZgLl23IUytoqvOw=;
	b=V5r4QaM3YYk4Mh+SmSdU6e5HHmbhhgjPLC9NO8QfF9gYPDtaF+DCs5e3JrKQE1PIIM3J3P
	xVzuzkPU24pwNcAbp1VtHK8NUCc2sa6MO8DCG0eVKKnKC7i5JG6e2ZEfexLHezbfhR+alF
	EHe9nvc2aXj94EgIG1EYE+dr14GB7rw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-HGxbjyacN8u4gL-rCBzisw-1; Tue, 17 Nov 2026 11:30:32 -0500
X-MC-Unique: HGxbjyacN8u4gL-rCBzisw-1
X-Mimecast-MFC-AGG-ID: HGxbjyacN8u4gL-rCBzisw_1794933031
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-49166c8a60dso3754407f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 08:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794933031; x=1795537831; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gzNj9YY/nz5fvfy6gpTsHNPiMT4iZgLl23IUytoqvOw=;
        b=qf60IkSAFxTD8xr8bOjsd/byszjQSqPLfjok2uQ+ANozpf+0gR9NTS8yPJ7RUtY0eA
         IKfVZEz+ooTfmV3fZJ0ZPon3xFvNtD5Qvmc59ZPJCk5/1J+xOLhIq1v9zlJomaZAW2H4
         aUpvwfLGlWZ8xdmIH1uQwJfzN33jnBbmgxGNoj6XQRm6sNK/Gyq9QSz43sCTQa6Kjnfl
         6cDq4OXrIKMWWsaSc1ryv6UsrZeF3f4vIogqHWTxd6IFuqA7Tp+7HLuhJ+4JbxnWVjXe
         7eXmtj7+9avNVfGIN/HUPG3A48fEIcZx46uDs3vt9/5EDAh+btcari2jaZKPIQ9zA4Mx
         Zcig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933031; x=1795537831;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gzNj9YY/nz5fvfy6gpTsHNPiMT4iZgLl23IUytoqvOw=;
        b=LcdFCZkBM5FF593xUrEWYNOttneFFnOxUBoJL4TpWvu7WOi8Oe4SkVFZBzUMTFPZRb
         9vTyO+IoguSwDOAaF2N9MNqePecRxiNKlvM+CkSy0D/fO9Llo2DoASV47fFihPEAPhd1
         SFy0F7XSEXLrzJW0yKBM/jjR9uBK8V7qw3FqQQDTyAUAULsjmRjRQIumIi2RqyI0YbFi
         5cb9iCerhqQCkpSeGPls0vL/DJszKsJUjr3HeNDcsPM9X+rtfPoqsgcth+Zc0VY2/i35
         kauchckhz+4/lyVgtshuitzoAXDN2OjelGfQFssA8wpvHCOUoTm2lcaZYqkUicqb9qdw
         JbTw==
X-Forwarded-Encrypted: i=1; AL+hErHGArXaOaxaw2g2k6EYekFrzGBfuABgJgP2R6pL1Y8iMtD9JMSJ7IhBOZL5RJXhc2KHZJrDVO1HVeGPluXuQ4o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6PzF9MgPoafqsQ/fd5dxv53f3/SVgEhh6vt3fX2csgjIcHWul
	XvpLFzsv9gwbgM8czfgvJgswqdfju9gBxSZHQyHYldxJ7qpFGe3jwTpD79O6x/Z857ryVwnnLck
	GZ8HnazRPpUC3vLE6nsAZsgDvDTTcmK1tnZmL5XZZgCQOSbi4neRrH2ZhkfgJuTNMG9U68Q==
X-Gm-Gg: AZFdTZfaZpSmi50dtgSCkO/YDMwvg/GQIFOMRj8uzM5ZH9/0iTNXPWYBkhK0Dq1NC47
	qnTqvDNFCwPKJvuomZRIRta8uhN7m/Z26HrVqvpXg1y/6lgKFm4GSq1cfVxi9XQpjXrNuPSRzcf
	3W/xmlQ0KvBb+j2Rt25m/AA4HOlx5iVUdPg90xbAXHkOsofx0v2Z2jM7P71h9kTBiP2Mntm04uY
	kBHXzDBI2dP/WMlww1eJ4tWpBx2RQPyJ4kydt4QsnU3nBpJUluKcvDMKeepKCOfrv+ND0lpAIXR
	SDI9KyO/LWPfnA2fPOenvVIaRQVxlhp2cbOOe7XY7tA+jiDZnXBAf5a9R4UUhjd715RmJsJkeF8
	Ikt41CRTLA5kb+Ihi277gNZp+wZM6O2a5W7rZfE3E2QZe9/5gvBXYMQ2a3fF0mHjogisqUcsZXz
	ASwxo0AoIHybzbbINXqoqT2Ne5vr8HJiWlsDQeaiL1I8Xs
X-Received: by 2002:a05:6000:1a8a:b0:48b:f93:3b87 with SMTP id ffacd0b85a97d-49c726da6e1mr33405902f8f.30.1794933030638;
        Tue, 17 Nov 2026 08:30:30 -0800 (PST)
X-Received: by 2002:a05:6000:1a8a:b0:48b:f93:3b87 with SMTP id ffacd0b85a97d-49c726da6e1mr33405842f8f.30.1794933030089;
        Tue, 17 Nov 2026 08:30:30 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c888b90d4sm29021988f8f.9.2026.11.17.08.30.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 08:30:29 -0800 (PST)
Message-ID: <09765df8-89a7-4b7e-b889-5bafd7622c20@redhat.com>
Date: Tue, 17 Nov 2026 17:30:27 +0100
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
To: Ido Schimmel <idosch@nvidia.com>, Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Leonard Lausen <leonard@lausen.nl>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Florian Westphal <fw@strlen.de>,
 Phil Sutter <phil@nwl.cc>, Shuah Khan <shuah@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261117110813.9894-2-leonard@lausen.nl>
 <avxPFYfEirXzTup8@chamomile> <94f4ea0e-c1bf-467c-94be-b65963410d30@lausen.nl>
 <avxRfzsnke7VJq_w@chamomile> <20261117152414.GA824125@shredder>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261117152414.GA824125@shredder>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 16:24, Ido Schimmel wrote:
> On Tue, Nov 17, 2026 at 02:07:11PM +0100, Pablo Neira Ayuso wrote:
>> As Paolo suggests you explore fixing this from nft_fib itself,
> 
> Why?
> 
> fib6_lookup() is the IPv6 counterpart of fib_lookup() which is used by
> nft_fib_ipv4. The fact that it's not working with
> 'suppress_prefixlength' is an oversight, which is being fixed here.

I must admit I read the previous version as the issue was caused by an
API misuse by nft.

It looks like I misread it, I'm fine with this fix.

/P

