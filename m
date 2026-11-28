Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795830680;
	b=0/XIWcUFXY+TjVfK31ZSzskg+e7ASzRIukhrEzr+nn36dlCdEcrok0Ztq+pKvJ7hhZYx
	 ThA8+DDYH5eBWskdo2h/Xm7513CcbAxAAOlKVc8JhycxXqeV4m36BjNfjSCnXXmJCzhO2
	 OxZTZEZMGS4HdIyDBKh46UUi3w7jr3vzUoWKJBrPtntC9C+MVO0UIYEztw7iCAv4BRxax
	 J0FVfnxAv+kThKkt0MUtXhrVAZWuFWLHFJnfY4AW8tw1VO5pp6ztBRKRJCgAIoFUPYKYF
	 NC+5JdXoDjG65xaCN+EMB19HMr24ReF0zjYV/uaxLaB0HAqDt39KSXSmJOIWpuoQJOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795830680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=M+kv6M/MroHXNub3A7PdHe23Ap2KXe5JLqM78W2xjvU=;
	b=eEhNRgxtFJYhBPKopSheOySVbAY8fulBBgVUciMB24EqgsNFGeN+xrbbHYnobLlJCMSK
	 Y4nAOnlLbmutgf5c2k80l3KK2jMUaBsTyzZb2oPqaTg/EZYFfz1iB3x3oCK/JMOFRCe39
	 9lBycDT+2+Pghkd+nJF5oBSO25cwIrZxAIyteLpEll23wmWTKLImY1QD3tbwq7me49mRg
	 a03c/T26dF8n8UufNc9Jgj4N2mQih+8HbvhhUdx2faxuUYmKHHtu+Lm3n3DJ2a731JPra
	 8Q03Q85Z6sJbsda9rtZjJGMCuWbS2BoEHZ4+Whqg246Jvrcc4oqFax8AJnPOAG0RGLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XLosXPN4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFFE606A324
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 01:51:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EFFE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XLosXPN4
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so1388182766b.2
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 17:51:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795830679; cv=none;
        d=google.com; s=arc-20260327;
        b=SkVasYAAQ+N6EWLTW7zTPKN6GDNufPPULpv1f+hnPL+W0GhMwyINiGAzZ47FKI+c8Q
         GrSFx7Uqqu0JbFK0S2TS0ERcsQQU9oBRTkBwZPhF0w8dVB5kI+POTGW3t9UpqHgbtl6L
         E40htdxsfnS/4jOFeeRi/7psjThn4KVmlUM7Ke/Lk6/0OW0el5CKHXTGunr45aigP8mj
         kW0nJTeoWOLgRIkyyYSET0SLszs72IYGMtejWWjJUjCUawSzHl96zF8BrbThFQm+0NGE
         GP7+WA+FrFslOpPzuawRntQjjinrVp4sEF1/fkZjQNM3m8fxQGDv4hTPwBWSfbTV9+7F
         y6cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M+kv6M/MroHXNub3A7PdHe23Ap2KXe5JLqM78W2xjvU=;
        fh=CmLcxp2Nw+m0PR7Qf/dK+ubLwNgBz8vkUKlpLLJdCvc=;
        b=Hgeep9+sJKXMuSzgvUkoYx4FMLdQi/tJQ0GFu2810aio5enw6fj08SyyHnOO5WWBhy
         K75m1EK4izunpL80FurvdBZGUeXe2LBVIrdfhBIcuYGavBubogDPn4HogJoF9DPTAGIn
         U5VULH63HroX2K0kpUIFhBnpdCYPH3i5bu9xiw2dGp7D3sLvv5dzR9D8HSzHED5ZACOA
         rUj/2VjEhITSXNRHNuIkGtrPXCDmtjFqqYYR17VK6KFDrYiHvCiYblMWo0q+0naXqWVn
         HE9J8Tt70KybilBR9Rx4pIG2MGsldv99i/Xb0xOSrYH2V52BNv7UVK2BnGb06KOkNaIc
         chFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795830679; x=1796435479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M+kv6M/MroHXNub3A7PdHe23Ap2KXe5JLqM78W2xjvU=;
        b=XLosXPN4XY1X7SNdxkqBL+OmW6RyoS3KUKiJGN6VkhP3L0yhHIWAe9gfCGB7c23JLd
         lHNLLgTgGaPV+ANwny7auVJWhylTPy7tn8Qbd1QmlxO7gDNExEWgSGEhy30NAozJQ+8+
         +xKv07hbVc2PMmC0nQwONM+Snu/fB4CVx2Zu1RVG2ABrNV3bydSS40OT+TsJEZK+JELi
         MFuPTs18dGi6k3X7RKL9C6rS6PY4lyASR9cQGoX1ApSJvF/sCt8fWc54v5qN8Mgd+424
         mRGAbRe9QyqlYYy8UZHrD36MAiba/qdVjAz2hG+uSVag6rBQPtZrBpUV+D6X33j1iq7k
         51pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795830679; x=1796435479;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M+kv6M/MroHXNub3A7PdHe23Ap2KXe5JLqM78W2xjvU=;
        b=hT5cnbnr0HlNvOIPnXv9Fd+eBzqbjAD0HPdffHj3RwdwCg3JGIF2XOeiXot4TlYNt0
         p06NTULeb1LSa7bxMDqGrxYsaNTQn8abnWl4G7r29kAjTZZwWcoBncbYfbFNA0zbCi9f
         xr4cWCfvEEcgFsCJisqNYxpjukpETHUbV4Bt01EykMJWJP2/65w+QygEAmG+Sidx5Ucc
         8VEB5UB9hL5eVgRXwJ7etLl5XugQu8zNqpEpK7/mdFRtGIECHlVHFbvSJUsLtnFzMqy7
         LAR8dhpRS3OAYWHSz0zjn4t4mYm4kefh3A5AeROUqQhqj9dg99xTV8PODSaL+klkV1HC
         j8QA==
