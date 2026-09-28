Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7B9263F4A
	for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 12:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790599170; cv=none; b=NGQDybIycWp657C/2iwPzNA4qFH++YVVRoJ/dBILBH/qU8vtBI48ndvj4bWyCi2aHALRNmkCIWRYv1U3r8HXFXMUvXiTr2J6rVDsMW2Gbins9r1v1zsRBxtT/w6ZNjOUpWWEm7Xnvsx75Sy/xgukAr+kkVOqXIptfP+skQH5HTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790599170; c=relaxed/simple;
	bh=MgtimNvGMW2jV2lLmKB4kJ0Nlw52AMVJCUyriCjAvEs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oB8i2SNNNNekHMu9mCevv7nBfJi7/YYPLFodzd3MzHkWLVz3P6kH0v1VxWqtTtKPDy6E+rCyWs3XC6djxOv096z9UbgkjZtthTRfx/s7R0tb+rNZvp12oaepxMXEErTD9b065jxw+hLV7JSltclE8jcHz0t47sQ/osQR5bFgLoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UsvN7/EZ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=aE1xUX6V; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UsvN7/EZ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="aE1xUX6V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790599168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MgtimNvGMW2jV2lLmKB4kJ0Nlw52AMVJCUyriCjAvEs=;
	b=UsvN7/EZabJ7NxiSaQG1/9+sNZuw12e6sEXUnQexXWjOoSVVo/QHQXeFAJeOpmayMleeZp
	boO80nEecGC78f11gLfxXhL4PLsQLdPerumhPn6c5ICvtruuOJTUy+hrrY5b256CgoLz38
	hmTn5cmDdw8OSF5yxzx+UUv3YVEARX4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-oJoN1O6dM-iXcPF_LTcNlQ-1; Mon, 28 Sep 2026 08:39:27 -0400
X-MC-Unique: oJoN1O6dM-iXcPF_LTcNlQ-1
X-Mimecast-MFC-AGG-ID: oJoN1O6dM-iXcPF_LTcNlQ_1790599166
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a009f82bedso3406655e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 05:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790599166; x=1791203966; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MgtimNvGMW2jV2lLmKB4kJ0Nlw52AMVJCUyriCjAvEs=;
        b=aE1xUX6VyovX1pT8WuVqoKVtOA4eW81XFMph5oQ3cXySovirXqsZj3Dp57GFUI2DOI
         5SJC3hOKLVvC1z8S/LVyWwx2Fd3kWirrSFR+ZQuDcFylImDVtf2WUProKrxsZo0IpEIC
         XiNftDJQsqHhida/pZaoc1rPLqj4EqV4x7m3EzE0fv895jjjyavM+qXJQjGI/75r//le
         gaXD3b737C/ZtU7EGUcC1mxxg592vZ43Ngu6povcxj2ONze81jBWHOUnMFVEH/vjOygq
         ZRM7cerZVnRMfAdrkPIYG/LqROEWeZovG1C4nkReEY6hZhKjUsE7kO81AKXQ1uY6LfGa
         cIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790599166; x=1791203966;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MgtimNvGMW2jV2lLmKB4kJ0Nlw52AMVJCUyriCjAvEs=;
        b=1BqyumvtE0Xs+o/Jp+cAiQuLnBuYXDwZn/rbRSAe62phe08O2TtArEvh0qwbmZYo+P
         f4uCo8lAFVYKov9kOWVSQTrPFnEEI2H7eaMnNhKoHC8YPGaPuAnYZ4yRdjm7UP4FnUSp
         QA+xo2iLpTJbdQnNgf4NHdzatkCMGthzi+z+bGdMrwYCC5Rmm/lRMDh7DgWlig1CZd7w
         /v9C6Lfn3yhJeqzWsZZOq9jXP/HvsSVHyoefrtKDe8DXWXKuQfhXD87T2UI7muxgElKj
         67yoIxr3c2t4AR4LKRP/v2vFLY0xxG/BhDxcb4jgdR4hoGU/6UrDYVHb+MNCFI8aYGJc
         DwwA==
X-Forwarded-Encrypted: i=1; AKwUvBye7k6RrzVl1erhA52YezlRmNbbHORRxtYAaxmdox4TBXQCOQaSWzp389sYpCmoEjEvV8d6YqFPpNdZdaUaZWE=@vger.kernel.org
X-Gm-Message-State: AFuF++kFzNLo56tjiruqnKajXubYGZ5FMbk/blGG+TDyzmWp/iPaGGY3
	hzMRmhCExe3HSO9CwHx1mmGCHEMvtagTYQmESIGKNcKJDsbfGt8/s22S3k+7p/HOo9iuZJB0DUB
	p8uAgwrySRj7Zvs0JmKXPO/ve2Rza7tNbv/Ed/VQCw6wgYlOnAKC+DBoaRqt3MoY/EfYFNgmQGB
	8XhVZBjqqBR/2DbW1GInSBVSQlwpnzHCXL59EDIl8NjMS7UGIWFRK7
