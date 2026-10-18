Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6DD347C6
	for <linux-kselftest@vger.kernel.org>; Sun, 18 Oct 2026 01:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792288482; cv=none; b=uctQHxM1XX2RQ0FdqU4iKMIHOebjnmddGYKavN2RqlH0n7SBWUezSEpOChB7cqJzaXGBOBHdYBabQlplYPtAuFD/4rC0vLDaMVNjVUweOqDbGcpjlYLyXs1RTrFmT4BXahHB/5uvg3+i/9Xxv3SRKqIAWsy+bNJFoF0Mun2AXeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792288482; c=relaxed/simple;
	bh=ESeD/ZAXmJY59zUgjORmhYeio5Kr8jPgw7HiOlqo0ck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=seo+6SgKdq07c7k4lMLH9qkdMeFAesBeLcWFfnUVCBf67NxU9K1pPu8meHQ5h5VALfPEzsK3LHJi3v4HANMbGjY0o0DLxGjQIl6Yf0O9FbxFsDecYl8yAxp4okp3bBtq8ausdq5OLb+PoeY7FyTtifJVDBI6p2AnzlONGvVn6A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=oYD8KUe6; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="oYD8KUe6"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1cc392d8bso1121367a12.1
        for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 18:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792288478; x=1792893278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ng0CE/gjPTE+OIlSfddS/+J7PTYfSFF20bemZKRWDt4=;
        b=oYD8KUe6KJDoXciAtxuF/6+4gh+2ihWLWkPCqNHeBC0g38HGRiWAp3veyWmM+0k1aA
         e7Dqrg+3Nl4QkrxKUO8UxpC8W6soE9RBKhiiLhkPM4GNfJ+1HL4MEJ41LcdE7htHlBKp
         rktxdzaA1KxUQIAvhlL8POMB+VmeYe1xmz8nfXOZlK+l3IZ72Hn+FnHKG07rTn492k9E
         GI85GZNpfGVQ+wvxkk3R2zvQFxVOAPV2YrgZ8aTHapDIcs/ziNzzKVWlXnxX5jFfz+G/
         ltVo2QAJ+ZWzAnSQB0cnZk0JQrvHfuwcZ/k2j6d44VieDtd31Imp4wsJastg7gCgHpq8
         CZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792288478; x=1792893278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ng0CE/gjPTE+OIlSfddS/+J7PTYfSFF20bemZKRWDt4=;
        b=rVFGvUKNn4Kzp2ChlwulFbN3tAtkImROWcJSMB/3OgQHEwDsgjMx+z7AeJ9GwwrtTg
         W4luGakssC83Hyf+O7clbqHwt5YMS2yi+E4cs5egrn7GgZiFwzj43aB1c+urEghOxDob
         txrePmcWjkGxYM9P1gjSJIXcsXCEHjqMol+4G71dmjWwZ0AN1xAQlTKovzDGAox2PtWO
         iOv4VTlY9LaYQ53KLnKtaqdDh42xChtasnZA1qG5P7QFDLM4B2c7iCUwnrKXPQnwXIJx
         L/0QlZMxOzD0BxXiWRx/qTKeyzjIiXwkUVx6CIrXjHVMDwAO7EIqs0LnL87Qif4I7eOm
         JNNA==
X-Forwarded-Encrypted: i=1; AKwUvBytD2noYR+cjVXWXULkvnOvkBNO4uPPPEhE2NlIemBMccbcUodDc1tFR0QN7IhNzu1mRY4zmpzw0hA5o+7jzE0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5GuvWHjb1hv8ekoGX52b5zgXIaD9scvcR0I1o5+Zoy26RUYp7
	/TFd2Ve0IIC8tBr1J3sGGOCRWK1DT2L9QtNW1ZJDaw4BjwsxNcRfRg9Dgr1Ng0TEYQ==
X-Gm-Gg: AYBFou1qhdmdCek7MuEFwciDe7prQjCq2QxclPn8nAORNDF9tk5nacQ4+gE9Ff3pzDb
	E53UuwYZtpv74r+SQ1hxn5wRI4IKUa1YL+UqgDSFSe447r608GGISTj0a4udvaYqwadAwPzMTnd
	u+4IFzcIXNQBYoSXYqz7k+pnbtxIETKARzPohHSSyJQ/Hh7e0cZHSOosWWQiKWAye+I2sR7jYYX
	aoOAAcVLtc9U8rJ16LC0J7IokUa8HHJA2zPKFJ1CpBT5ZbyDJ2kqWrlDk1B+in50G+oFXztm/pA
	rVaHufq6XhkLaWT5/MpcV68kJoPrk3VQZYGx3C5QQ/joiVL3rlMjutFoGWjTMEtGoIYB38/qjSd
	nqQ/gzcbXIhJ6K4u7jM4k5iwGgtT4TdZYmjH9Alsh/7gi1qKewVDdMw/ilosQb+YTQOuAYMth91
	ymm+h4q5RHHDuhZSNzPrUcLT2/A5zh59Hms8i0yMN4nZ3S5h04ctNTTrNBRRcqPlqqsaiWSA3cx
	Ha+6W9n1CvUNDrRruCF1DPob9AdxEdbFhGm+m2CsNvVSdAwVBeMYAtd8uIA/n4IPGq+dc5gajnh
	PXsLeva0eqalEMtLaevyak6IqWtMWcTn+S8uo+CqXnn8dQ3BEN5HUcKIm/HHpuPM0Nby6Bt6H1a
	AMcXnXEBVPuJt5r6+DW6hN9OCjS5S1A6S3IL40q9ssZR3onhS/RPARA9TNoiTi304RyH/w55/Ie
	uTNxNP8cuOA+cT5DwyyQeHbvX6aSS3Epn5dRrTFaEtWy3wcbn8+nGN6MobaEJoKwfuYbcii+goo
	Lv3XdIc
X-Received: by 2002:a05:6402:2350:b0:6b1:d8fe:52c0 with SMTP id 4fb4d7f45d1cf-6b3a81c05a3mr2284727a12.33.1792288478126;
        Sat, 17 Oct 2026 18:54:38 -0700 (PDT)
Received: from Desktop.fritz.box (p200300f247424f103187cc9af620d661.dip0.t-ipconnect.de. [2003:f2:4742:4f10:3187:cc9a:f620:d661])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1c7ff2sm2390429a12.19.2026.10.17.18.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 18:54:37 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: pablo@netfilter.org
Cc: netfilter-devel@vger.kernel.org,
	kadlec@netfilter.org,
	fw@strlen.de,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	geldot@protonmail.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH nf-next v2 0/4] netfilter: offload a TCP flow whose reply is never seen
Date: Sun, 18 Oct 2026 03:54:34 +0200
Message-ID: <20261018015434.3326758-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004171628.3544978-1-julius@bairaktaris.de>
References: <20261004171628.3544978-1-julius@bairaktaris.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Oct 18, 2026 at 03:42:58AM +0200, Pablo Neira Ayuso wrote:
> This series are a no-go in this approach.

Understood, I drop it.

> Please, given we are discussing one series of you quite recently...
> let's handle one thing at a time.

Agreed, the fdb series first.

Some context on why there are so many: they all come from the OpenWrt
PR that adds flowtable offload for the Qualcomm IPQ807x PPE:

  https://github.com/openwrt/openwrt/pull/24806

That PR carries the kernel changes it needs as patches. I am sending
them upstream so that OpenWrt can carry backports instead of local
patches.

I know the rule that there must be an in-tree user. The PPE driver is
not upstream, so I only send changes that stand on their own: fixes to
the software path, or features that existing drivers like airoha and
mtk use.

Julius
