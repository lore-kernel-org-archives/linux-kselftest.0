Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9B137EFE7
	for <linux-kselftest@vger.kernel.org>; Wed,  5 Aug 2026 14:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785939749; cv=pass; b=klKHmDkyEMncs0U67x4K+Md29jlsa4hechsDKmvq7A8bK9f1XOE6elOzfLkqOVv5AsEnLsRFCDKvsYv2P413oXj9aWIPy2ImlvsMOZMWCzN/TtCEJ4YF6omfPDa6HqFbHfgUqVeKJiEMu+rdSeEnly2jg2AQZq9BlDa+trlNQt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785939749; c=relaxed/simple;
	bh=PBTXPiYdjm3vlQmsRzLNpMwqKaxNZRd51NNDLZRc90k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jl1EbAgmF4PIrYKTSzb9bi4faIi7jI5JFwaG44Od0YQdkJLHu/xaHmyMFE8hG1v94TIq38OnMGs4clDXhDstpVZBjRKrFHdiOxggUqfQUAHL/vT3pG2srdyp8P4oYhmGZgAGSrxGpjRJEjikqTbr2zmkTv3PULdzAp0zC7it2dA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COoO2U8O; arc=pass smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="COoO2U8O"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-495e602352cso61739b6e.2
        for <linux-kselftest@vger.kernel.org>; Wed, 05 Aug 2026 07:22:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785939740; cv=none;
        d=google.com; s=arc-20260327;
        b=oN9CfGs2aoFaQ1mGz8lUg8qmjqGWPBEfUmlLMNZHgEOeLS3Lz+rMtAiL4Y7ycMGvFA
         XTPlqc89N6qTjL/hvzQL5JBXmVytqFLX2VuJONyr6baG3v3hjL+2XpSozOQexhEO7Y0F
         WvfP/irTzQCTjXVgqcl24Poe/wZFm2HIyJClp2iJcsRVS3MB8ZKw0kGCrKIndO/JLs/U
         0cYUn/kNQ2hS/JE7287sw1DfbqTkr5fGsfIp1PReVfud5bi56DX+7CLTnYUIcQ3YOoo9
         pJEoVHPrMiJ5w2xPmV3IhA1336ihaB6nJU2MSRDDVgYsu6rIXu9WSf8Yu1FNGhpMlv9J
         2EjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PBTXPiYdjm3vlQmsRzLNpMwqKaxNZRd51NNDLZRc90k=;
        fh=Fy4GTJtKi8XqvYrdPuly41+t0Yi5QKenJ+GvK83MBro=;
        b=EnEPbpWvDej08XBBHq7lz6kXLv83hSeBkhLK9+CFHChxIpR0QL2Sq8TimxTrMCuumF
         enbeBWtJT7yBfB1jVmRYkEyWV37MPVgDdaN6xBOLboC/EaRWHKztz9kBC6e2X5Esnpfi
         tgt9sIEEk0PgyrwcNtL/W8q3r/zNsCyV663SpP3rAV0rXKD8IDYnY8IiLffNpX6dtIbA
         7YDdmM+A5C/j6SWltnGV0hXJmX/WULywuwsmD1utZFBRI4BRI6uHNeHDqSkin8/gXD1B
         MmGoMq/adkLMTMXPYm3X4KdgiC5Y03AfeGq5Sew/vHGneBEFquODFzgmSJCxF+QxuAmB
         XdXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785939740; x=1786544540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PBTXPiYdjm3vlQmsRzLNpMwqKaxNZRd51NNDLZRc90k=;
        b=COoO2U8OjkiVkhgfoS7++u5iBfYDAKH4nDzXzAdi/RivU8d4C9NnSJLYwFXgoFDq+y
         O61Gwr1GNZjhOSOX/dKZo+7w1A9rU1mNBWnQy7TMG10C0niFzQ5isHs5K1xSvQu/27/T
         ZySFyot/VDbOJ8lEMuag7404blne1uTLbhvFeuA4/95F6VJGm3H6vYZE0RKkqUsJLRSA
         gJPyOpRRwtOEwk8U3hsx5ZAFiOqjmB/CO7xp9w9oE1iYtQJdM6R3xpUeHhxqRZ3KE+Zg
         yJaGCQ4ZhIj+OQivYITgVfYpUF3FwAvEz/JYyu6kGubBTXV7AUgQJbZvulnUmgAKaduR
         8mYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785939740; x=1786544540;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PBTXPiYdjm3vlQmsRzLNpMwqKaxNZRd51NNDLZRc90k=;
        b=hyOx5Ka0WleHmESped2mh25+Csnwoig66iDUbLbvO2639QeMLX2dImskWyLSGbXZSH
         rmfEUi/IserYfH0LjQbMIdQwSV7cXJgUp9PhOeFqnhwdA6F/pkdv4WFckfikeK3nGEN9
         9PIzgtOHI2AW+qKYgDucaa/Gl94MmSLBOxxd6Grs6cssOTBiZFYA9uNibrJ0Bd731b5d
         6BEAfAW2lmiyfIuLCxvcCDvBC01N0pDwcJ2g2xLacA16cb3dMjJaesvP5fyh7jBF754R
         6eyu0UAKHLfssagWeRIAP9F1MkCSF4MPZ1MjfP1cOtjHbfZbadu3TR39YpOCBU8LN1TX
         rdPw==
