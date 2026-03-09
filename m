Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5487E2472AA
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Mar 2026 05:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773035675; cv=none; b=dSxBuY6miG/m89AFIBTVU9BeFK3lvIwp5zflWubmIiST2CGg4yPNacB1utsWrjzQknkw3v+WxIcY6A5MiymEKKp4jinU/i0zRHTSKq0aKNO0gjIUJjy5qwFKjepb98Z8o+GCKiOyD8aZOeCSels1PwY2+RQ6viWDFp5w3qKlWiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773035675; c=relaxed/simple;
	bh=yhRXDuYeW+cftAqeXj832wG18URrEw+/ciyn8otv1bs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KFm68RS96ykbPDsrPs2kwGiaFB1N5xOUYgGHCb/JONE3OnAwf/H3kQ0xC93cXlBsGjiPlHIweEe3BadH2NYViNTJDKp3kNsqfXzVoTJ+kp3jcC1Xh6S1xy5ZO1AzuIL4weru88uCsg3OkpZLkn+nKuSJo16d/BaItrcOg393s0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cV6Zl/kq; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cV6Zl/kq"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c7393536e53so1419200a12.2
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Mar 2026 22:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773035674; x=1773640474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pQy7F8PJ6uvy5F2yRW0mdhvL40ZL+dX8MEO00CpDqi0=;
        b=cV6Zl/kqBNxv607ftvljCrRKjOqcbnx0iTV0DaBN+eXRUoTGEGfoAT3LlezY2XsY13
         RisOZV4Kn7yZqBC8sxM9rcXjoY/18AtzqBboyHhQ1Rv0x/mTfVpuNj72cLMw+gdGamv2
         unI+FZ3nF+Ls0H53ywqXupejOUsIDfxUSi5epsMQ6pXIWGy7cZaY0/pB6Q13I9DTy+Pm
         6fYz0ORxpJOZjrYX7ywp0QFEwwWnsQQGdbBvrrvv4cMw4gAdIHbE4yVy1DHASb02oS65
         mc/EbhJGwDPyhDnLwvTltSf6Ew0cHf1qkF9WQJYZ+Y9eaSSRkP2+yyJl9RBBopo49QrD
         lRaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773035674; x=1773640474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pQy7F8PJ6uvy5F2yRW0mdhvL40ZL+dX8MEO00CpDqi0=;
        b=Da6fyDp8lnBlKVKjEcnPWR8jvRu/GBLqGP03lnypvH12Y25b3sXhviZs+Q0kdQH2Uk
         WSg1jhJ78XLwG5TZkQJatgFqaCjeyq/5aod5x8TqAXUOrHS4J3d3XhF+oYrTaZVtMFsj
         7rKDV0mNY7IJVIq1Oy3JMiyIbzcYJlTwIFp0bOlnKa5qaO8S27XSCrhaFMJE9ZSDQGjp
         3t4FMCUOVl8qbZYz2V+kf82PISpObJYqHJso/dtJbbhpn0e6GbkbLEC4SD8jj4ktOVjB
         s1tYw9bsPHdKE3sL4sWifOdG+sBXONrrygVfj/Ua4VS2zuPx4xmGT94bwfG2G6YPPP+j
         vHmw==
X-Forwarded-Encrypted: i=1; AJvYcCUJNxdbz/pXORtkOpsfAuSwjz6aZftIha/337nEjnjJmAlEODcapxCB02Az2ddxZn6sMwlG6Lmgzi5SU1R80JA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVQcQi7/oGQe+L4Za6By5s6CsFkRfMB9VMx2XmgpAOpJQkF7jP
	wvAk6yQ6EO/rvmiOWqLq6s4mChOOkVsnyH0ukGiXbJ3UOUwnb59CBc5G
