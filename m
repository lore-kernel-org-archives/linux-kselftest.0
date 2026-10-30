Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793381719;
	b=bru3B7rSqthRpgyEvOs4Oh54tdD222SwQI2+414SV0pA5WbKolzkGbhezRy3GkqHEpl4
	 PFoHjP+9GZjFIAq8Qw1ZFYq9GY3lHaTTkkHnUzONho5uQ+dK/IDPzG0zLEgS9YyP9ayh7
	 Gyx7id5KhD7fzO7yHXmSdK/I4kbjknYy2uTQd/SsfTuVebq8jYIJ69h5XNhx7vkTHuTtN
	 0aF85DVGqrCU0BOsOdQIU2RYr4F1y3C51DdbLzyQJZgO/hrOjr6ZPiXPLrOCRwgRftdxz
	 VvwKgqf9yvJe9yAic7dYXIaHAvr3bcV5ybyarPWPq7s+6/YEef+FZotVfNM3nFZte0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793381719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=l/eeNfSRBxI7r1cZpHBU1gvii6TqZFB2r4ECPtzWEQw=;
	b=l0pIY0JgcLM2p1i4Ym3/gRGDxjCBbJB7juZWXaXhCqpUqWUVF4F1jKbRiRtqyP3d8CZn
	 oAKKoLG6yit/VPwksjnwVNeFMA0V6HZJz3Tu7GsZA5/kbSwWHAe3LYDxOadzukf/j6Mll
	 k3mBjdACSVNl5EC6xhxxhYoVzgfTA04ybuZYFuwJzD1bOL7jMeK5oZRkaEeAW+lxhgyp8
	 2My6S/RlgDX828yEv1X1okm1NE91bNeh0qDSp6F+REtrRuxxx1IypTsmjTK7a/2/c0uuO
	 uRQ/BGAlM+t8R+jsJHXXzANYvKED55KguPiBWNaNEqWOHd7FTVDq4fZkP8uFGuhXV7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jT13e42U;
	arc=none smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F56606A31D
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 17:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28F56606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jT13e42U
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6790844c9b0so739690d50.2
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 10:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793381718; x=1793986518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l/eeNfSRBxI7r1cZpHBU1gvii6TqZFB2r4ECPtzWEQw=;
        b=jT13e42U4OFwVIhji0zXSJ4pfE3/a4dWKQOAKqkeIeQgijbHtJLL9YQwY9I6jRj3ud
         YiWf8veDgJJDdnzdLyaSOfPGptrhvLg6XSYzOoyl1HHX8CR9D9acKDe99ugeiK2ei2ZX
         zqqjweCm2NWIvjXKKOIEQO9pY4odBHSthTesmfgi4NVTzpsN13Qy7UG3CLpjbNWIEZ+s
         /TOtZWBeVdIi8qY/2Bgjxizys5OpX6sz70Im/fzSnJt98HxzhzF3ptnbE5Ur/qh8rxVg
         zxAbF86/VesZNCQ8yM8X/wWiOYrS/Jv+mPCwEkViDKyvCoBmFJGNTO7f1oMLrc7dc+sy
         em2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793381718; x=1793986518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l/eeNfSRBxI7r1cZpHBU1gvii6TqZFB2r4ECPtzWEQw=;
        b=JPy0r63KIYL0cgrbA8GeYkCcsQfa5OeEta2aXObldeEVPD1l3kEhop/kSWSr+PyyO+
         e74OMEjS75FhQk6gUHzjrtGO+S+WKDpC7iYYBHtAvTYklKmkbo7XCrI/6XzlNn6w8i6L
         c0nBMzEVosq1RiWQUYRmO5zO55iW42H4CLRUkT+bkI14fvTNk51t5hgiTN/Y19Rmkv+H
         kNBKazBfPQqOLXJ2Q7lcrBkG24RXETQqt22VREe/294RkIcQ3LjmKD4rJhmaJdS1h2Jp
         MOOiUv5InyKBmYXI+9MEX5y6yue6Z9canecqggAJDa65+lwPYemMcZF2cV9RhEwUe1bM
         TnRA==
