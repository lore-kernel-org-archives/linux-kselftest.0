Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794445637;
	b=WoxNDcQByCTh1FjiOalNWZ9vwoALOj7LrwZKIjjle0kHoUpFyTbo+boBmeEZjJBrrxDm
	 ISeID3CcQjZ3sMVc1xF4/ckeyxmoA+RwRSEuVTws86Q/0Ufzjuqi5nfW6zEgvPoM3KxRN
	 KiORWkMZ0jsImox3NTebzIZzo5893PDw2wSoHqGmsDazxLHbhuUlm8aVNXi3Y41rSrd8M
	 NbTV93PrVT+eIsqTN1H3o30dYpNAEe4r/z3MeoSoBkBmRY5YjRUUTsbRhCRiX4LI9MamJ
	 dT33d+9QCsoI4P6p3B5v42wIIzxm0FObe+yGgu0fC2k6xJmKWejVM/rXFrco8r+FVJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794445637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=2RReNFzwszTC+E0RspOXYqfO8c+r26PYFZscPQMQXPo=;
	b=QnyTTQfNsTWOpE992AlZyvMCmqezgbvbGtp4dk1TAvjBeWFn8WtjnpWNRHqY/DfMb4Q6
	 2ql6i7Ynai/Qoq0XagM/mU3MqS0Ui+QLqvhi5uOL549Sx+B3dcUofrkbQ2E5fWGHxkCAK
	 nkbzXip3oTaelb3XR/XCzqtspqIriSjBlxqedJnM7NwZ+rk7qliuPwU+OTcBUGh+qFsiI
	 bNfKvCUDsHBOnOeRDMvLV6XeXIwDRTkBuTRqEbRaBQfCXz4b6GmJvOJs4tbXWd9bVFtuP
	 bLqhSTbSJl8irSZI3of0G3qsxEF6yYLNEMiW25M6Ts4yaNEKyW5CxbyKT3pYQXvNSHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jIa+R2cZ;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE74606A321
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 01:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EE74606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jIa+R2cZ
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b4c8b51b58so2671578b3a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 17:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1794445637; x=1795050437; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2RReNFzwszTC+E0RspOXYqfO8c+r26PYFZscPQMQXPo=;
        b=jIa+R2cZA8GeTGWY4OkBYSP1QFCIyWWlph2FPtReagpNxNoDxmiZOVCH1eJ2M7WU3o
         D4mO5chbkhqnEgeKPmW7Ko50qbGyEuJKZJtZ/qZ3aONwoR2/havVtaEvOZvYpISSZP1M
         z1nMBWNO5DteMV/pf4HKoB8hNglyNPsjJBduYVSouut9lLlrngwNf68xTsyvP6M6bC/+
         5PuXzhcDe+fGSJ6iD0VvBVLEshrBsbM3DEpJMKYL8fj9gaYpN2U19vcsEOkqLj36NZUH
         M1BR8IXXGRswP1pZb2d2u1Cc4GoeSekQHwqZQ23AF8jyRXJ1nN8MAvgYHWKOlXHV1num
         lE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794445637; x=1795050437;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2RReNFzwszTC+E0RspOXYqfO8c+r26PYFZscPQMQXPo=;
        b=D9T+E+ZE2Md9xqo6NQlr6qe/13uewZ8FIVVWE5ObYMv6X/EI62GFWy2s5RtiRaw2qT
         u7+Q+7BoeXR6bCqZxQvwXoZR384namg+KLYQHLf0EhymlTR/UvZOkEpBwqSq5x7AZ3Tw
         k9E3U8Jl+uQfKwvErfcX7ny0FUQTyL0rcKPmOrW5/6rPTBV63l2QR6SVCcqrpkueYlnU
         YLRmGYdK2FT3gN8KpIPI3jRKfbI3xZmh9CPWFCxcYyog6bUrox8HE3VwreBm7UYcy9Jb
         1xrOrkZHvSFv8Iv4h1xd2QmKRJDGOyOd08V+evWUXfM/6EOReflvdk2WijIq0aAFja9F
         +LVw==
X-Forwarded-Encrypted: i=1; AL+hErFt4lnoebk1mJmYnFpB9wAl/57yYqXsQxCCqyiP6zMPs9DiJdhI9PD6nH/OI6xT4kInnyUT/E+cTa7zS3y7CoM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UdXxx1DQ8HsC256YZlZ+PzHDF9JTcPvEtCxdj9yITuusLWg1F
	mkV1uDoSCwqcQAQb7nIrLGrcMG0gi7DPXM5EU+1XPmlX8E1b7vXkhh7vGCXz8DEo0IE=
