Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795453911;
	b=P5Yeha7kKM2dnOoDoIo9bGzTJWGosF4mpasEKphyBfaX4TIglXvkPSQInG62FHD4gIq2
	 auo9vcLQNk6+eBd78HmewK6i14JI8tpJMgb9hQWK9lheNN3yS1l/2aZVEaUDiLaV1NnQM
	 AJeUl9+eKS5miMRWr9LwCB01tZoHaKeGAXy/wa/qI0kLeARheOk02qpaEkgYa4ZxsAght
	 1B7ipJ7uj4DsnLrOLdyWIy87nxhYbTiXhVnp3esBQqL9Fq8ohPvQ8BtPy70PT3c0VtBPS
	 ho+sk43GEm9CbeWZ+2hGns8uUGTglJ2VWaorGu1XKPKesWnGWsynQQhbzFpBDDVkXgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=6zmRgo0gFPagKYr2g+7G2GW6y5yAil61y9s8jKpkWdI=;
	b=0oVmH0jn4UX40J0IpQ9bHXfUpUh/6lvt7JM0ftaOMEFhbiFXnJ4S4z9DsSlzLi2GxQjG
	 T70NVtGwv0r46nVFM6iVMLjiswtEe2Oft0sBfnQw0sl14YZ8n84yEY87arqvp/zJcecrt
	 Z7cfe9IsRmBH2F1O+wQ6didTitvqT5LLBEUavxIRZLeemBCy5YUSSretkRD97n/ZdFwci
	 GOpOXObQT6lNzRoEk4SV63Kq9u4LuPOQeWb66C8YQ51GIdpkhzQIM4lkF83qfvwyatadl
	 aA8cEpl4uztURp5E8leWcEnqwGDcsc2Wm6lyXcpwXrn/KdV6KdMH3W3NbP8DT03Z/XQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=cG0siZSF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07D0606A31E
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 17:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C07D0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=cG0siZSF
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4395d31228so577947466b.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 09:11:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795453909; cv=none;
        d=google.com; s=arc-20260327;
        b=Tu4HryCmTX4hDFzeUrMcFUhSHB5XMbdSXFx4/FAux3rVRbGfzQauPEpaUjrPXaG/jT
         FKp0h943zsgBgI2ueDSwQFJkR7Mj7Mqy6vXfelowDijGLsJvM6zDqhd+La5ilqUfpn5Q
         SuYYFfyUf4UrrgpLNTWKZ426CaBQ2zSmXFpukW0sRcsEgAwd2NBQFpeoEdPLKRa+UmyJ
         SlBE/X3w7SkCeMYa4rePp8t8YBG31Yfb4xzc43t7ggoK0pzXGVK5vMaKMLc49VDmfXXh
         oItTk+Hge1wioKLhGaHkSbecTnQm8gL99u7EaU9Zcs/92Ace7GKeCes4XxjLioVWryUX
         5RBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6zmRgo0gFPagKYr2g+7G2GW6y5yAil61y9s8jKpkWdI=;
        fh=XVgT3D0Vb63ibM7LIDRxew2PpEOLTWbdaeen9RTwit0=;
        b=nCYTb4nXKlEodJiOHPS9B5MnFsB/JC7sBTnSNMKQA3kFEKfsvm3fUdY1NGgyN+QPQY
         KXlySgcj2mVYEI51VoQhTbY9szdMx4DoOtkbNa/UPvUnvNeJFf7sGbfUhnEZpJe1FHkZ
         DbC3g13I/f8jdj+RxO4VxVNPSBpjb/DDJn27miPBuKN4G2pjIwOtxgfi+jV+e2Z9Oaik
         16qtfxdc71FpDsmAO1z2EuRveKdBaRuMrFSlJy2Jp/XX3Iv3UM0i9ZSTPYCI50iRdmFX
         2ZwhNp9trAsUQ5Qku7wtrkRYVy/IXOg5ZOhpA5pBWHjPPvTv98qUhBvpYtoEaoiULGdk
         2TvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795453909; x=1796058709; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6zmRgo0gFPagKYr2g+7G2GW6y5yAil61y9s8jKpkWdI=;
        b=cG0siZSFYTpd4R6ZgQYJ8SXc+bG8ElcPj1nCBKcIlsZY4shb3awIkUOvQn5pkSc/b1
         lHPS1ExBDwp3M3cWTFoG7f0+Z5cx6Necf4BvTT5DlfzagAveWt3Tm6oSaG9VsQW8cltU
         GxbnXZvB4TRLielIYojVRurnjfGdsldtDi7GIsCla93CpWdxcqza94lGl6K2cioZt3Mv
         XIKvTFrwZUnX7pjtmu8DjwRXwK+reMjdG2Sxetn3ND3EaqRCfymK4LZGFl3s8TJ4Tzrr
         j0uxvZOoNSKTYXINbEvfcK3Xf5gco+Ed0Jx9vbG/998jlDxaPtjtPqcf5F/3IpAkttME
         Ksag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795453909; x=1796058709;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6zmRgo0gFPagKYr2g+7G2GW6y5yAil61y9s8jKpkWdI=;
        b=jan3MqjiCG6eP2+VwT+l8p+UIGFbaBlsIVk5uQkDowNNtkNiGj0W9jTiBouCqh9ZRu
         h8FDTIH9wFRu1fPNXG3JUdYLWSm581qQjJrzSZTOXHBrUMw26v7YiZpZlS01lKpfl/W8
         Kej1mqphqevMMxI2MHVuF28QqpgiqFHxU+oa1J9CXUXIx7QAEaerAAd2kbyuPaqkivZN
         Of8B0jEHgW3ul+QYtUvjwuSfjJyCGvTaQabYg08iu+SybNvAPrB5MALOo8TQxglkUDwm
         KxpxDoUDTP2yoRhJTXQNferrVmzWE5H/ZQ5frSMIRAWJbB2+b20aMlLVZb/MZRs9XfH3
         9D0w==
