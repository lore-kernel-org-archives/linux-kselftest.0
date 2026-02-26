Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D1B2D8797
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 12:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772110429; cv=none; b=kf1uIaSn9Pag3QNC0R/P1qQhqFAH4r9/MhDUQtMJTt1fipJylHtTcGsfVh1UACGYasOlCeKST33c6jHpR2E7jDnlMXcwHdf2lVewXmBbqxU+DJ4Upxmv+qAk4bbUyUK8hETzt2OPwvo69lIxqfhW9eB83mfW0JfQtqacGXcSiJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772110429; c=relaxed/simple;
	bh=dwiStO/chK1OLFBK71wNHFWP6SlMqftxFvbc+vvnPhU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dvlIMKtfub2KwyppO4XIClql92EYWvUu7xjI4kI59H7hL3xvzn8J3pCpSeQUw9XV41eYtyya3akJgb4qw4BPwhJbLwiksTgRtmuBEB0w7iNO2PP4vpwMc+vPNvGW8fqWWcfEDjam8cArOBJbRTJl/c6ZNHA3iCgTYXlM+Jeycx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d4Fy2gX+; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d4Fy2gX+"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ad21f437eeso5691085ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 04:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772110428; x=1772715228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pU3Nlc8ltUu4dkb2Y0/KvgT3i+9qT+K1/h3U6dSw2Oc=;
        b=d4Fy2gX+XQ4X9Hnh9IH86jGWxpldlwGJQZwJgM/fyA2arJQcp3NSkJFUtHNbWSZjVY
         mqmgdovi+ztArNPF70hMQbuJpPcJ4nI5hsUJfx6oW0euYK9hY5qWRgtYN1vq04wfr59n
         pwpXxwmbc6Z/7qXDgKWhdaSf8ZL3V7X3UYdeZ+56t15UiRU4RxEzaZ73FeddH684RCwr
         K1vPmmEggsiKp+z+2XnpGlQJ4WNDi12zbUhzPLLbRfKJXthRRS7QZ11hMeZKlNNnXBa0
         ivX7zkAYzrXHilb83NYqD+WNM0RQvX7ScuXPg/fcbpDAKdB38iXnSZZnXvxWe/KuWl4k
         7VMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772110428; x=1772715228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pU3Nlc8ltUu4dkb2Y0/KvgT3i+9qT+K1/h3U6dSw2Oc=;
        b=iFkIh2j1SZjixG7E9d48YljXZFwgbs2bXDGGjDhDQgVT355uqNCw6PRxcLDBUVaV2B
         R9+4SUjZZ5g0eOZ+topH3tbghXHifaq0T2p2htZz9rg67Ci1jR7/arAzqh9sF8Li7Kzw
         eVXnlzPfe52wj6uCGLonqX4NT+FFOk0cLIXdjv3kZTZHiAwMCal1SraweubVASKVTeHm
         NtT7BRCgqFriZ+Z1Cvl9iDax0fZVL2IwPwbfXVnGgUlIQXfrqCjfifEBpgBIvY0ZVsV7
         ott0w5ZStrut3P0dLWgOvtX7fofSJGqIzRgECRgTsLVXjYIgHHGYEE5TPm1cIkhxv0P/
         SfUw==
X-Forwarded-Encrypted: i=1; AJvYcCViB/GeYBi2XlR6aYG5WzbNWupcl6+zD465AXLnZerciGAEllsj/CzqMzjC6UImKqCz8T8cEwJbTsyHHHxajRo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza0Rk03D1+Spt2FX8ldayHGqvzYSLDWPDuJew++z8s3fW2Qcgw
	VthgfryDIKp9Osng+wa0nSUxEMchp/TbjC9iRMGZq3pk6hbjF0hUrP19