X-Gm-Gg: AYBFou3n3SzlXdx/AeN/F35nU0NHvXJ/paQ12v3oP4D+j76vWFoM0nlCuPqezxo15aR
	sE3a0pk+S/aC/YpGwjnc5AGm08YsLOyUZAnSo04Or9FdvR8oUg2ajcsuRYdgCGMRgjwsG2yZm4r
	v15/cHseU1mD/1JhfD1n4FAwjODplH3GqID8BebllLoTg3hGiYRUt75QFq67kk6wHRo9OjGnhbj
	3SjAz8beTPCBamz2sc7E1xG8rO+gYPQ7D6AU0Yv8r09jknVH4TLr7DcWKiJ7k4SHP/UYCqwk0b/
	UcdNJWXaE3nbi5qbib3tGdag8Hi5er+/I+2j8uUlm6bxIj/czZjlaFhI8TBaXzEwXVnY7nZ7Gw1
	qirhNaQxNUu3+s8Dd3juGti5wy/bGEHs=
X-Received: by 2002:a05:600d:8643:10b0:49f:bb8a:b4ce with SMTP id 5b1f17b1804b1-49fe67bc26fmr163682105e9.28.1790599165915;
        Mon, 28 Sep 2026 05:39:25 -0700 (PDT)
X-Received: by 2002:a05:600d:8643:10b0:49f:bb8a:b4ce with SMTP id 5b1f17b1804b1-49fe67bc26fmr163681685e9.28.1790599165460;
        Mon, 28 Sep 2026 05:39:25 -0700 (PDT)
Received: from aconole-thinkpadt14gen4.rmtusnh.csb ([24.151.142.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00c076dc3sm1269605e9.0.2026.09.28.05.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 05:39:24 -0700 (PDT)
From: Aaron Conole <aconole@redhat.com>
To: Minxi Hou <houminxi@gmail.com>
Cc: netdev@vger.kernel.org,  Eelco Chaudron <echaudro@redhat.com>,  Ilya
 Maximets <i.maximets@ovn.org>,  "David S . Miller" <davem@davemloft.net>,
  Eric Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,
  Paolo Abeni <pabeni@redhat.com>,  Simon Horman <horms@kernel.org>,  Shuah
 Khan <shuah@kernel.org>,  dev@openvswitch.org,
  linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v5 1/2] selftests/net/openvswitch: add SCTP
 flow key test over IPv6
In-Reply-To: <20260918144647.2024095-2-houminxi@gmail.com> (Minxi Hou's
	message of "Fri, 18 Sep 2026 10:46:46 -0400")
References: <20260918144647.2024095-1-houminxi@gmail.com>
	<20260918144647.2024095-2-houminxi@gmail.com>
Date: Mon, 28 Sep 2026 08:39:17 -0400
Message-ID: <f7tmrt18s96.fsf@aconole-thinkpadt14gen4.rmtusnh.csb>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Minxi Hou <houminxi@gmail.com> writes:

> The merged SCTP test covers only IPv4. The SCTP branch of the IPv6
> extractor (the proto=132 walk after parse_ipv6hdr) and the v6 side of
> the SCTP netlink validation (match_validate() requires the sctp() key
> whenever ipv6(proto=132) is matched) have no selftest coverage.
>
> Add test_sctp_connect_v6 mirroring the v4 test: bare icmpv6() flows
> forward NS/NA, and ipv6(proto=132),sctp(dst=4443)/sctp(src=4443)
> flows gate the association in the same three phases (flows installed,
> removed, reinstalled). A keyless ipv6(proto=132) install must be
> refused with EINVAL, pinning the reject side of the match_validate()
> rule; without it a regression dropping the requirement would pass
> unnoticed. The refusal is asserted to be EINVAL specifically, not a
> parse error of the flow string. After the association succeeds the
> test also pushes a known payload across and waits for the listener
> to log it, proving the datapath carries the association's traffic
> end to end, not only its handshake. Skips when the sctp module is
> missing, socat lacks SCTP or IPv6 support, or IPv6 is unavailable;
> an association or payload failure with the flows installed fails
> the test.
>
> Signed-off-by: Minxi Hou <houminxi@gmail.com>
> ---

Reviewed-by: Aaron Conole <aconole@redhat.com>

