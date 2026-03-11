Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB1A3CEBB1
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 10:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773225534; cv=none; b=ZRcmaWLZD3LeiCVIThFr2DcqezVyZbqbRnBjd+dwBhxDbMPVCchM4DytfQ/+2diHYfdVDKU72lpzgtFh0XMbxj0HD7ux/b6HXE/U/tVf3+sl+IylZsJCK9mivQ3Upifw8n0ldFkNuwugsa6OV9RIgF+NFuOpM+8AHKLEqb9XCSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773225534; c=relaxed/simple;
	bh=185y0PaB2qoq/kw/dk0yYXDMqRtCAUSs/ki1l8VSMrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HIku/LPgbvrlelwnilWvdRNJtQtAfptgzheUzxSL2HemeIFXfeltVHPL3HjWv7mnDzlAarp+V71d6UuEMuMET05nEnO2hQavrzKjT0bh0IsAOe+M014VWKVGK7ZMxOcv6z2do3tWt/PWfbEUSmpS7wWtvUcOF7Di2SfNZdyf24I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EC1PaC7M; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TbNOr/pk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EC1PaC7M";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="TbNOr/pk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773225532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=neo6yRSSLrmWFQaEvseu7oNpogbBakeVD6DPSMC4PEE=;
	b=EC1PaC7MmvAidbaCL4r5cKCODX5WLIObZwuGq3AMEUJl8h3Q+ljswwdSLXX9qe2gwbfKNz
	FG9OOEjd3SBjSZpT7KT9kiuXsOXKXw6Cx0t6bkM/iYP0lE3rnI731/6752Q2S5CJRzGfzS
	m/4krs69+t5cSZSLjMeKlcEZBLKihbI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-r1PoOJKhPTmBx6-XWt9pzA-1; Wed, 11 Mar 2026 06:38:51 -0400
X-MC-Unique: r1PoOJKhPTmBx6-XWt9pzA-1
X-Mimecast-MFC-AGG-ID: r1PoOJKhPTmBx6-XWt9pzA_1773225530
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-439ab866bc1so12734227f8f.2
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 03:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773225530; x=1773830330; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=neo6yRSSLrmWFQaEvseu7oNpogbBakeVD6DPSMC4PEE=;
        b=TbNOr/pkTH5NrZ7ojW04Lz0C4b5XRDEKVyyoqtqS7M8Nu1CGEjUGmMkWZTvR/Tt6zn
         Ksegl6h3+AQFgv+2G44PSJiV4bSBHzCuKMiayd/QBnebwq5wh3r9BTSPZsknluGZ/g0H
         wEckIx0AXr89MNEz+7NMVpNTG+OJCM96UiAUdtGV3y05u2KOxKYkkXHeyVxiBgxhtBji
         ST0gC5FoXDAzAqDl+JgmyiOkDL4Xbuxe3YUc1fkiD1BVG9UxJSPWez54yXnhCEY3wpX1
         tjKLqYIr181tg0Ad2MA2CMiPjdQlQYWaVJPrMkcclazzCyVMP9y5XJy4EnHfomvwkuOZ
         Pg0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773225530; x=1773830330;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=neo6yRSSLrmWFQaEvseu7oNpogbBakeVD6DPSMC4PEE=;
        b=dkSzOh6mEYyHE9ONK3xLqELdjL87PihOEjUBc9PFidXJm8e/LVl2Ow0FhM8VA9vdoF
         B777L51X/nGJJpVcZWsmE7IQLznM/KSOCCAWvh6zgHytx/bJPB2xiwY9xoSzZxdhLp7W
         tPf/rtYMOpQCdU+vavQ0KQhFKIcNpcIYB7tdyS6eVOk/EbFH91HOtT1szWDcHX9XIJ4I
         JddTKOG0sf3QRjy0XFgsc7kSycYDfU+Mp/GlJ1vDR0wnYyvxjk3SQ24Pn1spu1H0L2qm
         g6l6tRj44p0+ec2wpIB9HNZslN7lu1v5Au/TrH0qrfDFZzqArRSe2c8MYx89x64XC/Za
         ta4g==
