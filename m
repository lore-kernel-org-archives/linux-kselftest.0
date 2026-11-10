Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329364;
	b=2Qm9D0KHZ+Jau03Y7hH110+d2L69GnqIk9yMKXRds+ZO4jIEhCkJmP5Dji1AXA0SyYCM
	 e8+JSL5RbnMkJ/8tRsVrYtBRnycacYlNjW3B+DsG1pZc3+5JsCwFemWCndGANrOcdWUdu
	 wkoohdD6mOiDuMEgIKx+eRu0z2wml8udvLzXCtgQ5RFSJcYIT7sX1t4qPSoehY1u1ZU67
	 bhpu5Ryh9i2t7NWZf7OlQT8cMwArroNuOP2Y0qu0xkg9QWv/Umo8OOLagzDgpYetCQcAN
	 v8T9WMpZX9SQVjwBqiZFhFrLSbbhP03foNIG+HHaZhd6vYzg6udMjcxRcJwgypD0MWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=nPtrbd2Pn3rK1sw5Bc8c1fg7SY1qBfAR8Azz15uZZXI=;
	b=NeapsihNTXj5JAu97NfRK78oq6C4SCbwRMGrv4dVRcpBq/YxWwOC5fAq3oeVkR4P5b6V
	 Ekooi3CjaF/D6wZsvRIQ+0CTiMnVBBzEVvmMz1BYE6YMYGcGjY6+Mlndn46XTz3w7k7+9
	 Z5MAMfrPebXMA6ZZtFbhkZ3gErHID3HxaXxCqPvbRA4qe2SHdsqA4xVidbkUImxbqoKVu
	 spGRsKnU3T3xEXJaTjrzHVNZJ9au2xrRz0B/rETj2aM7Xc8/NI7kEOYJ3IjObA0vpzXNi
	 Er0nhlPHqx27Noh42A46oEk+bfjv9dZeuDA9/QFe+4Iyc40fX1mNMBsZtUVvtRyG4sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=POE2dKJi;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AA5606A33A
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 16:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7AA5606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=POE2dKJi
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-18818daa3e7so659547c88.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 08:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329363; x=1794934163; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nPtrbd2Pn3rK1sw5Bc8c1fg7SY1qBfAR8Azz15uZZXI=;
        b=POE2dKJio14LyaDVkR+BmbhlmJfL3c+ppSMEYXAn68Zh1qMJQkRRgYrFpfcjoPIdxe
         LKNTJZ+qLl5KycuQa/KBAa0V7qCYDceZ72rU4/d7aIOqMEqb76zw8F2kBmFjv/dkSrts
         8KeVMjltoTlxis9vnEKSzF/mz0U2xBpQzv/CUbpoABR8TmmaIhAtN95GBKAYj0bQ5y4K
         WTflcwHcbLFOlptFw+pVwlZcd51SidZ/s0KEYDXY1vnyaH6k3oFribB2jbDeLWBn3Dei
         8tpKh9Mhgze0pDpKuFNQ/iUQl12ffQjfbg9Z47WfuKSCBcxZHxrCfv+ORkavKx8ydT5n
         yrSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329363; x=1794934163;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nPtrbd2Pn3rK1sw5Bc8c1fg7SY1qBfAR8Azz15uZZXI=;
        b=cnO4ujE8bl1An5qsYjD0ZIvoTsvmHGt2iIiQEiz4PBd6Cz9FpAuKaSASXjeOBQa2Js
         1f6lSit9tnL9ewX2Xznlrr8PHt8nTspXpOoIy4tqc6yN3xChHNQEA3rGvoQBwTmovgi4
         Rx2H5Z/8tURKZTGRGypEqSDccDcW/tEK8CJlX/3R0SDB1k2B7Uy0dixw4ivvkAaHGJlT
         z5GHr89AaW4jcOsiA7v9Hs7+KP3UqnybBfS0ktDxYQqQxwUWiDwX2yYwrQzFSo4or8dn
         UvQPMBhbJpp5RmHM0ZLPIi4oBEDKc0UG/f6jYZTXV01mCF8okenPaj32iEAkDAaWGkNz
         7nIg==