X-Forwarded-Encrypted: i=1; AHgh+RrARZ7wkgDVAmA853mcr2FomGUQRIaXwc4uCfg/uVBogRjj7QzompssIL9Vzg5jePM70vQp/wdwwPrhVeCVxEo=@vger.kernel.org
X-Gm-Message-State: AOJu0YztO7lufio96An3doVPBc/64OEf3gcAcsWeepOD1kxJUXHogFW+
	siaekgvfEMhgegSJ0y4vIpJIcUB4wWctb1qwcnhUOp4bVVCIgeUq/R4el5qzYRQvlDE/c8G7KRp
	KAEzzR07tPfBF+OzG/BLlGHF+W8Uq0RE=
X-Gm-Gg: AR+sD12Nq9dlw0GzFpicCN3SKMJou1RToofmWBCLkcxqqvjGn14/tqXLQjb2R2ULF66
	0WU2DjjtoeSgxed65f9ILclCJ+9Ih8va0KwES57cQI3vrxzAMmG2MW+N2qxZOO6Dfxm+KzcCGKo
	gWMxLuq2w1a/xuAGDVUy1DJFbUfulo83FQKyOk+nWnEI64aanS7pF+z/CeMqS0QqNuZSEtO1ZN2
	6ZejfkjWsAGQ5mC8QLLlDUaoW526nkxMf0wknmjU/TzJYd0LgjTvEhF7YigP0wm+zFBMZ3GX9Rs
	oopexFxS0Uqb5kA8COuwe7d4dh+zi/cEIrILCSyCBrPQheKjy6fBbhZ4g6Gm
X-Received: by 2002:a05:6808:3082:b0:4a4:82b:2a35 with SMTP id
 5614622812f47-4afadefa686mr2996765b6e.1.1785939740248; Wed, 05 Aug 2026
 07:22:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805-netcons-userdata-rcu-v2-0-c5e80f6a7a46@debian.org> <20260805-netcons-userdata-rcu-v2-1-c5e80f6a7a46@debian.org>
In-Reply-To: <20260805-netcons-userdata-rcu-v2-1-c5e80f6a7a46@debian.org>
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Wed, 5 Aug 2026 15:22:07 +0100
X-Gm-Features: AUfX_myEBJXrwCd_oNjePYEUGRCdQy9tXUD1opmu4-BqJqeTjHWmE-CrsEfGEVM
Message-ID: <CAGSyskX-C3vyySs91KEUEUczGrwyxH36=UVN_chte+m-k_NAvA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/2] netconsole: publish the userdata payload
 with RCU
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, asantostc@gmail.com, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 11:59=E2=80=AFAM Breno Leitao <leitao@debian.org> wr=
ote:
>
> update_userdata() takes target_list_lock to swap nt->userdata and
> nt->userdata_length, then frees the old buffer. Since commit
> 7eab73b18630 ("netconsole: convert to NBCON console infrastructure")
> that lock is also the console's device_lock, so writing a userdata value
> from configfs serialises against the printk core emitting messages.
>
> The buffer is immutable once published, which is what RCU is for. Move
> the string and its length into a single netcons_userdata object and
> publish it with rcu_replace_pointer(), freeing the old one with
> kfree_rcu().
>
> New userdata design:
>
> 0) Unify the userdata fields into a struct netcons_userdata
> 1) update_userdata() no longer needs target_list_lock.
> 2) writers stay serialised by dynamic_netconsole_mutex.
> 3) reading userdata needs an RCU read lock.
>
> No functional change intended.
>
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Gustavo Luiz Duarte <gustavold@gmail.com>
