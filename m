Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D59617D2
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Feb 2026 01:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770858110; cv=none; b=YLmXbnrpoXOvYDNkjzGtXJOcuFKYXIH9fqbunYBqH5gCvV/EgLuA/zslXM2gij+BDGBMX47PQg7p3ADxIB5zL4UCVAbHFqCRLvyzqzSZ6wkM8QGNCQB13tyc1GaaY3L+gGzMGLB+7XHggFQXV9CDgUXsyPMZGVgukEpAM8BIt1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770858110; c=relaxed/simple;
	bh=NNigq33vVJIbcoGBYh+URUoEg1c2javLVb9mFublwzQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fUGq/mcS7MW8QTQGsKwQxNoYlUDguUF7++xYkTH7rFyKlZr1SEnnGcbbHeej37ddYRLWIMJtX4SriW9MFaps3ZnbDfs0KCL1DUFuappLvVONQWLzylh8du5LaEyWb/B7Steqko8gfU1Jj9NltvIqdP8jaausfSh5jx6DfGmEAPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLiqsZFx; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLiqsZFx"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64ad62a294bso5199330d50.1
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Feb 2026 17:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770858108; x=1771462908; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9LHpONSdJI596ZCuRsuiRBi+ORL1P4Wx9UbBWVB59mE=;
        b=GLiqsZFxx9x/nv0aHRNYK/wic7FNHwBcyOnUOzjEzoo8fRPmKK9mE75mzxhV86SWXJ
         xQ+AKAyVQqmdnPddcIC8GaCbsVBQEKw7tr7A0ei/3qfmfWw5XeUVmrrBjyJr5fz9Tzpm
         HrQpjRDccZUCIrmPTWWgv2OJp33mqaJwjolS/dW57eVTM1eD6U+EkkAsnnV9159Mj5tQ
         /S5bjpDQ8J+TQKB2ifdnOP2lAyywfdO7ZXQC8cCW/wu9k1HDkmyqjMISOGJbaR1AQw2+
         xAhX0LSQAdNWNbbsnwEidqZXd8v+3cjQ0NG2wydDRuQ+gymbGgOu4WTvBn4oeh7DgfM2
         va4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770858108; x=1771462908;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9LHpONSdJI596ZCuRsuiRBi+ORL1P4Wx9UbBWVB59mE=;
        b=IglMwcBEsmmqtR+jGv71eqWa/D91q0ddEa+xz9SyX2RcrNNTIWHNHxZx3f55ncBArS
         m2LdD/SuOP/z8S+z5zV6Zed6kcrhtRg6jJIQ3BdIBM8VPCxsywtmpsPFDKNpxUIqJfkZ
         LZy6MLJI384D8kqbtLSoeQ+xl/wrHfSBcK2sDqkzqeSzF3JGM4QzXVWikt50cqZLkNk8
         XYCFRuZxJ8K0h3KjQGbGu2nkgiNbL5Fnm9utb4KaciO5e3CrkAYv0kGRhxKeSaP0uQ5s
         Vk8zd6jDKtDP2wzp/OQ0HRohZvaU5BXLHtVp0v1gF7ycQOU8n97Srbggc/EB5SsZi0Po
         1ZNA==
X-Forwarded-Encrypted: i=1; AJvYcCVwOu1YNn8WXhgnclqyR2rrpMVyBvrFYanPT5zeL/bLqjstShN/AxnW/ez6KwSpO57FZkGN3/h/iE9gH4x6iEo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRtENEr73oDmq/XnDnIKG5Z2pFEEJE31MIparPJJOfhHixr/RQ
	E0kfHYZH7rzRcHUP6rCNrXioD4NeN3x7onTxPyoUVYB6c+xkfCzgye7w
X-Gm-Gg: AZuq6aJG66W5aquF7WMt95J9U5joMrpvrUfZWjxKD8R6Z/lkoaR6i2C1y0Y7+VeZRSZ
	qFrVgD/g66fgXIN60gh11IuwM8Xwh5bmGTtvUPe4EsnCeATXmxUrISBsYwn88kJt1Vi845+boob
	TGIQvn2sDKdoLkf6breZVsC7175+ExZsK4VLXeSIZw0yztIx2V/sY8bo2CngYvrNPRPFsTnSe0j
	Kvi8cHiEtiOgTY7hrx0UKxBUc7oxe6//r0qYW9JOVv19WEDL1dUEjFjv61oO5qbs3PuF+I5Dsva
	PARxUU7uHSWt7jX5oIXP1DUXZYv4TLn0KHBZYrLXhMvHkY5ZMTbZqV8sfTUn1oMdzEyXvCicaB+
	yE3NS8TzRwc/bwcrWgboxyuvf+sCMUBd2pkb0bLob2kErFsIZNUyHkvj4Mqlut9PhUdHaGGxD73
	PXcAbaKMy/jdcfVQFy5mrSWQ==
