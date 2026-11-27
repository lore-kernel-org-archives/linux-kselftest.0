Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795815676;
	b=Wwyj04MHvM9/DYnPsHyF/yqsJBfwof1Y6kQP6X09YHKsWyH1UeMunafSDoBoRbIzrd83
	 PKAzA19JWXYB5tN2XO1QPDPIsPYk5Zv1h1ajCvBwFXJrn3flMhGpr+LaAM3nJQXphfbLQ
	 Wj2+daeNl5BWc5OFKyjVA7ITuSBBFDJBYejbVGBESCQhagoivupio7h8k2nCvJC0xCqdg
	 2k/BDQ/KJCn+kLwmt5bnrZw79858v8dInAYPEz8NgLSvEEUFFT18EvtdTxg4S1ebTpXdx
	 CnXPFz/+zNHHiTnz3bpx3UVwk7Im400FJYznx+mVkv+eTwxbkjHYwPw0WYsO5VBGkUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795815676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GNjJtSmgBzeJqa75AyMuB1FfpMIGeExfgQrDDeRI15s=;
	b=zZRYJPEM2dqkH8Jquz9+qgf2EC5OUWkzCPS4OAv4zT8i11jk22xz+qsqw20Z95aapWmF
	 nXNvukASrDtVsQJVJH+yF1ORDZ38NDgQZftgOM4PImKY/1Dy+zadLphNrCZybMDPidddi
	 L+wV5nhFaWwC36kaw1bZdahCvAV6ZtBeGIfWNqMGJnFXs1Sblxu6wa30Q9L0gERzSxHx3
	 Ncdco9H7VGd64cgbJg+7lNkRx+/gnxWSFGZOoSss2aJgnPHP8IXF6f3RTs9LC1R+2xsta
	 23HhNe0pu7E2UXKRxOZJNPc4iqeA0Q35K8b5DIPgBBeKnuu1lFI84CtVlT13urgKb6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rlJzjc+L;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423D7606A326
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 21:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 423D7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rlJzjc+L
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so68496535e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 13:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795815674; x=1796420474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GNjJtSmgBzeJqa75AyMuB1FfpMIGeExfgQrDDeRI15s=;
        b=rlJzjc+LyIk9Bk0QS6P/I8TDEexyuBC3YqrMNuS8l9ecZxXqzecIXHrsa2+jjLCIkd
         AvdgA+lDcovhfWDGGXxDDTraLo/z7WixYN6CS0WFtDPjvWLKrdb2LmuL8SVsyVcmcUAE
         w7uKvqNGQ6fgCtW1/YqXftDsvKWqzLc/etNTUBIImSolgJ458EFpxfvonhxlMSH2he0w
         gpZYXR2cdjzW3qoLBTUFALao2MhHDceARIdwR8T5fNHKRhO5CZKehhou/RRtD33QzCTW
         J9VxQgQTSkBjmppRZyAfVgxgVnOD9jDbF3HW5K6gfIlLPnr/76nWxRQFxdk3GCbefAfK
         3+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795815674; x=1796420474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GNjJtSmgBzeJqa75AyMuB1FfpMIGeExfgQrDDeRI15s=;
        b=lUQNRp5eD4Nca6G2TCU3wAFbzFxysg2QG5mHjzrNa9n0mJS/KIYzqwQFNysLUU600r
         sNHfLv1TiaCCPxuYdQnCCsYm0Ty0h3HfMdPc3zxRfvtqaY3w8SZfVGGmZLkd2P4a4NYK
         qzDDGT2Ldvggpju1cGtBAZlL108y/O5di7gKhBBKZnID10VvP2X8g/oi2tM/R4Rptu/H
         /gJTkGWdOc+wps1YW97sr9ex9lx7bZeDho/dWP29tFSLXnfeM5s5h+hfVNHn7GlGqdTW
         ulyJc9lKeIL2fsw82I4lb8v4m7dYSV1lyxtqbZpkviPhIH1fJJs2r+J92c0neJFQBMki
         Ui0A==