X-Gm-Message-State: AFq9FYJb0Pb6t7JkuuUIKrNsFD3b63WEeCU+cr8nx+LsSQMdqXCVftt6
	ddi6kIDpoKnlYFqKcffUGgsrxfDL9x2+fL0QFwdqblVPSbRfTK/1PISZ
X-Gm-Gg: AYBFou0sr3wk+s5hwdG3iBC4vzf8vI+8o3EPzIKvvkhRGjZcz3HN+YCP2rmswriP2hT
	8HoYVEgnv7xWSKnRxOkA4bYVtnBe8VRqcU0rD1+5dPovdGA4WRQfCeRTAMCH9VPnazhRMECrF1s
	RRSdhFyae8F1kAsimgp62P9FkIzl44MLAbw+Tehl+ZgsNSnarghYOiysJs0HJMBPCIf2iezI7Xi
	3slmWbKFXDnKAURgJFl7X6yxQL4HodbaLrWOBTm0CwCpLCYb7a+HqeOdHa72us1tt8qhiBPMt85
	AnY9419hdBYKRpx4PwJJkNQ+tujXhyc19Jw24isYLMzcCidA42TQlLd6ywyfJkMrcjRyKA/UzW5
	Rmr2xP4pfqKgUGSZVr7f55+QfmejMXrwizjOZ435YY4fsVOe3C5znJ/MsL/hhlfOqf9SmVIMW5F
	vAIz5/Wv/7jcL98pNnpSSqFp+Bdj3iipKLOBa7nf7XfqozLF3KhTxiPgKD+svi90+qOz49/MXdl
	ZfZpmjBa+WHJvjy7gLxhvNK1YeQCRJML79UowP5fsn4dL/SPZ57KMEnSFUfhzSEO5kUUpjO/3yt
	xbFYWH9u4BOMmQgIz5UaeQq/th4=
X-Received: by 2002:a05:690e:1915:b0:677:aee1:9f16 with SMTP id 956f58d0204a3-67ba4edd4fbmr2440015d50.34.1793381718129;
        Fri, 30 Oct 2026 10:35:18 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:31::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf2aa655sm393389d50.10.2026.10.30.10.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:35:17 -0700 (PDT)
From: Mohsin Bashir <mohsin.bashr@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	maxime.chevallier@bootlin.com
Subject: [PATCH net] selftests: drv-net: pause: Skip support tests without link autonegotiation
Date: Fri, 30 Oct 2026 10:35:16 -0700
Message-ID: <20261030173516.1002250-1-mohsin.bashr@gmail.com>
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

From: Mohsin Bashir <hmohsin@meta.com>

Devices without link autonegotiation support may reject both link-setting
requests in pause_test_support(). On fbnic, all four variants then fail
in cleanup when the deferred restore of unchanged link settings returns
EOPNOTSUPP. Removing the restore alone would report PASS without running
any pause checks.

Fix this by calling require_link_autoneg() before pause_setup() to skip
the test when either interface lacks link autonegotiation support. This
also skips devices that support only forced link configuration.

The issue was observed in the fbnic CI/CD pipeline. It was reproduced and
the fix was tested on a local fbnic device.

Fixes: cbd8a536cd6d ("selftests: drv-net: Introduce a selftest for ethtool flow control")
Signed-off-by: Mohsin Bashir <hmohsin@meta.com>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 tools/testing/selftests/drivers/net/hw/pause.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/drivers/net/hw/pause.py b/tools/testing/selftests/drivers/net/hw/pause.py
index ca4a55e59c30..1537f88e0e77 100755
--- a/tools/testing/selftests/drivers/net/hw/pause.py
+++ b/tools/testing/selftests/drivers/net/hw/pause.py
@@ -466,6 +466,7 @@ def pause_test_support(cfg, pauseparams):
     supported fields.
     """
 
+    require_link_autoneg(cfg)
     pause_setup(cfg)
 
     forced = forced_link_settings(cfg)
-- 
2.53.0-Meta

