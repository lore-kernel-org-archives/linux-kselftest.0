Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795702129;
	b=uBnYiqNjeClBLi2tuhLTI4tAVRUrizE374KNEHyvN+AtF7heueCTchhK+JRIM3tAVeZM
	 CFEqbEDJiUVg+q58bsQR/O8zBNwAZWCa3J+2EmWAp2bvbupDEdIYjF/21X09WxlGZQwSJ
	 SlKIlFxhzhWqFRHqq8w9fqnAwIob5HRrI8YlF8LwAHNoL55QezDye/ZVGNGtY/QHB+l1u
	 mj4pm4ut37SHDn54pmjmSbfbkEqarSFAH3/a9K2bJ8ixne9G8Q1JtNnGQHMxe0btGo25T
	 KwPIg3vQ4QOK3DezjXkADFKMAAV9D85CIdsojFh6eYOHqOzTtHXqLF2Q5R4ANB5WH2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=fWXq+2jy46Gh3ZV0MvhLA/7rLTtY2IZQAf+aCrKyZOo=;
	b=RwIV73vA6RkjCL+BWxcQm5h35SNDLCM0VYnpxSjTAO8cflwbBr575Ytqy4l7/8xcI4ld
	 juwWLPbsKzmwJMrAORBNoEGl+nW2fJwrbmCanoLUDFErEfBz1UNJ1uaLGjuD/zxnD94fm
	 nY4tQq3ANfALBi88rpy2Is6qcfg9pmg6gklNYciz3tJc7t43M1sKrK+m3e9gPFHUobx+R
	 /9bBOaRXMAo4o0TQ45K/47HD+UKHCqcYZ1CFIqVCZN3pn22pjckrrTiE/fNL2nqGNrMVg
	 bBJcXHOpSbET+Knf6Brn/BN6ZGTUO1qHmXVg0ELoT7X59o4NVsUPU/y6s4WmmEWjv0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB653606A31E
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 14:08:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB653606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4d581da0aaso976242966b.2
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 06:08:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795702117; cv=none;
        d=google.com; s=arc-20260327;
        b=G33A00GNaOb1334iRUKq93ayZEVp2nmaxdKJOhdvHAyBx1GgpV1yQDWEoS7I3VXaqd
         bZkbitNy8AEeBGh3cpQfyw36mX5tA4/27y2J7spT4DM8HBUY70yzpizYq9oUhWicH0aD
         etROvN3U3EEhbm5jdWpxuNMY6x838jv7+PoWv9PM/VLgMuyUbYtHqqnaz/2akKSdBLX0
         M6yI4yklgu6W9m1ohSaOxuF6/vQgqZUeosTzkqqFSAW4pv7B2phJ4ltLuBO3dyiBS9ga
         /UUxMCesAp8zfBBeGeiiapuaBuklhnpGcnTorDrQLTL9rzQ6t2YV2QdtkJ0O40vSL78w
         5SOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fWXq+2jy46Gh3ZV0MvhLA/7rLTtY2IZQAf+aCrKyZOo=;
        fh=MH8pMz/1S9Va8isPmKx7CB37pSSanzDXNqURLeJAt1k=;
        b=VTQ8ect629FN1K0v0rfKzQJlT8XClBwHY0kHwX9YntSdUl3LMSslMAz4BQeG3aq8X5
         t5ktw1dVeG4iArM2EaVepy1q88MppwSTKaA917FdigyobAF6Iacw9NH+3KDJuv1H6fZq
         66nJEyr18mAfHXJ9/9AwyFAAZGkgMOXQAOAA36y/f0jPP8YUH9SNwQx/8paP6eF75DSV
         Ap2Yq9E/FRUbLGyk397YSCSBBIrUI2/nMtYQ6URuRkMn8/kbWvTGPXiT5HwE665RE2o+
         LFwN9qfgqAeYJM3RtQlDjKKONS2+OqP/co6WlzI7/l+q19VzWgPAOy0L8eNzT0mwRiPu
         1mkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795702117; x=1796306917; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fWXq+2jy46Gh3ZV0MvhLA/7rLTtY2IZQAf+aCrKyZOo=;
        b=HR8ahns3qwuAhoW0hw9HTmgsr0BAAW0rNNJQsSEr+jLXiCNzUBG4/kyaapy4P2cbxJ
         VrDfk1DVPaJuxlzqMTLYlB26btFGHFZR4GRcVPQu++pKTCZyG0lTG6ICUyz6G9POsRDR
         toQJ1aszLe6o70KQaksYZ9qnsxKbUOu15LVA6bkfsSY4U28i8HPS+aAcYnmPk4uDl8Gj
         8oDhGuV7HAY9mhG+TXno2m54MtIjOnGZtrjFdA1+VAN/i6rr8ANK72Tuo9UcYg7F6jd3
         NBIAlWRey6LPB9Pfk82xyJawMysA2JSGMO4bAgSd91FS/2clRduTDEY9Q68+g8paeIJ8
         2c0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702117; x=1796306917;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fWXq+2jy46Gh3ZV0MvhLA/7rLTtY2IZQAf+aCrKyZOo=;
        b=GSs0WogTVXNPYLKR6SA66KopzD9l1MliYSZPl5QlbQk8To32o/koF8woyWsyHHOk8q
         jKO8le4ENdYmjfl0/flG9qDZmlIAvAgSHXok6zKPhZ3ZoetSDthOcWrqgpswPRPXFkRJ
         +9bgHVfZ1bjjqGsDXiNmmjspfPJhS1n/yVP7tSf8CL13MGtuKEonEcWp7II2wdtA+6lY
         4kNxTpO5RFNCMvWTseEazlHMsTR1fkzK94+ATU5hTRS9TGOOwonnXg4yhCYyFapuRBQ9
         459Oiov7P5sUkDE83tVO+Y3DPdEHk1CwzlHbCl89ie7PMV8HR2Ax6QO5gGAIIRpv83xQ
         ZJfw==