X-Forwarded-Encrypted: i=1; AJvYcCV6SxCJL1Q98XzebkYVoixeCZ6EjuhXzBw90fnBKkd4uvXn0xunc75uJSUujEyBdlxLz6WTHAyWuKkVg6DUuDk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeIPoX6joTyR+8OA1QIKPqEk85bBF98zH5KuRGWSAiKNYvgxoP
	XPjNYOGEBpXlzDXeNEJ37PT0yjvKy75h/Wz7YerU8TlonZwolKOwtmb+vWZQpkwQnnoGrw114h9
	L62QntqicKdpvOmPlziOXKnP0DVS/hCWXjpuGMOLEQdXEadcoStCL86s7twKgK2ndv0P/
X-Gm-Gg: ATEYQzwBOPyFXTfW5REbNf1NUvk5O3WNiDAPju/cxe1oPanaj97RwY0j+zmbuW+S/td
	iDC2xUtTWFSGqFxd2Zzz6bT18RWaM1sW4QkPOPGm4TjN0BxPPIuES+7Hy0QYx+jsKDwEG2MV7C1
	CFg0KzQEqrbW5j290xSYlw+gYTPs3PSNJ2AVxMlbkgDo/mA6+Lz0NzouklP2WFDN5BR68DvIcx8
	wV4NuYAuItzYM8ScSpoXjz8J/mvamEc1LyyEopPk/ttxGvUr1AUCfzP3sQJTCXYTwjtFoR5Hl4V
	7mtxeDMw2iqqwSUuyYjefQTQpODIupgb4avFV6lArabdq8D+qczYOjfbi44g0uY9E5Tqn0f2LHk
	d3zFH58q9eN6jJBAcFhVYuC+QvFaoXQFF+o5NzJczwHgZJojhwO4OA9DF
X-Received: by 2002:a05:6000:2486:b0:439:d752:8bf9 with SMTP id ffacd0b85a97d-439f8227e7emr4056574f8f.58.1773225529947;
        Wed, 11 Mar 2026 03:38:49 -0700 (PDT)
X-Received: by 2002:a05:6000:2486:b0:439:d752:8bf9 with SMTP id ffacd0b85a97d-439f8227e7emr4056538f8f.58.1773225529493;
        Wed, 11 Mar 2026 03:38:49 -0700 (PDT)
Received: from [192.168.0.135] (185-219-167-205-static.vivo.cz. [185.219.167.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f818d209sm5419754f8f.5.2026.03.11.03.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 03:38:48 -0700 (PDT)
Message-ID: <8194d1b7-9279-4290-a15a-df57ea991066@redhat.com>
Date: Wed, 11 Mar 2026 11:38:47 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] selftests/bpf: Fix read_iter buffer termination in
 test_bpffs
To: sun jian <sun.jian.kdev@gmail.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman
 <eddyz87@gmail.com>, Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
References: <20260310102145.857810-1-sun.jian.kdev@gmail.com>
 <6a914824-178a-47c3-98f7-f3c3086ab831@redhat.com>
 <CABFUUZG+fDw2eETsmEs1RZ-vSZ07uuxLuZDYp0KJqTX_6via0w@mail.gmail.com>
From: Viktor Malik <vmalik@redhat.com>
Content-Language: en-US
In-Reply-To: <CABFUUZG+fDw2eETsmEs1RZ-vSZ07uuxLuZDYp0KJqTX_6via0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/11/26 07:47, sun jian wrote:
> On Tue, Mar 10, 2026 at 8:28 PM Viktor Malik <vmalik@redhat.com> wrote:
>>
>> Does this fix any real issue with the test? I can see one very
>> hypothetical false negative when the uninitialized memory would contain
>> "iter" but that seems very unlikely to happen.
>>
> 
> Hi Viktor,
> 
> Thanks for the feedback.
> 
> Even if the probability of a false positive is low, the current code
> is still incorrect:

It's actually a false negative, i.e. test reporting as passing because
it finds "iter" in the random bytes while it's actually missing. In an
absolute majority of cases, the random bytes wouldn't matter because
"iter" would be found early in the initialized part of the buffer.

So, since this fix only makes difference for cases when the test is
failing, I don't think it's worth patching it.

But I'll let maintainers decide, I'm not sure what the common practice
is for these cases.

Viktor

> on short reads it NUL-terminates only at the end of the buffer, so strstr() can
> scan uninitialized stack bytes. That makes the helper potentially
> non-deterministic.
> 
> Terminating at len makes it deterministic and ensures we only inspect
> data actually
> returned by read().
> 
> Regards,
> Sun Jian
> 

