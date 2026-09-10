Received: from mail-oo2-f34.google.com (mail-oo2-f34.google.com [74.125.231.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FA849E12D
	for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 23:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789083979; cv=none; b=PpH3uUXzeRB4DXZC2y13yy1TxnRLmHvZeJVo2i/glx1dC8rC8B30a/CHRSZKrKUUwJex+hk9EVl6xL+qjs9VrAK3KTk7NcCyuKN8F/EL75ysifA6yYvcKXWaHyU6q8rnxCMJJffTscDQfBiOYIG28LajwdyQCyWhFyZTgW2cTgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789083979; c=relaxed/simple;
	bh=wtS7XfPu0s7QNj82EYOO3AJRyw/OaqisjEjeM1X++/s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ULrHpZekMVfrGgXs3nbfbdv7nn0LxkJGw+/dNxjNPLPKZWJrUmRIDzzSpLMKOjV1U7CIGhcf2Kr4aVtuGJ+1TQgJCBYYNX7s7HIE8t+FcDwkOF2v5cVv8c5NiV2C7mhtHQQxUJq82JuUWqrGpMVFYWiNdnX/Ly8AvfVmQX5HUsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VoT1jAzF; arc=none smtp.client-ip=74.125.231.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VoT1jAzF"
Received: by mail-oo2-f34.google.com with SMTP id 46e09a7af769-80032c08611so263970a34.3
        for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 16:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789083977; x=1789688777; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0Upxo+7rV5K9D2K97LlL1BYgX8SH4f54xRCJJNuV6UM=;
        b=VoT1jAzFsIvrO5kWJU2Iu68ZXSDF8EQ07ug1D2mqKmcEcXzNZI7F1b8A7JFO9+8Uhf
         gkJ3ZoYsV35Sy3PZDFZBbZzDz0C/sWiE7j7c9wlFFjlgxNTk9ARrl+skjoBgYSU98lWP
         50hRN8j7q1nZTAS8dWbxSrJ6bv7qsKHVDr5a5zEMbMTSgrPDdELOMUT/h2zhSICLrFPB
         wtjR2J+tt/ncujh+GQu7VOp7RoSoLYDxmHYC1DcxnxHV1B9ZJ3N1W3/U5TSmK7N/AijT
         IoFy9pP5hw5vgZ6i7alcspJNkRW32/lZ7i8vnO6no87KnNQn4WX6tQ3OI3LgIHQdj2+Q
         Pj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789083977; x=1789688777;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0Upxo+7rV5K9D2K97LlL1BYgX8SH4f54xRCJJNuV6UM=;
        b=gAJksAv5ncAybEKDrg95Pw8/PMXNzdiuFM/zZNlv51zbFUtP73FCJUpx3lgo8UOZYj
         7+C9q+Tu/MbWl7lEvc8qi718r1qEoUlJpXWci4h5UBP13Bs+hdy1QBmKcWCI4NOTSnuB
         ELcP2rRfPog9WW0ADJuhr927jgcJHafbxaZgU9MfpDYj8YWPl2BXjGRHqC+Q7GmbZri9
         Egcz60cojx9FI1wX9MqknABvNfYO+1LC00wk2grXE8lW2qqhze1rgcdVuIKhs2RNOZ0s
         /IAMBbgCnbGfkOjVJXN0MCAgC+TWpoVjYAjfwdGvxvMvOhiDgnAWEx7ksp6EGzFeYr3R
         mFKw==
X-Forwarded-Encrypted: i=1; AKwUvByeFSNNp37qicXHEV2Dw/m0B76XB0qQrsRdmFJjjgXFEYp09lv8ByOfnqMQ8B9y7kBJovB1tpxg4Tu/CDMqw5A=@vger.kernel.org
X-Gm-Message-State: AFuF++m1iIlHtaoMO3h7QTTSBMnRKT8A+fkttrtNmXLPkFpd9NzA7Cdx
	g8Hzcj5gT8al0y6ZlnqLu7VR62wKmMwMA3GoEqRQnrNERHrbTyxicDHz
X-Gm-Gg: AYBFou0UMW2ZiNWH4BXHxG9juNHKh1lZkxnEEEBK3fWy2y+YksGUN7qM6TiQUSyemJD
	pHc7UbNBtCOsACXLewrQr4L7SCDKtMA/c6ki4MOcurL5iu53NOVzArujIWymsrHk4BrIPTPEwqO
	rwczm5UIfZT4UlJ2cRXnri6y6WqffcJ+dG8YIC09yG1Nua+aFE7iQffpWnDOTL8tciHiyvvd7/c
	zJtSlpF8yUaCle5zYYQ5AGvYRBXujxYG8u9zw8lWUSlJ4TA02MgT0HHOU1WqQW9IdhhbSJvsjQ6
	/1JYkuk/vl0tUyH8QkX9FabwmKOHoY5yiym/Bn0JMjRRoAS4N6GxgXmcRnzj9HVVERm5ZH3esUL
	MKzcC8tVopcyesEwNADCllm2N69uSXPlMiDUqwJaU4xCbJa8pivecD9A5bllBrtBMwa1pL2kR1f
	h/ajqt/k7QmYl4abAUBGudJQMhZeMNp09oNpQ9VEbdbdFRXg02BHkQmh3O4OZLK0uWG1az
X-Received: by 2002:a05:6830:43a8:b0:7e6:8955:c52d with SMTP id 46e09a7af769-803fca19150mr1910314a34.5.1789083976972;
        Thu, 10 Sep 2026 16:46:16 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:72::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f59e04a0sm914483a34.8.2026.09.10.16.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:46:16 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Subject: [PATCH net 0/2] net: psp: avoid conflicts with skb->decrypted and
 sk_validate_xmit_skb()
Date: Thu, 10 Sep 2026 16:46:03 -0700
Message-Id: <20260910-psp-ktls-fix-v1-0-e3f30aaeca4e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADtBo2oC/x2MWwqAIBAAryL73YJJD+wq0YfkVkth4koE0d2TP
 mdg5gGhxCQwqAcSXSx8hgJ1pWDeXFgJ2RcGo02nrbYYJeKeD8GFb2x650zvbdsuBkoSExX970Y
 IlGF63w+ME7XqYwAAAA==
To: Eric Dumazet <edumazet@google.com>, 
 Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.13.0

Sashiko's review of commit da630d1da2b1 ("netdevsim: psp: drop tx key
ops") [1] showed that there is a hazard between psp and offloaded tls,
where both can clobber what the other set in the sk_validate_xmit_skb
callback.

It was discussed further on the mailing list [2], and it was pointed out
that there are conflicts with psp and non-offloaded tls both using the
skb->decrypted bit.

The simplest fix is to make psp and tls mutually exclusive. This series
goes a bit further and makes psp exclusive with all TCP ULPs. The PSP
implementation that we have is not designed to be used with any TCP ULP,
so don't allow a socket to have state for both.

[1]: https://sashiko.dev/#/patchset/20260903-psp-prep-v1-0-d47e9c4c375d%40gmail.com 
[2]: https://lore.kernel.org/netdev/20260903-psp-prep-v1-0-d47e9c4c375d@gmail.com/

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
Daniel Zahka (2):
      net: psp: avoid conflicts with skb->decrypted and sk_validate_xmit_skb()
      selftests: drv-net: psp: test PSP and TCP ULP mutual exclusion

 include/net/sock.h                         | 11 +++++++
 net/core/sock.c                            |  7 +++++
 net/ipv4/tcp_ulp.c                         |  4 +++
 net/psp/psp_sock.c                         |  4 +++
 tools/testing/selftests/drivers/net/config |  1 +
 tools/testing/selftests/drivers/net/psp.py | 46 ++++++++++++++++++++++++++++++
 6 files changed, 73 insertions(+)
---
base-commit: 78445023439506ebd83b86d40b1e428a3b309d4a
change-id: 20260909-psp-ktls-fix-47aa27d955f2

Best regards,
-- 
Daniel Zahka <daniel.zahka@gmail.com>

