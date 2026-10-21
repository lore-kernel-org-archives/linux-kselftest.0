Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792622339;
	b=ETUzsn25epMvk+5W+3fLSsrw/ht5U9gNImAAJq9MQPg4/mvA/fch/42vHkJkYaQztD7N
	 j3NWLXMQM0Znc9fxfWQWANtbhmXCvGXwMd3wzSAmdi8DC6lAXOlY8ElOViPCoyCAHTvFh
	 dYSJF9ek7IIoaDpmGZnW3d9lgrdzsJrgR6TlEdrxxaJ5T1zJIpcyYJ44Mnq3Fratz59fS
	 j+IwymSNnNfIiMaqi/6IGGoxmWxcmSBEH/0iKXZpJzdFAHCOUuNQN1uxq7MuB/4xi5ak2
	 eqvPeR4yz5euXNX8vc2TWUD2fqIXzy6X9qwlfyNV3J/joxglDpDOhy8l/Ty937lGiSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792622339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=SmC5QDaZtY/tUHrpKqljZ15wNyGf+4dy53b3mfaEpts=;
	b=QEL8TGuBeWPbQHvDyRr2S+ivVHdLHr4WD+Gy14xApMs5Xzn1SVwnD9iFtdEB3I6j7PuJ
	 BztBHCtFz+48W4TdtyqMH896Ie94uIdO6zIz8Q1vdbnC73KhY6EBvXzJqbKgc2etXK2zT
	 uYEwlLYaGu+50NPctrGnEwtAxlfi8qQUjwRXx1AKm7B2O245TlyCnpUXBDPcnVXPPa8Q2
	 LJfOzIO9hUEjkwFWflYZU6CrjFPs9gMYqTevlEUb3c9hiX0nNCCfoFGMR26nv0YhfT2Az
	 8pUiTdFffa4wwUWCfzUJRE3vFmEKILr2QWYlUwrflMpLhoe0CAWfpTCPnVLmBA4YNXA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=ipZhChH6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BE4606A319
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 22:38:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7BE4606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=ipZhChH6
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8ac8a2ac52bso4055947b3.0
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 15:38:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792622338; cv=none;
        d=google.com; s=arc-20260327;
        b=QiKp+KgD016F7vZm5cCUW06nNbpKC5mkGc07qVXhiWZ18hT+JvJzmD6iGWjIdDRs61
         wo15OVwAUIwHOhOrFs4uV9xm/n/haNT/rfuemXzkU3kKYxsWCbY2yZw5I8HkqoDYtXir
         zfcg0lMxHsZ6MbMwjzRLsPU+9a6NNpBhLLVzeLrn03nSP3xdusv1wyC/0hQ4WL4NLj9o
         ba5Ci2SsueB72cTvXU+9EwecrXY79Q+HTK36olGm+jnhMBRwO0+nm7pdirDCUy6LeNjY
         aBDJ84G04eEdnWSVP7C8qtRlXAbFWnn1p7ZwLoG/gG27io9O9h9CI2W6XzOdYkXujQOl
         xDww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SmC5QDaZtY/tUHrpKqljZ15wNyGf+4dy53b3mfaEpts=;
        fh=I1PlodaT2HH6HrBwX19PLwFcTHM4WUEnWJGcMDX0epY=;
        b=ExzPRh3+E9LC/C7VQ1l3ZmWTQXfQq2YDDi/IUfGtZDFvpkDuFUKb7CjgxK3c2P5UMs
         We8/d1d/xYgZXTzrrQp61KPQ3hVNSLoJ1uZ2DwauFgX000ofWDtR9uAFNtg4DfWFfolO
         rXyshNzQtYwF6z/r+DJd2Z+QY1LCCZuafKXDKJ+AoyRgq8NpPSWYxHyeUy/GObCv2Du9
         VZMf0ERGs9HBYR2EvTbPsydwmLjNl2NqxXmpKp+tZ1+evWQaVpR/oH6RQpmwwy9cIE7i
         FNc1r1bW+ll299EzFknoOgqGAPlwtEm39cAzXWTlfHDj/yb/GNcuVFGxemXp7S2RGHzw
         ss4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792622338; x=1793227138; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmC5QDaZtY/tUHrpKqljZ15wNyGf+4dy53b3mfaEpts=;
        b=ipZhChH63S3JydgLIQpA2i/1Q+0ZwZU9Kk8gbIBur/B7FjOkuH++WKK5WXDnZJhdhB
         dZH7Kn9WD7hxV6WFIlwjPzhw2vlptHIn0nwyVrTf+EzK4a79NRbmc7yTPUPZPdxQkufV
         mryx3cKnr2UnkfFCrfDm5Hgkp6Dz1oBrmUTnuVw5yfzopboKEr8cxdBn4o3YIs+UNOwV
         Hd0V9MjwMZ2j3fEmTwzQG/a0B6qudXcNmnnrHEuTNBXMdI5XkR5Ytl/nmPbhNi24j31Z
         v9mbeHEfwePAzfphL32krwpVyk2P9vwxCKTUWhsJGnD0llOAXPz92ok3uJ3ShxfYlofZ
         WocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792622338; x=1793227138;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SmC5QDaZtY/tUHrpKqljZ15wNyGf+4dy53b3mfaEpts=;
        b=DccM/QklGfkJsNihXwakb0nTPhfFuAVg2JHeC+TgR4/p1tprZm03cQ2CqCpUGS7pPS
         YdDsoHwWwdxUXWFRLzDDJJV4G1N1lfVqCxFW66DmI02g2PkfBG4JDHcNrgKqMkaWp4hJ
         oDV8Lg4KigHm9pnXnJbV0m1crOupjIWZYFcgW6uXlmLL2bMfEaoR77VUbndJHb5tqD2J
         TEXxjcSw9bPRF870AdfpAeOGIv89m3N/1y6PEKV4gEQDBBIk7yx3ZM8s3/o+mslI/CGi
         0Uh9fT5O9rcbOqPINX0vB2WpqiC4yT8UCkCq3MG0GbbJUJ6YX6JHVDfmGCdJZUZKarLh
         OMgw==
