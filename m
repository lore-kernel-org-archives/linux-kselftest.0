Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394482E8B81
	for <linux-kselftest@vger.kernel.org>; Thu, 18 Jun 2026 20:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781813022; cv=none; b=lKApBUpehdfVCmMw3Jo+byHA6715yMSp0mjyMS4hEG0bVteZC+StEDxri+2/eqSz1yYYHI2Nxv1DJoYiRg9qYgjYac9T+oRE+FlQnN+U3F0kdw8NhF65M0DrmDyi3E3n1iHt5sgvMMLxjBC4p7nZgcsNCx8aLxetEjRWFtGmVhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781813022; c=relaxed/simple;
	bh=pBk9kGJqbXRSBiX8wQep4HoR3YvnXTOqulYjM3xplJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tPaDh94lfoRGzAkX8qu0ZIAY1d0bbFCFM5sKEuJ6XEu0AEg5a9P71CSIQElwgCYHgHqbJVAlTHZubeeeh36hqvtQwSmy8Ui8FZp69eovfiMBZ+dVs2rCq2J5tC4+3shfCkhw/pFzWzLhBLeUBipknhzZjSzKSIUayVBfwZVeGsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lu3CxoO+; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lu3CxoO+"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso10322755e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 18 Jun 2026 13:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781813020; x=1782417820; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pBk9kGJqbXRSBiX8wQep4HoR3YvnXTOqulYjM3xplJU=;
        b=Lu3CxoO+CtbcHE9O0K1SZnk19gpNRoX9BYyfi+2dCmqE89jZ96ohr+Ru8m7GFiDOS1
         +HWTcmXAKZdh++lcv2R8bpLS6YTkmZLNfNdkef8s6boi3Y+DpIwbcfNH73qt0gRKZ8zB
         DgNwY3wmLH9s7mnMP6BsyjXWmut+ogxo4gppqzUhUW0Ngrk6M/r1XmV6P+9TDPaJfApe
         9RwRA0VmOMBtC9dwjlGvXk9y6AqqdyMetG8awL5Yd5zf8SvJTaTX2/j7kKDPGRsUcDoJ
         Ua5sOJMdX1eDLNKO4VuqgP32mcHRc0HKzwFeGa6L1iDQ/IhYHw99bPVJknz0p5gQ8kIF
         3U9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781813020; x=1782417820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pBk9kGJqbXRSBiX8wQep4HoR3YvnXTOqulYjM3xplJU=;
        b=G5AMXW/lzCcMFbLMH+JW5un7VFFh9LkCfR78yjr9ai8l2b1MUhu4JyB57mQD3oViLu
         sgd++a2x8omG0PL8JC2GBN3eQrk/sTXhl6HlGZArnIHrgcTGfmfaMniVsvGPo96cfyDr
         7Sxair8VM5w9tn/wXrzbUJMD/cHMQiX5lxd0g48WLMSoMQNajXfX+M7N1WcpRuhLlu9G
         JpzTyZNFcODHfV3K/vzxKY+kFBCOsZPPjIYOtfnI3Q9Q+wCGtBwXNkJ6On5b6wIwBLj5
         yl7p/kINl2Paf2PsnSSURu7TYvJhsDqxV8L0wJzEGf0hBwtvb+PK9Lo1AX+20CQnTaup
         9BKw==
X-Forwarded-Encrypted: i=1; AFNElJ+A1H0mx1M/cDWW1x4z15VxN0K6a9LhdS4NbcIwp1lxOj6Bzcjp52C1/2uHPrv0nWGJ7q5EmhZfkJTjnpYaZx8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWrzG+DbvZc3aN9Fbs6SAQFiTZ+J/GJl1fjI06lI7B0Hp0/CmS
	JXkbWhc+0NE9N3a1s2PZajnHYXapkFdKLrxFOxs8897ffYCFF2Imr+1z
X-Gm-Gg: AfdE7cn80DWn9ZELGQ6kWN2t6u1rkmcaCKaKOhXVDbtMbICLazso025EFNBszcG0Ecn
	YpJbA1FQ0VCXwryX16FBq2OVXQZPaY8r/hsjarA+y86n9ByCvqvVgHkDkbNnsRL8QlO/5JNkXBO
	GSr2L7mVHAgTXdrBVpPe0bgLgT5hd9k+8kbxdvbhw4gPqpGiJSEiJuVM8bV25kOdh7o+NLB/ShK
	GzhRH6CFwDvFVqoR82ZC0+K7Rdjc2BOIz2usrnnamdedqu7yDQjJwTEn9agrl42QxNRsDdThFH/
	daqT6ox4isZm19hc5jezLiOAVnTr4DsHXW006Z6XBTuP5tjOBPLr/2Ke4sY6aKJkJ1G6kvdPr4w
	wCGoOfrQCi1H9/fHpRzx/VJ/mdqNIiK2muqZYawFrezS7XZ6d+wS5BAAN6UlNtP//nrsAbxpYE7
	zfDcSRMQv4BfPFCXDeblnN0Q/6H9t+yY/mfAW//n2t1UCitw==
X-Received: by 2002:a05:600c:4fce:b0:492:1e36:bb04 with SMTP id 5b1f17b1804b1-4923f6ad553mr18204725e9.37.1781813019397;
        Thu, 18 Jun 2026 13:03:39 -0700 (PDT)
Received: from [192.168.10.21] ([39.40.61.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650b67a248sm1487602f8f.24.2026.06.18.13.03.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 13:03:39 -0700 (PDT)
Message-ID: <60ef7ff6-0aa7-47eb-bcf4-76606ec016da@gmail.com>
Date: Fri, 19 Jun 2026 01:03:32 +0500
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/include/linux/types.h: add ulong typedef for musl
 compatibility
To: pbonzini@redhat.com
Cc: seanjc@google.com, shuah@kernel.org, me@brighamcampbell.com,
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20260531144934.403888-3-hisamshar@gmail.com>
Content-Language: en-US
From: Hisam Mehboob <hisamshar@gmail.com>
In-Reply-To: <20260531144934.403888-3-hisamshar@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/31/26 19:49, Hisam Mehboob wrote:
> Building KVM selftests with musl libc fails across multiple files
> (e.g. memslot_perf_test.c, cpuid_test.c) with 'ulong' undeclared.

Gentle ping. Could I get some feedback on this patch?

Thanks,
Hisam
