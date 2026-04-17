Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647453803EA
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Apr 2026 07:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776411813; cv=none; b=VhwbqPn2MYCj3vR3c2nDirQgR4V96K68cWmHTy0psKiNKui/jamIAQWeSJ5FqLv3fdBY35Xuf58ForKzRdILbbkA5ZauRq/mZKO7WjI6I74SYNZoJ8gMohMN/4semt1MW/kkJTf8CoXpyfaabnGa8VkckqWd8pj3e+o7fwlodh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776411813; c=relaxed/simple;
	bh=7TDAbrtzems1mdoWHs3U16Rrbtm6ftMbK6YSU6s+wjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gJiw6mQIvxPLCE1E1XqodBj8cH1m0cIA/PFuWumMch6idamOvbyjEx4XYxjfu/B9pfpNJ9Yd+xWJiT+PDpkF0J+GUESscJhxJCDK3c95fiAON9DIJFfFYmmQyrmp2tF8SMHpuXfcZMTvZymQlEiBrrZyBUf3n7/Tux++mwcAYx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BBJAKbcM; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBJAKbcM"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-35d94f4ee36so224578a91.3
        for <linux-kselftest@vger.kernel.org>; Fri, 17 Apr 2026 00:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776411805; x=1777016605; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t1ZNdH13ipZme4Y4qMwgwn38uWUUdSJtBL0WmZYxRa4=;
        b=BBJAKbcMCskLI7fqOGmXtLEEvOXnA4IXf/slg8KXy7LF/3zX67W1H7B78dxABBJt9D
         kvFHIY4NV0e6dyVKu9y/vGoUCZkcOff/vM4y0QzUH4YDJ1eOVqz0znEqX+DaOvfbl7x+
         CGDJ4x2s2O/YtPbZZZXSMkhFforF2lSjiN0Ol7NXETO9odYNYJLkvbl4PwwONfqwD5/l
         o4pRlxWX7Hobin5fJDkn3E04b13azwWuxkrbreo0wLN3i9IrgLDwaEPCmQc0JLyIc4rn
         UW9zAeECDRjJkZqfZ/BN4zS6Gfk9WwLqIXq/sKtKnO68LaDQ36Gp9oWrCMT+OZIt+X83
         uUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776411805; x=1777016605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t1ZNdH13ipZme4Y4qMwgwn38uWUUdSJtBL0WmZYxRa4=;
        b=DTlvznNr85svkaqh7FAVCggECVXJs/Ovk7hlb9QcxASF6oReAJ8h/Mo6HnWIbHpxoY
         Jc3Q/8OVukAi33OZaQvxwv9h29k97Uh2SeUAT0XUt0bwEPTWdUhYVUpGYCiq1EA1t3rS
         xtWBQzi8OzU5xVDkmfhL1l+1L9pM+o0vr2XXQOddJEzZKCb4sEwRhJbq2tAKF4DuhFAf
         o5PpMB+SP+PxR7ECM0k7baXfcbX8vc8fV2ZSCVAZVmDwjv+h7lHg7+C/6IuoRfpulh/r
         wREroCxVy6yvumdhx+sS8wNLdZwaqIsaz41qm5AtvpXlSGAHPeTaHUHqpZBnkrPic7jX
         nU0Q==
X-Forwarded-Encrypted: i=1; AFNElJ+evnk7lQV+qRTXpGjB7N7ijtFY2ofiQ7QcuNXIvlMQh6mZ6YWT/4RgLjw1P8tQvZJfN799BRedDK45wfDEX5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoeqRU+eOiXoQFnQks4VC2hVqqKxwwQiLRf8SGZPCiDYGu8BPk
	zZYUXiU6gvSqo44Gn2DFXEkdK1dQdBgp1KKkqn3q8/nhm9SlCz2pZTDf
X-Gm-Gg: AeBDietvHySf9hVGFcPhEfTYvJz12YRZu0zMzeHvVKV+v8gtdxFea5eyqhImo1putSo
	RzlD5ZXnQaL1RQyCkWXUgqHxD2LPGDwMK+xI5yeEgHI0XvsGNj57iqapULbVF4MDEfLKLbBxJE2
	QcaTQOsAMlPcxFvSBUGj89r4HKdCoDTXp02KAgYCXV5UrV+DyR//1bSRETBGfxhu17r6DX3JQik
	UpEecHqXOymrqB2AmCoTC9/vyvuK+Z48slQbJXyIrCDAsaK38sa8Jv/8w6pCHGqR4uJWoqpf7l3
	kMNaHPdVnQn7NhCnF0okqGK9/V6vMF4KOhyP+AoI7CMqckJ2LsW7Ri0LkGrS96KVkVW/ePgKpnI
	uaSi+KX8Pf/aHPNfiVeya3ffJiZ8ZJEPMCRuzFhQZMghpY+bWf0WA4dmH33N1YEj2v3f5U1xEW0
	1gw7RuRS+gJZHGUEGQKJ4pjQuSHz8aiSKE45bRoB9taD8=
X-Received: by 2002:a17:90b:2785:b0:35b:e4d8:e21d with SMTP id 98e67ed59e1d1-361403bda05mr1752318a91.2.1776411805038;
        Fri, 17 Apr 2026 00:43:25 -0700 (PDT)
Received: from fedora ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36141973c57sm1079042a91.14.2026.04.17.00.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:43:24 -0700 (PDT)
Date: Fri, 17 Apr 2026 07:43:16 +0000
From: Hangbin Liu <liuhangbin@gmail.com>
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: Brendan Jackman <jackmanb@google.com>, Mark Brown <broonie@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCHv3] selftests: Use ktap helpers for runner.sh
Message-ID: <aeHklHWA6YpY98RN@fedora>
References: <861b722f-6d5e-4f47-9d17-00a98fceb8cc@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <861b722f-6d5e-4f47-9d17-00a98fceb8cc@linux.dev>

On Thu, Apr 16, 2026 at 04:07:08PM +0800, Qingfang Deng wrote:
> Hi, Hangbin
> 
> This patch broke selftests run with `make -C tools/testing/selftests` as
> make uses /bin/sh by default:
> 
> /bin/sh: 5: /home/qf/linux-next/tools/testing/selftests/kselftest/runner.sh:
> Bad substitution
> 
> Add `SHELL := /bin/bash` to the start of lib.mk to fix this.

Hi Qingfang,

Thanks for the report. I saw Mark helped fix this issue.
Sorry for the inconvenient.

hangbin
