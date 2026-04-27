Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4B43E6DFF
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 17:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312013; cv=none; b=PQ6SpDDb4rNCIOwwljCrSj10ux/jFj4Se7Kb8k3Hcn6vTsMG5quPjBgqCfuPfkubjivmhq+FOS6oaLe1wvKOx3TDmvTfC4bnE+XnTlsA+yWSoc93LpmjsKUx90K0bHT3mr2BoYsBfno0bEnV9JsQObm6NZiDEQPVWckAu5t477A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312013; c=relaxed/simple;
	bh=e5HjhuVcIZm6djIJ10bLTcfPxKhnYmXhabkxmU9/cyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KmunZjHYrvKXJL2l8Bm/DOEp1c1fwhtDl1rwqBQj5NShxC0BulVofB7BLXya6m2pflsdVvmduZ7yx4lwWIu9OtfSrLXRsQvbqYe2v5jFBG/PCS1BZ7idOXlJ3kyR2cJg8+pqFbeQ3t/iCIa9P+cY/yQL73sX733ZOoSbWmsTiPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YDfocJGp; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YDfocJGp"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12c45281a06so14157684c88.1
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 10:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777312009; x=1777916809; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7XYyRpT3Px+QXPGB9xxIGkvs+bq3B849MvDwIxQIdqI=;
        b=YDfocJGpkfGlw/ddwbBpOBbwdD8iTe//TVtdyw34EW8xvOUHAldWtq7ExhaIuV8Swv
         pMmLjT6AIX9tIsjlWojjSj0ASOASV5KQ4F5BhlNQuSMv/eM9OWg6MCTup1gVQmR1qH1z
         8rS0bcizzFAAcSnh3zYfm2RJ74EKVqHNTUZfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312009; x=1777916809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7XYyRpT3Px+QXPGB9xxIGkvs+bq3B849MvDwIxQIdqI=;
        b=aYCmvTfk61TWzuquL4rZnuADctcoMzwWGQ6UlN5BUVqejHzCtMNvAbDbiyb6qE3NAZ
         O2EiCU73RY2ZaSpdN7OO50yxioor+bAYNKFWsvNJ6FY1HYj/rSWtkyNVxg15vcIae3XV
         TSPnj+vReZvz9N3vz6kzInnliW3f7Fb7/MKoJCLE+XrjO2JZOzyG8AtjqQmSF9UDpgFg
         JCD/BVooKjpvcZAfs2g0pz+02aD2S8jGr8rvRVOCTFGS45BIrz2CQ+X2EdnNWsoGLxQA
         NpUUISSw4Rc3mDYJ4jedxa6jLsVS71EGmSwi7AAPtXkZ5Bds8nSeL2BPVRokjzCPtjQq
         4zbQ==
X-Gm-Message-State: AOJu0YwPc588IoNHNaIIIQxzB/zTHnYzqo2sBLwrHJg4uC8Ecwrvr8Zr
	8XXEQKsH/Tam4L0vITmvvRu7GWdInV18UVeAVnt2XRO2DXladZ0uhiwRfuLkYGg7nZc=
X-Gm-Gg: AeBDiesgoA2/OWtPWJmh9g84tKCAXb5LXo+afjpACblpiFS3KSjiD+mtNwfRbjE5da9
	uT/UUjy2DEHj2zniRxKRECC3G6CoHrVnP0mzzU1wsMA3Y5hleLF8a4OeF0xg68uNMb8vtiHZiAL
	RayRzLjUZReDBO8sHqPP3HhEycx3cbx+Lqvvk0tbjBKxkKiKC1P0fUhqmdSOp5VBpdH3VqeV9M/
	OF4Cdvy7JZmBaRZJvogRr4SRK3dfGTBDIcWnc3KGVN642noYsa4Bv1lOJb8O0JC1GItcTuxmpaA
	ms2Yzm7KfPes7eDOwyg185HANiel1FgNND4tXxVxHkI/HNU9Ssj+miYC0HqVKe5WlsHWAwI7UCW
	+AUJToAUtwSJL/j9TvV3i+Wl1yPK+Nx90WlFfbgbvsznyJ0ADJhXtZJ18G+JIOtBU08Ey8V9RX7
	6K5gZdCxvfGa67NQlJADxwCZCEVnYlgDCWtFXs2c8TyTrh0SxTCnHkuA4=
X-Received: by 2002:a05:7022:e28:b0:12c:8e70:c338 with SMTP id a92af1059eb24-12ddd4db90emr131910c88.2.1777312009022;
        Mon, 27 Apr 2026 10:46:49 -0700 (PDT)
Received: from [172.30.76.185] ([50.224.25.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccce0f5sm44032479eec.17.2026.04.27.10.46.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 10:46:48 -0700 (PDT)
Message-ID: <c182a8fd-5eb3-4189-a552-884d4d94c626@linuxfoundation.org>
Date: Mon, 27 Apr 2026 11:46:46 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests: harness: Restore order of test functions
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>,
 Will Drewry <wad@chromium.org>, Shuah Khan <shuah@kernel.org>,
 Sun Jian <sun.jian.kdev@gmail.com>, Jakub Kicinski <kuba@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260422-kselftests-harness-order-v2-1-93ea980ea3ac@linutronix.de>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260422-kselftests-harness-order-v2-1-93ea980ea3ac@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/22/26 06:32, Thomas Weißschuh wrote:
> The recent addition of explicit constructor orders for fixture tests
> broke the ordering of those relative to non-fixture tests and the
> reverse-constructor-order detection.
> 
> Restore the ordering of the test functions relative to each other by
> using the same explicit test order for all test registrations and
> __constructor_order_first().
> 
> Rename the constant, as it is not specific to TEST_F() anymore.
> 
> Fixes: 6be268151426 ("selftests/harness: order TEST_F and XFAIL_ADD constructors")
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> Reviewed-by: Kees Cook <kees@kernel.org>
> ---
> Changes in v2:
> - Pick up review tag from Kees.
> - Add missing closing brace in FIXTURE_VARIANT_ADD().
> - Link to v1: https://patch.msgid.link/20260420-kselftests-harness-order-v1-1-b3c603782ce8@linutronix.de
> ---

Applied to linux-kselftest fixes for Linux 7.1-rc2

thanks,
-- Shuah
