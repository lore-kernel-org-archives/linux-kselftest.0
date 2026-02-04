Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2AD423162
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Feb 2026 15:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770218409; cv=none; b=RT3lMwGK4F6yTgpZBPualBMrNI5XYdTjVvWo/GQD9Z2ZuVPwRcJc2lte7tN7XrU5zm3ygl0IDCzuu88ZeYpVE7drggW5aRRkADVftEFy1SkHjyLZTohY3631ZC4yhvCEVLTjQjxJ+UKY24SnO/mAl4ryn+utIpPDh0RYL4K7V6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770218409; c=relaxed/simple;
	bh=KwwAKDopHJRILboAztm5XFNPGYVwREHQpS8M1jc01Js=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dRfkFfddlMUeMhbJQU9vAg806uCG1lS/6NZ1p7AZZPTdMekN2mIQKrmRotEMaIfdQB7kkTbwAlh2VIMfI51CjV2jT02j74OSgyLa29aBoPZW7GjWiqGUQRH/uP/7EGiXH7gDt2BhXCdKiDb0yvcdgTWCISfbqzPqK/hFiyAr5OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dgH1Sw+Z; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dgH1Sw+Z"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-794ed669269so16732917b3.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Feb 2026 07:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770218408; x=1770823208; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1I7Mk9Hd5K7WwRUz0geICz1s9Dm05KM3tUh5w1KEMTc=;
        b=dgH1Sw+ZIWUdnbONrvvmk1pCcMofW/HNjGrLHxko3KIqjz8MNWs0j7X9tsQw8+rD2g
         hwKEa/y1fzqLfiQ2GBkFvkWJHprQbKY8TPoMagHCKSytZfQK0oCvwmWj3xF5MCsnnkhC
         XT9C6ojorOUZy5NeOcLc8G6tFl90sW6SNCN96m0c2MXUJUyCLWvl8UniBShkjI/4mgt6
         a2ChzLHZ1xIRHxh/RJcPu5BAKlqBCj5291U+kVVBtYnAFJrlfPfpMEF2aHc0d3QyxdnR
         rMHn0J74oZLeVWKYXY4/eWKOH5erDLp14wUMiPQK6YJNNF6TTPvQ5eBAalvqfBcXQkHv
         rVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770218408; x=1770823208;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1I7Mk9Hd5K7WwRUz0geICz1s9Dm05KM3tUh5w1KEMTc=;
        b=ivZwRqnNiymZGUCrhDcaE36W9xD52x0REDH/3dakkOYKw04sHWorkeh9uqO04mguSZ
         Su7YSlOofBB//6frwFWCQ07RDCQckDJUmfLDh728RXGrFGE5qLMkiMJsLIGSvyOv1dgN
         65OC3DIQ2p0d7ZP/S41OHPZxnS44ceF5clSh9QcQic7h5KZk+WcPbHh7mOx38lq2KlJA
         rqauhN/F2AZEX+UCHUG5vDqoORAHmd5jxq1TQ49U7hpDfpkRJPVY9CHCiwIvL44X0H2s
         +KExI3f+BxawYnHXQlVrQwMVOIIOL2Q5lw50/xEeUb5wrbE9SC8gO/94lAH7WZ9cf9rg
         xa4w==
X-Forwarded-Encrypted: i=1; AJvYcCVkrq+IfpBIfZrJsIIWgEqxMh/Wb+dJezJAI3hdLZ+xkK71dGzj0efZExN2gg+YD/tne8C9OJPCvcFsw4OfcUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxacK65xQ9Ec/zZ2Jupx72ZBfgQdClOIWxMtdD7A7c7LYvuNRWm
	EINrvSw+PWJkzOgowQVe1Ayhjq0rNDaAvAQvYgbA+kP+G4DQKMbZvHs3
X-Gm-Gg: AZuq6aJUwK6+VVQMHo0qevlD1UEIFtmGyIkmtdF3MyEsgru+kh/4P1pU2mewVLzK/TL
	P8Pefk0dik31jF3pZa/k+Y3ADzmg3WtdVogyZmCOhiy+j743iAl17FA1FPgMyymmEHH6/hIZY7N
	mN4AsdPgU8tX/+xJpHdwj5oyF3cOUpX1eDPxrsk/sRLqqVEdQ2PiB9HFuTSQcY3m56hI1s0Vm3Y
	+4Bx+c7By48aTBKH+NRYL59ma/Q8nqnnnJ1Rt6aqLqY/jh7pmHOjrr+asltnigbSoSDDsdblYNE
	PJcV5XCwGQ+3wHI8ABrjq5Vxc9cIsyT/4JU+cHdZznVTmjhrHhGmpnls5z55qNyiiSshjGg+QmX
	nAv7iZ2OATqf2GOMjwzI0MSC6jU8HVaBZ+90/KpeZijIQJolWFQILPh0wfyIOHTwHnqGBywdMJ8
	kWR975H6P2TLU6ryK8eNo=
