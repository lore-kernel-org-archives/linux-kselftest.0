Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535F12C11D9
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Feb 2026 18:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771095440; cv=pass; b=bOyjjk/QqPDzOrmKT8HI9IQ9GOfzdb+/QuQw0IiuyLxV5OPXAa/MzUPYITwgoCsqdRqEFyMRRlY8oMPRHP9UcxB3BVQSswJEAEId2asM2o8XWne7SwplrRQCwGeDd6/CCTZrTtRiXlJokvZuEUHIJWRtKPI4lU2gBgLQ8akZ5vQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771095440; c=relaxed/simple;
	bh=vIfLepEI+CPnCKqAN4vP/GmXxHUQ3v/RKMM4Vri69kM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sSXvGAr/FoPham4+3hrS6WXI4ajmQCrL5eUR4V2RCJI5GaJkbJOugUGmPi1b4MqnsscNoe48Z6a4h6iLpR/gtoaRdFyUaNXh6+4+YnKmwfhZzOechc1liOQU/HScQNPGKcoXWjtfi9aE66lr/C2pI96zJzfGd19aOxY5xYj/mxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sb07cG4W; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sb07cG4W"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48371bb515eso19533445e9.1
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Feb 2026 10:57:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771095438; cv=none;
        d=google.com; s=arc-20240605;
        b=dv05kJ1363IiVWZVioQT7t/i1axvOBfmvdjYeVJzY3AqYEN9VeW0IdBuyOyMGQDwjp
         AYLmAdbjbPPNMI9hiOzP6LSZXIUBhssPzYi3kAp4hmbKdplpfxedN9V7EExYEnMM7/w6
         cTY2F4TtWRJpRWS+2xKq2O6Z39tO0ZSZXwYNNLQ8BMKoj5iu78NskJpOzwHHbOfetj1n
         9f5L+ui2mOtPLLb8PeQyvEMIp+ccOD+LQR7mDjXgpHBsFS5Zd085lhq+yOba3lVO2F0e
         Ui7NxpS3WNhcr4XeCG1o3pFjrS1M3uIShS3BBGcBtRQEM2tKK5lmUQP+Gi03YeJ23F9l
         mQnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vIfLepEI+CPnCKqAN4vP/GmXxHUQ3v/RKMM4Vri69kM=;
        fh=yESc9aQPxNqAaQsODyS4Tx+rR3NnDZm1CiZ2v1gz/mA=;
        b=jd6r3DdnomFdS4G/3HBCviwaF5P+GhMvVZ4TNOfGSL5iQKqYgswVsmn9us3vYKS7/m
         CFggthAMfD3d4wliZtPgICpaZ8Xu43g5ahXp51TMO/mI8AE3cFGVXV5SzfsYZqYHLfws
         JP95CQRkZ1wyRFn5P18Um7bygQLgrw9kmkIDXbICcFnwoifODm5fXdTFfwtvVpcuQsYm
         ybpqPgRQ/wi4mTRuE8bYUwPJoKA/8OK9I5Q81MfwgSfISekXApa1AVFzQ/2O5ehXMd2j
         goxfL71DGpNnlSnVv3eugAPSlME3I9P7S3FgCkZHcAlBs69pOsQT7WHEw7+Wv18BM//G
         mb4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771095438; x=1771700238; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vIfLepEI+CPnCKqAN4vP/GmXxHUQ3v/RKMM4Vri69kM=;
        b=Sb07cG4Wtf2iRUaK3nljM+C05lokgqCVPJkn9RGeUDQBf1sNX9f+jgFWl1QWjorC+c
         Vc3pv/WdUNkKRU8mmaFaSrzRlOnikLIXWRWBe9Y+UlJ6YNbcD2C6jTcOb7dIwWZa9NSw
         8yMtKDs4+oBvEQS35sV6/EAwzkxTiYn14fEpRVmwk9OwHYiJ8UCNfnI65glhqF9A5GEx
         pxp7f8YLHw6+s1yL/Q4aVAnHSvbO4LdSjHbR4pfO6Rvk4L7Qxa+g8jM5vhf2cH/drIXL
         SR1SmO2cdmhVKJhmx7/u8SNU8+usYJHUJaWxEJopkkaGzWqYx6NYsVnoG2DQBIlcSd5a
         6JNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771095438; x=1771700238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vIfLepEI+CPnCKqAN4vP/GmXxHUQ3v/RKMM4Vri69kM=;
        b=jGzShwCdYF1LLLh8m9wycGI6onaIg4ndGk8a4mIJZ3Q7XLTirOwaZdQK+e5WWO7HXI
         Gbx7DB6DenEqoCMfzNaOJKu5cH3s4baS4EXteEySsTHI8V6+GMLtox4SXLFT6In8PD4R
         R8XTbLKabRM0Lx2FBNfrbAwH68SdFuDC73IeZiwudklBNIgAo7EcLLp0HfxVudiVFDO6
         CutLmXTOxfFfeW6Yml4DEqTYBRDQR45DFXEE9GPuk5BSYOBVCVGKEewiwerJobajvEku
         MKUf0d01vWowIMhEIPdKx+WWyL9g8g4q/w/SVhLrs6fg+WJJ9NwDOCDzhuoH+dkZbpKe
         UarQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3qymt02ccgJpCLamtQtNJ81xopArqMRwv2Sgme/3WqLzWP2B8RseG+tKqQhvl+Jg2Now5nla4IG6IRmB1LxE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1XgPWH2LQJE2f9CHmA7Gs9KHZG5WLE0k9D6xi7ye+hhd15NBU
	1XEHd5EJRUatazokuEkhE8Qv6kXh2fwNmKaclytqhv0n++UVM9htaQeDpoPkICtygPzX9tkRsAG
	zmuckZ+uk/YGxRBWY8Q2i9Twow4xiI7Q=
