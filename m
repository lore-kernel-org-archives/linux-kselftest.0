Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793105102;
	b=vltEpu4oubUGhPKF6b3ipATqj7MChZgOppbc9D1gvqP9LW1ptfx+hkMpq4AR1iQ1Wkmg
	 LpjMXZ+k9zmD/l4Da7h+WFA9bBRKiGxArV/nPxCUsaMMjOrGqcnjnJbaqDodEJsz/570t
	 NjNb+geakOQKxIGe1w/UHVjdIsunzfEV1XVqo9kKUSRPz1fQZmvol0ZX+3Y4ly2uGr/Bg
	 s9fdwF+EBCvOghNTf25WigmY0Amiye3p9SmxhFCyIFLu/qOBVmHSgU+EK9CHRBtGvEf+B
	 e27zfZn3PmTb2cOGchb1bK3YF6AiOBivRQ4Ciav3fV81nZoF6s/fna8xT0dkiMnQLDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=s3EYuBTTmVhTSEPj6dV6TX9HIoyvSVBfIfq2lIa11uI=;
	b=IM1Inst3tpQj7sxe1OBn37Jm9xr+DyORXYBScKHz2gilNd0pLqhwog2o+bP3o0r3t1+Y
	 x1lEzoHVtAqX0uQpiGguhshuMH8NqV2wXC5vvGBzI1lPZM7aTlLPCf/J5mIzqk7DmyVoa
	 OdkJutwdznhg/AdSvl5dJjxkJ70wyKoKkY04R5QMV9xzHIMNyz7c/8lWuJdseO4zfik8q
	 K7Pxubs5MoOE6UTkpC2st66FxnNWeANxNOvTrgSCPx85UXqH6fIdoWENaIzZUdMECOolG
	 vLFCV/K2B9sD9sQzgqyoo/epEdFuLPUWR5aoc+28RCRYks8Vowwu7A79rGL7mf50PgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="ZUOBzw/p";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0066B606A31D
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 12:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0066B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZUOBzw/p
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7f84a55e31aso2666014a34.2
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 05:45:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793105101; cv=none;
        d=google.com; s=arc-20260327;
        b=TraWNBejRnOZTr2GgXwnAwzxURw0UblI/o0nQB3Ja5IEEVF/YT0+oqMOt4aQojIEIh
         RCx2yC4IilsrVW/6hLzQPCnkCNTzLFCyU519ql796F4kEtThQ3kunIbipMBhc3qhaYPW
         +02yUck3fay8pci915NoJ4Zq3oquy88SkseuVEwiq/zZTFPYEHt/t+gbDUFSj6VbM0oO
         02czdqnPiKO03Pl4R7zVx11bSjkuwxEhn9XaNR35rVm3rBMtuV3MyYuNQi0ABIkhHM8C
         pw4K4NnEYP7MaF5/0fDkG8LUFcUQOMBBNloSTAdvCq89yZHj1FALXbtEt47W9NYMuabi
         5xrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=s3EYuBTTmVhTSEPj6dV6TX9HIoyvSVBfIfq2lIa11uI=;
        fh=brjTMr/iDBe5LK8cvS5XvtLDbkmlNJXTBWU5SOzdhXY=;
        b=NFbL0gqjvoI02fHIuxMsnBjF6uJ9wTi4lmMtMK6nF1Fqa1jPlQAtOEAp+ADIEO2Ko7
         avYZlNqeBf3MFDkHvLskgAwcgylyXastza4ITBRikf6tMr3Rr+/qGFjwPpAfOnn04H3P
         L3dQYK8+6QQX3UpsUWiwa4JUrajDkbiD7Jg6oxd8e0KlasfFqIV7p31X+idUiwkLfvCT
         5jRvSfs62rZOefd/fDBktRdJMjJ9fSkcXbgkyGZ3F+QmyxNhMiZXsenk+NbCcFqdX2NI
         HFojLQpY/f1gTTZj7tRE6SDbeB+g4Ahe6k8lK0RI/g9z3fmRO1SXJY3Di92f20jOdDqL
         1D3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793105101; x=1793709901; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3EYuBTTmVhTSEPj6dV6TX9HIoyvSVBfIfq2lIa11uI=;
        b=ZUOBzw/p7m8KeeHwXA3quTJfFdIULTmM3ehGFEBoTt0YEm9WBE///XebirB9K+GcjT
         X8AyRearg10v9L1140F/+9XhKxaoWZbyNCgCOek7RexPA2Jl6fe4vHkeaBZLZ5fPeVdk
         SPCF3DJCaDtrzgOE/xQQl1PEs/DwnGYx5P7km94wV5jKtF3xgEn+pkvrf+KON/rQyMgV
         wNEfYgR9EJPvqe2vwSxUEk3ChxmJ8hUGdkiQCudrvt+u2YHLkd4TTVXtq29eNT2T9MNZ
         U3zCLsfAioeNg4r4A5z7xASqQH4Ke6OwLCHlGPszXIXRZYpye7olhKWw6AHYQ2BqXU82
         7nRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105101; x=1793709901;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s3EYuBTTmVhTSEPj6dV6TX9HIoyvSVBfIfq2lIa11uI=;
        b=InnJ2FxX/fsSJr/Thn6UQFqURyR3mdDBbGCPmkD3FCn6xN8cKuFm76Cu06IjPqOkyL
         Ra0s8v4TzX0JtY1DEOlpwZ7Zcc5Ii4onqKS5Hp/WfjsQcFUiG5N3T/YwyY+HsnHYdvhV
         OhgjFSquM0OXV7Sq3u1sbnuVUVJuaSHHRsWea/UaZoTZzPs45zPYHkFlaSpZRJtCKrxA
         wousKi8l5J9eubYK90eaIIXfvxvzgesUMp/ulp6RglKk7KwIJZW4Aer2xEiGo2cKNCYh
         eYoJadciRYTGurpSrnlZjdWhhKNlri6lVYb6hUVQm5pQoyM7U/hMbn+76yn8WwHtfVIS
         IqqQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/1TIHvONPQLkKwhch13lpMnrGn3HMpfpVHalFx/ojTtEAZp7ZPsQHReTDmOfEgePE7UIMKD2x++hCSLqiKLg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJM3ktICXYuDD1giBAwSOpMjuAQgVQsj8+d1W4XQdgbCLnpo6wR
	LVBM8IbteLBLy5zlhV+IUXl/2n2YfTnFpoqzGAICfFw5M2JukQheaepMSeUsfwJWskHRCFzgGJj
	W0Ulp+lKszXITzN9dk5Fz//tM9DPH4R4=
