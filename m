Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C86037AA99
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 10:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773915774; cv=none; b=JM9n55k4Afi671ECILXF45G/EM0hkerhHCbQOcm5dsLyuwMbp7nmLEJP1ppz5cqE3CYrrWkpyJsXdbIba5WbAoT1Q81v7N1QSbzUdF2ky7fui2wWwUQEL3/NFPq3T5n96GnrXXYDfzxfEXhiIU6KYY5GrI5oi3bNcngI8+bWR7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773915774; c=relaxed/simple;
	bh=jI3T4fyaHJI7Z6XuDHJkgpVgH5BlNdf8DNKrN8B7PzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TlM5yZzcEzhmfxOQYjZvYfKOG1Bp7MVH+In4oOkD23+Ub1QSu/IpgMqr3zYzMpQ1j1HxLriS22ZedDhu3srGCFsnwnZtlOvQl5o4v3F7BtBH0SWAu3+eIa2j37qdVNm8XVnCNiI9Jl0UZAp0JoNCPi84qBcqKUDwn+ATD7LefeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D79ZNNms; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=iESOMyTY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D79ZNNms";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="iESOMyTY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773915772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wR/FecceBEZR/0EE/23yp6rr47owa2Fbfb4UxboXmxo=;
	b=D79ZNNmsR9t9aPM+zj04zake63qs6W4TjDdsfuKniYzm6Uw/Ra0dOpwT5OjKBUYJRlPef0
	ZJpnqD4jDkOsF3HzpEfIdbGSENcEvLsAQbq4/2G9C620achkNSoUMg6SMPtvzSmacyno2F
	v7aNHA0NUZqgViKShD4sOTDWiMH6eMg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-jbCJOALRNqyptlynRXBJug-1; Thu, 19 Mar 2026 06:22:49 -0400
X-MC-Unique: jbCJOALRNqyptlynRXBJug-1
X-Mimecast-MFC-AGG-ID: jbCJOALRNqyptlynRXBJug_1773915768
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4853b5b0fafso4980855e9.3
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 03:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773915768; x=1774520568; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wR/FecceBEZR/0EE/23yp6rr47owa2Fbfb4UxboXmxo=;
        b=iESOMyTYksoObvFcqstvFxcykWzlrXhnY2Sz5gzqsIEaZciKIBXLMF5hn061STe0xS
         A7dmjd8GJEHWR1v2Hdz7PMOU1NDZ6LE4mgpe8+NyurKvIlDNr8Z5mHfa9wJLr4iJY/jR
         Taj4vpBcAboVqvCMTFuJ/Tc6lj0GP5d3QBNRENGLiVTjDiBscKnH9tVYMzCkgD4eNzIo
         8IlGVuEwGB4/5uU/L3hb8LvvD/eMC29rCI/E24vSr1P8mmuLMhd3mc0rkwyv1FbnGHLX
         u9zgLo7W0ZyFM2/pfDf08Ytq6RtJCUrF6PUHm0QuYLtdNn5AETigPTaKfpe0+OGdOQhR
         vynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773915768; x=1774520568;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wR/FecceBEZR/0EE/23yp6rr47owa2Fbfb4UxboXmxo=;
        b=WgUIZOSQtYPhEZk+RNRiTJeZ3J9BOiC2irv9qlWf7ZG1fXutNwdv1X6jYOTqX93MB3
         bKre5frREAGYMi9D/cr318BncicWDdXoQ8ypYBOARJAOFry33x1AUGMYCKz5wKsLzuTo
         hdbsU5fYIDwSGxmH7B/5BfEBUnBCwDOYGxG5NsJMPraHuPLzU+vFURhrxkFdpSd9w3Ig
         oymoD7vSVv/Ej4X+R0O0WaJtAj4C7kFntiIVA639Ponb7r4eCFnQ6DkCvzWfjmQ+l9Nu
         udAXu8tOqw5KtGHzWANzpg5meni5SkC9sjG4I01Hu/RNrIqTZZRJ28tQEcoXs73Bqa1I
         2Csg==
