Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF38386C32
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 21:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773955315; cv=pass; b=LQ+JtK4gsm6Opc5lUr1LkcX/y0sI5heuFdgf/P7MgCGlEJxI1V1OzLIJpMb+G3OvZs8KibZsswJ5sZDUwbNw5/x6a5J6WmzPxkctOROrUh05R0irvVjSj8g13Yv7VH3IfcubARkLD5J4pUUYIHse9pSimSIHomK8RT1dPRC5cFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773955315; c=relaxed/simple;
	bh=221SE52RqevFko6XNRwaQM9HvEmE73WFUCY4jlFOO1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iikESSNbgPpXfQnim+36IRNT5YjtlYHOtDE7N3XamS6BeRSYVWtsEVvQS2W2CVAv8WOq02ek1CeYXqibYx+GtWi9Wmv2VoyzdbEi1+acLZ6RA9as6JSvI/7y8sZF2H4Zj9xysgB2LUQf3tnInGUr4ZR2tug0Tkz9xrbh6Cf3rfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYuYh8jf; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYuYh8jf"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-126ea4e9694so747208c88.1
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 14:21:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773955314; cv=none;
        d=google.com; s=arc-20240605;
        b=LSH23QHaWT5BIdANKOZDJJyavCRPhjZY94Selk3STWqsNUCnv7yy9DHdDsNJl7D+yq
         jr94qhLkjjfQ5P67fAqYQ2PzzSC2k0FOrk1rXRd0hWpCBd22UhL+RhaQF+GX6UpqQQQ7
         D4wdFvcdj55MZsfbjJHnoLIf/WStMFoxFAgxfX1H9c/b9dE9z0DzvjDF2oCvlvk8EmA4
         MQJLZDrcToV/NrqynRKBIxcvJxMaI4MjRUCkSVLFshntUe5dLRypIjIXm35Pbek0TRDF
         +aMRHWrY/V499iQzzUSz/OSLkLMeyS8YPxTult4oQ+O7ArLeT/oxp65gc/7ksfpEekLU
         ibyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=221SE52RqevFko6XNRwaQM9HvEmE73WFUCY4jlFOO1g=;
        fh=wjzR9ZYE0IaSG9WQc1L/iETaTAjB3ZUoVePJHdlGwiU=;
        b=huERTMtGmrQX5RiCVLKM4ctGKRGHFK/8izGI/PMcwkvNyM8iVtTml76CQdtJ72WQXo
         TxDhLGobsS17TgWaeQQwIwZIk0mcncfybCqnVw1cEEvtBsTHtV4p9kaB4mySQPIYuzRp
         fUVeczvurnHiHX+ROaFEWP89spUzi4yqttfOBIMfntkDCPW9AwOc8D/9X2G6xSrZXu/0
         3qrWCoIi4RlXdwjsGUCfnDiU/Uf1FRTJIFTUKK+eZX3FGwbrTlEl3/ogFxNfTxm6aVqp
         wlNPVPrbSLfs63qP/ueaI+k0iLr4QbTcukYy3ZVKk5WwbMqfjRPx0MsVKws69jFRvpMv
         lm2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773955314; x=1774560114; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=221SE52RqevFko6XNRwaQM9HvEmE73WFUCY4jlFOO1g=;
        b=OYuYh8jfWV2zj7Qi8ABMTbYmtjujUtTUnbz7b0NTJLQMYfF2g+mzGrFbUPrc/DO/Pg
         X6C9wum5FUU8glVsIpa+/uk9lxDtUp/2qYvkrReSXp1AW+VSACojZFSXpUZk01GD4bQG
         e8JRAo4FYHNQk1LVU2ZlhEANmCqa2Zfe8MW8Ql8zUj73XV1vb/VVJF2B6vAHhoUdyvcH
         XzFDGGT/kcuuhedVkMzS4aazAjwY9J4vPvRbm/XnjQ3990KiWOOExQw+79gGsWqSuXhw
         Q98rb8m4CQ9zgW3ItwnUYce8SLHVzIzVcaJWDqnTib3jRUHOC5GViTpktknGdAV/izSU
         hxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773955314; x=1774560114;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=221SE52RqevFko6XNRwaQM9HvEmE73WFUCY4jlFOO1g=;
        b=JuPnRFSeQPN06PBF1UZot5TXnxWnfpPEsFT9GypK2bG0gw8g2fL73/dyvRA3UZDyaD
         CQQoACIPjYrxH3lnhDQB3WyU8kfadddBLLXJDBzfY7V4YjGYyCxwNyLeuBivh0ZMbFs+
         FrzwMts3RdkZIsVOeu7m/up8Xp3z2yVb3Z75tk/9i7MgdbxrJVVlHnn/LFSWk9fLN/rz
         uhkwbbmH5006EXPuQV4uRoUGXe2NcYopnTaBXZZmsCObMz8sFbQAhH+CVs0E2VYsGdSS
         h4u2dRRnkXET7KDXvZvdLyN33AThnp+6e3MGRud1mmlqoOaKH9JkOwfAMdTASWSQomnB
         tuhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZZNIP4+XTBIqVvPDTUCdRd9q5SjFFIMypK94RxJzApAw3aZ/Mt45SIMD0rlS7e9qbCYZqbpWYa1dEoPcpff8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVNvVczwRlUJv++UX0IXGaDxtiBHeEYzytHfWRQx5rnhu4WFh3
	JtS3mXjHkjaUH77u0E7JF2y/xgscgytonYmGwVRW3joZoo19ZZU1OUFbhpzV0n3O9vrEerFNnFH
	o9g9GtmJ6aRVvsWCYJBi4EXXZUbVAUQQ=
