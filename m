Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA205381E97
	for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 04:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789013057; cv=pass; b=XF4gxo7eGaE3y0IF86YoIlp9r1JOk4g5Qi7gEhFxtxmCImTJ1izxEmuHl7bm8GAOOiNcleWjpZpebKLetrZnsQg2G/V5AR1tlNA7A9EH276JoBbkWOxTGtnP5wzGd7SoPf1u+xddt1vBBjg0Bxu8RwyxEYtBzNQ3H3wfbd1Z6j0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789013057; c=relaxed/simple;
	bh=l/EAaO5OOE4PvdFfUPVYr/0nOobA9KoQhMRWAD/2oro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T6+PXQJflJkt8+YVIjFJbNHome9bIDezz+c1WRt5eb9iXtEoLJ1TN0J33D2ijiR0SbCIFe9sXPNZoO3ZT7dF3hb+Wqt95Nwx+dzzYV++N2bRV09HlpWvHaipciuQZ3gK4num2Hn7snQPGS4i7MQL86u03LhUsmjiT+Dev1fpwGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eBDAHhO7; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBDAHhO7"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b899413537so1527213e87.1
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 21:04:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789013054; cv=none;
        d=google.com; s=arc-20260327;
        b=OGHwMr5unke440RFOnJQRcnbbVFUky7QzO/tiuYDDMGarAvwS4SW83UgTLoKufDDXI
         ci75F+3hHUsgXoNYfRk3RxP8lnBBzzT+JLCyKM0/HspEaKntcy/IYVft8MeHF1v5Sh23
         /JErB8RbHxLdZp//mnTjxsWeqsunD/m5mfbGK1kf6KYxoVKOUCucsk+IO9ePXtASA+w4
         3PeHJkA5u8o11jzXx7j6SgyUrSWz16OPaAnIuIgkY6mih4K854akzb48R4BAGyJ6wGsj
         zNKbBTU7JnZZQWPMifPdIoU1HpxO+Y5917rYUM12IgLuFEE+BohptYAWfbjtcGogXZCL
         iYUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=l/EAaO5OOE4PvdFfUPVYr/0nOobA9KoQhMRWAD/2oro=;
        fh=E29hOoWgPx9LDS9MTAjSd0KnaygPJHroZgqtELMmtxg=;
        b=cEpavPmrFyOPouFHmyWm7xOQEIwpa//o9nMhoLK8sYpnkFJ5O59/k1fhjk4cHNqtAr
         +cEkPeNaTEOkM1VVcueSgicO9K1psmxO95qKcxpQWUzR+TjRCaKKVs7LP72eHPdlqO6W
         pyNXRdNyIdp9XDkWFwwKtSyDfLPgdJBa2XHHQ8RyMYIK0lQoa+MBTEsMPSAMVnxwbAvI
         G8KjBXtJurfN4eltaYV25xzSLFV3kP6CWe3HCheKSm92QElO8W1HkSq0KkmQZ1sRvHjh
         0yZRkIt+JhKOWFr/UW5+oJs8bB76lGHJ/aHLsrq4dzo4/TBQmlMhfg6RBr/o5xLm1EHY
         BX4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789013054; x=1789617854; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l/EAaO5OOE4PvdFfUPVYr/0nOobA9KoQhMRWAD/2oro=;
        b=eBDAHhO7SNBvUTl9gFLG2JawKkSkcw8t2NhHylZLkuZ8xcTxvUpyBM6OvS3q72aA7v
         OBYn9g/5fJAD37HfiLmEybbkUafRLd4mDD6Y5XMHKWwwY805d9OIaOvUsVrCqCyy6UmZ
         eM9TnrkeLzDjb0TaDz9S8PdGMxV5uP62S86oJvzR7ayNQc9kWHmHcmZ+Oq8c5sS0eTnQ
         ib5qCZluqH6NQtxJnybP25yCvSt/eV7fEsUT9hIENgqR3ZS+FlKYTSiJhrlJ3ArfNOrV
         OgqrMwq9L2n0boVozthUUOC3Qi4E8uxEGAB8NBCJx1qlGXC8CWansOjed3LDRmyIbZw5
         qjgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789013054; x=1789617854;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l/EAaO5OOE4PvdFfUPVYr/0nOobA9KoQhMRWAD/2oro=;
        b=Scpv51NEHlxrBMHxKcslytHgCU9Zf5/+y6GIrvJvZwG2zg/oJvR3TME/EVR/b8T8zZ
         QOOFtI8OhM0okMe3vXOz0pguul+gjFKMbHWW0qq48xqWubE3uWhNrhmEAR3tBZqcRJDh
         Y7PtGz+DTOuPOryA4N4gBAyRKd0gX+RmwcmKLSJYbD5JfVNVfu+tn3fmT0Kg3j4bPvB1
         CwISwvNIoyT4Kx4RZ5AFD20+D5rKXUfXgu1ThNtdjX6ZItmj7BeeSArcbIUfHQHBJNnd
         Udlz5iRVk3UzsYnyvpLHiUwiGN0XuLE+s+k1UiYkJq0FL9weedsOLX6lyI8y+bm/4c6z
         G6Rg==