X-Gm-Gg: AYBFou3A+wfZay9q5r2V3kSNwGTZK9c9+fl8WLjgsjJBjRfg/oM7ogEDCgXsSC+/JY2
	4FKCnddG7KHrYhpqxvnEzkVhdy0nePPrZ17ba0j+QyTnp0Fu88TdmYw4BsZL7ViEKx5tmY3qPbS
	55rUdtrwI7MKdsH0ClErg1Skj7mnxk8jOjhDLLUjrRX8g8MHUxIUfak+bD6hNCPXJ6rDA8lLHZx
	FChvvoKN0bl8jUoBVxHvtcfyxDpeEnYX2jufE8vL1ZqNfq3UYw7sNkUOsWhY575hXQu1TGGiTJY
	jlrr4g2oCfTrasB6RJHRSmcXl0ngoQIg0Ws+q4r4+2nBOg5kxp5lWsHFjxxl9OGo6fqVqjQLM7r
	NAo3kJQ4sabPdEFo2mkSyBxZS31Y6HvxCjFroczbK0rXDWk92MJCyOXbfk7SJ4EJv00IZNVuv/s
	NMtWoSoRYLky+R6C3tssx4Irc=
X-Received: by 2002:a05:6808:4f07:b0:552:1042:5c35 with SMTP id
 5614622812f47-55c0032ba03mr6286078b6e.41.1793105100960; Tue, 27 Oct 2026
 05:45:00 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023-netlink-dump-livelock-v1-1-478214a635d2@gmail.com> <179310175111.3134.9177648236285208856@kernel.org>
In-Reply-To: <179310175111.3134.9177648236285208856@kernel.org>
From: Jhonata Poma-Hansen <jhonata.poma@gmail.com>
Date: Tue, 27 Oct 2026 13:44:50 +0100
X-Gm-Features: AclHuK8vtyo3SzVDHFGolZX6XEU8zK_Jh7QNOxyA31mgL6WcdQ5ELfLnY30XFg8
Message-ID: <CACgZWq4DV10PkksLhDNp+RxtTGNyuA1m1YmzTZJgkybb=MfOWQ@mail.gmail.com>
Subject: Re: [PATCH net 1/2] netlink: retry a dump skb that does not fit with
 the minimum size
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kuniyu@google.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Oct 2026 11:49:11 +0000, netdev-bot+sashiko@kernel.org wrote:
> - [High] The fix is incomplete: the ENOBUFS livelock it targets is still
>   reachable whenever a minimum-size dump skb also does not fit.

Agreed. I can reproduce it with a small SO_RCVBUF, where the
minimum size skb is rejected as well.

v2 will rework the admission check for dump skbs instead of adding a
second allocation size, so that a dump continued from recvmsg() always
makes progress. It will also address the selftest comments on patch 2.

pw-bot: cr