X-Forwarded-Encrypted: i=1; AKwUvBzh/JUsopq/ihxonH/A+tGoqtyP0UjinBJQr92tESYsb540TzqRdMluSI+ao34JNZrfNz+L0iNj6TI9yoRmsCc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNmBV/pxvTnSSb6B7ctYa6roJuYEsOdGDsKephx5yIwTsdy97w
	uMM2XYJyCnRfyYM4NCrifs+C6VHSQKUCjo1wEKYTr71exnFDUc12GUHdGDeNFSIfa/uHmVkzW3i
	jJD+A+tEEXm9yQvaywELL2T+UgTyKUVy0gQCrft3+
X-Gm-Gg: AYBFou3KddvSTr2BxLA2xcDdGzf3OjqgD/QwMx8oZTxgKAaBQ/0+LB9bwbYdlyKQGT8
	1GgaTMC3/bST9Z8XyzBzHHhssVymj7clq8g5EgbhsVKYyvys8qyXmgZBqc7fT31S2iHZBAe32zb
	b8nkdH7amlK46Uv+P6wPc7zGlx4Jzifm3+ATmTxxAY68EKKHsBSTrjb8/kIgm5KLBSravl3Rkn8
	b5QPHG9DAK1KpbY77/bzC9No2KQAbdlwx0Auq4M2ZnZ8dWLReSUQ19GLstLBxeKfvw4FvnbRKr6
	Y8aorGdRMI2lHaVJ3/TsLJZV+N68axgvigJ37q6Z+VcObtVKetNwsyWHpy5EYRYsQDGTNaySiBf
	ROIavzeBDdm5M4NTMmkayH+xD4NFkl8YkLB1NLg7xOcmoQN3DX7lijCCtk18tI/mz4Y0QXR7yPk
	/jZve3Ibg4rrBU5jl/Fdn2lASxAd8q/J1jpyA56dj4iDomiOu0Voox4Xw6QQligVRV2pfsxLi58
	KRlFPgjHjDrfCnzw4XIwpY+zMefFotiCcvLYYmQ9yRbV75B5mCbnX3uzb1isUBV3s9XExRfTlnG
	Po2r06ROEhVykkqxbjsJVMfb7axcY6MPV1FOkWGmqeIodGHsL4LEvrUnuajIymnxkYneOR4=
X-Received: by 2002:a05:690c:dd6:b0:89c:41f9:b8bd with SMTP id
 00721157ae682-8b145717273mr4834527b3.20.1792622337820; Wed, 21 Oct 2026
 15:38:57 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261004171628.3544978-1-julius@bairaktaris.de>
 <20261004171628.3544978-2-julius@bairaktaris.de> <atQii0cO-HJb5TQ7@chamomile>
In-Reply-To: <atQii0cO-HJb5TQ7@chamomile>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Wed, 21 Oct 2026 22:38:21 +0000
X-Gm-Features: AclHuK9eNtJ1Y6ncuQtLuxl6DPZP2RAM-Lbg7K0P7AME9akQS7QgqY9EuzG32NA
Message-ID: <CAC1t37L_0ayne1Hj5Eg6xkfgWvu3uVU-sw7rdjgs7J4Ov=v1EQ@mail.gmail.com>
Subject: Re: [PATCH nf-next v2 1/4] netfilter: conntrack: pick up a TCP flow
 whose SYN was never answered
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter-devel@vger.kernel.org, kadlec@netfilter.org, fw@strlen.de, 
	coreteam@netfilter.org, netdev@vger.kernel.org, geldot@protonmail.com, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The series was written to offload LAN to LAN with the default send_redirects=1.
With two subnets on one link this doesnt work currently.

Would something like what act_ct does for UDP be acceptable? The ruleset
opts a connection out of TCP tracking, and the flowtable offloads it
in the one direction it sees.

Or is this all too "hacky" and should be dropped?

Julius
