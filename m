Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE55736D51B
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 03:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778470998; cv=none; b=g8SA460HPdmLXyKiLL5i9Hojq5D1UfZPkMeE1CuRVc+aZbvhCjKDBYk9Z+Gqn1TCxBXjxgHxjTQ9poH4JKDvISbpMoUtdBCpnRNaPi1MG/q/nAM+LlwvvvcmIa86sM4+M0JGiwUvnpQQn3KgF+3zNJJBSYKpbTiWhfyKd9oI9SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778470998; c=relaxed/simple;
	bh=H4fkwwbYxPKm1ypzT6bOcfX/lK43QRojgcILtVu2XFY=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=GMxGBcIngxWNzd9KSIJSGvEDkXHTwe0S4CuIQPDlAODE3yZGCTAgFdNNf0sAcAaVLLivtVsvt5HV6rTW0miSRr+TMkAp2wJHyCM9S2DyBfA8vowSh/7upYabMjfTQy/+mKfB6qb/HjOW6rtJi3N8KGWruCJOPZwqNNqFD1MP26c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c33Ih2Zo; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c33Ih2Zo"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-651bc83e74aso3837137d50.2
        for <linux-kselftest@vger.kernel.org>; Sun, 10 May 2026 20:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778470997; x=1779075797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGClT6yKjio/U/X8taFr0YcBozUqn3DwsEV9alBjdFQ=;
        b=c33Ih2ZobpX0DhdBIiNyacY1orXTAn4rgx7mk0lUYWoa6mnNJZxV/TOXeNiUY9rhlr
         5g4iaV4Hb0/FYuGHxzDyeaUlwiCeQ8C9DZTr887rytbBMp7ivA4D45Jz0C7IsSnqeR41
         2zLv6yC/vod83+GoF0HmJS9Fptg1vW8Y01+ea8zyHfGdLuLOH6+/oiTbSpCdv26Cokxr
         P3ywRejaG8O8HHtDlyvYMLNHph6SR7675L0DXgsWCr6daLhBToNszN8UqJhcjdKPbBzO
         01ZUSjokqww7GwtX9B8eDbFqa60WD5pdpqCUKv9+MCyI3ctarGUnZ/9IegGK0ie/LSeS
         YJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778470997; x=1779075797;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yGClT6yKjio/U/X8taFr0YcBozUqn3DwsEV9alBjdFQ=;
        b=UgIt9VPw3kjXozIeYSnwVJgzhXKSj5KHNLCRryS6HBRb5xu3qyTmSqSPTtq2X6WA35
         ogQieKJiYFTpcD8yOMvgeI/GSn0fYw46huC/H9oz9pVSgnOY0hcU5N7LuemkDAN/x5Q/
         0fgxfTLqoaPpvF2tnfVfXVe/Wh5UIWeT0q8OBw2LUn0oedB3ZwRTWzGsgkyLpzJ/CPP+
         RTQYqEAoWLRwncqjXIrL6/CtsGR+7OxhAzmmmjHtJ5Hamstd5HSQeXmNuRHBkGQTiLF/
         tSAvFU0HkzHZc8SFJZRU9UvcZCoxsFLEn079WrQVvA2Sbfk9oGFRZassgxr3tUqLGOhJ
         k+fg==
X-Forwarded-Encrypted: i=1; AFNElJ8wPvtp8RlC5GyqEABS8NnBNmc80fnWj/pzRAKlRWrg4sJS67t4GO0YOsnMm6uQzSyzSPrLmNUIdPUMVi0HUws=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjfYA3HiOpBW4YnohpQKgiwJa466yC9t1FKTQ2Pe/D4BwXJzgO
	jq2oWxO8U68lWhBG01/mtr6L28LrjqJ+NI2/10sS3UPC9uN8ccKt94e4