X-Received: by 2002:a05:690e:18f:b0:64a:d605:dbd0 with SMTP id 956f58d0204a3-64bbab62feemr790973d50.92.1770858107959;
        Wed, 11 Feb 2026 17:01:47 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:4e::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64afc83ff82sm3573234d50.2.2026.02.11.17.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 17:01:47 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Subject: [PATCH net 0/4] eth: fbnic: fix and improve header/data split
 configuration
Date: Wed, 11 Feb 2026 17:00:40 -0800
Message-Id: <20260211-fbnic-tcp-hds-fixes-v1-0-55d050e6f606@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADkmjWkC/x3JQQqEMAwF0KuEvzZgq4j2KoOLtkbNpiONyIB49
 wHf9t0wqSqGQDeqXGr6LQjkGkLeY9mEdUEg+NYPrXeO11Q085kP3hfjVX9iLN3o+inGFNOIhnB
 UeQOBPihyYn6eP5gCKWZqAAAA
X-Change-ID: 20260211-fbnic-tcp-hds-fixes-e38149aabab8
To: Alexander Duyck <alexanderduyck@fb.com>, 
 Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Mohsin Bashir <mohsin.bashr@gmail.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

This series fixes TCP HDS configuration in the fbnic driver and adds a
devmem selftest for the intended behavior.

The issues fixed include setting the correct CSR for EN_HDR_SPLIT,
adjusting the hds threshold clamp to avoid long headers overflowing into
the payload page, and configuring the device to use L4/L3/L2 header
boundaries when present by programming the DMA hint bit unconditionally
for all steering rule types.

Prior to these fixes, small payloads fail devmem.check_rx_hds().

Testing:

IFC0=enp1s0
IFC1=eth0

export REMOTE_TYPE=netns
export REMOTE_ARGS=ns-remote
export NETIF=$IFC0
export LOCAL_V4=192.0.3.1
export REMOTE_V4=192.0.3.2
sysctl -w net.ipv6.conf.$IFC0.keep_addr_on_down=1

./tools/testing/selftests/drivers/net/hw/devmem.py

TAP version 13
1..4
ok 1 devmem.check_rx
ok 2 devmem.check_tx
ok 3 devmem.check_tx_chunks
ok 4 devmem.check_rx_hds

To: Alexander Duyck <alexanderduyck@fb.com>
To: Jakub Kicinski <kuba@kernel.org>
To: kernel-team@meta.com
To: Andrew Lunn <andrew+netdev@lunn.ch>
To: David S. Miller <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Paolo Abeni <pabeni@redhat.com>
To: Mohsin Bashir <mohsin.bashr@gmail.com>
To: Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
Bobby Eshleman (4):
      eth: fbnic: set FBNIC_QUEUE_RDE_CTL0_EN_HDR_SPLIT on RDE_CTL0
      eth: fbnic: increase FBNIC_HDR_BYTES_MIN from 128 to 256 bytes
      eth: fbnic: set DMA_HINT_L4 for all flows
      selftests: drv-net: add HDS payload sweep test for devmem TCP

 drivers/net/ethernet/meta/fbnic/fbnic_ethtool.c   |  3 +++
 drivers/net/ethernet/meta/fbnic/fbnic_rpc.c       |  5 ++---
 drivers/net/ethernet/meta/fbnic/fbnic_txrx.c      | 25 +++++++++++++----------
 drivers/net/ethernet/meta/fbnic/fbnic_txrx.h      |  2 +-
 tools/testing/selftests/drivers/net/hw/devmem.py  | 19 ++++++++++++++++-
 tools/testing/selftests/drivers/net/hw/ncdevmem.c | 11 +++++++++-
 6 files changed, 48 insertions(+), 17 deletions(-)
---
base-commit: bf9cf80cab81e39701861a42877a28295ade266f
change-id: 20260211-fbnic-tcp-hds-fixes-e38149aabab8

Best regards,
-- 
Bobby Eshleman <bobbyeshleman@meta.com>

