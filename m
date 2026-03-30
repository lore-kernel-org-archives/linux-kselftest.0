Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C7B2C159A
	for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 08:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774857976; cv=none; b=YfVewsFFyaVuHRZwByUAw8HrgMRx4/XTCLRgYUp/+pAbZHPcdGoAC9JEC/bArnNO7zxSV5uJU7LHRAt8rWvxwbq+DanesR1Y0NKd2DM2ZXDjwjOgdqy2j0RjGWrC0aep/7EkD7f3rHikh7q4VHndDzyCR5Qt6FVNwmk/lyz3tYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774857976; c=relaxed/simple;
	bh=kkfD2P1hm0+ZubT4vEQkzecPsPm6oKT2oHVK9d+50Hs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=arbcnKOJPZO2vg1okEW8Atfumh1sKyHNytykGo7y5Ledp9hNawS225rTj92JpaiKHWn7WgyS2NZPrqZuYeegY22j3zUC5MmnE5DL7vdIxp1C40sApahmfaSxvTyJ/jCD5yBsFsSQrkrO2vuqFJag9G2DUZV5kJ8AqeK/swKsGY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BWtBrIu5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TG8M4INq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BWtBrIu5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="TG8M4INq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774857973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7T4GSdfs4U7ZrYueyx37xTT6R+FzPto57XBQfWOXzFU=;
	b=BWtBrIu5WkVzmfeM8qQ9gUI5g1LRS17rfEryJovAo2A1TT4p/wrwCTxYXlz4HcYRhKBCXG
	igbtkAMRG2e/gyMfJE2yhzilDbgFp7row8mfmpBT0SyRFpR11Bd0GKzQxh0xj71DmxC3wK
	9mcQPywQ3EwIcP5aSYKkwAPIQMgb9Vk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-4jm6f-yhOMGQQeeBUoRtQA-1; Mon, 30 Mar 2026 04:06:12 -0400
X-MC-Unique: 4jm6f-yhOMGQQeeBUoRtQA-1
X-Mimecast-MFC-AGG-ID: 4jm6f-yhOMGQQeeBUoRtQA_1774857971
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-48544725bdeso56727335e9.2
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 01:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774857971; x=1775462771; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7T4GSdfs4U7ZrYueyx37xTT6R+FzPto57XBQfWOXzFU=;
        b=TG8M4INqEZHAsE3RdcO+Vtn9yemH5EW201gyCulmGqzGATQIvjbVDIT0tESm9A9c0e
         ftAMTsTWzPa1YakdzCPHWRQ07YTjOLqTEgqXtqutsnihv1sm2mc0DbXO6dSJh+KPelPB
         Uw9zHgsOsIIjVzGFZW9IUVZAEPoCaJ49zssl9vRPMBGOAva6sB/7HKF/PSim1RYvtQnt
         zJFJkypmHGdJnlu92cWfBksUbl2FiY7JYsbd7k7x3WmTpeohoDlIdUeNCnYy12WWgq4q
         WxNV8S9q6KZDNSOmrzyCQ+TGc5S4g6z3oftUg5cJgpmQyx3OLQxKP/clcpHWgwRXxxP2
         mfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774857971; x=1775462771;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7T4GSdfs4U7ZrYueyx37xTT6R+FzPto57XBQfWOXzFU=;
        b=mfi0/7Nzpzs5HAkUa5C/cNMd/t8zgGGo9vfAcTDlvOkAnGwK5PV0r2eqMcdjcIoBZC
         ohm2Wu+TCYBdw35v+ybUwhAYbjs0zN91mPZNzt4+dko+R6NsA1Xl6MU737hhPsStpTEu
         6G/mSd99BdXCXNpTnIQjOWi/fGoDQkyNDktI3jvcZ0ypOEU2BbBFCuIWwY6a1OHXSqNF
         toour4tolgO5U+NeNaYD/j3YQAwfDryMr6RLHBuPqCR06GUcyB+pQwE+eIx4nMxfGPM7
         fazAyFkGnPJCBeI7XYq3dYQ0bBx1wn4NWBO1RXifQ9Y+L4Lw9po+cfXeYY4y/myyhFge
         1tVw==