X-Received: by 2002:a05:690c:7207:b0:795:905:c00e with SMTP id 00721157ae682-7950905c893mr14361537b3.14.1770218408089;
        Wed, 04 Feb 2026 07:20:08 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:5a::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-794fefd00b5sm23148567b3.43.2026.02.04.07.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 07:20:07 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Subject: [PATCH net-next 0/9] psp: support rekeying psp protected tcp
 connections
Date: Wed, 04 Feb 2026 07:20:04 -0800
Message-Id: <20260204-psp-v1-0-5f034e2dfa36@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKRjg2kC/x2MQQqAIBAAvyJ7TjBLib4SHWJbay8mKiGIf0+6D
 AwMUyFRZEqwigqRXk78+C7jIADvw18k+ewOWmmrOmRIQU64kHbWoMEZehkiOS7/ZQNPWXoqGfb
 WPg9D4ZBfAAAA
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Donald Hunter <donald.hunter@gmail.com>, Boris Pismenny <borisp@nvidia.com>, 
 Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
 Tariq Toukan <tariqt@nvidia.com>, Mark Bloch <mbloch@nvidia.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Daniel Zahka <daniel.zahka@gmail.com>
X-Mailer: b4 0.13.0

The PSP architecture spec specifies the need for rekeying connections
in the event of a device key rotation. After a device key rotation has
occurred, a new rx derived key needs to be generated and sent out to
the other end of the connection sometime before the next device key
rotation occurs.

Because PSP connections involve two different keys at each endpoint,
one for decrypting ingress traffic, and one for encrypting egress
traffic, there are two types of rekeying events that need to be
supported. From the perspective of one endpoint of the connection:

1. rx rekey: we need to allocate a new spi and decryption key on the
current device key to provide to our peer.

2. tx rekey: our peer has provided us with a new spi + encryption key
pair which we should use for encrypting traffic immediately.

In the case of rx rekeying, there is a period where it makes sense to
accept packets authenticated from either the previous or current
spi. To deal with that we allow a socket to keep a chain of a max of
two psp assocs at any time. If authentication state does not match the
most recent assoc, the previous one will be tried.

In the case of tx rekeying, as soon as we install the new tx key, we
have no use for the previous one, and it can be disposed of
immediately. The only catch, is in the case where hw uses a key handle
in tx descriptor state (as opposed to inlining the key directly). If
this is the case, psp core needs to be sure that any of these
unaccounted for references to key state are gone by the time it tries
to sync a deleted key to hw.

To deal with this race condition, the series includes a driver api for
implementing deferred tx key deletion, where the driver can signal
back to the core when it is safe to dispose of old tx keys.

Lastly, some test cases for rekeying are included that go through key
rotations and rekeying.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
Daniel Zahka (9):
      psp: support rx rekey operation
      psp: move code from psp_sock_assoc_set_tx() into helper functions
      psp: support tx rekey operation
      psp: refactor psp_dev_tx_key_del()
      psp: add driver api for deferred tx key deletion
      psp: add core tracked stats for deferred key deletion
      mlx5: psp: implement deferred tx key deletion
      selftests: drv-net: psp: lift psp connection setup out of _data_basic_send() testcase
      selftests: drv-net: psp: add tests for rekeying connections

 Documentation/netlink/specs/psp.yaml               |  14 ++
 .../net/ethernet/mellanox/mlx5/core/en_accel/psp.c | 101 +++++++++-
 .../net/ethernet/mellanox/mlx5/core/en_accel/psp.h |   7 +
 drivers/net/ethernet/mellanox/mlx5/core/en_stats.h |   1 +
 drivers/net/ethernet/mellanox/mlx5/core/en_tx.c    |   1 +
 include/net/psp/functions.h                        |   6 +
 include/net/psp/types.h                            |  39 ++++
 include/uapi/linux/psp.h                           |   2 +
 net/psp/psp.h                                      |   7 +-
 net/psp/psp_main.c                                 | 101 +++++++++-
 net/psp/psp_nl.c                                   |   9 +-
 net/psp/psp_sock.c                                 | 213 +++++++++++++++------
 tools/testing/selftests/drivers/net/psp.py         | 133 ++++++++++++-
 .../testing/selftests/drivers/net/psp_responder.c  | 131 +++++++++++++
 14 files changed, 685 insertions(+), 80 deletions(-)
---
base-commit: 9a9424c756feee9ee6e717405a9d6fa7bacdef08
change-id: 20260202-psp-3c8e2f65c5c4

Best regards,
-- 
Daniel Zahka <daniel.zahka@gmail.com>

