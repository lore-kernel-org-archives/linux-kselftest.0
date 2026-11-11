Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794419260;
	b=t3nVOH5YMG1Iqvk9mkEGkgFikkyt5azvM/mbGnd2TATxKA6mMP6yLTaniQhrUb+OqfOh
	 5Vj8JqItbAReL3ZVohzVEWjX3cVTM5K6JTG5+9pfMT1odJaDeth2FTdN4p742hYrLWXCd
	 BjOtdDiOuQ1b16prm3AEfsJsYsVYBSxZ59yjMnD/A6irlcliulA7iJP8aB8JZ17pWu8ng
	 pmolJgX2eTDXbAYsbboC131CjBrHN9iP1g7vzElMhgf9etHaX5eSm/QzsVEnCYFgKjuWJ
	 FC8MYc6kqDvVVipeHV0IPXx8YaZnnXj84bV9jGv5zstYEkJ1VzVb91TTgXz257zx8+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419260;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4MaTdFGm3iwJfcX3VGdFborPM6URWf3gTu0u7KO9Lxw=;
	b=I5SVKpDMUOxv96Ntyzrq+yzWD6dqqHn+obm/ID4x6IfM+Pf/mQRNcbCVVyFDr+qLVJ1z
	 b+/eD7PnMpdLn+YXAyV4/l0DXCxOuGY2lRWp/QdrpMjo1YCzBA8OuWX68zfkvNFVzeIk+
	 FK1o6XNUcU6VgEYWbAy+zf1YDeecz1H6UhXQZCqh1BURCVQ7q/LVDAI11D+Ivwo/xq+qb
	 x6C4kF/Tuuip+vaoyC9fp+HphxaMCdG8uQZwDOesdtM76rpomkYG2cXqA1befZDNxY6hm
	 qwwrwNJko0iTmam8dDbvuZnbe3HDMKGJwG6K5haBgTuVmHC1F6vsr7+dpaYAnN2jO8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X9iQQDXK;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEA4606A31C
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 17:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AEA4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X9iQQDXK
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67c246c0c60so104642d50.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 09:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794419259; x=1795024059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4MaTdFGm3iwJfcX3VGdFborPM6URWf3gTu0u7KO9Lxw=;
        b=X9iQQDXKuNjq+myrwm8V4PXdcRhRXJAvcHYei6UT/AUaVZFNEBxcYcvMm86gIAU9sp
         9fiv5DnqAq4z5pG4pFLxxnLrVyiKu7DkyjkiZx9kEWM3cBVIz495kFM5maT2g9nuweDC
         b72QIY86lc9LZwtjGAC2uYkst3x4CwQzwWb1nGOpDOEATGbdtF6jp18tvNljPOKs4e+O
         WW5cNYpzFY8lrKExK3+jIhhthMlMGOIWh28yvumgj5zqcB6L77liKuiOLthogauVjPAq
         P/0go/3r66tFxEICnaM12TEa4SgzEBr+7jQkMyBdU0xO6uXRzzVAgeyDQA8pMG6ZqNu6
         5KSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794419259; x=1795024059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4MaTdFGm3iwJfcX3VGdFborPM6URWf3gTu0u7KO9Lxw=;
        b=0lUp1uYSxlHjS9SQn3CFp5QUhsT36DvBn2zwhDmap5rOFWJnTyGbL42FBhS0r6WswO
         VgzeahnoCpmy79Du1UBCEKrO/InioEyx8An936Tj47087mtzYXTCt6zLxjaSZghXg2p1
         9iXgzPlSihHFHrr9neulMVNNhxwH2hNZQgxunNTpSyDXOaa/a9/BXlvEXqKYT0T8uIWo
         OjLfQaWnOi1Y+uUk8/mQTTuY63lY6YmSg7nATVw5WvcY6P7WqMY6B5GRuxtoyBhgXdF0
         SaEH4xza3xPgy084eZYs+qDzUAhAyMQl4t+/TJ7KtS4VhQLz/oGOBzYSYvRPNFRBVsOd
         vqYw==