X-Gm-Gg: Acq92OF2qmnYA0dXNedZ/NVkCYZvKBwk45WBhXCvOZE5L4Ks7+nguVmLwb5oshSlrho
	bABWGuC9sXZum0yUMqMemgJtA8GPQr9xR92TID+/RD9nwpMg5hyNcurWJiec6tLY3k1eamacDLk
	jRGUhyvm4/puDKBibzZMALvTex27lSUsSnjtv9j2qP9LMaKrNxTeVHdNfkFCwVnzIC7UuuLDiWB
	b7FVPbSb37hcMJVbnwd/GxuFHJzQkTsktsiDsGMLpgFSoyn7hK4voiFZe+sD+paEL6yYb/oNRAH
	q0V0Sp7zIUbUfQUGHAp2Gc2KgpSCRXk44IBGcwgNZOpELrH3CA1flyZtHYKBErVurCO8ZRuv55q
	A/YH6zb1mjLJXomTzHf0vlKjPp+XLPDZvjfAfUNZ5MYbTp2qPjQrem8gdr8754TQCnlmCby/BES
	/oRYW+ltOzqXcKX97yvLJXohlCvxQkWk/ddhg4L3ufx7TIKQX+o4xlQCAkAV+FRQtCIFyZBvCh/
	RyOgOdDJ9GAQ4vkJf3WADVbsw==
X-Received: by 2002:a05:690e:1759:b0:657:e42c:f25 with SMTP id 956f58d0204a3-65c79df9fdemr16415508d50.49.1778470996712;
        Sun, 10 May 2026 20:43:16 -0700 (PDT)
Received: from gmail.com (172.235.85.34.bc.googleusercontent.com. [34.85.235.172])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65d969fb85csm4673774d50.2.2026.05.10.20.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 20:43:15 -0700 (PDT)
Date: Sun, 10 May 2026 23:43:15 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: netdev@vger.kernel.org, 
 davem@davemloft.net, 
 edumazet@google.com, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 linux-kselftest@vger.kernel.org, 
 shuah@kernel.org, 
 Willem de Bruijn <willemb@google.com>
Message-ID: <willemdebruijn.kernel.112c88eb7daa1@gmail.com>
In-Reply-To: <20260510174219.74aeee6d@kernel.org>
References: <20260504174056.565319-1-willemdebruijn.kernel@gmail.com>
 <20260510174219.74aeee6d@kernel.org>
Subject: Re: [PATCH net-next v7 0/3] selftests: drv-net: convert so_txtime to
 drv-net
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Jakub Kicinski wrote:
> On Mon,  4 May 2026 13:38:31 -0400 Willem de Bruijn wrote:
> > From: Willem de Bruijn <willemb@google.com>
> > 
> > In preparation for extending to pacing hardware offload, convert the
> > so_txtime.sh test to a drv-net test that can be run against netdevsim
> > and real hardware.
> > 
> > Two preparatory patches
> > 1. support negative tests, where tests are expected to fail
> > 2. add a tc helper 
> > 
> > See individual patches for details and detailed changelog
> 
> Hi Willem! Looks like we have some flakiness here:
> 
> https://netdev.bots.linux.dev/contest.html?executor=vmksft-net-drv-dbg&test=so-txtime-py

Argh sorry. I should have run dbg mode, but hadn't.

The previous version skips all receiver errors if KSFT_MACHINE_SLOW is
set, as of commit a7ee79b9c455 ("selftests: net: cope with slow env in
so_txtime.sh test").

This achieves the same in the new version and seems to indeed mask all
the timing (and other) errors in debug mode.

	@@ -24,8 +25,12 @@ def test_so_txtime(cfg, clockid, ipver, args_tx, args_rx, expect_success):
	     cmd_rx = f"{cmd_base} {args_rx} -r"
	     cmd_tx = f"{cmd_base} {args_tx}"
	 
	+    expect_fail = not expect_success
	+    if os.environ.get('KSFT_MACHINE_SLOW'):
	+        expect_success = False
	+
	     with bkg(cmd_rx, host=cfg.remote, fail=expect_success,
	-             expect_fail=(not expect_success), exit_wait=True):
	+             expect_fail=expect_fail, exit_wait=True):
		 cmd(cmd_tx)

