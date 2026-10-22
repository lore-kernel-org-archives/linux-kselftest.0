Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792656964;
	b=QrUH5YA+IhH0Uzw8PMd+G/EFxskha6Apd1RXp2DfNyhk/9PA/gy/6pGcIDybHHz2Jyub
	 M0TmotZZFd0NAcAxr1jsmZNo3GgvSMzu28ynuLFBiQTGMAn0e2KDUggb1Ql8pgIJU79ko
	 a9IfP+2qHXZJNXf/2BYwZsBOeuiEbOn2J+q9WuHxig8U6noNz8vn3YhG0kj2QvxCziwnk
	 uk5bNK7/QvgC2QNXzVkv1or57y9hOO4O0rgdZ4AF9RKpV0GSyFhNNrO4IQ+LrC3LzAlPZ
	 e94zJ+fF/hFi8zd9uJzxIhTTe0N5tZK5XEIowzJfFToFNo/niMz0kFl8oaWdrrRfivA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=OJBOjlmu+tury2E+zoV82SCM4AoLHSymcLyi7zzP7i0=;
	b=FJsOocMF5LFBxcp4SyGtdfjLonT8uih5f7c15h3KKpltq/LaHmJ8ZeYzvkuj4etz3hQQ
	 28GFRQluBRZPGrAwvuQnka+vk9xiEt/Pn2NQf7EO8Cqccy0zh95SXoFWuANsxtJoSmHnX
	 G25PXKYZKcq7D2+By2CihiCP3huXEMPlGHyzrAH38+809BTPWITxp296MBo6e9ogtn0yh
	 041vVRUgV2pUNvvif4AkjZc++h6EoKZmmHpFwZyZofb8Fy+wwVRAW4HfyWz8X8Ggjd7GQ
	 km/++BWte2/Npvf1aJ5sjf0jm+2tx5PQiZGxIQF9cNjJp+p64KeI15homwzD0Z2yWTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mpj53jGl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527FF606A319
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 08:16:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 527FF606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mpj53jGl
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91ba702cceaso19821746d6.0
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 01:16:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792656963; cv=none;
        d=google.com; s=arc-20260327;
        b=JGyNjTaUenriWlKzJMTaGqzCiZ2ZMiraKTwuN5g/UQgZsoygBigrXF6DUq0wF11sCQ
         8EtlSZab29Jjpnyw5E6Bje3QBgc1o4toagxFD1fBPAqEPg4mfq1iKT+i9bmcanvoHo4s
         t0vQk4NOz4Sm/nbmwAtdfGdv7GMZrVy9ZP7zKuC/ZdAKk8TQbyVzwx/Z3Am/QDvjuSik
         lhaeDGUvTHkqvAnYSlX7TK7cTffAcf66Qz3J4KoxxxCDDXHyF0ABkIYSr9FwxcG7TkHI
         v5/opoy5/Vkkqvo533Z+1oTtv3WtxKbhrykqoCrZDIxSCiX/+YHqVsoJ4bGJLB5J/y1c
         hqwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OJBOjlmu+tury2E+zoV82SCM4AoLHSymcLyi7zzP7i0=;
        fh=XO3y0P4+Qd4UWb3LZW145e9uiHeL7SS17g/IrurBVmM=;
        b=PnOFrUS13TgrE5S7h+EZ5kbcvzVvWcNEGXtbET6pL3Lk2Hh0s81moUfl+hDXvHGh6C
         sJGXj0Bxbwprou3HyrYXpVECTE5nQt4vxkiwrOsxk5JfEmG1RNv5/UeMN6T7lanhT9oE
         JLqiI2ppCwsFy74QwYo3N9S2aAf+8qFzKDibaAys0XGuhif2t1+EIC5NXSuscN6JoEgV
         SvxKzfDESiGxhzLBHiRBfi6fqXxpBfp5aC6UNRQmpEI5elzlj46vAERi40fSkNOlT59e
         /r34vaLqi4J+MCkMB2RPWNm50ptn9CQA+Ohrufir8Otp0RzWsPUb6o2/6PW9pSdghvMt
         wNwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792656963; x=1793261763; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJBOjlmu+tury2E+zoV82SCM4AoLHSymcLyi7zzP7i0=;
        b=mpj53jGlB4JLop4p8vC+NfLevU7DyekIe6PQ2ouAeX1vi/tiv8ONerDHBIh7ihOJjs
         cgG5mD/xHAPBK3GHqW9KMUI26IwPqyLZ/QOExaiwV3aCdbqQzd0P4glEMgWxQWOsQAt8
         zlxrh6Eo0/kePEz91UswcJ2oirZpciTOGtgkdzM8BNQxr5i+O6660+1sDoegtJVAfZKS
         usZFq2+fhDXpfhu3PgVgb4Z8y3IN1YtjkvThXRIr5FLLnETHVnuClTn6sJHyuuVgWY0D
         3R5KurpJjZBysA4iCVd1OXHxZ84rztSoLXbD6aGTzcBDhlWl/uWnPBPQL+cj2eVZ4Yvb
         pYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656963; x=1793261763;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OJBOjlmu+tury2E+zoV82SCM4AoLHSymcLyi7zzP7i0=;
        b=CVvP3karEnaKMAYoopeByHeLwWxi4sskHDfyy9+vrkk9cB+JHnDYhCsSs+pEykEQO9
         08VJWO9TMxuJSBOBRJAKMyyfK4tSq7ji7Nfw4/mPpiQkDLzb6iz49LtxIMegy5Gy2dGQ
         lWH6AETkSlWTWPQzPVcAeGSxZBiSp1IQoR14n+4gzwntBXahMpfMl4XiDXF2jwIjmO4Z
         RJee8+x3NmOuu9daov0DDXrR20BxjilhbJ5Mv+BqYEFUt91WrIfd51yhmZ/CcJkLOSjO
         VIu4x94AnLOfKni5oQRJ6AIUVpxFY541S3dppYl07n3kYR2XkYw+FOpsfe6cMwIrmzEB
         l7nA==