X-Gm-Gg: ATEYQzwXObHQIE2fgOOzmWScAkcwari7zbew8SwXavGR7/FhWGKHK+dXr231ocIjpPq
	t5eJhNfTUKZHEzST4jZu3Di3lU+C6saYszlr2FuYty3GblHBMj3pt0GlouPPoxKUsGN1SJWfFDb
	gmwVE5++sIZbVEBWowTNYSSezTtZHOQYhOdV8h4GR0hjivNC+ZHjiYQD7dq7l+XhBXOSkTDLqBm
	2+qW43EO1WVJmkhDEGgQnNxLtwIjudMJc5NOxiPWCwo8YHgyvE035F3xrxpncGZ19N+d7WAX/4w
	ewsy22/jSxqCa61Vd9IJzc1NEZLLCmvRwmuhcu5OUqL5u/FCfRwBQ82tGHwVGp1hZy9uc327Vos
	eYk4mYV2GWHXY7bfyTRZqcgeErcpPkCpOgOMRPRaC1vVp0wNlODqVBJD643EOdA+OH7YBpHYNWr
	3D56bkF8ijGkYnsc5FMdlmxzys7/4=
X-Received: by 2002:a17:903:2307:b0:2a9:320d:285e with SMTP id d9443c01a7336-2adf79c86ecmr24944385ad.27.1772110427685;
        Thu, 26 Feb 2026 04:53:47 -0800 (PST)
Received: from fedora ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb705b53sm25276715ad.92.2026.02.26.04.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 04:53:46 -0800 (PST)
From: Hangbin Liu <liuhangbin@gmail.com>
To: netdev@vger.kernel.org
Cc: Jay Vosburgh <jv@jvosburgh.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Mahesh Bandewar <maheshb@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Hangbin Liu <liuhangbin@gmail.com>
Subject: [PATCHv3 net 0/3] bonding: fix 802.3ad churn machine and port state issues
Date: Thu, 26 Feb 2026 12:53:27 +0000
Message-ID: <20260226125331.28147-1-liuhangbin@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series fixes two issues in the bonding 802.3ad implementation
related to port state management and churn detection:

1. When disabling a port, we need to set AD_RX_PORT_DISABLED to ensure
   proper state machine transitions, preventing ports from getting stuck
   in AD_RX_CURRENT state.

2. The ad_churn_machine implementation is restructured to follow IEEE
   802.1AX-2014 specifications correctly. The current implementation has
   several issues: it doesn't transition to "none" state immediately when
   synchronization is achieved, and can get stuck in churned state in
   multi-aggregator scenarios.

3. Selftests are enhanced to validate both mux state machine and churn
   state logic under aggregator selection and failover scenarios.

These changes ensure proper LACP state machine behavior and fix issues
where ports could remain in incorrect states during aggregator failover.

v3: re-post to net, no code change (Jakub)
v2:
  * set AD_RX_PORT_DISABLED only in ad_agg_selection_logic to avoid side effect. (Paolo Abeni)
  * remove actor_churn as it can only be true when the state is ACTOR_CHURN (Paolo Abeni)
  * remove AD_PORT_CHURNED since we don't need it anywhere (Paolo Abeni)
  * I didn't add new helper for ad_churn_machine() as it looks not help much.
  * https://lore.kernel.org/netdev/20260114064921.57686-1-liuhangbin@gmail.com
v1: https://lore.kernel.org/netdev/20251124043310.34073-1-liuhangbin@gmail.com

Hangbin Liu (3):
  bonding: set AD_RX_PORT_DISABLED when disabling a port
  bonding: restructure ad_churn_machine
  selftests: bonding: add mux and churn state testing

 drivers/net/bonding/bond_3ad.c                | 97 ++++++++++++++-----
 .../selftests/drivers/net/bonding/Makefile    |  2 +-
 ...nd_lacp_prio.sh => bond_lacp_ad_select.sh} | 73 ++++++++++++++
 3 files changed, 146 insertions(+), 26 deletions(-)
 rename tools/testing/selftests/drivers/net/bonding/{bond_lacp_prio.sh => bond_lacp_ad_select.sh} (64%)

-- 
2.50.1