X-Forwarded-Encrypted: i=1; AL+hErHLOqmzwVK8HqxAihOXgeHVPYONWPZR+mdE9SB27Ac9HP94PbpPyOCv6GrIR/tbUqq+YBjkU2vTv7i70uSjowg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+b8qI0a3X+heSKlYkP9jvnxauQ4GMtabK9AiKBmkSw5hNbGLp9
	7G3zVP8EmKX+QvJO1j6UKdwUpFj1/4Fpbe76/Mpzc6+tfcCKI7YvH4aDs+0NGt08A7qSSj++J0n
	da3CLj74slWP+nK/RfdBZCbnzR9on/qpug24k87QBNg==
X-Gm-Gg: AZFdTZc5NiDbBXaPPhgpFzbkVQmW+3bdooKzmlPXZFE7zMQuuJinStYE9yWY9ZmVdTx
	UZbiT6ZLLy7r4kCwzxlNmEJ7Jq+iZ3+IRpfdm8Xzp4ELGPN5g42DUuesUZkG7qqnRBQjzfubcVs
	iFU3dfmTd4vl3TX7522gRlRK6tu07wachq0w8ovx8WiXR3eaSoeMm5ODzeCryWoM9WzhfcwmNoA
	+tQZ8RD6Ed/IwdNl9FSI1G489yC8Xq+Oy6hjZxNgzwCk2SKO/BSMcCqmjSMsp1uLqgx1BLTJouG
	RV+BCpjEJ/hSACF83FFn85oIu8MQIcxXxrWlYV7Bp1LuLHVrQ6l2Mb6ktQvGnSxZglInUn955ms
	wvGikfhIOVqmfDinVGaKBCGqEHPgQ2BP7+g==
X-Received: by 2002:a17:906:f10a:b0:c49:b8ec:a9e3 with SMTP id
 a640c23a62f3a-c513aad202amr871113566b.43.1795453909164; Mon, 23 Nov 2026
 09:11:49 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <awGr_tB3QXwnW1G2@kernel.org> <20261123165638.2161305-1-rmustafin@cloudlinux.com>
In-Reply-To: <20261123165638.2161305-1-rmustafin@cloudlinux.com>
From: Rustam Mustafin <rmustafin@cloudlinux.com>
Date: Tue, 24 Nov 2026 00:11:37 +0700
X-Gm-Features: Aa3M54qI_gigBtcVlB0bVVMCDfPwHMSLIUBI_RteTpbOu_KmpWlOErFZfJySAUQ
Message-ID: <CAG6=z5tCJNyaPbOBYRCskXTCGkbJ_Zteg9Y-N_FFdU6Ag5FxDA@mail.gmail.com>
Subject: Re: [PATCH v3] selftests: tpm2: test that io_uring reads ignore the
 file offset
To: Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Shuah Khan <shuah@kernel.org>, Jaewon Yang <yong010301@gmail.com>, 
	linux-integrity@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> +#!/bin/sh
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)

This should be GPL-2.0-only, as you asked on the RFC; I copied the line
from the neighbouring scripts. I can send a v4 with only that change, or
you can fix it up when applying, whichever you prefer.

Br,
Rustam
