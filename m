Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16424EBAEB
	for <linux-kselftest@vger.kernel.org>; Wed, 16 Sep 2026 11:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789558829; cv=pass; b=GyUR6EdkSjjFExp+p48TOmdxxtOOKldGVe5X4LI3WaoiKpg3kZyK6zuPzfeTJQrTKehHxVdKWl0MZm0c10WtDpPEknS0zw/gNfwp8P+PimeepQUkCVOcOuA4SBIkvr09E97ZbrImXCP+EYt8FGBoZWUxnzL1zm1DYpdQGg4BNqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789558829; c=relaxed/simple;
	bh=wMEyFjezcohw5i9hNyj9Q/Ko0db3fpn41JnBHJR+aJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jl8kZyGLknRUs8tw3PqfXBuscvmBjbbVC6K1jTua9yOzjrnzNHiJC7zRBRr+PE9vSiJoTWQYik6cIzOuCTwsjeBDtXiDj7jyAOW31PvWZfeWoFwfdtDOdJpjrhkeQQ5vcRClELPhFdrcFZSxiTi35j75FOwUU1+56KEm1zlYMIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ow5z78uR; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ow5z78uR"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a302c23fb2so6526261fa.2
        for <linux-kselftest@vger.kernel.org>; Wed, 16 Sep 2026 04:40:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789558822; cv=none;
        d=google.com; s=arc-20260327;
        b=XbKpB6zyz5CNVQeZpSYrsI+x+NIqB/xN8AA8a6XZaunuW4z1VE3ArPz2Ww5tisoSDW
         3z4pJ/6VATTdnLSeynzJUBG4BH3VTmY3RjTEElL8iUeTPgvk35t9XcDyHpBlYsNVSnry
         iDrm2WuUHVVE1PCbvVQ85rTJqQdLjIZ2ANhReJ8i7WJw8/2Omr/0uGHWCkqCKR6pWmAp
         syGpzjOOHT+y8XValFKTYRI8g8WOhWeRn2DAnFSUhL6FJDWtNgbe46DqmLWOOCA3PSsy
         SYG+jZXwbfs9XRzPbAxfudBXAEkJRhAmTttPOHnC7wchuOKtky7tbDGrYKeCKAmJW+WO
         KsiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wMEyFjezcohw5i9hNyj9Q/Ko0db3fpn41JnBHJR+aJY=;
        fh=jHBnR6VA0GlZIKsLjnSd2GaA+J8iM366dGYSZWfLfcg=;
        b=W0WANMI7NtfpxbQ0ZNc+lajNG89Bu5FS2WuM44SpUfBnd8wmhAqAsUst42ZoV9HIdD
         2HoqDgsNsdSPeaVQr5QsGATU0cfa0ZeFPrDcV17lroda+HhHI5u8vfFfhqEXqnYw3EM6
         /XKngM/BEIaUorUcclan3M4QoRy7htMNS1eC3CupjFZxWrhwaqb7bL05FPXz6ECLBp6f
         AjdxkNHc2HFQGQIu285B5Ws6bHdzyHuR8V4eqh7RWE+/bJ+Ia1GYKN9nyfMynlR91nsE
         t6bjG9liqnp2VmrYVjrXE9v00D+SgOoIPQU+/ve1I4esDaMS5h8qdhZslGR/9R0BZY8E
         ZkMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789558822; x=1790163622; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wMEyFjezcohw5i9hNyj9Q/Ko0db3fpn41JnBHJR+aJY=;
        b=ow5z78uRRsvrCxH5IvYoWD9Zt1t8AOjL71wdPNC5jb7P07zrWHOrFpJL7wRFhSf4P8
         rjqRl+wDUM6C3VqblXQYuNYsc1aPcVSuQNPqAgkl2ruR16V5joH+QMSNRQPOvNYGelaP
         +3s68aUq+uY21ligjRtaSaTDMUhzMo91CravB7nh3gtgIr0F4ATmnboA/I16sxzfsedF
         VTHwY73GPIpUYntoLMv0eVc5SqZnTMcrg/2qzJi9rfn0s1bHasJWZqKlPK6/ImPiyWPW
         lbEKqYK1nqZY9DoN6o0simfbillNyLPmURsSFcdmOwvlA2oWjF2YyXtL/nck1fRfD6ZV
         T85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789558822; x=1790163622;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wMEyFjezcohw5i9hNyj9Q/Ko0db3fpn41JnBHJR+aJY=;
        b=1gPVQ24Fy8DfGiceyLAr8Wea6Zi69L52fn8EK5E4zb6dRM5akJ/YYh3xB+Oy7cOmQ0
         XRB1KQrS6MrkjBab2NwkygzD9DIAlQKMjK3+SU00EX2QLFfTDvW2uEJirpbYlcRDWtbr
         hqzuuI2FX0LDfYByvwoCP0UzJhK9DIe7osMHwR51tajWPCZ9TAnaPTWuMEnggb8j5/Lx
         PCYx9iunrT3Tc+iDpqWL2t8kRr/Yn6QFTAG8/LDcVbbOhqvkjUvTJlYonG1Uemhny8wC
         +31SUWK8nPhslaPMGDv+KMzTxsSFZrntkT6DgNzG0O/KQWljrJQxgx4gl8yWZ31u6UFI
         qc0Q==
