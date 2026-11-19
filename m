Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795051789;
	b=UK6MjhrEyBuY+QbJghANqX8zT8IqA75UB+Hg1EaIMZ0hN5iaUBkLpoB9sxBPoGKQobY7
	 4iGhS4uJTtOXSiV9mNzAes9z34qp9ODGMQczj7ioDYzkWrdPrMjXTHzPD56DPcSlVAcIK
	 3CHwn86BFUDGHAgywuExebFNaA5DWj5G3uRCJotmeDyUgnSPRHqeg9m+joELo5WUo6m+r
	 pnMZfFA2vYlhFhJd6OyDDj9jfsJmwK/kyX+ck+sKDAipzrMJ0ZPslDwVH39r+Nf2zZ8+J
	 se8S/jslajqnldrpokyqX/EptJDaUm03r/Ua56QJZG4Lk9eIo8dTPZR8DCRgJeJwRQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795051789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=IMUfFg2iR1Z91GxSjPkov61aiB2ViYWc3Z9M9ZmX54Q=;
	b=AfuV9xol73LAWY7Z8maLwBvjb7qw5Id66c5+sd7S/qhS0ZH1eSJV1YnxJDM9JvGc1Key
	 YanLxF5pfDLphHwsEI6SUKePL6kssP5AJJlJ+MSUg48zzBNQ5YKWtSFr+mIuyva/L8BWX
	 3eqmrT2NeLhDITw32snJaUq4fkCoiYcZjjcSY21rt7LuhoZw1CCSruKPl6pT9KQzLaQcY
	 MAuyMjRne5otRai59Ff9DmFlsc0n6jM2rte4HhUjvlWiRsrQugmwadeVZp/rFv9UG/3RU
	 EybMKkX+RF7wXOZvPOHuaB30r2w0PY+L9+ByOEJzc4oGaE+Fum6RjjbyU8VsT2RNS6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=X6RUl5nX;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A194A606A32F
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 01:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A194A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=X6RUl5nX
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b75712fb57so2462432a12.2
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 17:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795051787; x=1795656587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IMUfFg2iR1Z91GxSjPkov61aiB2ViYWc3Z9M9ZmX54Q=;
        b=X6RUl5nXPwSwt5c/kUdF+d/qAIPpu4B78KXEgoYgO1Ifwmp9Un0wXT9O03brHfdkj0
         Iw/NgiWtHQkg9OjzyksdTG/Yk3SubNSObINPdaZ1LH3tMW9lWXcM2a5r0nkclDrg2smC
         Zb0YGB4IT7dNKxmFRti4PmVmxBxhrgJIsbGdXjpReO5gHaAFEaHL7kPg6Eg7L+Kh2w1f
         9UmlkTUkG7mvaMEWNHvsqbuMBWDQO8hWN6c3xb4rEMyQKIx7BNQiPLSzNI0tNGSeJsfo
         60BiL735Nn8IsGlBj2912I24qTnwkLODMQpnOlSR6NzHZK8QstcQRJPAG1XWTsTRcE5b
         m+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795051787; x=1795656587;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IMUfFg2iR1Z91GxSjPkov61aiB2ViYWc3Z9M9ZmX54Q=;
        b=S84xHQHVukB8WutAPp00kGTWXx5eH70uldFI101olkpM3VmXvo0B7D7csUOR61s+0U
         0gafPpNiKS0XqkvlU+YSlneLEqFik1n3VQHMDU8EWh4SwodC50AyFyTmrsu1a5b9IGa0
         KpVGOHsYPfVR5BOn5tUe7OB0EiRSK6C4DYgmBKPq0da0SBPgVikykP8uaFsVg6T9HSPq
         xMD7gtMFtUHoUZXk/V8egOf2a6kHc251k+ffqILbE9cnQsaPd90Q0fqkk6bcjE5LEOaP
         Wb4Dpv9P+kW614N4/2OQctWg4l+28ofdFmO3EAmMOG4wCIMju91GlWG9BebUD52PoizS
         GhNQ==
