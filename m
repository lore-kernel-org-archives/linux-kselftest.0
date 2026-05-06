Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B6048BD27
	for <linux-kselftest@vger.kernel.org>; Wed,  6 May 2026 15:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778080934; cv=none; b=gR+i08OfNEeRWTW7fHkjWSSbkDZSEmYOqSfakoUbFOiwwlNc6pnNqfF4/yCR3DC3Bfpm6Bte2VGKDLXdfoxv38A2/OpObK8KfjYtZzn8rVDmsNlwQ53bvquJeMwkCHztEef4BCNyidJBm3TJIxi8a41DC1BDS4SfQvC9e6D5XNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778080934; c=relaxed/simple;
	bh=GU+rpeFvu/c+ECLaLtY3bH6GaOKIvSDEkZsrPMB5ACQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kNjsva3obqqUKzYFEu2MA1jJvupBUpbKgFxZgaLXupokIrFfZdKJOy1G1QI56eiNbiYCoupfzrp1dyrRxhyx58eJ58CYx/0SPFMiX2q5Pdz5fCU0IKLbV2DgmyJyejKF40djehzoKauxuVK+ByhqULuvbg0O2VT5jaGHOssXebk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=au/g5mo3; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=RMpeRqDx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="au/g5mo3";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="RMpeRqDx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778080927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4lOFmECujKVw6rBnTfWmHI4ViWK6rRKv7cPq5umz4ds=;
	b=au/g5mo3wwUH5JtNwtC6kqWLpNlEzZ7IP+HpbJ5WZyck36AyC/4Vbn5otneUdRhZ8CXLlK
	HpnRGFEE6JYhrszD0BNMR2KaatQ/3gTQiZBLYMboWN8+Qy6h6sV+zUQ+jD7jFvWkNu/O6S
	F5mAvJBBPVs7+TpogNvyzhuOBYm5vjU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-rnS_lsTcPfy3d6SWgU4Tyw-1; Wed, 06 May 2026 11:22:05 -0400
X-MC-Unique: rnS_lsTcPfy3d6SWgU4Tyw-1
X-Mimecast-MFC-AGG-ID: rnS_lsTcPfy3d6SWgU4Tyw_1778080924
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4411a1f9601so4808415f8f.0
        for <linux-kselftest@vger.kernel.org>; Wed, 06 May 2026 08:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778080924; x=1778685724; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4lOFmECujKVw6rBnTfWmHI4ViWK6rRKv7cPq5umz4ds=;
        b=RMpeRqDx0Xyi0yMSuDMb74nxP20oXt5s7Il9R9RJ401qSOz11FkQz3HwsywimuMjCc
         IaGxpyUItI7pcHXEJkF6sFHiD+Jl5bsq/WNgJ4VqPj9QNAMSaEYKJDanSGyHc7s78lAe
         Z9iuO4szijc7nf7AKzuds7QJ+iNr3vipUR1qc3LAkcB5rNFPK0fcm2Xyl6qQIuxQKelf
         oIMr24vVJzkcLf92uU8dq6yTUWuzzmFFEhKxsb0EKc3bKb31VlHom+4IVwcF2++5qQim
         otyssSgKXl7dQRPb56d9dhZI4HMjTONVAo0pSmkYdjU5JbR84s8o8w6ulgk7OP15ikJl
         Q6BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778080924; x=1778685724;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4lOFmECujKVw6rBnTfWmHI4ViWK6rRKv7cPq5umz4ds=;
        b=SvzIcLvlKti9dzQhnc7otunuQiqxsoOKrzm+xPAMvsCJLwe0HgzTnHlEDScEUMZYtt
         VHvYuLRHwzAX40MQS0cN8IkROPUyKfybYT3LBTHkrDfFItnb6ZAhmDsJA1x+7/jUrolB
         gbXMK6BRIeu4zyKBfRSl67d7Sfv6JMMCd3+EL0cRMsXk9hoZTegGT7TaV2UWvo0mqW7r
         +LkLvmn2EEhTzwB3PVayf0MYG6ZJ6SxurxPYzgT5aWu+oTKzQthGyKvNBrcXIslw3v6W
         5oNQYY4ps0jWVEUmxoFOq0mXeYbUrRtx5nHRl6LLf9x6mwEYBWsT70T1msqd0eHxErqG
         cA+A==
