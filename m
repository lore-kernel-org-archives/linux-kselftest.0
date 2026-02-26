Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E13F3290A0
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 17:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772126529; cv=pass; b=LYZNWo5phKy24DPXjrkPLeswsclzA09YKozAv1k49x0FGm3c/uJr5Fyi3n9XSMw+oFUAlJtdqtAGOyF/7kqeEn+BYx0CVpajWJHzVLzNvW0Qqc5c2FovEvpE8/+267j8RnVT2Oe8n5qbgh+e9yGOb1m6ORRDgLBKf2jEONsE4js=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772126529; c=relaxed/simple;
	bh=74qgg5SJJYPKqJmOzG3s1YhVXh8RU3o1jEAY2JTGo2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eLurbVdt3V1Ye305YyrQQt5utx1A02yj5VlmT2W8DMpd861XbzTOhGuPPVffAyIOuWrTSziWG729JMyHozURmnxn951fC9Vx+kPYusVQgro2akBnx4Hioh0gusAtwJ06cvz8TffSj50OQaCwn7Qruj8IWrUgcbBWWW/NYjnr3L4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/ZBFCnF; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/ZBFCnF"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso10541185e9.3
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 09:22:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772126526; cv=none;
        d=google.com; s=arc-20240605;
        b=T2sZpaUhGPEgrWYKVxbzAy/O3BsaCUjnsz4TnaJlORUQLy7PgeFJFVI2HDW83I9t6W
         jn1MzYKe8pXnXyzKjB/kjsDbrXokpsowo/vIux80hD2wna1P5iQI8O2arIL2sEbVUoDh
         RNG1GP/ZvxAdlp+rYPm7XOzfO73gNZNbX1aulfeO5OSOdCuwANNK7Zz7ERRcV8HKvuTD
         OHzB5acPNV1nkbeTuZVK+yTOM8DkjngKw7LgiaQ5xM66Uz8djXEXm2OO9bpjTvZ9WnlS
         dtH6yGKcU6tThkWl355hP5nMJq5LkRNF4kPHAyAXmZHIc0lMxVBXfARWsf/yuusntbxJ
         CRHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=74qgg5SJJYPKqJmOzG3s1YhVXh8RU3o1jEAY2JTGo2o=;
        fh=72y00mshRMAdQPe6Bes40sEarbdL6VGUZ8xrzcy/E3s=;
        b=B+2mHv0O9kBvw/PxGjPO72PPfqBjRc26Jr7HQE4F41xop8mqmQgIiNLYCV/Ko8J9c4
         jUIXLW0aqPtCZodLqiAxmsT1Wqnn1qEnqarTsun9OIJK0Kp2EvkhwuCILNYx8OSpM2rE
         mauT1JeFKcOfwtUuKEcm8k+BgRWt3cNWKbIuvlz9LIsOUtiEWl8bioKe91ytDFp8RLXS
         I/A0Hb45LLTLgFzrY6zlUihgLU6X2alR+FoACVMwDv29KlbQRppT6vzDvUoQW3T5Yatw
         99gLgx4OaE1BVyPGdH5pnJabEokRsaOoe1aE39qH5uynH8TwqGxSR5adPJ+ZTqXjM0q6
         pJgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772126526; x=1772731326; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74qgg5SJJYPKqJmOzG3s1YhVXh8RU3o1jEAY2JTGo2o=;
        b=h/ZBFCnFM165OdJM/PQQ8TAZJnndWYv9Y77AWglq6ATeGR2LzKnDf7pkBM5B9U68Eo
         undvdPudxMvopvvE6MlRsOEYLUHJI8MO2hFs9BfCDv9AqISLMSORx9LP1kaLI3wnibDV
         8vnMI2M8DoyjwcPBZxviVtS3Ho0f2IuArsDLp298ber3Ud9pK132EUhCYDKmvOd5xpdh
         mNmfXpyd5qn7T+Gt2B1JiKbzk1gFrJvETz3PNd4f5rJFdgAVlVzD0MNYHkxT2yljS7iP
         MzQu1giRfTGtR8y5VetXgw7SwOSzE6QP5+VaijCQD7qvYxbXLwvmLmfOlSSAwvBPvtBp
         3z6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772126526; x=1772731326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=74qgg5SJJYPKqJmOzG3s1YhVXh8RU3o1jEAY2JTGo2o=;
        b=hf4zGk2Zk7SMH4eETiosXXvxnC+ElHwpuqlTQ4OrcIO59CbhS4sz03MVc1o3QATvIL
         v4cvTUF3xchUTBWbiHZFkky5Ys/2ottHkIia0Y35gtSv0bVM8zJUN0LssZ2QPGUtfWkJ
         i3N8IMOIfYY1O16Pl2wZia2IBlqcNfNb3Akm+QTV00H3HbzUcQ0P7+4IPKJwmSx2NXvn
         DH0nZVBOb3M5jdE1G5CEKlyAGjHvW7kBIp7zeEx5SeZ3nEtFStGnHTKUquT1VlRT+4qD
         Dfrc+A/4YlbgyCH7PdMUrbejljxSy8/KFK3qnR91Os1PEifhEWY1Fya7viPtDYCDI72H
         AK4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVdzKlkCOLfxSHNxaI8yDjdafOLjyRzStEtj6TaAmqk44HnjS5O5m0rcu4LcCy0kP2CRm7oGmH0Ndps4yqRHGY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzYqAU3v5wLAjQiCkuBNdHX6PrD5femmxWsIeU2FUFTQaEA2Y2
	lId6o/M+M79gjnKhgl/A9+5MvrB0CDGhmrhcXhXsClGbbCB0bW+GYZLPjTZ5Bw9Y6nAhCxGPsht
	NyJ50KUy/L8yQD5OK8L5Y3tUZoH7GtNk=
