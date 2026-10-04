Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06335344D91
	for <linux-kselftest@vger.kernel.org>; Sun,  4 Oct 2026 14:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791122421; cv=none; b=oZ83VxBw3Dey/uh9pxdp9kSx1YKGQwn/mF5X275l0QVT3gi0mq85JB/5jxPeyoJw2xsTrf8FeQ8pU81wzqHTIQi6SiB2w/zNEJegU6dOHsAUcWxeTLhpawGI/1eFzL2bQhkcNLMv15z13oOJpv7IG66jxGcZJvMb9fegmJLj34I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791122421; c=relaxed/simple;
	bh=M7G/69YDl6UxRKlMCZubwH5wKehLjiqi6b/OWSUeyIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ljCxGWzESbZVVcb5jkWnFEf2Ob8uxbp3MwZ/rkSZfUbDXSgblEr33JywBaE4opDHvz+Sk2v4df3pH+pgMxoVo79B0g//N1irjQYyCj6iDmporxOpICQH6Onfqv70AhXgFNN6IN1XPVoAdDzH9BWx/Yq04Ezrt4o4Alv+rBLUe3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=a/juIQiu; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="a/juIQiu"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a11603310fso9812205e9.1
        for <linux-kselftest@vger.kernel.org>; Sun, 04 Oct 2026 07:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1791122417; x=1791727217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M7G/69YDl6UxRKlMCZubwH5wKehLjiqi6b/OWSUeyIE=;
        b=a/juIQiu1iPkaqkVtGjm6kutc1d12T4Cow3imMH8s+i8AGaUdYSdFrFI3C7qTaRek2
         vxCCcbqXGVqNOJdZnBr7HLl8w4o3mghMe67WvmSAc+VbNSz/OFM2RUWyhon60g4eT/7U
         sOzO3XSnM97QwbnVbiot4zASn3EvUlSTNf2yDhX1MllEC3yCceyWKKkUQgCBWPiHuthf
         1O8m9iVrokWaGg1YHvv3/Od6c0LewAqfxNPw2Pwvnsrww9WqzU+QxtfEiNF8U5yMI6M5
         jCaxdHC45WP3oR4PQTK73SHEsGYFCMU/XF0fE3GlqTGV/dOL9GGtGLtOv8JyKpyk+6JD
         whLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791122417; x=1791727217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M7G/69YDl6UxRKlMCZubwH5wKehLjiqi6b/OWSUeyIE=;
        b=ZVuZEnWwwKUQn2EEcu2zagK6fgK2lheEvGfAFE7ZI2nN74EwQumInM2UE+Ew4edbhP
         CtsChXnRfvxJWkTlmfYi7oHHysIWEwxEIQg5SIDV0bHJ6ceKNoBdU7/7xjXgxWEr3OQ2
         WgJw6ZbR6knZQYOCDGctgCcYO1zrxks5kuJlvKVTKlfYSo8ziZF/QSZQ4O1adiCSGxa8
         oPl2JODXspsKAXaNuYICJQ6CiDAv4rptFRB8yN62FubC6x7vx1k3swdcK3JBceSccTBg
         nScCIxW+hUmPrFtIcaDXQtDI8qPRNSf1F5z5cUTr1zj72+wCCJ+k3LNp7U1WF540t/Cb
         cBXg==
X-Forwarded-Encrypted: i=1; AKwUvBySHUlpi1zuP3n7adYp3AePxCO2w0tpQPAUFqtGh4qRqoNKhlrjYSrQtlQ3ewZLzpZxMc7qwQopQ0j19jR5W24=@vger.kernel.org
X-Gm-Message-State: AFuF++m3TxU7ayCdO8GZLmyVWCuz/XKiGO+WOBZB3MPaRF3A+vFAQWrA
	26+LrS6l1LVlFBI6b2G0UdSkkzcSPQBEXhRdRnjHkaCiApjPJe3Rdl38WJ6NYpI8JZs=
X-Gm-Gg: AYBFou0qcAJ9MSVyKveFM36DwNTOhY77XxpnsbYwVXDrzG/e47tdsiJ9dViSrcTSAqu
	RFfHPi0ObvUOfUixRR06XRh2pS52YseqBEtSu5vn8tZjHMUnU7sMOCXB0/G463YuyMCqHnWodLR
	dPkDLRKY0cf7ePTJwdoTKgKj6Vpg2Q2PwYOCFyT5dICnxen6EK8yG0MRe624Mg2Q/VS8gp2RHf4
	0ibqfkzsZuBsjgolZ3QwbQT6y1sN3jS/0SBHW3zV8AYKcwFmHXGFJdH7ETEmUDFLesHQJVdX9O2
	tSg8UtheUEwq+7XEguPrqVQAZKCKnFjzDf9q0/scGdrcTZAvcy595eyUaqEKtcclZfZJdKoPk0w
	NFp8hGVp0uKRccX098Bel62bmqIDBnjT6DW55qf4c6dMnZnxCXCJ/VXYCj1LQ/+LyVQort3rbn2
	R0DMkKy9mT5E960nec9e8pE3v6c8qSUnQRB84WZnyS8Eh3N8woFlo/mGHgA02wCoOk7GcgS6rz1
	po4Jyk8Gko58R2m6uTcJ+qbsrUNxyM8UmtZUtpS6lTDP9DAp3Q0y/JzuhZyO0rPZVBtO8xrM618
X-Received: by 2002:a05:600d:864b:20b0:49f:fbad:29be with SMTP id 5b1f17b1804b1-4a0276afda9mr95240495e9.34.1791122416978;
        Sun, 04 Oct 2026 07:00:16 -0700 (PDT)
Received: from localhost.localdomain ([197.51.72.2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f8ab4sm17450227f8f.35.2026.10.04.07.00.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Oct 2026 07:00:14 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: netdev-bot+sashiko@kernel.org
Cc: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/2] selftests: net: add an amt test for UDP_SEGMENT through the relay
Date: Sun,  4 Oct 2026 17:00:06 +0300
Message-ID: <20261004140006.93394-1-omar@blockcast.net>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <179106416321.434549.5874142465613964174@kernel.org>
References: <20261002212458.34247-1-omar@blockcast.net> <20261002212458.34247-3-omar@blockcast.net> <179106416321.434549.5874142465613964174@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Oct 3, 2026, Sashiko wrote:
> What happens here if one of the sniffers has already died?

Agreed, that is a real hole. A sniffer that finishes normally always
prints its report and exits 0, so v3 waits for each capture on its own
and fails the case if either one exits nonzero. A tx-on UDP_SEGMENT
case in which no GSO skb reaches the driver now fails instead of
skipping.

> Should GRXD be passed to check_err, or should the commit message be
> reworded to match what is actually checked?

Fixed: v3 checks amtg rx_dropped, and the changelog mentions the plain
datagram cases.

> The busywait return value is also ignored here and in run_burst():

Fixed in run_burst(): a helper that never prints READY fails the case.
wait_tunnel() still ignores it on purpose, since a missed READY only
costs one of the 40 tries, and probe.out is now removed before each
try, so a stale READY cannot match.

> Can this multiplication wrap before the total > MAX_DGRAM check runs?

Fixed: main() now rejects sizes that would overflow the buffer or the
seen[] array, for both send and recv.

> Should that be reported as a failure instead, given that this is the
> data path the test is meant to cover?

Yes. A tunnel that never comes up is now a FAIL, not a SKIP.

pw-bot: cr