X-Forwarded-Encrypted: i=1; AL+hErHZ70Ll+9re7lMvJ6q8WpN1W2Z0UBbsDq540xD6W2nG4W2pROAyfTbRdi3LMC3yRhiC7PREHYGaC4xD4m8+2Ac=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Owe8HKxXsgNm8nDULGdyTcTNm6nAUe9gX38klVlmLmXMf2l20
	8AK44WfT4PvsyA5cVixF08+N969jwY1WWWd8B/1y0TCWk7Emc161JcwK
X-Gm-Gg: AZFdTZdGXEUITHKb5unJwitgYIWAsZ6z6n+QYt3mCfv1/DbPNeR4Qg0Fj/Jf4nF+OQE
	hX2VZgdhP3BJZtBdLFP+hrlh9uWeU303V0TPHSU5dKaNGucx8iI/qmfxw6wQ/dmubTyE+1m2vPv
	6FlGBg3jjs4x/pwj5J6lABZOIwR5VqCnpp7SyncPhRNdELUiN5b/IGjEyYRf63il94A3u68n0mI
	pB0e9EfRd1itjukkpCcF+5Jfosk9WRZYudXAImKlLsj8UX8+/GTZwVQy5KO5wq7WRTacjMKzRMF
	8BdRcP0DIbGiZIk+CreXMxZKVfyhOAIrE/eoS6dF55JEY6QghX+kengROpI9R4RZHaG34dhlmhk
	234rXUtpJzvcEGAipVIJywZyJBkjVLKC13/ntg9H0uQkI40M3MVmsLMAqDODRF2RF/ZmZBLcfRv
	L+OUmCRHli7DAmF26w7SQ36OUV6iwN3rBg6hi0eZnBiu7vhnqZIwSkbdVIber7/akQ6nMhJTXIj
	viI1laMI/ojsCFatxGItEVoEpW0142iZWgDVbG3kco/gQkaa6pJuNieJaKo+LCbsa8CGLO/j5nu
	uex55ZXQGBqT/zmzYKLvuu2g3g==
X-Received: by 2002:a05:600c:a085:b0:4bb:85d9:156e with SMTP id 5b1f17b1804b1-4bb8880fe46mr518939935e9.11.1795815674386;
        Fri, 27 Nov 2026 13:41:14 -0800 (PST)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bbb97e5356sm37714445e9.4.2026.11.27.13.41.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 13:41:13 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: jarkko@kernel.org
Cc: aleksa@amutable.com,
	alex@amutable.com,
	alexei.starovoitov@gmail.com,
	arnd@arndb.de,
	bpf@vger.kernel.org,
	brauner@kernel.org,
	containers@lists.linux.dev,
	corbet@lwn.net,
	dhowells@redhat.com,
	ebiggers@kernel.org,
	giuseppe@scrivano.org,
	hughd@google.com,
	jack@suse.cz,
	jlayton@kernel.org,
	josef@toxicpanda.com,
	kees@kernel.org,
	kpsingh@kernel.org,
	lennart@poettering.net,
	linux-api@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	linux-security-module@vger.kernel.org,
	luto@amacapital.net,
	neal@gompa.dev,
	oleg@redhat.com,
	paul@paul-moore.com,
	ptikhomirov@virtuozzo.com,
	sergeh@kernel.org,
	skhan@linuxfoundation.org,
	viro@zeniv.linux.org.uk,
	zygmunt.krynicki@canonical.com
Subject: Re: [RFC PATCH v7 00/26] userland: Userland containers
Date: Sat, 28 Nov 2026 00:41:03 +0300
Message-ID: <20261127214103.542291-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <awOQDOel_72Xwjm7@kernel.org>
References: <awOQDOel_72Xwjm7@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Jarkko Sakkinen <jarkko@kernel.org>:
> I personally think that "getting in" should not be a goal in the first
> place. I care more about that whaever gets in has a high bar of
> quality enough. It can be something different than this but
> when I read the LWN article about Cells I was alarmed enough
> so that I had to do this and prove my point.

I think that Bacik's patchset has better chances than yours.
I think so, because (as Bacik said) it was tested in Anthropic, and also
because Brauner reacted positively:
https://lore.kernel.org/all/20261021-zeitig-niemals-clubmitglieder-b3973fcebd38@brauner/ .

So I suggest reading Bacik's patchset and say what you don't like about it.
You will have chance to influence Bacik's proposal before it will be merged.

(Note: I am not kernel developer.)

-- 
Askar Safin
