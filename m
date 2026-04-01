Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7800F1A680C
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 00:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775001622; cv=none; b=PtKL4YHnyI8bZT4+4uW1VulNGzP8uWljSieojcQkw826AdbxZoTyimzLk/xgHMYN8mFXiwyvIFUj4GA4BuYULTzZ6up7lrtjvBWdulncH2fjv+ZMgPIpankDvY4K7u+rv2E+xjjQzuFUm1MxiGpBgK5yDA14rIP122lQQtI0Asc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775001622; c=relaxed/simple;
	bh=6QqvLzfD3TWdX+qJ8LK3qe7rjEasacBys3QoxoGWt80=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=a77i4fdaYZW/oAe08qWqXO8heC+dD01oftpU63IkASsaiSXHSz+r0wgRieBB0ON53pLzGOA2Vzq3D2d7Qy7IEuOJO+FBJREtoNbGDDerIO6iRO3CwB1ARn7IGQU2wJjRLQJz7KEKg0Q/pCI+s8OligAxfQVW3uRseqBgyHmBD/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cU/qMJoa; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cU/qMJoa"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7d9c98e437cso5220006a34.0
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 17:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775001620; x=1775606420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UvZzRjhIJ24B8/MDQ+5FBw9nmKdExc+6X6xQmVNVp/E=;
        b=cU/qMJoaBSw35D56JZvsbpqDDtcEDkzfeOF1g06j50dT3ApCiH+GP8yQ+GCdbehxnU
         CeSWGPoXBb1FEamaR+cOwyb9w/EAAtSwQYzVGx0LuW95X1BiExk/UwNlDgDkO5Eb12iP
         q/5c57nj5DJnj78z09kk0oPt/e8bU01pYdGYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775001620; x=1775606420;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UvZzRjhIJ24B8/MDQ+5FBw9nmKdExc+6X6xQmVNVp/E=;
        b=nFGKcvgEq5xe/nv9okDo6e/WD1foc9xuXBVQCTIbrkIAzxFNz1kbYM+VfKcxW0kh1/
         Yw+qJ6WAzg/vGohsth3blVdMM71I2XAYfFDmvKafg48FqjdY/H/gkOu0L81eLXu1xBVe
         iE3N59nAo/agbw+DFFGpcYkxnjnuxkpq4RqGSWBdDjXlBm0fZ9B/c80yUa1WMuiIFkMq
         jiIie05T7P6S+0sarBye0FlYyk6G0LkI+u6fmmwrDopZ+sV6AaRC+6E44t3tLMY6jsyo
         q62qhgnaCgryvp6ajSzdr+3RnAxMlBBgXivx1OFOgjsq9LvjOIEgyBTg8dOK4fnlvDjz
         xogw==
X-Forwarded-Encrypted: i=1; AJvYcCUGeUU01wyIn6jY+Rkrsrf9JxXTIpTtiMsFTIQrgxTAGU4eHh+RsUalbBTonIFVBNiAkpA0SA/exk+4uNo32Vs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC4mNo0PNSHdorBoJAlmnJd4v9YlZCxYdJYgGsV/E+KlNahONB
	Aw7BUQwMGuYN5wrgWdw/5ZKBeQijIUWls8WyrF/vQxxlQD1t29tpXto1BphvFbea4katPWXyl9s
	5mnXeeVg=
X-Gm-Gg: ATEYQzwc0H1t3o6FB0D3gATMZoHCMX+BsySO/tKNc0CqCerWRoYDMC87MC1Fw+g6eCT
	fVnKZPR3o+0LLQIgdYzRZVvGj/QnyVJzei82ogAy6SURHW8QrQD5nIC4BMFvw/6rjkhcICzdzPW
	nfKA+30Mt+w/+FJaDpMhOa+XypJqg/BnVbaguZqoIgqlTUQul1mcDTL2ec+9nnhOgoaA/20xUrP
	/gnNTSj2zw2cZq77h2rGYYMJd6bB44Dxy2Ce3Gc07/HH9payQ2MQgvZkulE1R+DiMbRoARTeHfk
	yCvCaSk3ESqM8M0AyKALDzTR6MpxLUDiMOfMbvD1x5Y+ItWZHr9/5FqTGkNMb+0U01tXPYA27vT
	o16N0UxkWFT37bgQdt/TZWuPsnYfKP6mdzuJUBU9+w+Ff5Po/NcYh7OMCtKkKR48x1GBFZhuVBM
	R9JSA3Ql9xT5NqccY1uMF6I8pxI4STx08TXpg=
X-Received: by 2002:a05:6830:6690:b0:7d9:b0d2:dabf with SMTP id 46e09a7af769-7db99393681mr1064455a34.22.1775001620178;
        Tue, 31 Mar 2026 17:00:20 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a336353sm9308937a34.2.2026.03.31.17.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 17:00:19 -0700 (PDT)
Message-ID: <c88cc374-4c06-4567-823f-74dcb92ab90a@linuxfoundation.org>
Date: Tue, 31 Mar 2026 18:00:18 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: tools/testing/selftests
To: Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260327143234.40bb8a0119bd55670ddfeec6@linux-foundation.org>
Content-Language: en-US
Cc: Shuah Khan <skhan@linuxfoundation.org>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260327143234.40bb8a0119bd55670ddfeec6@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/27/26 15:32, Andrew Morton wrote:
> 
> whinges, perrmanits, maybe I'm doing it wrong, etc.
> 
> a)
> 
> At the top-level, neither `make mrproper' nor `make clean' remove the
> executables from tools/testing/selftests/mm/.  Seems wrong?

make kselftest-all from top level builds the tests
make kselftest builds and runs the default tests.
make kselftest-clean from top level does this.

Also you can run,

make -C tools/testing/selftests/mm clean

As for mrproper support, I just applied a patch that adds kselftest
test to mrproper cleanup to linux kelftest next.

> 
> b)
> 
> Shouldn't I be able to run
> 
> 	make selftests

make kselftest is the one that does that.

Documentation/dev-tools/kselftest.rst documents different ways to
run the tests.

thanks,
-- Shuah