X-Forwarded-Encrypted: i=1; AFNElJ8JtavBZicpF4btUCrLtnVJ4GmssbcLdvCQq4BcQG3PT8pJ3ZlAOqE7E0zgloTTgCCLPrB5E6WkYVGSS0HLGKc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsZugE0KM/LsUMPbwFptoTNRIdPMCAzqlI/xcn7e9Zc1w9yctJ
	i0cfGTTxw+YpRA7tYVpiC++tye53RclpDdEf68r6IZrrN6a1NEcYcE7Ph5TlYkcmNL/gYHA5Zav
	0XSkKOU4upJo9E/QpOugRe8wnR7BvyRortaaUoRK3o+SIx/N1LMDBMlsw2rt2wclfhA60vA==
X-Gm-Gg: AeBDievWOSOdbyX+bP8+TMWaj2wN5sTmyezPTjxQqv0O/GtOXLTcupECAicefCpd7Lg
	EhVUDq65JzfB4kNd3EKxTlCADXUZJ9+TIxsI/p+qtN+f7ebOfskBhfNYtku6jZecCb5SG26/3qS
	2BpaXyOK/zkQQQ69f8oCHtz3DyHPL0cBwbUS37gbhJftVoGxlvRvKbrpXENZO1Byl4df8mcc9Xd
	s0oLn/F7dJOeMR/3UDuqMVtJ6FEWuSkWKJdvk2pwZTXzYTr5qVDC+rhJ9NfOTu+JDXuaj7v+Nwg
	Pk7EgSolHwMjfx36d6cJ79F6aLMkZpOOLjCkKkKdBXoEWF/NI/uoQ0r4vEyj6DEKIMO75YudlQN
	r0ikScO3B3nDq+dJMILlqAhYD8TI8kd/RsbEpf51ejDJQtQZmOgg2mpM4cepwj9SV95o=
X-Received: by 2002:a05:6000:4010:b0:441:1fa5:457c with SMTP id ffacd0b85a97d-4515a6c2a13mr6722869f8f.5.1778080924408;
        Wed, 06 May 2026 08:22:04 -0700 (PDT)
X-Received: by 2002:a05:6000:4010:b0:441:1fa5:457c with SMTP id ffacd0b85a97d-4515a6c2a13mr6722802f8f.5.1778080923927;
        Wed, 06 May 2026 08:22:03 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.25.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4504f4857ffsm12837888f8f.0.2026.05.06.08.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:22:03 -0700 (PDT)
Message-ID: <59b26f1e-efd5-488e-8738-15e96b9c79e4@redhat.com>
Date: Wed, 6 May 2026 17:22:01 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 04/12] net: shaper: try to avoid violating RCU
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: netdev@vger.kernel.org, edumazet@google.com, andrew+netdev@lunn.ch,
 horms@kernel.org, shuah@kernel.org, linux-kselftest@vger.kernel.org
References: <20260506000628.1501691-1-kuba@kernel.org>
 <20260506000628.1501691-5-kuba@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260506000628.1501691-5-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/6/26 2:06 AM, Jakub Kicinski wrote:
> net_shaper_commit() overrides nodes which may be concurrently read
> under RCU. This is not a huge deal since the entries only contain
> config, worst case user will see inconsistent config params. But
> we should try to avoid this obvious RCU violation. Try to allocate
> a new node. Since commit() can't fail fall back to overriding.
> 
> Full fix is probably not worth the complexity, struct net_shaper
> is around 80B, and the allocation is with GFP_KERNEL.

I'm not sure if even this variant is worthy?!? The scheduler tree dump
could be still inconsistent, as the dump is not atomic. IMHO e.g.
inconsistent weights in the same WRR group would be as bad as
inconsistent values inside the single shaper.

/P

