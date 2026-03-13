Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E16318ED7
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 02:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773370207; cv=pass; b=OPEJ4+CHo6xb67uYJbSRgHdP6EVDx7OlUSESINc5BJaACTTEjoP6OP7QMPDGNiHbdPr0CzfWCUSKcC3D2TZ/5xaYBYlZ/SAna/bbBGgetL5hF+iExVvxRszx4O/9XJ9jnkqtvF2H11cnSvaWakaewPw0DunpWcSL/RcjHJFe8ms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773370207; c=relaxed/simple;
	bh=1DDAUTZZs9nurII5sQuxTIy3I1smjx6u+1ntACDvnN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iqeBd7ki2+8xL4ZLJIpdAhLaRMLJimIT9WoqWdS3sNn6/gkvVWNTxjrYWUQXpb4QXzUNHbShRYMYWX1gvmwJXO0q5dkUwD/bRNA8mHSOmaXzbR06jqIMfMw7VeF1mke3DJ2dHuI1h1slCHqrdd0kdSL+0+Mk7ixfCIrfjr7VZqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C+AEaGjf; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+AEaGjf"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79800183233so26709987b3.1
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 19:50:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773370205; cv=none;
        d=google.com; s=arc-20240605;
        b=ARX5iW0CdaJPkyye8tPbgqE7idL2uVrIpE7qFu79e2b545enULybTjchVf5ylf8AFs
         wBnEp7dJJhvq+u+m72dWjHS/0LCc/xkVd7z7c7A+zlfwuZVnfkeEXe1Ck45ggzKW6GRN
         Mp2JYf+myIPWwEBdQ/NbASCSa8PUzMAB4EhCpxm4HwdpHflu1ln81+DClrtJ3TDoX5Ox
         BQDBN0h28eeXzkZXiEbUjdkZFDM8i31vwUtEvaodljbnFzb8FbiSDxLWQKFB5CeMb2Dc
         cYWog2XkDSkAIeWic/PvjvcuMPoHrYQMcOnJbxsekMM1sDPwGJ0lmgQfOiCzNS1jlebn
         9pNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1DDAUTZZs9nurII5sQuxTIy3I1smjx6u+1ntACDvnN8=;
        fh=hvwvtCf9sUmbXT7raP0022okBejH5FTbscerCc1DDgQ=;
        b=ijbVZVgitdMbxN7gfijIpfsvXCeaD63pEZJBGeVTQIuuoXofvxHBd4INKalVmjaiM/
         MoaMaruLnBJxM4y6Lvd89+eVL5ffM9eutqQd2heZZ81yv5PWNcnF+PRmBV0CMDsFrG1V
         NCKeTKJlSQuAoeHeYGlb1yXM9RaxXnXMtJZt2QG/bds2Xp/Uv0Ec3gKi/rgn6UjsDK8o
         Y8pkgAPrTfsU0k4m0evnVfUpZzaOzPx3ilHFDUkckB01mNR/zSyQMTecVWzhjtROVTLq
         2WNxY5ygQdkW4MCtRuV7P13uPbfGmBjgxmcyiawT9DNX+2aml9KjDpa3kiU0jczKXCym
         lkYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773370205; x=1773975005; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1DDAUTZZs9nurII5sQuxTIy3I1smjx6u+1ntACDvnN8=;
        b=C+AEaGjfdrInamjQjc9HyWG9UqSDlwsmvatT7cFDhFC+r0s0pR1fMVINF4RE7fQlFi
         thCoJZbeD31ojUpjoBhIFxWeR5zMCR5K++3oonQcUZuH9+J8TTU9q1h/Uf8fWXUQh/Ns
         /38xv+qUCKoLhtTbVKZFO+QCKsx654Xnk9vxBXXbSc+f71sunuzmDJ3YWs46FUcluyCA
         KJn3pFHJXKPAWSatz5rfFI5GY+umbw0gPtaDlJlX33yoMgd/DyFohgeYc9Wgqny2wpgc
         CRAwlKycX5rIPeao5yeH8FXgE0h6lFKY0qmXUGsfMzOjcIR9kxyw3m1e0k7DJM68dc8F
         OMKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773370205; x=1773975005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1DDAUTZZs9nurII5sQuxTIy3I1smjx6u+1ntACDvnN8=;
        b=j1ywPozL1aX0ljjKV3EEHJM3gXiEftvchXzEP55f/bEBYtE8YfAlYvZLVceBWVrd0B
         iwD69NhPrY58tg2is3QXgYJTv3jjTKtP+QIqdiSth0Baf5xXwJmxnljgeKmoFJmnAzOS
         KVzsgRtChgyFbkU3pFT+Zy5M8nRptexv0EqzCqM8G81qRaQrdDxHqR3xHw4L0oZGSKkB
         TUhKqJRrCNvVBy7tFVZ6z8KSAhwVJm/yy69WHFcLBcktDDJ3RKTfr1BvkwVf935mrnM0
         8WonDI04x43xwyBKwWZI4mCRFVtMdfOYRtfjpyUSbYMJpC+ejXVM3+wL9K5wzJXT6dyg
         8AjA==