X-Gm-Gg: AYBFou3XRdZ0InpJEkkUikDZ06Gv3BF6EDo10F5B4WoYAV0eqEdrsdxAsGmupSHOJvA
	i0z3pA/blcbvYgOOx5+ycto1MqiAV+XdGFtDt8ZrTvP9yRfIiKjyS7zPw/cci24pU80tSRsxUwL
	o8/IFeXOp3fKIEvrGuHZQfd4WsP2zwggsXienWIi6iYy4GzJ90/Y7dD5V+cVM5BV0kMVvEqGZq9
	mvr9xAnGBeMx4sFzd7s6yvoXaUfiQVhz4aiLEIw7RvODNOqwHtaPkmcaDPo77yi0W59W2iYCX7v
	6q+Xg10BjDB61P+qWzGUYdYE/u0whvH8sz2pOW2SjmMaMq03GqvmJGq01jqAdFyqM36SCpYpE9W
	/TRDwnKihMrGI1CV5evvLJcB4aZJQpjKuTgF7PvbhSBcr6h3lnrKPYfvc4plYjnPkDCXAxMRGeJ
	P74LCz0l3A8NAsmeG3zqeLjR24/bCWzygxIHONyckqcLvTrZqygOl2lttu9Al5sT7tnrwwdHxKS
	rV2VZ/q1kQw1iYb8uD6gVn8XaFhRch2HRQ3RSddFs3lW8Sgp4VZkWPr8hXDP8bM50/QuO2EKf7S
	RJjpVKE1tr6cnSKYLaoJhCSAlAwEuc9P7sFet1cCLdTHMB9EVAa4qLm1j01rOFx0xl+243y+Pwp
	KeYWnmAxhCoF2pVjJFJg=
X-Received: by 2002:a05:6a00:6c8d:b0:89a:5f8d:2e35 with SMTP id d2e1a72fcca58-8bc1dbfb4abmr3789694b3a.49.1794445636851;
        Wed, 11 Nov 2026 17:07:16 -0800 (PST)
Received: from phoenix.local (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa86dd0fsm2559942b3a.22.2026.11.11.17.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:07:16 -0800 (PST)
Date: Wed, 11 Nov 2026 17:05:24 -0800
From: Stephen Hemminger <stephen@networkplumber.org>
To: Todd Freed <toddfreed@meta.com>
Cc: <netdev@vger.kernel.org>, David Ahern <dsahern@kernel.org>, Jamal Hadi
 Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>, Daniel Zahka
 <daniel.zahka@gmail.com>, Willem de Bruijn
 <willemdebruijn.kernel@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH iproute2-next 2/3] tc: add the psp action
Message-ID: <20261111170524.2b0a6af9@phoenix.local>
In-Reply-To: <20261112001512.3598626-3-toddfreed@meta.com>
References: <20261112001512.3598626-1-toddfreed@meta.com>
	<20261112001512.3598626-3-toddfreed@meta.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Nov 2026 16:15:11 -0800
Todd Freed <toddfreed@meta.com> wrote:

> The psp action applies PSP (PSP Security Protocol) encap and encryption
> to packets, separately from psp socket offload:
> 
>   psp encap assoc ASSOC_ID   attach a PSP Tx association, created with
>                              assoc-add over the PSP netlink family; the
>                              association's device encrypts the packet
>                              on transmit
>   psp decap                  remove the PSP Rx state of a packet the
>                              PSP device decrypted
> 
> decap takes no association. To take only those packets which belong to a
> single rx-spi-alloc call, a rule applies the corresponding flower psp_spi,
> psp_ver and psp_dev matches.
> 
> In JSON, the verb is psp_action. The action is documented in tc-psp(8).
> 
> Signed-off-by: Todd Freed <toddfreed@meta.com>
> ---

I saw several things that need fixing here, but AI review saw more:

New code must use strcmp(), not matches().  Six sites: "psp", "encap",
"decap", "assoc", "help", and the "index" test.  matches() does prefix
matching, so "e", "d", "a", "h", "i" all become valid keywords and are
de-facto ABI once released -- any keyword added later that shares a
prefix either changes the meaning of an existing one or can't be added.
Your own 3/3 uses strcmp(), so this is just making 2/3 match.

"psp decap assoc 3" is accepted silently and sends both
TCA_PSP_ACT_DECAP and TCA_PSP_ASSOC_ID.  Your changelog, the man page,
and your uapi comment ("u32, encap only") all say this is meaningless.
You already reject encap without assoc; please reject this too.  The
check has to go outside the "if (!p.index)" guard, since the attribute
is added unconditionally.  A repeated "assoc" is also silently
last-one-wins -- duparg() is the usual way to flag that.

print_psp() emits "psp_action" as a JSON string for encap/decap and as
a number in the default case.  Which type a script sees depends on the
kernel it's talking to.  Keep the key one type.  The default case also
fires when TCA_PSP_ACTION is absent entirely, printing "action 0".

explain() and the man page both omit "jump" from the CONTROL list,
though parse_action_control_dflt() accepts it.
