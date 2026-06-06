Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663061FBEB0
	for <linux-kselftest@vger.kernel.org>; Sat,  6 Jun 2026 01:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780709585; cv=none; b=ei3C39ppeeJVsasz/zNdpjLq1FTuJCTdvNz6iX9MdMUmRyQJhE0v9GGjpoNxxJ2aFF7I7O7Iib4BLb9NcC9vMndCA6bQumWbKC0NeC2oTkT8Ovx23ha3+gjJUlBwzXRelOZ3/cIMmJqnSWGfj5MaKT67lrVvmKcOorKon7WVPhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780709585; c=relaxed/simple;
	bh=yCQB3YO9RGm7V3SVdvHqHsfBTMTLhHrqO7+YMHldsoo=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nB42xOH0Es6BAj9Rcx5ZpIVTBAHenVetu4F5/+PZInEfsLIFhaka1ze1SeerapCnkc3usi7rfTqiHpg3auTKSF0VTE/mapbnjGzyJ4mmhxDdQSSUC6sWnKhV07XHSpoqA97sOKQjVY7PexlMWRWh6i8Xyx9SB0sno9Re8M9Cpyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-490be03d47bso20478155e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 05 Jun 2026 18:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780709583; x=1781314383;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OHl7B4Pdpkq6k1fa6b0ffg8CaxQkxmXR75ZusA7nDOw=;
        b=X1bzbTg0lmaIb+mXZWarIerbemEl9BU4C6amm+Or17XtmtJMB+/OU5ON3m2NMzNlAu
         8NvOEmNAtVJaf2ZaELoEOjuPtQ11xOPY+d1/xSe6qrjcbfcPgO96zX/WuxKdPQpzp1oP
         QZL7tcP6gOs72np50gnXL4kxytPfJLPFov8aw7Xin0xh6zWYoOf3hkmUjgPLZDwG4sDh
         TAf/v0TJ2dXl8hGgk33ZK+tw+CK2dlq+lMzZyQhh+eelvKL5oefEN+WD8egoMmnxUcgB
         pvoyQl4mOccApAAqTpfrCUg0d8k9rbUJxva/F7BxzlB5E+Zgr/9tGsrYATt8MpYOVYy+
         fMjg==
X-Forwarded-Encrypted: i=1; AFNElJ/KYucCoLJwZj9K7bTYSl4fogqndr/nfG+l8iXJ3wP/p3YHjDgqq74P0T5vRs76Gz43EjnW1ydcBKLpmKBQnxM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDHWceQvbKQnfZq2Upv09p5SgUxB0jw3TgVvERmFBNSedeoXR5
	rMLhWmHqVr18lLaLzZLNr4LEfru8MqKTemMMIUm1Ke2jxnoU4n4dd7wj
X-Gm-Gg: Acq92OG6unCGjUa/kG6FVZR3G9Su13A0cchniqJ2l3qSHlb9XkLyulZPFtGN+dU8oRJ
	RyfgXJa800vPWKS4zftfMrlvBpF/amHETjvVs9JZrbp1QRk1GCl0WF8XEk2Rm2Qdbd0+kE1xn4I
	Urs5H3WWjt2nwC7tJC27re6ofU4cdy4RYe84JUrUYOXl17NhmnzohpeZbrs+2c9d1VKHAc5Tc0l
	WzoiMtJIchjAIMnfrrTDDHVOIFwRZ7TtAifjTY9Yi+WuCRfaahyyWe0Yquh2fUNKxK2uf6JKPLn
	t0k8qNlGS2Q86Q6qx1wUG2x+ps669eubLKgBZDM8Bx9JH1QARkvQlr/P+Vp5XSjqADRuNeVskF2
	mMRTQ4zPg80C8jEhiNe2YOqGGi6V3sGkc6Hzr2dRHVjqcxflMjboezfdALn08zXx0bZ+Y6xL6Pd
	pmwxOpmkmTK5R5ocW9JUFJKl9lDLui9VBOhrL12ulIx8CBHF635IgW12mNrtdU9GZKIw==
X-Received: by 2002:a05:600d:640f:20b0:490:c2a3:3303 with SMTP id 5b1f17b1804b1-490c2a3337amr67695005e9.34.1780709582748;
        Fri, 05 Jun 2026 18:33:02 -0700 (PDT)
Received: from [192.168.88.241] (89-24-36-255.nat.epc.tmcz.cz. [89.24.36.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351ac0sm51494708f8f.27.2026.06.05.18.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 18:33:02 -0700 (PDT)
Message-ID: <110f6d5e-85e6-4e60-8b73-4d3a85a9b08a@ovn.org>
Date: Sat, 6 Jun 2026 03:33:00 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: i.maximets@ovn.org, echaudro@redhat.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, netdev@vger.kernel.org, dev@openvswitch.org,
 linux-kselftest@vger.kernel.org, amorenoz@redhat.com
Subject: Re: [PATCH net-next] selftests/net/openvswitch: add flow modify test
To: =?UTF-8?B?5L6v5pWP54aZ?= <houminxi@gmail.com>,
 Aaron Conole <aconole@redhat.com>
References: <20260605124222.963815-1-houminxi@gmail.com>
 <f7tv7bwhlc0.fsf@redhat.com>
 <CAJ0BgHcEHi0Bjv4569MnQmVbJukdLfghWMTDYk3k6dRp86OH_g@mail.gmail.com>
Content-Language: en-US
From: Ilya Maximets <i.maximets@ovn.org>
Autocrypt: addr=i.maximets@ovn.org; keydata=
 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
In-Reply-To: <CAJ0BgHcEHi0Bjv4569MnQmVbJukdLfghWMTDYk3k6dRp86OH_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/6/26 1:42 AM, 侯敏熙 wrote:
> Also sending a v2 shortly
> to fix two pylint warnings that nipa flagged (+2 new warnings: missing
> docstring on mod_flow, and a %-format string).
Hi, Minxi.  Thanks for working on all the test improvements, but,
please, do not send new versions just yet.  Wait for Aaron's review.

Simply re-sending the same patch with minor changes flagged by CI
creates a lot of churn and discourages people from reviewing the
series, as they don't really have time to look at version N while
there is already N+1.

As a general suggestion, try to wait for a human review.  It's hard
to define what the "good" amount of waiting time should be.  But if
the number of human replies is noticeably smaller than the patch
version number, that might be a good sign to slow down a little.

I would also suggest to wait for the Adrian's fix to be merged and
synced into net-next before sending the new version of the test to
avoid any potential mishaps.

Best regards, Ilya Maximets.