X-Gm-Gg: ATEYQzxrgqoNu4CUbMteS2izYPD7EXcLHVQbwk6j49yf+htKtzphYRi7x5s+aalXjC9
	bI8ayA192HnpD/WkZ2JOULrG+y+b6ofIMXhGWIinjNkJd+7rEwJFk6nhEiKESlPBOKIEIO/karZ
	VHVKH7peBY/hv2R/r6bq/QC79hoi5tLUK56PZ40+ebxC/orJ7SpDmL7uf1TaN5FTt/3Rhs6YrAc
	VOmjz8aS6srPGiLw3AdBPJKQyIpPge2z0iFzlGZVfsOHRCQY3s3FMeXC2RdAvnkvfvQZGekkbkY
	G0RdyHc4jZAdGKe0oRWx7ss+7t4aWMCHtAonpOuaUgT7nD0O1AEnBTIejG/c4r6xxJkaoVL5CNR
	JXIdt700q
X-Received: by 2002:a05:600c:6812:b0:471:700:f281 with SMTP id
 5b1f17b1804b1-483c3dee17fmr39194405e9.25.1772126526208; Thu, 26 Feb 2026
 09:22:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DGOTPHTTR5ZE.Q7ALRR86ZZ6N@bootlin.com>
In-Reply-To: <DGOTPHTTR5ZE.Q7ALRR86ZZ6N@bootlin.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 26 Feb 2026 09:21:55 -0800
X-Gm-Features: AaiRm534F1J34rJ7kh8hSVim5MtGmblXU1UcmGZYNyuBYkm5GWjDPjFqUbdl2iI
Message-ID: <CAADnVQKM3zCvUv_ja+QCCO20eHZ0qrYpReNguXToZpaf46vEFg@mail.gmail.com>
Subject: Re: [Question] json parsing and bpf selftests dependencies
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Quentin Monnet <qmo@kernel.org>, 
	"Bastien Curutchet (eBPF Foundation)" <bastien.curutchet@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 2:36=E2=80=AFAM Alexis Lothor=C3=A9
<alexis.lothore@bootlin.com> wrote:
>
> Hello,
> I am pursuing my quest to convert standalone bpf tests (from
> tools/testing/selftests/bpf) into the test_progs framework so they can
> be executed automatically by the CI tooling.
>
> I would like to continue on the bpftool tests, especially
> test_bpftool.py ([1]).

I think it outlived itself long ago.
Just delete it.
Any new bpftool features can be tested through test_progs.
No need to test json output specifically.
It's diminishing returns.
