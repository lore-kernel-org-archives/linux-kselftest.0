Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7992C21C3
	for <linux-kselftest@vger.kernel.org>; Sat,  4 Apr 2026 15:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775315417; cv=none; b=YNIDwQBSjv3ELmo1/sZShoHuH+MuxPXyDefVlt+Axv5gF+JYWaKu2GXgYE2/5ajJV1kCaOsisSE7E/5tlS19Th/GeYU5l4c6Bi2BwuMq4qLzV1TTP5s8PhIihoQuGV8Ww1anBoLnFpHzVx1gvjK+G3n4IVLqU2wSYPW3DESvS98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775315417; c=relaxed/simple;
	bh=Anq4LDGq5lVtFK+TsNxarTniDdSAlSCXkoSEiP7oYu4=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=jFa6WFkgeCDpyH5DmfGt1FxM1gZB5DahCbsTjr28A8lHoCN7DiD3uQb4858QKWKVfSOFw8Y+Q3kPx+fFY+JNh0DDVu4mHF2gYsUBliEWsy3Ec+ZTevoxH3hv7hZsmSACEsQPvw0aOq3qPjROAB6jMkzI5N5Jn4j3UR+XNceG3PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ezm48tf4; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezm48tf4"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-799001d73bdso19623437b3.0
        for <linux-kselftest@vger.kernel.org>; Sat, 04 Apr 2026 08:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775315415; x=1775920215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/TbcvvItW1iIB+wImdS8Nm5LxtPLoKDDsWDJz1asoA=;
        b=ezm48tf4/iv9tXkcfbW3TSWMem9i4NOmXPKhUgywsQcWRtTkjiHw0L+RCFdXuiy9/o
         +2bYIbXxgZpM9S0miZhgWTWJTwGXJGFIkIHExYMvfpoxs27SJlFxU51XtQGs/Zrplks2
         36yb41tf6q3EqZzhuyx62gWYsAvS6jY28LDWxcWQlrnN/hwRn24ks6X6ueNR6yWzOdMu
         UeXFhQiZiXY3umIS1zDzi5HyOSa/1q2hXCFD35HC3pSgb5mU4MWGMTY34tkMUPic/pz+
         EdCsDYMmL7ytsOJggLOSKJYBqUq1D8wWxLcsrUsEFXOVecd9tr5UfV1ueO1t8GdTKvJh
         ZzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775315415; x=1775920215;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J/TbcvvItW1iIB+wImdS8Nm5LxtPLoKDDsWDJz1asoA=;
        b=iJJW/X1qBGMDAqWoJBESUlFqav8gfBVp//lPlf78ccSeHs0PT8+2OzxkTonrBGA517
         CUSjk1+807p/TaR85YYBxeIm6WpNaujG70N+H/KHHVKzr7cxLN9pote22pqztfxXzSRA
         QJDVr9jkqSQdaPHS+SNnFEElX7Cu4zcBiK3mmMfT8KsZjI8VuSTLIB6ltaBZBdCX+JOW
         /K/cum4Jtuo52nxth42Oy+CdhXVveG2ij4H1y9oYWaTA1fg+9eVOVn9lOTAEIPnyTbK6
         qA0Jl9tX3Ketov3gXYeOzsGN+STyKE3ZyJcd1v+1qd1Ht47YGcKOuVbFLKkaJc/1+lyv
         +uRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBFvqU5IzDoSnJDf14Lz8yQ6Sq0LDpFASxmIamlIjRGBlUjF8C8X2lk2gy8Z84QLEF6FRd9sJXWaKAk4TrOko=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDX+22Xe7MxQxac9WnwdKQjpO/Rs/zmBJKEzuYeCwV9DRVdl4X
	L/OvGFExNMWoaUXmaGLoojZxFtt2Hg72bnJO+H6Iaizq968FIVtN/Fb7
X-Gm-Gg: AeBDietRQLbY46O3VSM0qs6dMaxNDNkNtVz8Lux5wpu6tokusBIst2lGNBOsfICz/QQ
	cNi7m110ADkuhZGZP/QIA8sAGxb44UkY0sh5/w50bhKt/MEW49BKulpRCh6zkxWc/T49tP9Q84I
	d6kC9n2ksRuf6QVL2HV732GVX8UJtcyedzVeopkpRERyKIjeXHVaAZvBu6PGe+8Q2CGCws4NePU
	8fga52MCxh8pb1ttqk2l6pHnifL+WgDMVSuZVXjuTXiqvenyOQ9AnmOTY1mGYp8DMYchUDU1Vm1
	zhFeOuUMKZfgHXGceFmdQXOGy5ixFxb0VvBC59sVz4axKY3Tp9nA05licQI0ZyDcURcq98xM+Ns
	ZdCTdriQcTr3D58s8M+biWKy35nYCyXSgnwrOP9mY5FpZBhMuhGtonu5tf+5TWddDtsu/xZEGdq
	uRQjuO+l2iRKlPVVKuw+BEV+KKmFMioMc/ZNtbjPHzqpM5nAV6CoffplSAjOykUnOwa0mnzw2p+
	P3M
X-Received: by 2002:a05:690c:c513:b0:79d:d23b:4c32 with SMTP id 00721157ae682-7a4d35d5cf9mr69352567b3.1.1775315415094;
        Sat, 04 Apr 2026 08:10:15 -0700 (PDT)
Received: from gmail.com (172.165.85.34.bc.googleusercontent.com. [34.85.165.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a3712ecc53sm32578907b3.44.2026.04.04.08.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 08:10:14 -0700 (PDT)
Date: Sat, 04 Apr 2026 11:10:13 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Joe Damato <joe@dama.to>, 
 netdev@vger.kernel.org, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: andrew+netdev@lunn.ch, 
 linux-kernel@vger.kernel.org, 
 willemb@google.com, 
 Joe Damato <joe@dama.to>, 
 linux-kselftest@vger.kernel.org
Message-ID: <willemdebruijn.kernel.3ad8f36da2a1f@gmail.com>
In-Reply-To: <20260403233240.178948-4-joe@dama.to>
References: <20260403233240.178948-1-joe@dama.to>
 <20260403233240.178948-4-joe@dama.to>
Subject: Re: [net-next v2 3/3] selftests/net: Test PACKET_AUXDATA
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Joe Damato wrote:
> Extend the packet socket selftest, adding a recvmsg path, to test
> PACKET_AUXDATA. Check basic attributes of tpacket_auxdata.
> 
> Signed-off-by: Joe Damato <joe@dama.to>

> @@ -322,8 +376,11 @@ static void parse_opts(int argc, char **argv)
>  {
>  	int c;
>  
> -	while ((c = getopt(argc, argv, "bcCdDgl:qt:vV")) != -1) {
> +	while ((c = getopt(argc, argv, "abcCdDgl:qt:vV")) != -1) {
>  		switch (c) {
> +		case 'a':
> +			cfg_aux_data = true;
> +			break;

These are intended as independent test cases: test_auxdata,
test_drops. By using flags the flags can be combined. Are all
combinations of flags expected to work? Else maybe we should instead
have a -T "test_name", or so, to keep them mutually exclusive and
easy to reason about.

Or just a test that two flags are not set at the same time.