X-Forwarded-Encrypted: i=1; AJvYcCUW248e9oEBeTDkit3X/0slRZVSZ/PA7S12R7pdYpE+G6IlExNio2PTV5WlzlQbTr3mwQRu7sQdvjQYemx/zTI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3xHCRgW9gzdvrgQ0SzRgwi1mWYdARSeBZ/TY7Qtn7NPQvjusW
	6YKEhp6FC+03IXTFvBbdPtt6LgQf+GMcZs2/dCb5vzUA+JErK2FbKbYgVM0sCDKCKOcxeoEcsgt
	KSDmUjSE6OaeQCxoiMjE8i9kdBLJtWWSGigfwaugnHOUpYRHXYIVxzcA8FR2vEMUUwQoLuw==
X-Gm-Gg: ATEYQzxwGVkyXwQXlmndMnJYv/QuEb+QR906Z2AQFPz7WqK/pwCRJwnmsMxKkI2Hv9q
	gSex/oZwTjKU//sHUH1eTgZwmtVXFzYPgGO0E4fKORr4s/YtHsf3Vwv+XKfvU8zDwaJlp4Z1VnR
	zrb0pe+KefGVCEnVn6NgeY7Z+f9bRf5Y0CPZjcc9NGsTrtm0jC4e7TLN20eHa4QWRQtTIxkaCEn
	M3AwTbRtvssLZMiSxxvCrTGdYZQh/+Ehr0ilSdwNEH3ukRr2qdxuCxozJRuec5f0t1Kimw9aM5K
	mVDKaewXhnKKHHCRVWy0DOM/OnhPnVZCYJIuMBd+p93pq81lGUYZb/htXZmQOMEOAo+LANbk4Ce
	iw1Jr/N9YfynN4oMYGUl51Zl8hb3F0OSR/E3VUsI4fc6FOIHNYVzSGnLC
X-Received: by 2002:a05:600c:450a:b0:485:531d:28b9 with SMTP id 5b1f17b1804b1-48727d774e6mr200981555e9.14.1774857971183;
        Mon, 30 Mar 2026 01:06:11 -0700 (PDT)
X-Received: by 2002:a05:600c:450a:b0:485:531d:28b9 with SMTP id 5b1f17b1804b1-48727d774e6mr200980965e9.14.1774857970693;
        Mon, 30 Mar 2026 01:06:10 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.11.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722be608bsm392031745e9.0.2026.03.30.01.06.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 01:06:10 -0700 (PDT)
Message-ID: <cf7128a8-80f2-4d4c-8c68-2c9f386cedb2@redhat.com>
Date: Mon, 30 Mar 2026 10:06:08 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] selftests/tc-testing: Add netem test case
 exercising loops
To: Stephen Hemminger <stephen@networkplumber.org>, netdev@vger.kernel.org
Cc: Victor Nogueira <victor@mojatatu.com>, Jamal Hadi Salim
 <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>,
 Shuah Khan <shuah@kernel.org>, William Liu <will@willsroot.io>,
 Jakub Kicinski <kuba@kernel.org>, Savino Dicanosa <savy@syst3mfailure.io>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260326181701.308275-1-stephen@networkplumber.org>
 <20260326181701.308275-8-stephen@networkplumber.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260326181701.308275-8-stephen@networkplumber.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/26/26 7:01 PM, Stephen Hemminger wrote:
> From: Victor Nogueira <victor@mojatatu.com>
> 
> Add a netem nested duplicate test case to validate that it won't
> cause an infinite loop
> 
> Acked-by: Jamal Hadi Salim <jhs@mojatatu.com>
> Acked-by: Stephen Hemminger <stephen@networkplumber.org>
> Signed-off-by: Victor Nogueira <victor@mojatatu.com>

Apparently the new test does not pass on NIPA:

# not ok 364 8c17 - Test netem's recursive duplicate
# Value doesn't match: bytes: 294 != 196
# Matching against output: {'kind': 'netem', 'handle': '1:', 'root':
True, 'refcnt': 2, 'options': {'limit': 1, 'duplicate': {'duplicate': 1,
'correlation': 0}, 'seed': 6495514880116664183, 'ecn': False, 'gap': 0},
'bytes': 196, 'packets': 2, 'drops': 1, 'overlimits': 0, 'requeues': 0,
'backlog': 0, 'qlen': 0}

It's not clear to me if the causes is this series or the follow-up. I'm
tentatively dropping the latter from PW; let's see how/if TDC is impacted.

/P