X-Gm-Gg: ATEYQzywxdBT6wW5HhI5MAaPJS5r5Y8RRhjM9G84WTZUZ/ZqfaKW0IHfJmBaE67Y0bc
	PS93ci+yE8GHhau8F9U3MO9Q1MSXn58sgT2Wf6FmSv802F2+d6krUOzAUG/4jhE+u43F1b91jf/
	o1VSoiWyqbqeiZ0Af+hgNExBpywjhm9cbOjgJ/XPl/5Z3G+xjeniUkSuKAvheCy3c5mjmzGLvl4
	1gn4QrrxUhxfQ3l7eBTP8je7O2wCCrpi5WZrKr3tOLL7JYdVCiNHho4f9cq0tPTG6HDvjIxE+Jo
	EnjpaF5rBH2zUhHWwX1fcBneL/OhbMnEPstqIQiI
X-Received: by 2002:a05:7022:68c:b0:128:d5f1:d594 with SMTP id
 a92af1059eb24-12a7265ef91mr378865c88.10.1773955313615; Thu, 19 Mar 2026
 14:21:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317065137.1533226-1-atwellwea@gmail.com> <20260317065137.1533226-3-atwellwea@gmail.com>
 <f5c9a512-4779-4cc4-aed9-37ce0131b3b8@redhat.com>
In-Reply-To: <f5c9a512-4779-4cc4-aed9-37ce0131b3b8@redhat.com>
From: Wesley Atwell <atwellwea@gmail.com>
Date: Thu, 19 Mar 2026 15:21:43 -0600
X-Gm-Features: AaiRm538XUw4IKToQaoAq11Z10_mTYAUbrTsrzh12UMqCaa0aGQGRCabgU4juzM
Message-ID: <CAN=sVvxQg026ch7k+GKxORd1hpQzQtROT2=tNQ1h2HH-re5-eA@mail.gmail.com>
Subject: Re: [PATCH net-next 2/3] tcp: keep scaled no-shrink window representable
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, davem@davemloft.net, dsahern@kernel.org, 
	edumazet@google.com, horms@kernel.org, kuba@kernel.org, kuniyu@google.com, 
	ncardwell@google.com, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"

Paolo,

I re-checked that corner more carefully. I do not want to overstate it as a
common path, but I also do not think the current code rules it out.

rcv_wscale is fixed at connection setup, while full_space/free_space are
recomputed later from the current receive-buffer state. The tree explicitly
allows later SO_RCVBUF reduction, and the window clamp can also change later,
so I do not see an invariant that keeps full_space above one scale quantum
once the scale has been negotiated.

That said, my reason for keeping the small non-zero case is not that
unconditional scale-down would be less safe. It is that it would also change
the long-standing behavior that avoids scaling a non-zero offer away to zero.
My intent here was to remove the larger-window round-up slack without changing
that smaller legacy case in the same patch.

If you would prefer to also change that small non-zero case, I can do that in
v2 instead.

I will also rename gran to granularity in v2, if so.

Thanks,
Wesley
