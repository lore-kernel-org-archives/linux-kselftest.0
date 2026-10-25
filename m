Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792944532;
	b=FyujrJb09oAW5fNoRKgUfpHy9qQGxxZ6yAlKDwXdfntVXU13WpTATTd0e//y0cG4YN/Y
	 NHmghJ/TFmJzUepLiIdSmzMbMifF4/8JumYvhR4uSqhWbZCfgacju45gW3/0pHpXX1VNn
	 sgowEx+ekfcXMXd0yrEsYvTT+UUkPZTtV8KO0cGt33Bed4D6uhp7E1l0BQhj3nzZvAvLB
	 j8lk1o7pz4ZQ9dAf64FVw0g+8peWvbveuqhhWd3EpEhJCTeMD55akc6BWp/uP5jmXhKFH
	 Haick8L3Rw6uL0aZivLHJwyll3J2f4o7fWXR01vVr7nF0a0Ii7RIRUVJdVJdAPko1nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792944532;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5bsFb1VGF6oWmE/SaHObYdwjauVdSsHZobYqpgFT4fg=;
	b=cbxJ4II4pMf2MGYEmMZSiZ2lej3L/Zu9xFSbtI2owIzGLXTcL1QUodLTqAn0Ca8UFOzK
	 VVmVctaMQ8IioIi7DKSp3AlpeFkWlH6qSZ+n02FXQahra9z6g/+FPdRmnmgwAEYFJh7RH
	 FPKvDoiTtRoGFAefKEDtUpv9M0LUdLrva6Q0MVs/Heq6AlXtB7mozt/TAegtU7AKQ9g8I
	 egyrn+t3BWUDcNekncm6FTgHjqtRBYp+6tc9+GOC5paFLtTA+esMb3Vu1ETODfX2M68wU
	 RDEqcVqwrPdgb7aGSwTAOiMlZm4ZzKvmhjPgZUZsDyed4tkXYvTjeWVFi35hS0E0EVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=exSmZb4+;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB28606A33E
	for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 16:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AB28606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=exSmZb4+
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-157fe9d771bso2722941c88.0
        for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 09:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792944531; x=1793549331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5bsFb1VGF6oWmE/SaHObYdwjauVdSsHZobYqpgFT4fg=;
        b=exSmZb4+Kw/kxqqpDCYdKTZy7cTyRv6ROKOOKXPRoAjBll5aml/FiU0qd78qRCr46V
         hBvBAKzCyQEe0CPsezteuFWs4H4TuL2+Irsy0SMiU2CdIdj5H7t8AP40PnczFjz106CB
         giwqCpQlfq1Om6b93qLEUlrD1/rpW689+tbjhKX/4zRmFh/GGLGGexJu4W6dicjNBD98
         j2QcTlfLMjcHDbKuMcUB0qtl0oxYTiZ4TVj8O+YFoVRGkLAsuyVVY+gXN+BLxeHCm2rr
         0wKTiwU/+z3WB74m3g0erDteWlyV5jX4hcDrNRDsFvZa6qjEN7Cf3o5N6MmlI2Riy51t
         DM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792944531; x=1793549331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5bsFb1VGF6oWmE/SaHObYdwjauVdSsHZobYqpgFT4fg=;
        b=QzMk27BNwXCXcAbrDD2Lk4WlalDqwKTWCM5jKP1wi6+9jCBozp8CjEpVW5ZXADTSLp
         5ltP6gYZvVjbdOlYMk0d66GVymZ4+xexZ7Qxt3hr7a3JpbN4cmvF+EEDdWl5gtjuvzNj
         U4I4uhhP7IZyZLtx2Y9Daee1dSJANRMwpTRxfHC2e4SXARs0PQYABrKc7EpeaFAHdLps
         fzgdYP+d+hU4vIi+89mt173B7daf15+RMIqPT3ZvC/HAkhJ3iquaQ3F2NAE3Im83krmp
         XxJIo/D+p/sdHKtXoQLILK37orowt75JOzLk5tULa95EhkmuuTtxqFVGR/f6tovJpFFk
         Pybw==
X-Forwarded-Encrypted: i=1; AKwUvBwcd7Q9W29O0HzZlLi1FGrnlJLo8GW03SztcmLY2YClULZC8qvsw2gUp0VYT71hGipEFxUB5ppgAW5Cov9c2Og=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgnwH7wSjO77lNE9xnUxi//vs8KgAvDj4QV4WJg9Utik1Am26s
	s5APVHrcKPzy9ngYHmF0MltBqvITX0n4RQunGctXD+VCuSDFR9Q0UmyO
X-Gm-Gg: AYBFou0gNg8Rb+q2Nl2SihyfNoyzuMqkS2FgbGjY3Uncy8fKd+QZS8yOfuQz8zR0jVm
	8BeBRt+Ow/kef/Ivy69t4rISCRVhrB78WrNrgtuXp9hSgOhDVOEmSjdBn6xqNNEufNGV4AkNPqB
	XLnCapUOmp0ty1b3WL1U97tr6xYpNgxwuYQcyNBTke6Xmnod1X+dhLMy4ILTwEWWfqW+nrf4K3X
	vgUrGai4up/lYYvBfrFfVhQ1o0ao2piRaGX6T362DPwwwUHL8nWjfVvjoYKGyKViJ45UtWHbYJ+
	7+ISwCOjmZs+Yp7SI+uTV95RicvzRTVBSfJZc48F1nfvECIsNh7toY8oYFYirrMWnfam5Kh5Ck2
	fb1h44SiCo/0F5swWYgKMmM9v32xLi9zq8wsn3rYxL0lYXvuY31eEZUdrgEZlmfbXMm4vXxbwfh
	PgtDdZulf8iV4tnjiVRYyvXkXsF7A41QXsOC2UZO0HH+w+uIhKjeE/N88Wqbmn5xVeKPEiJ6q6/
	slEu2U6ywhS9bvl+EkvgUFXtWWBN+3EJGdqMuFTiIbaD+CEALqcL4wuKxAYn97gfPki9mIdFdu/
	cJVoOyRU09QF4yzk356x
X-Received: by 2002:a05:7022:1087:b0:17d:7b45:f905 with SMTP id a92af1059eb24-19937025befmr6506534c88.31.1792944531413;
        Sun, 25 Oct 2026 09:08:51 -0700 (PDT)
Received: from obadmin-Precision-3680.atlascopco.group ([136.226.232.166])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d59f90sm16330421c88.3.2026.10.25.09.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 09:08:51 -0700 (PDT)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] selftests/net: test network sysctl extremes
Date: Sun, 25 Oct 2026 21:39:27 +0530
Message-ID: <20261025160927.3934600-2-sahaj123.sc@gmail.com>
In-Reply-To: <atXJLy6iTh5vbe9D@fedora>
References: <20261014041446.2821085-1-sahaj123.sc@gmail.com> <atXJLy6iTh5vbe9D@fedora>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Hangbin,

Thanks for asking. C was a choice, not a requirement; I agree shell is
clearer for simple sysctl toggles. This test also searches accepted bounds
for each value in a sysctl vector, verifies writes, restores the original
vector, exercises loopback, and checks kernel log records. I chose C to
make the numeric and error handling explicit. My shell prototype was
unreliable in QEMU when parsing the vectors and reading /dev/kmsg; I don't
mean that shell could not be made to handle those cases.

I've narrowed the test to tcp_rmem and tcp_wmem; UDP is now only a
transport smoke check. I recognize the C implementation is sizeable, so
if you think that complexity isn't warranted for this coverage, I'm open
to simplifying or folding the test into an existing one.

Thanks,
Sahaj