X-Forwarded-Encrypted: i=1; AKwUvBzttWcI8F/UXqQTWVenFwZF7lnkD6lF71vuQgd4lG9v54mnUBEcGA6mAHl3YpxCoiF24boHantL+a0GrI4aW4c=@vger.kernel.org
X-Gm-Message-State: AFuF++mpHpgHdz5CezNUPW8wcCKPtcocC0iRquMu1sV6BH/LFXvh2627
	vKeRfgGS2iwe9pQtYeXoAR0d/aQhgaxcPjptm3fKu28GbQU6cHBw/3Q2wAKUtKRK48ZaZheXVga
	bYqO0YdhZF/GZQHcn1UcVoAu7z5+7Qro=
X-Gm-Gg: AYBFou0dBKPbXBBiLTxYnIarJ1aW7kAbtDhJVeneaHqr0eu7l5TlXwNNURRvHW4o1UV
	f6yhRp8t9Bx4Th/Dc3g2JMkH32TMx2Xbw6K0wObID4KlkD3uLIXMGcmMHGpDecxTmco7XA6c0tI
	a07CuZsZhy9jfCzRo+sHOOSKhRO3o4cMb0RJr1BlGUTkxS5rQ0qhhOzNIDdfDkIX/neaHH/z0C8
	nQrekhColwLZbPM+Xrk1gcinjRkKrvaZ+EcNBU06FuwI62XkRUc480JzgSreyBJHcJPgr30zuuh
	j1VwsbWLaxkJirb5bD7l832Jw66Hs+4v+WMM3X+YBXRV+O7bByEhI6KjzTlVo+FU8gvknt47VmN
	YLfI3E2RsP9rauIDjuiA43NTPGfvJS7YIIdyfezVI1A==
X-Received: by 2002:a05:6512:2c98:b0:5b6:1883:b1ab with SMTP id
 2adb3069b0e04-5b8981081f8mr1128634e87.40.1789013053655; Wed, 09 Sep 2026
 21:04:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905093932.43726-2-sigefriedhyy@gmail.com> <178901169340.219967.5720246601361596190@kernel.org>
In-Reply-To: <178901169340.219967.5720246601361596190@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Thu, 10 Sep 2026 13:04:02 +0900
X-Gm-Features: AcwNN1UzE9U2hCIXKFIf4HaPYtniZ-QsUnDUKbE5iwtT7QXVPA8oUnZsDwBc8hM
Message-ID: <CA+7S2vJN-Qg2PuonpuJBrZBpVib6R7=k9Qmx2dFBG-1Dm8niSw@mail.gmail.com>
Subject: Re: [PATCH net-next 1/3] rtnetlink: add AF_PACKET multicast dumps
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, dsahern@kernel.org, donald.hunter@gmail.com, 
	edumazet@google.com, idosch@nvidia.com, kuba@kernel.org, kuniyu@google.com, 
	nickgarlis@gmail.com, pabeni@redhat.com, sd@queasysnail.net, shuah@kernel.org, 
	horms@kernel.org, sdf.kernel@gmail.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The comment in this sashiko round is on an old patchset. I think the
following comment is worth fixing.

> Should ctx->addr_idx be reset when the resumed ifindex does not
> match the recorded one?

Good catch, yes. I'll reset it in v4 when the resumed device is not
the one the dump stopped at. inet_dump_addr() has the same issue with
ip_idx, I'll send a separate fix for it.