X-Gm-Gg: ATEYQzzCDgwMWRNHcAAOEP903qnMXC3udSQZJ0N8VAP95zV6mAEbJRq8TgnvfFb2PyY
	wDowArEUl1Dc5aott5S3jfUlTotoi3hDYfimFx0x17Gx9EBVxQWGBxs4le/mHGP6DHKZec3q5Fq
	Sp7hfOxkLGyW+PLrVqJ2aUckgCf7hnhmJSf9GKDa5ufF6fCtLpfAnXWzMZpA6Wnz8p5v7vK2bkL
	WxxksG2WinHBWPjhwZWhR6yE24xfCbeu3POgdUL/8pSBKDyxKp09Er4JaVJpU4M129uOh70Y1nq
	nDSHpqTTE7TbHa3lGS1qce+w3w93IGIdEVaEJ8ZftWQGJmxC9BGt/30XQ/2FV/0IAIlFANDVpSV
	ierR3HB85kaGpCqZC/z8RrTd3KzBJDftSRYq69O8PTD7l1UJC0iNY/DQ5Igjwd04We36dSzAZ5M
	VvmdiLgt/ri+eEV5ua4hQiHKa/5jp0roHuxzcgIiZ+f9ZH5lHPujcudKAmRcji
X-Received: by 2002:a05:6a20:d527:b0:395:b6ff:fe57 with SMTP id adf61e73a8af0-398590d3b1dmr9399688637.63.1773035673636;
        Sun, 08 Mar 2026 22:54:33 -0700 (PDT)
Received: from zenbook ([159.196.5.243])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e170923sm7933716a12.17.2026.03.08.22.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 22:54:33 -0700 (PDT)
From: Wilfred Mallawa <wilfred.opensource@gmail.com>
To: John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sabrina Dubroca <sd@queasysnail.net>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Damien Le'Moal <dlemoal@kernel.org>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [RFC net-next 0/3] tls_sw: add tx record zero padding
Date: Mon,  9 Mar 2026 15:48:35 +1000
Message-ID: <20260309054837.2299732-2-wilfred.opensource@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Currently, for TLS 1.3, ktls does not support record zero padding [1].
Record zero padding is used to allow the sender to hide the size of the
traffic patterns from an observer. TLS is susceptible to a variety of traffic
analysis attacks based on observing the length and timing of encrypted
packets [2]. Upcoming Western Digital NVMe-TCP hardware controllers
implement TLS 1.3. Which from a security perspective, can benefit from having
record zero padding enabled to mitigate against traffic analysis attacks [2].

Thus, for TX, this series adds support to adding randomized number of zero
padding bytes to end-of-record (EOR) records that are not full. This
feature is disabled by default and can be enabled by the new
TLS_TX_RANDOM_PAD socket option. TLS_TX_RANDOM_PAD allows users to set an upper
bound for the number of bytes to be used in zero padding, and can be set
back to 0 to disable zero padding altogher. The number of zero padding bytes
to append is determined by the remaining record room and the user specified
upper bound (minimum of the two). That is
rand([0, min(record_room, upper_bound)]).

Also a selftest is added to test the usage of TLS_TX_RANDOM_PAD.
However, it does not test for zero padding bytes as that is stripped in
the ktls RX path. Additional testing done on a linux NVMe Target with
TLS by issuing an FIO workload to the target and asserting that the target
kernel sees and strips the zero padding attached.

[1] https://datatracker.ietf.org/doc/html/rfc8446#section-5.4l
[2] https://datatracker.ietf.org/doc/html/rfc8446#appendix-E.3

Wilfred Mallawa (3):
  net/tls_sw: support randomized zero padding
  net/tls: add randomized zero padding socket option
  selftest: tls: add tls record zero pad test

 Documentation/networking/tls.rst  | 21 +++++++++
 include/net/tls.h                 |  1 +
 include/uapi/linux/tls.h          |  2 +
 net/tls/tls.h                     |  6 ++-
 net/tls/tls_main.c                | 72 +++++++++++++++++++++++++++++++
 net/tls/tls_sw.c                  | 58 ++++++++++++++++++++-----
 tools/testing/selftests/net/tls.c | 45 +++++++++++++++++++
 7 files changed, 194 insertions(+), 11 deletions(-)

-- 
2.53.0