X-Forwarded-Encrypted: i=1; AL+hErEYMiA2UyiizmtRtnDGkafgoaighwcJ5QBYk6bXufEVveGbeUKdKlrb9VBFvMLGbQTqSuzIPdM8aKxDN/vS49o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MZefIXvDIHbEx7GGLPmzAlNF5eejXqFCfwXjVyqrCDdcYUT3R
	o1a0LUrBe/I1Qe8JLwZPbzIOTfuyUC8e+dLx7ZqriLaGOz3XA6rJyFhaWdN5HKxGimBAQ3BaIx6
	r0TajqfM=
X-Gm-Gg: AYBFou1bAJ1VegZrurB1vKGj9qKBblcq9qxyCQAYMzAxZ3weB1LFT+YrXJ8dLrmyFrv
	Zrh5GbLNLNZPNGvv1VBnP7Zy/S1c4TU4L4Hgah7yw0Ahk/dAArsunBeE/moQZqF04e4nJNoKH4U
	DwhN3SoTIuFbmTWjs79nu+ufT4kG6whBfW35qKRKRIGSnhu+hlijMcw0LyvIzuLAyPV1ayZdoJ9
	e9pdTO/04EmE9p5D9A/xFYRVKQ9E1UnWNeDf7bZrrIP/ETLOfIlKnPVmvkMmfDqRIT8AhNemJur
	O7ih5METIGVkyMMT7K/Sdmt7dzMprDIjqiAgMK8GMctAkp8Nk28g0BJ5ZjDIQ0ZPRX9DPNgxwrL
	+G6dRmt0AtNlWc8M0olTmpkYrsTCh4jqoZ4f+wxkLneyK9DPjLKvWDUBpT35edxN1nHMnR8BM+7
	i1s5X3YidKeYf2McHumME8oY7r3aYk8dUXo11ctN6lyxWtOVJALl0yocoF1vF9haIosQ6MYfDLC
	2BNSHhMGLiNHM7qlJD+787YhvjdrlqPdGZD/0mEpo3MrGTiTGb6eC0f+CIASIQHkMIGlJnyZiym
	dEvvpu8vM1tnBRNi5RNBF4AWbIIhEL5ihXSiNqPlV3SpyOYZKsQlArejcQ==
X-Received: by 2002:a05:6402:c4e2:10b0:6b8:afbd:64e6 with SMTP id 4fb4d7f45d1cf-6b8afbd6722mr1777470a12.42.1795051787085;
        Wed, 18 Nov 2026 17:29:47 -0800 (PST)
Received: from L9JK9NPFH9 ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b88a1eb813sm1711016a12.26.2026.11.18.17.29.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 17:29:45 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Cc: Hangbin Liu <hangbin.liu@linux.dev>,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev
Subject: Re: [PATCH net v4 0/3] selftests: net: veth: propagate check failures to exit status
Date: Thu, 19 Nov 2026 01:29:40 +0000
Message-ID: <20261119012940.32838-1-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119003003.40482-1-emmaonana18@gmail.com>
References: <CAG4wq-d_30-B4wQZu48ZQXAORM4QxRqPfmYsmoHS0hiYp1EtTA@mail.gmail.com> <20261119003003.40482-1-emmaonana18@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

Hi Omokefe,

On Thu, 19 Nov 2026 01:29:59 +0100 Omokefe Emmanuel Onanaroghene wrote:
> Changes v3 -> v4:
> - Patch 2: use if/else instead of "&& { ...; } ||" chains, keep
>   lines within 80 columns (thanks Tianyi for the review).
> - Add patch 3 deriving the invalid tx value from the kernel maximum.

Sorry for being annoying, but I see three problems with how v4 was
sent:

1. Patch 3 lost its subject prefix. It went out as "[PATCH] selftests:
   net: veth: derive invalid-tx test value from kernel max", so
   patchwork put it in a series of its own [1].

2. Patch 3 should come first. Patch 1 makes a chk_channels() failure
   fail the script, and from then on the nproc + 1 check can fail on
   a correct kernel. With the fix first, no commit in the series
   reports a false failure.

3. v4 was posted as a reply to my review of v3. A new version should
   start a new thread, and its change log should link the previous
   postings [2].

[1] https://patchwork.kernel.org/series/1215530/
[2] https://docs.kernel.org/process/maintainer-netdev.html#resending-after-review

Cheers,
Tianyi