X-Forwarded-Encrypted: i=1; AL+hErEr2ZtWkG945TdIlPCLr/H7sPuLTrwzVmARCR1j0bW6z2AwscCl2OB+WNJruoQhDttI320KGdf+upenKV8Qfg8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8voxtlN3rJ7Z3MbGKybZIdCE3TpFg1AKHuDf8gZyjJtssIt/sq
	ZtPVc7Jbi7desLMIMpgt3AC2pZByA2ttxYl/DYj6G8Zi0sSqz6vsd22T
X-Gm-Gg: AYBFou0vS7eqz4whYa9RoUg9k9YrWiKPDzq4OTiaxl3qYBK906xtGLiSB3mHDcXWHgD
	h/AJaP6pjOFB2C4tk6fUAmrqDigdGG5vboe75OP6z2h4A/5tqyVbKcD5t0XKR4tpBUcycOxdMKp
	r0zJfhsfpDw3W32VYM892wIJH5tAIKkSaJwGIIxsDQYAqA9Ix0rV7s050IqkqnibZxeyKSqBbq2
	CaW0kKO1lDyzR74QJnmEUnTGXH5NfZeHMz4OU0O9KMJK/Qe53dfDiYR7s3VrFDvWW/acj+oVBsB
	gbxQedNpZRvqjV9VWMT4OhzHyJ0ev76KOG8hkIi1AAJz4ZNpQ+6gjmfkOmSYzQCfaYRe5gpFXfp
	jX3ReXtRF7DGR9RhB0s0qCMJFx8kRX7o6CZjvPzkEjf0tFgXnCMFrkr5fvpbGFj3y4rqpanM08+
	4VezdFmElGLXLjD3sl1kPyiIj1dxkmZDTh8Y1hrusNCoXfls0GSZSwCrDSCplRpD6pPafNtMNvK
	Tp/Y38wkXzJc17RX8KRoXFB+Hw9nDAUPs3VBvAPM3iOpB2oJI7CPFf8J6ezi+jU1qt5gY8hkc7v
	9Ue8wyftkVhUh0K2K7+TaZWIXmmafkFvFKjCa9A6SWk31rWxnLwtr/PJ8uH3wCuR6Tk=
X-Received: by 2002:a05:7022:1586:b0:14e:d0ba:75af with SMTP id a92af1059eb24-1b3bee94f73mr67874c88.6.1794329362760;
        Tue, 10 Nov 2026 08:49:22 -0800 (PST)
Received: from smtpclient.apple (v133-18-180-162.vir.kagoya.net. [133.18.180.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5ba8426sm7208003c88.23.2026.11.10.08.49.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 08:49:22 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH net-next v3 3/4] selftests/net: packetdrill: add TCP black
 hole detection test
From: Esko Mobius <echoowall@gmail.com>
In-Reply-To: <CADVnQykoJWJL+vZ9GC=RqZuiSEypNtmTONBzV7XRQ1jsXy0X_A@mail.gmail.com>
Date: Wed, 11 Nov 2026 00:49:06 +0800
Cc: davem@davemloft.net,
 edumazet@kernel.org,
 pabeni@redhat.com,
 shuah@kernel.org,
 kuniyu@google.com,
 horms@kernel.org,
 kuba@kernel.org,
 netdev@vger.kernel.org,
 panweiping3@gmail.com,
 linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <18B3E417-AC3D-4A70-88BD-4ADA9003ACAF@gmail.com>
References: <20261110-mtu-probing-series-v3-0-dedfab25d641@gmail.com>
 <20261110-mtu-probing-series-v3-3-dedfab25d641@gmail.com>
 <CADVnQykoJWJL+vZ9GC=RqZuiSEypNtmTONBzV7XRQ1jsXy0X_A@mail.gmail.com>
To: Neal Cardwell <ncardwell@google.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)

> So I'd suggest renaming this case to be something like
> tcp_mtu_probing_blackhole_no_tlp_retries1_is_1.pkt.
>
> Then I'd suggest creating a test like this, but with only the =
following setting:
>
> `./defaults.sh
> sysctl -q net.ipv4.tcp_mtu_probing=3D1`

Thanks, Neal. That makes sense.

I renamed this case and added a test that only sets tcp_mtu_probing=3D1
on top of defaults.sh. With the default settings, the TLP and the first
three RTO retransmissions keep the full size. The fourth RTO falls back
to tcp_base_mss, about 4.8 seconds after the original transmission.

The new test passes in all three IP modes on x86_64 KVM. v4 has both
tests.

Thanks,
Yongjian=