X-Forwarded-Encrypted: i=1; AL+hErGpxPHSxVe1UXwJXOU+hkaStSnUKVHeOKDP5iqEQY2J35ZogMTWuM1OmrDEPDd/+CJn4TVkTtclwokEG7wkn74=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ett1lBWovTivCSuxCB6BPEB0QahwhqzIvPyn6aVX6kl50GEWc
	K3sM5QfxkCaoTwXmWuq75qINtj3MquQQb+XvxkuEvXH/a5DAT3RQdggtDiofb7rHeMMcCLhCw+2
	vps7lfqOLJ9FvtthWi40tMoXo0iG3exkuQdW9gn/Khw==
X-Gm-Gg: AZFdTZedQ++y5fq5+6UJYIj8IIi1yUcXDkEfsSML6v/U/TSnCAXrATJtgcrj3UZsyPr
	oBtqY730IpvLTKhvBkfaHq5jZjrajD1Oc+6qNZ2rSjpNtXLqyf3XTACEd/mPdbXeztOBQjuQiqc
	wrTSSOkQvKa31DMkUy0SUf/NMadD23sVN8Td+g4VbQDEs+5AZ3YZX8Tmn8LY++ptPWvTEGjd4di
	xd/ZBFlSFyDv1il+XyYCGLtVLU6Fj6e5kFzSckWArAaMVSpuqCQNyRMTULhMtAIiKMJAAviEznH
	rx0aVzYxb6QBVOTOJ6T9xC+eyQtO/0lQ8/Ole4tDw467XlgiVFCe7oIy0W3KjwKGS7Xyt4CD8MY
	VqpiM0+wH4mBfHqaB3l5dc3B1dCRFyhbJ9w==
X-Received: by 2002:a17:907:1b1a:b0:c42:102f:15e8 with SMTP id
 a640c23a62f3a-c513a999e27mr1682615766b.14.1795702117183; Thu, 26 Nov 2026
 06:08:37 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <awXHzblUfp05jZSQ@kernel.org> <20261125065429.1483868-1-rmustafin@cloudlinux.com>
 <awcT0WnnJ-fyovnn@kernel.org> <awcW90qZvOim7dbh@kernel.org> <awcYZNG9f2YSIz49@kernel.org>
In-Reply-To: <awcYZNG9f2YSIz49@kernel.org>
From: Rustam Mustafin <rmustafin@cloudlinux.com>
Date: Thu, 26 Nov 2026 21:08:27 +0700
X-Gm-Features: Aa3M54pYCLcfNb7xtzLqr27MYGtUyFN9A6DJLgyYcVB1PLXNJ0HDOIerUcb9Tb8
Message-ID: <CAG6=z5sThdfZLY3mQ+NdzpFYj7bSN-CsV1bEdKCASw7b_b2g-A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] tpm: Do not allow io_uring for /dev/tpm0 and /dev/tpmrm0
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, Shuah Khan <shuah@kernel.org>, 
	Jaewon Yang <yong010301@gmail.com>, linux-integrity@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 26, 2026 at 12:18 AM Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
> I got them applied with git am. It's better to use separate threads per
> patch set version.
>
> They are in  my master branch now.

Great, thank you! Will do separate threads. Thanks for your guidance
along the way.

Br,
Rustam
