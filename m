Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828B547ACF8
	for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 13:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787664133; cv=none; b=EBaqQODmMk4/KcMA2ik3B75WNiHTcERjDzHAYROYqgIBPtMMU2/BfaZjagViFL/1z871N6TymEyH9eTMSAucPC5OnNvYwxgPB+/I9AIWB76uP5FA/EqJLDG6wXJ4cXj7x42Cxv3vfPTqRNBQ17DkRLr8Eq5SpcN2W4RbAmn0eTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787664133; c=relaxed/simple;
	bh=l2bquGZr7xVC6kTuwhk9wLmiEjDAoqczWlzAZCpRkng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cFbxw9SjCGfqLyGSueEKRHdW34o2OrkGSkJPye8mE9BhhNBVdZved8hQb231IuMxF3wtafcLaCYu1VEsmzicoUwv774YTbOrofG5mWSA+ewvvw7Qgmg/MX9NFCaXUGgsJMV/bHfYxh//q6XR5sq7CqjhgtkjQLj9wdqVYjklIv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U3sIuUIp; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FddhOQiQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U3sIuUIp";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FddhOQiQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787664124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h3loZNgkjJdhRVsMoqc8GJfdnErwerujYkPb9VXz+wQ=;
	b=U3sIuUIpMql3q1CSWi+XGuNCu4SmEih6AKvsQv1vt8SwKxZfjL+EQYCqoZP3z3+sXe4fke
	m/5S24pH4hM77FX7UsJ3Hj2p+NyJtcsZweylK+XHpUgWxJhfrluzWJnPBpYOIcUzscCnb+
	ACvZNi4MksjKsfbfJi3rZ3Hb8qA6Wgk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-6pL7G7bmPh2oTwZa40-eOw-1; Tue, 25 Aug 2026 09:22:02 -0400
X-MC-Unique: 6pL7G7bmPh2oTwZa40-eOw-1
X-Mimecast-MFC-AGG-ID: 6pL7G7bmPh2oTwZa40-eOw_1787664121
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c213d5fb55aso214185266b.1
        for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 06:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787664121; x=1788268921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h3loZNgkjJdhRVsMoqc8GJfdnErwerujYkPb9VXz+wQ=;
        b=FddhOQiQWPD1qm5uSAdSQx45yEEGW4LLHzarw/f4Bo92aX9SkjX17P0w+IxHP8V8bB
         twlB+TgY+p3+zfyZg0J/gnubI5+9vqBtsxX4RW5KxTxqt/BaqcUbFEDewEp/eN/Hk3L2
         lppJbIB2jtyZkKGAa0iyCvKaTg89l9Z2e104TP59eRvLVsPLsbeDwIHsGgc4d7AlPnPP
         v6iWrCRJuWsYyerAnifduZDr2FwsN33l3lGlbux9d3I8UAaRLduXKYWO+vi1M0U9B6tc
         fh+bJc6ALzVx/hOeOp+aQbsZwC2N8CoSLTyKcOHOLI+iO0kMG9sf0MYFDGahN1qXRW06
         LcRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787664121; x=1788268921;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h3loZNgkjJdhRVsMoqc8GJfdnErwerujYkPb9VXz+wQ=;
        b=hDyG89+DGrF43qGN0ckIB9ySosHech6EGYOB1at/UFkW880CoYSDSKbEvyLzZrbjr+
         T2JMjre+mmT9Q2zJNrxj+Vm2LZhnigps9f4zZgv89jBpGgQZUoWgFBIxuU5yo9S7WDCx
         x5ghqO8q2MFHDYdMriP6BYPUHo1/gGUryafR+CVyBEIZeUL0FEWJ/pjZkLnY2T2rrqar
         xPQA3QBuj31ykugffTR9QmPa+IKl5NEnWT7ZcQ4oh45Z8LGab/tTiI+8YjOv2n9sHkvG
         OybUxRfFoXR8QU4/KapRBLHq2qgLxu2WylXwrBuF16GFOubFG/rLE+wRDFheXaRw8Lna
         yXnw==