X-Gm-Gg: AZuq6aJ/MwD8uB0ORcR5WF1aFNUdNacqnIkcupJ+t0aoLj9z/GSrm3JUf87LhGxTI8o
	UE4me+FG+L/iDTrILHuGppg/TplIUCzHP9oAea06ttgXATAYygcKw7jNpflDHzXHCtqpOI2IfzC
	v0vuf1mpwhzL6PiyJo9CKA8Rz3gnpBV2HNFV7J/On0w8aIFbhpuQoqHo7pWGBruL1610/qGCPts
	7vXfU67O+RcJP/AWmJayDCfGwogn3pM7bwH0gG8oaegqv9qnRGIfjdgnmBbgUeQ7B1EyLcfX9n0
	tQI4ONuz1LuEU6p03HJIV/21wWVch021nVMdduvWHGMWWWFFZbBCShk58hZf0ZFJtflotJGWyZP
	nhKpMIrWZoZp2XXFVkJgMHKbK3Q==
X-Received: by 2002:a05:600c:1909:b0:480:4a90:1af2 with SMTP id
 5b1f17b1804b1-48373a78e7amr99696475e9.35.1771095437570; Sat, 14 Feb 2026
 10:57:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260214115431.55574-1-anandkrshawheritage@gmail.com>
In-Reply-To: <20260214115431.55574-1-anandkrshawheritage@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sat, 14 Feb 2026 10:57:06 -0800
X-Gm-Features: AaiRm539bjiX9dqVXUAYw3s0ZVhaVMbaDETFDrJyUdUXB3KeDpMAwmZnBMsEyFI
Message-ID: <CAADnVQKFHW09Y_mGYVa8wLD-1+W915WmZA_toO8+BUzJDR73rw@mail.gmail.com>
Subject: Re: [PATCH] bpf: expose original requested max_entries in bpf_map_info
To: Anand Kumar Shaw <anandkrshawheritage@gmail.com>
Cc: bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Shuah Khan <shuah@kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 14, 2026 at 3:54=E2=80=AFAM Anand Kumar Shaw
<anandkrshawheritage@gmail.com> wrote:
>
> When creating LRU hash maps with BPF_F_NO_COMMON_LRU, the kernel
> silently rounds max_entries up to a multiple of num_possible_cpus()
> in htab_map_alloc() to ensure each per-CPU LRU list has at least one
> element. However, the original value requested by the caller is lost --
> map->max_entries is overwritten with the rounded value.
>
> This creates a problem for userspace map managers (e.g., Cilium) that
> reconcile map parameters against their configured values. When the
> kernel-reported max_entries differs from the originally requested value,
> the reconciliation logic detects a "mismatch" and may enter an infinite
> delete-recreate loop, as seen in production incidents where non-power-
> of-2 CPU counts caused small but persistent rounding differences.

Clearly a user space issue.
The kernel side never promised to keep max_entries constant.

pw-bot: cr