X-Forwarded-Encrypted: i=1; AJvYcCVPTUOcYX4anUpy5AjgjQSXU5Thb7ZNiAOYoeQJMIwkhI4tpJOfC45FlJ1YrD+9kNGP+gund26FvUJVspCvEw8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCIytt2kbWcJ6DgTcWJPncnMssr2EttqNV282cGQZDBoDTpoR9
	m+d5T8aXFSnUIdN61H3ie9XPxhJzMQzYIfEnXXbLwm8nf0dCQR8eQQjtX0RDgZiIU7RRP9JPZn1
	bLtrpBBtb4JY42V6pICCf5yVr8arxrmnAZr4C/LrA1rACIR/WN63CB5q/mVNuaX75wWrV8Q==
X-Gm-Gg: ATEYQzwMMWac4qMcfnxc1g+MYHElROd//3xt4SWB910fHDBhc3hJCOW7tnKPjvM8/Ga
	EaG1sTf1j7IJz90XbZCJNiGEGFJ0rCixMNjBKtR+abeUc4NDz/2GKYUpG21KNe/lXgIb2LNDa8u
	vZ0wenaLVP8K11sMSbeIPJPg+rn/tvLSO5SqanJU/hGYRTHh0G92l04yNp6yt8M61zIqDRRWtQn
	eOdNUnI527Fcn0sV+DGu8ev0Q+fkvNDblRRuqSL98uxKoqSke6MVFqKyER/3fSdVxXwtrqRz/RE
	PIz8lzkIyAI9VRA4AEBcqJhotKZHBEOuraGQDcayASbsAR2sBSsqRxZccaNkVMK5q2lHVV4MqW6
	IGiU+hoDcPBFXyZbsGAppdq80/qSQhRDwtIejiIspQVqaI/1URi0LWOTv
X-Received: by 2002:a05:600c:4e4a:b0:485:ae14:8192 with SMTP id 5b1f17b1804b1-486f442d3d1mr109792145e9.7.1773915768389;
        Thu, 19 Mar 2026 03:22:48 -0700 (PDT)
X-Received: by 2002:a05:600c:4e4a:b0:485:ae14:8192 with SMTP id 5b1f17b1804b1-486f442d3d1mr109791725e9.7.1773915767939;
        Thu, 19 Mar 2026 03:22:47 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.11.196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fbea40c2sm32983445e9.5.2026.03.19.03.22.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 03:22:47 -0700 (PDT)
Message-ID: <d0ab8cc8-f734-47d4-b402-9c62ae563b4a@redhat.com>
Date: Thu, 19 Mar 2026 11:22:45 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/3] selftests: packetdrill: stop pinning rwnd in
 tcp_ooo_rcv_mss
To: Wesley Atwell <atwellwea@gmail.com>, netdev@vger.kernel.org,
 ncardwell@google.com
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 davem@davemloft.net, dsahern@kernel.org, edumazet@google.com,
 horms@kernel.org, kuba@kernel.org, kuniyu@google.com, shuah@kernel.org
References: <20260317065137.1533226-1-atwellwea@gmail.com>
 <20260317065137.1533226-2-atwellwea@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260317065137.1533226-2-atwellwea@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/17/26 7:51 AM, Wesley Atwell wrote:
> tcp_ooo_rcv_mss.pkt cares about the OOO SACK state and the resulting
> tcpi_rcv_mss update.
> 
> Its exact advertised receive-window value is incidental to that test and
> can legitimately move when unrelated rwnd accounting changes adjust the
> ACK window.
> 
> Drop the hard-coded win 81 checks and keep only the ACK/SACK shape and
> the tcpi_rcv_mss assertion.

I think it would be better to keep the test updated with the kernel
behavior. Having the pktdrill tests bundled together with the kernel
allows for tightly coupling.

@Neal: WDYT?

/P