X-Forwarded-Encrypted: i=1; AHgh+Rrf6YDL1jB+ZgbWZ+Q6m+lAptGYLKipJv/3w8a+c39w6P6fStg2BawnqXneOUFQ35Sw6wnHt+bJDmvjIkXJLeg=@vger.kernel.org
X-Gm-Message-State: AFuF++kSvsAHTMjvxyBgEJpIoIi6yepE5H7Jb6SZCgBTVZipTZrugRT6
	INN1+PyN214mXMRYS1/kf+Em4DcRRBs4KMFnBwKX8uO2pVB+XpXlyKHWUiXpI2OZvGzDzGVyzKs
	djTibyFupIAz5htVx6qNuGOAMoveB9zQiAIzgDT0QfDvn+hG5Zf87KL2F2IKQdqASAj5pDA==
X-Gm-Gg: AR+sD1310BigNH2Ox3Fo2cNDnZmpVI/whRgb08HNND+7eylanRrySQGhu2YhmgwfpRl
	Okdsh/siiEfUnZn+LxbP+J0w39ymqXkMluXumGDfYD6uW+ejg70IXAtm+C18B0FnNV/st2eE/+p
	YU2YKPgXGKCZUL2EJVp6I2CD21KczpJsIBZD3ewvvLybw7qKGB2qOUD6EnwNO1AgT2lSH4U14Pm
	iuML/oIKtI4ctKnuksdt82iSfqOXOEw5H141cYp4wACChJHu/bdWajo77mgCv0W8NEEst80saMd
	Wnzz6hkH0fMSgrwVHvKIfyM7KHbpOJH44V9H2xj38ltlRpeBCccTvJUIfqc2MXh9jf4BKtds/Sz
	YLjvhikoOoi2qZEYRCGviZ1IacBWvOvoAtoqFYPMFT2V61+x3nOxASinQVE+ffUtZ4ISoKKuE
X-Received: by 2002:a17:907:d0c:b0:c20:d90b:2cb1 with SMTP id a640c23a62f3a-c249188eadbmr3012056766b.0.1787664120683;
        Tue, 25 Aug 2026 06:22:00 -0700 (PDT)
X-Received: by 2002:a17:907:d0c:b0:c20:d90b:2cb1 with SMTP id a640c23a62f3a-c249188eadbmr3012049466b.0.1787664120319;
        Tue, 25 Aug 2026 06:22:00 -0700 (PDT)
Received: from [192.168.188.103] (ip46-47-231-195.pool-bba.aruba.it. [195.231.47.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249685c573sm2279307666b.51.2026.08.25.06.21.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 06:21:59 -0700 (PDT)
Message-ID: <2fe7208a-7bc9-4004-907b-75f283360ec9@redhat.com>
Date: Tue, 25 Aug 2026 15:21:57 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 0/4] Improve stability of big_tcp_tunnels.sh
 selftest
To: Alice Mikityanska <alice.kernel@fastmail.im>,
 Matthieu Baerts <matttbe@kernel.org>, Jakub Kicinski <kuba@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>, "David S. Miller"
 <davem@davemloft.net>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Nikolay Aleksandrov <razor@blackwall.org>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Alice Mikityanska <alice@isovalent.com>
References: <20260822120308.1165200-1-alice.kernel@fastmail.im>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260822120308.1165200-1-alice.kernel@fastmail.im>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/22/26 2:03 PM, Alice Mikityanska wrote:
> From: Alice Mikityanska <alice@isovalent.com>
> 
> This series addresses flakiness of big_tcp_tunnels.sh discussed at:
> 
> https://lore.kernel.org/netdev/349c582c-73e3-468c-91cd-ad6cc3562700@app.fastmail.com/
> 
> Lower the thresholds to avoid failures like this (number of packets
> below the threshold):
> 
> https://netdev-ctrl.bots.linux.dev/logview.html?f=/logs/vmksft/net-dbg/results/754376/28-big-tcp-tunnels-sh/stdout
> 
> Tweak tcp_min_tso_segs and initcwnd to avoid failures like this (BIG TCP
> doesn't kick in in slow configurations):
> 
> https://netdev-ctrl.bots.linux.dev/logview.html?f=/logs/vmksft/net-dbg/results/751124/21-big-tcp-tunnels-sh/stdout
> 
> v2 changes: Use $KSFT_MACHINE_SLOW instead of probing kernel config.
> 
> v1: https://lore.kernel.org/netdev/20260814194124.3102581-1-alice.kernel@fastmail.im/
Any special reason for moving the target tree to 'net'? Selftests
stability improvements should go via the net-next tree (without the
fixes tag).

/P