X-Forwarded-Encrypted: i=1; AJvYcCXM9Td956GMVxOtEeST20PEIIBtqXN7yl1uPr8RKH68R+EWIbo2GxJ5jqevLx3UsWahYRvY3hNc6lFBMbBtTWw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqizGmOIiTXarRZ4tDi0reIAyNfnaZDqCTRKWYG09HXMxLckYg
	n+EIR5FwbOcghapGCcpB0/EwIXGYTG+FJTqY13JGz34yR1S4RrFcag/PbIMSS+wqbN1UvDQXO0P
	jZudjPSYRufaQr+ZRlpR4NKmSMg5URqg=
X-Gm-Gg: ATEYQzzXKP7nAMCiD2I8s/zMtFj375H5It0m5T8Fcf0Md+3Os44OZoaN6XLxisX6yil
	XauRO9zDD8Q0DP9EJ+qKfzee5lFtdtfrPC3kfgT/EtwUT19AeZPEbgqK3SJFa1nzaRK0RDKD6YJ
	iqdlOXcnlxk+/x2lgTKWkTzzVVi8oXwiCK0Bw0LEHV3UkLBJKSx5M4blL/zJ4nIzVjBOPlsMhb4
	n4iF7wMNuG2txwVR4oU/rapdOdwucbM3udjtRMGoqGbjTOdFicCtviCb02lh6fyWv+pcrqrB+Ki
	1cdo9T1DiVKVkmuT4w==
X-Received: by 2002:a05:690c:17:b0:797:a162:f7d8 with SMTP id
 00721157ae682-79a1bd1feb2mr19022287b3.27.1773370205576; Thu, 12 Mar 2026
 19:50:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310102145.857810-1-sun.jian.kdev@gmail.com>
 <20260310102145.857810-2-sun.jian.kdev@gmail.com> <9f1acc68-823d-4003-a177-face6cdcc950@linux.dev>
In-Reply-To: <9f1acc68-823d-4003-a177-face6cdcc950@linux.dev>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Fri, 13 Mar 2026 10:49:55 +0800
X-Gm-Features: AaiRm52VZvdjd9yeA2XiME1nGhh8eFDEMbwgZDYRre9CaRo2zzF8ziC4MIE7nL8
Message-ID: <CABFUUZHKVNB9F8ra3Ry6ymF7KKPP8u=zOEYEvZdqayVTYaZnJw@mail.gmail.com>
Subject: Re: [PATCH 2/2] selftests/bpf: Skip bpffs debug iter checks when
 unavailable in test_bpffs
To: Yonghong Song <yonghong.song@linux.dev>
Cc: Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 5:44=E2=80=AFAM Yonghong Song <yonghong.song@linux.=
dev> wrote:

> In which situation these two files have issues? This already root

I observed this in a virtme-ng guest running as root, where accessing
maps.debug/progs.debug returned EPERM while the later pin/rename checks
still worked. root in the guest was not sufficient for accessing those debu=
g
 iterator files.

> access. If file operation failed, that must be due to your special
> situation.

Agreed, this looks environment-specific. I'll check it further.

Regards,
Sun Jian