X-Forwarded-Encrypted: i=1; AKwUvBw/w6gOxBdH21p/UoD9SG5Isrb4Vojzps83iB3+pwtmYY/9PrGOi31I2N6+Zy1a+F/ZLh6VTjDDUROLO9Z+Wts=@vger.kernel.org
X-Gm-Message-State: AFuF++mAqpoFw/r61oWPetXZAod6cHC5Hxhk8VmSdh5HCbp37cnD+CqX
	DMiUw2AOAhOUuifK2VA8h1WsEtU9EQzFr4YZ6hBNJ1zGqZ0TJaGogiJQu+mgVrd4X9NfGz14Kny
	raW1bPZ+3yZpa9Nuu8YwnJCq42Tk7KDc=
X-Gm-Gg: AYBFou0NQJ05GHCWsb5AjhiTktbrDF+70HI+cE55gwPPjq0jV1N4iFa4Jgal62SukIX
	H62iQeuIrPH+nR/lY6Hp07Kk702Gyl2MlujkUnwg42YtE9RJ3UF3WvwwnjDJnFMxDxnhRfQ/PN1
	br9khx1OLfXsodBpHIGnYQ69gN2yOjI0FO6WTWEXWmz21+H8Lqx/+iLpWPJVsti2lEoLnleBy7G
	Kg0hmW2cKgHqpL27H7YeA+yQoMbReFnfVyxI7setspmH/sQvx/R/SdSoZ0f2G2IgiVVpYYGC65F
	1fjT6MdyVyVayulCFIYoSLT8MhMxI2Jvo8TIBrVW15xrBjtdGfjiv2be39/m4LvgOHFSjN+JXYN
	vpdcoz7T/nuYYjgLQX3rV7KrLGVvgsB0rBIFWH4JX9jgK
X-Received: by 2002:a2e:be86:0:b0:3a1:aab7:9bdf with SMTP id
 38308e7fff4ca-3a5dc9a7b2bmr4436121fa.5.1789558821474; Wed, 16 Sep 2026
 04:40:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914014539.5015-5-sigefriedhyy@gmail.com> <178949085358.22033.18209492388519439190@kernel.org>
In-Reply-To: <178949085358.22033.18209492388519439190@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Wed, 16 Sep 2026 20:40:12 +0900
X-Gm-Features: AcwNN1VmVXqC79iWucgVPrvrF5zMHqjVFQWTwIUaoH9hzNGmR7oOxMrBe8K1ybU
Message-ID: <CA+7S2vL7qS_0w_1x=vh+=XQKwnBMyN77wmDNmHDFUEf3qhyAUw@mail.gmail.com>
Subject: Re: [PATCH net-next v5 4/4] selftests: net: test AF_PACKET multicast dumps
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, dsahern@kernel.org, 
	donald.hunter@gmail.com, edumazet@google.com, idosch@nvidia.com, 
	jacob.e.keller@intel.com, kuba@kernel.org, kuniyu@google.com, 
	nicolas.dichtel@6wind.com, nickgarlis@gmail.com, pabeni@redhat.com, 
	sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, sdf.kernel@gmail.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Can this final assertion actually distinguish a dump of the peer netns from
> a dump of the socket's own netns?

> Should the doc mention that ifa_prefixlen, ifa_flags and ifa_scope must
> be zero for AF_PACKET

I checked all the Sashiko comments on this patchset. The two above are
real, but they look like nits and are not worth a v6 on their own.

I will fix them in v6 if a v6 is needed for other reasons.

Thanks,
Yuyang