X-Forwarded-Encrypted: i=1; AL+hErHWWD2Rb5jKuFoshu/S6KYRjfYKgfH6hrR7w3gO1g2uYZRcyfi6VSniUxMqNfxp5BiUS664ikFjtmLzJX0xVnU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VTM+D7d9mmTXBVlucxkSUAH5fPFChn68hJBvBCHTbyroyLxcY
	CgRexlSSpA2KoLTnb8M2Hl4MiK3UXy6rKGzTduLk3v5DhWPw2VnZIOjkgsPBqr8dRBo=
X-Gm-Gg: AYBFou1fmH9T97XKabYVx7ZfHwVa1DTEhUUFRg0tCtqTjT1LWXpiuDMfSNV/oVV2ryO
	3xXVVRxu3Y/0bl5GeJOaW0wxsDcxiMuyc7wgd25uG9UcOVpJaCjZkg8VqvDoEquPwVBAAaO7TRT
	QgaPucxTpqUMgJvybG4p9QTnuzQQB6GWmTXLiO2+RdhTZhy5n8wlnzOY4rk+0/9OUIK95jV+C87
	4HkSi0Y6j2R1wKCJ+wZ8xZ+H5E+Kosbh75tUziEUbemrWmjQSqHZjfksjuUZ4jcgftXESlqlu26
	iTrq1Og2TPH4lqFuWiW8J3AElXCAkZvR6EGOerSQYCMlgNxCkQ4/bBOYe9O01Qsdy3FdjCi/Cur
	pEtcTrccjROfmOfGLKeVXekcEM1xdffHxskXKyLv7Ou4cUR1HC3UALgWlEMKguoiPiV9KzbuFZL
	oWgV5Eca/jqMgJa/LlfJ8NhD83b0nt82pWs5ObhUETUZ6PveMAmBTIG4PBvk4BUr7UwiNqxRYsM
	MsczO7HbZfo/xBN4wn2Z8GdrdpLPs4D/fxvc7CqRwJm8rbl3+B+Ld6zGnFDqX3ddL+M3g6sJhjG
	BYn7a+K5L8YN9zkknONMbDl7n3XOHl3okcZCoTuCZL4Ybg5wJ7aRCg==
X-Received: by 2002:a05:690e:dcf:b0:67c:1fba:b450 with SMTP id 956f58d0204a3-67c788aaf25mr106177d50.16.1794419257699;
        Wed, 11 Nov 2026 09:47:37 -0800 (PST)
Received: from VPN-156-197.vpn.usf.edu ([2607:fe50:0:f802::4046])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589c6f24sm5077708d50.12.2026.11.11.09.47.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 09:47:37 -0800 (PST)
From: Juan Agustin Niccolini <juanagusnicco@gmail.com>
To: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	ncardwell@google.com,
	kuniyu@google.com,
	josef@toxicpanda.com,
	jbacik@fb.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Juan Agustin Niccolini <juanagusnicco@gmail.com>
Subject: [PATCH net v2 0/2] tcp: Fix the SO_REUSEPORT bind cache admitting a conflicting socket
Date: Wed, 11 Nov 2026 12:47:02 -0500
Message-ID: <20261111174704.24312-1-juanagusnicco@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The SO_REUSEPORT bind cache (tb->fast_*) can let a socket skip a bind
conflict check that it would fail, so an unprivileged user can bind and
listen on a port that another user is listening on.

Patch 1 fixes it. Patch 2 adds the reproducer as a selftest.

v2:
 - Shorten the changelog (Eric Dumazet)
 - Add reproducer as selftest (Eric Dumazet)
v1: https://lore.kernel.org/all/20261110080008.26112-1-juanagusnicco@gmail.com/

Juan Agustin Niccolini (2):
  tcp: Fix the SO_REUSEPORT bind cache admitting a conflicting socket
  selftests: net: Add SO_REUSEPORT bind cache test to bind_wildcard.c

 include/net/inet_hashtables.h               |  2 +
 net/ipv4/inet_connection_sock.c             | 15 ++++--
 tools/testing/selftests/net/bind_wildcard.c | 54 +++++++++++++++++++++
 3 files changed, 68 insertions(+), 3 deletions(-)


base-commit: 19a227903e65c7a9c179156485660a4e017575fe
-- 
2.43.0