X-Forwarded-Encrypted: i=1; AL+hErGOd9QTy1tcwG1/yubbMLZQSM0Yuz3RhQ/Ibp4RpuSuC7iMMmYcwScv+U7tOyV0wF+Vj6j1h9bChYYUr6BgSIo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RGcgBlgaIAyMS9o/8k07MsFyb5NgAhOm358a1N47DN9d3OS+n
	GKdzlMphbk/XZ9Z+R0y7cCuhlch0dSMZwBpGkOlfMQm9UxZIEtG8CEvFgzpqP0qYn2cOmBKv0qa
	zB0OCUZ9B0qkE8xiZqpOffF+ws/9d4XM=
X-Gm-Gg: AZFdTZc2RbCzIQMEoXI/JVdaw9UGgu8JZP8ed6T0kgTt65U7hDBNh6wcpwZcRRVMh+a
	XPJyOiBPe6ioog6rfnLkB4yo5TrXW9Xx6nzBf4iTlU3vz/Yab/tGQ+KshlcgozwgbyTmWWPmqrw
	wDcbxUyE5xot8gqhYnuxehF9f+yS3colB6ua3NqlznzbktY1+ERtp1l/VJj+3S81dFmXLHwIgvA
	9ShR5y4jWbmE4SkHESIznaQ7ouWicRgOMAunORc7YcvU8CDHX8nVJQ+XiIzx3TrT9lFFGTi4tCn
	UCz+6oOcQjkUES9if6U5zlxUthPsuMLpp42D6LO7//PVGkyx9Y8V7XaqV/0ofqjOPk5B/Q9LWv0
	nsYoHVGFp1MmVX7Ip579Fh3/OEYpDSlO/GkLp
X-Received: by 2002:a17:906:fa82:b0:c50:4b6e:329 with SMTP id
 a640c23a62f3a-c513a5eaea2mr1724212966b.15.1795830678877; Fri, 27 Nov 2026
 17:51:18 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <awOQDOel_72Xwjm7@kernel.org> <20261127214103.542291-1-safinaskar@gmail.com>
 <awn-ioAuksHNV-Rc@kernel.org> <awn_Y7oI4ckfsjSv@kernel.org>
 <awoHex4LVst2JwkO@kernel.org> <awoO9R7YF_5_6dHA@kernel.org>
In-Reply-To: <awoO9R7YF_5_6dHA@kernel.org>
From: Askar Safin <safinaskar@gmail.com>
Date: Sat, 28 Nov 2026 04:50:42 +0300
X-Gm-Features: Aa3M54pCi2p8qLdocdLXd3OCMkn8g_j_UUSVEEax8LAEOxwj1oFmxFAoHI8_4lc
Message-ID: <CAPnZJGBnFyrmr88OsYkMwtLiR93z4g0NAuoMurcnhcYFXz51jg@mail.gmail.com>
Subject: Re: [RFC PATCH v7 00/26] userland: Userland containers
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: aleksa@amutable.com, alex@amutable.com, alexei.starovoitov@gmail.com, 
	arnd@arndb.de, bpf@vger.kernel.org, brauner@kernel.org, 
	containers@lists.linux.dev, corbet@lwn.net, dhowells@redhat.com, 
	ebiggers@kernel.org, giuseppe@scrivano.org, hughd@google.com, jack@suse.cz, 
	jlayton@kernel.org, josef@toxicpanda.com, kees@kernel.org, kpsingh@kernel.org, 
	lennart@poettering.net, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
	luto@amacapital.net, neal@gompa.dev, oleg@redhat.com, paul@paul-moore.com, 
	ptikhomirov@virtuozzo.com, sergeh@kernel.org, skhan@linuxfoundation.org, 
	viro@zeniv.linux.org.uk, zygmunt.krynicki@canonical.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 28, 2026 at 2:15=E2=80=AFAM Jarkko Sakkinen <jarkko@kernel.org>=
 wrote:
> thinking more sequencing than data structures. I.e. I have a game where
> I need to end up to process creation without embryonic state, and add
> just enough weight to kernel to support that outcome, and that leads
> to ~2K'ish LOC of extra kernel complexity.

So you don't have embryonic state? I don't like this.

Let's assume the following situation. Userland's PID 1 is already running.
Our container manager attempts to spawn yet another process into userland.
As well as I understand, it should do clone3 with CLONE_INTO_USERLAND,
and then execve.
This creates time hole when there is process, which already runs inside
userland (i. e. its PID namespace and other namespaces), but runs
container manager's binary and have container manager's mm.
This invites for bugs. Other processes, which already run inside userland,
may somehow take advantage of this.
For example, see section "CVE-2019-5736 Is a Very Very Very Bad
Privilege Escalation to Host Root"
of https://brauner.io/2019/02/12/privileged-containers.html .
So, here I like embryos.

--=20
Askar Safin
