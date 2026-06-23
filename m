Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AF123ED6A
	for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 18:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782239513; cv=none; b=SsZExi/1Ii8HVlrpeJXNjt3qdA1XjsR9C2n063gUWp87IY6VIs4htE1ImTID5i2bv1VaHKN+s+FUEJOlte+BeszL/f/y1TVICOjiRuBWjQdHoGM+pWLtfoVOeyYyjsLNcm+BORbZ00XWimA18trwPqollGsRrvQxqy7mlpKJWPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782239513; c=relaxed/simple;
	bh=a6v/lpFeLkHnDu+IGa4zSrsn/mm02YtnvEpTbfS3FQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OzggEVwgoKh6vDoFPo2NQ0JT+ChdalIQ3HIX2KPcYop7M6UCU7Ng7ydi7pPeXhnguw1wafzJgRHEIpDoztwOPgk8V/GGvOPVKh0t+gupwH7A9HMauQ8BODRjndDaMPIu3WuTHobRAnK4VXn7U4QkIpdo3RPABHrrigSZGvVYSdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gASq32cQ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gASq32cQ"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-460662fcb4eso163317f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 11:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782239510; x=1782844310; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=1WzoRhsusRl0gQfys6taa/vq131osq1TZkHvUeTyq2k=;
        b=gASq32cQQnOakdWdGAi4RKCu9gJ4gOgSadpTO6u8yjQhIeI9UkJLK8QVemzr/zH93r
         G9/KCwzJi0U9+L3zXYGQL/tceIXVLwWamlL00Gs4zvoEk8O1fnBfmOOuHynOG1SfxkyO
         SUCsf2A2TWUGeAdKPjfAn/nf+SQfYbLH0JCEqHBuy/fPBqHR/+ato5LVhdTS9r4cOtYv
         zJoQ3LDFNBxpwKjlTciRlPnNeNyOKeRANt8XnIrWTXVNsQvx/BDSV9vgwV9S0T+XY0kF
         0Fo3QnXiPTQM0OuTOs+c71C/EZeQBQnasKVwleqBu1m2XGTIvIpSGbDACuDh1mZR71Nt
         5Grw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782239510; x=1782844310;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WzoRhsusRl0gQfys6taa/vq131osq1TZkHvUeTyq2k=;
        b=bjvZAqWUZKionyeQuMSPgu1q2ZsvL4bk2LtoNsUCXzYW6nvTQke7QrVSzHgjRlf7NJ
         V+34VNrtGIcd+A0aJ0A2/S3pgBIGbAEoRIvQeSTm/CrhnYmi0HixWZ/epNn8r9fJ9g6M
         P+/ubs5fw/Md/HVPhnBNFJv2zpTRwMEG1XWnd+fix14dSad7RI8WODRqLtXdbaDeztuC
         39yvJaKIcwKhVE051KCVO2gd31TAUcoxLcwW+o8mzbZgr5rI8oWA2ZCfmQ/h/uXYwf52
         +gd6jamoPTRD2hyAYxXa2RboZFxZYz0oMUVXkDNBar5dvx1Wlec/oXPwqIqfWCgGAWDf
         9DXw==
X-Forwarded-Encrypted: i=1; AHgh+RpuNLjjUekxIwN4E61yOP2nv8tcSPwQF/LNeTeFWtNT17+ZDbyqNnSEsVfrf/Aq2cWRWIij/YfzbaeueAQ1gf4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK4/bUTrKhWq6ukWHCdebz5Csum1R/s7ysNoK5YKjUVXgu9/Qd
	dLsHB/vCP7PrUOG0Z4iUqishn5fPaJy810NwZKoVjsibIVCqSffkiqJ9
X-Gm-Gg: AfdE7cm5dj0hiNpkD3o5jqHZCXOeWD3PiuBBbaCcWNyA2dcIJ745vIXAwwOaf5ASuLI
	UGrbHK4kGpTUua2wwrDU8X3aKTOe6uBWvqIhdoUdpItwLPdyq6dqS0BoU50apoI1Ma0tH19NNKt
	/K7jvfynwBwB7Z3l1Cz1ESe/YnZqnHuwPR4hT/Q7coLZh26r+NSNee3iswPosQ2OPbwR6fBjgdk
	78/NwAIwok3UB4wRz+onU99Xl1daGq1rb13AGntiYF2xjOw6FqFTMBhvDqB+DhEcgEVpT+xFOWU
	eBBe+heIteyQCKvLJpf+GrFcRx6X8TxiwOql/h95A/CVGihbpgLTWSYYF9cY2Y/DrsDLqaLsirb
	4gVBHHL/fUsQxTgX0eiJA4Y9MOVGZfD3yBXjhaLpjYPw8CHF2zKbFxqINLMe9kbMswvpKWiIR1V
	Yhypfgem9YFr5t4bzWftmscP5A+6iDEVhyqkupCubXLawd8Lb/NCWwEosQJtRTeBjMQ/Us1G0nX
	qxX/Mai
X-Received: by 2002:a05:6000:18af:b0:465:767a:3a15 with SMTP id ffacd0b85a97d-46c0a670fc9mr2639f8f.18.1782239510389;
        Tue, 23 Jun 2026 11:31:50 -0700 (PDT)
Received: from [10.128.11.131] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666788282sm55782307f8f.17.2026.06.23.11.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 11:31:49 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <96b043ed-c527-4e5d-8eb7-631805da53fd@gmail.com>
Date: Tue, 23 Jun 2026 19:31:47 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/10] tracing/probes: Support dumping fetcharg program
 for debugging dynamic events
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <178217904992.643090.15726197350652241270.stgit@devnote2>
 <178217907822.643090.14693478306190628970.stgit@devnote2>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <178217907822.643090.14693478306190628970.stgit@devnote2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Masami,

On 6/23/26 02:44, Masami Hiramatsu (Google) wrote:

> +config PROBE_EVENTS_DUMP_FETCHARG
> +	depends on PROBE_EVENTS
> +	bool "Dump of dynamic probe event fetch-arguments"
> +	default n

Sorry, kconfig nitpick: could you match the style used by the rest of
the config options in this file? E.g. the type and prompt come first in
the list of attributes?

- Julian Braha