X-Forwarded-Encrypted: i=1; AKwUvBzQKyPvnqyb8qMBFPvSF4zLhWN2q6/LrW6Cp+3kfcOr3IxfdWHw780g7aqaDIe//RWCmUWl4nepVpXyoDqZ/ws=@vger.kernel.org
X-Gm-Message-State: AFq9FYITPtHJWlZkvtqp2HyyXDRBpAizGQ86IC6bl18vc5U8PWDQ+Cmv
	1rP+RNrXvY7a86F9ty/wKVy2n65ieSnGLSW46SMMEHPv0s4/jq3QuM7qKZRdx5hPwOpaOAkpER3
	Lc9A5W33XoywyJZcXEUebbrgzNuxdkeFkwLUB
X-Gm-Gg: AYBFou2vUQo+ZX64H7C42C5tdIRMLpOr18XXhFTeg7hGjWvS9brlRyNq7jLQs+LeTet
	VYYPJGg85c0g0MGUNxO7CRu7Vl8Ciivbmp3ru8JxiRlOCAvh1M4Bs0C8KwVXPlPta6OPxMOjAnM
	hOSTxT1UtWDhApK0vfp47HnVu4/BFO5x4+pmTPhv0IQ0LfTlkRWCeB/633gnCYc/IOTE+u5oPrD
	OqVjWG2ud9zfPKJcfz9Mtbet40+kwUMhNyXExlXTtq9FVyirUHnIjYJg0pbCqTi4LK28EwZCyEt
	UIwL6q7r9ePVIRrGY4G8B7/cHvAlD06sK1obpaCMTbeR02sYKd+tUL4EGmpbCqizJsOLAP/NNOw
	gWpbBeylo/OFdr9UhzwyRHVgtnN3/d3YYqxojUj0=
X-Received: by 2002:a05:6214:2467:b0:914:39cd:e64d with SMTP id
 6a1803df08f44-91c12f01f73mr80371596d6.44.1792656963214; Thu, 22 Oct 2026
 01:16:03 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261007111611.2086-1-syauqicode@gmail.com> <CANDhNCq4G5VwNDBj5ZbZpWCQwmmgUTgBrMYdHPbK=s3NqKNLnA@mail.gmail.com>
In-Reply-To: <CANDhNCq4G5VwNDBj5ZbZpWCQwmmgUTgBrMYdHPbK=s3NqKNLnA@mail.gmail.com>
From: Daniel Syauqi <syauqicode@gmail.com>
Date: Thu, 22 Oct 2026 16:15:52 +0800
X-Gm-Features: AclHuK8Xvppmmud5vsCpQH6FzcXGJZj7S_qHU_EuZI97lJN0nJatEhkLBniCEjU
Message-ID: <CAL4Huyhx6mmoFaYjKNCY6D9Su_WCRHneiJfu3u18Nukstk6H0g@mail.gmail.com>
Subject: Re: [PATCH] selftests: timers: skip raw_skew when adjtimex fails
To: John Stultz <jstultz@google.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Shuah Khan <shuah@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Sorry for the separate message earlier, I missed the lists on my
follow-up. Thank you for the review and Acked-by. Is anything else
needed from me for this patch to be picked up?

Thanks,
Daniel
