Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D833B058F
	for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 21:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788213118; cv=none; b=HvE5HTrt2P5g2W6r/ThrQVXJqJ18Zz2P4JGylVyaR55kORD2dcd3ANuaqcRhIdD9+7BkHn6fc9nF3DmbIInMs037bJSzGsy8zFTuXoW2EoiXGVvOXt8bfnYsM/mrTa8cX6yaJQEuUP0SXWKhBVBlAho9ghbD7c/bucAVkvnNYr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788213118; c=relaxed/simple;
	bh=wMZRcjI+OWyvem2irRl2drG2Q+YoShdAEnweMvtF1GI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=heHQb5cf8sAwrILy/zDnHXwNBuLU8evci+WAsKsB3vJIXzodQovNl6vtRGMZ9a3tuSUkhPf3Om2YnPcgYfpsARQ+ToodChq+5t0JNhn1B7hv//bpYxQxRDHWVPZRFmFQj9AWmGXgvMcHLpafISvqbkwhYctiiWp6JyStK8UgV7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qK7RUyO6; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qK7RUyO6"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b5e1340faeso118979e87.3
        for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 14:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788213112; x=1788817912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cGKaO6KKnr5SuBGCN5zxoUeuXnRrk7kBjvDdBLu0U8g=;
        b=qK7RUyO6LaPAyMU+uG42Wm+Sybo3RbgEekiOUcO3nW4Br4h5wi6tZ3OQX2g8nfghJe
         AQN+27d0ewmNm/QsDg6KqTxkOIWxuzbcicq92Tj1g9j+3XQtZhfC3L+wJ1nGs5GO7dAe
         XeQWnCsvv9yyC0XCUyz3l4ZoxArsGUYtdVPEU8j02dd0rSwx6TJ2GiZ0weT/oXhI99ib
         GH5Qx5AOzK64bKLMnQyXhFuIlGw1AizzBF9cfIMcre042vvxh8KyyzQkjLh3lj++zES5
         GpoAaEJbN+RyHD5DL0jBWBFkLknfW18NmdtIPA9b/46EgpUxi0Iz61z6ChLmfSxakWuN
         KCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788213112; x=1788817912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cGKaO6KKnr5SuBGCN5zxoUeuXnRrk7kBjvDdBLu0U8g=;
        b=gkH/6BdEIIbN5NhhL7Ko7xxpuzvXIn4kmAsIgRfWI0Jp5SoMtL8e5+VcGDDTP0T0mp
         OfOC6oqRghC5Cv4aQdfu+VdxPDFPUel9AUTJFxpVvcvF0WfLhHBitblvXdEFHRowQH37
         ueFExjkyh/8rJyiyqx9tQxcJSAa03H38KyDqWJ1y1gbiuWdUDVBTVb4U76LsetTOCyRu
         xXk9WlScrgdDHgacHrxJO+uakNyIZXOSNJsqLDk4GBIL/XsibrJ25pLgQUyUGWYazoVy
         CkrFZnsQvG2uKtD41nlVXw98k3iep7ijP5iI1s6IebclgD+xdjwt9EyssWEszf5TJe8B
         78KQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5HKBOFWCguGZPsU9Dk7o5N543WpcAt7qzOKEtvdQHzdoRhjLCtdNonAlAwcDAIfm03vYrYuBkHJcnf705jP8=@vger.kernel.org
X-Gm-Message-State: AFuF++l7q0vTCKkKFVz4aqwvE4pjDCW/Q1bLtLjrqgvaeSSqbvWPBfah
	sA6UmT0SVHjW7EqihqLaPX2vlQXl4mhWrDQ8fHged0ux8UEIbQC1llI4
X-Gm-Gg: AYBFou0fIAXEllSevyB2czhoR7H243HN6C4erZasI/8maI+PsCi9HCL4nQDREafiRHF
	4umlI/RlmQFVm3Opmtew3fnrElY+IKWvjl5aocg1xx4l4jwq+/4Qr2/cu+RpKrTobAKWVD6IIp4
	N2YgjYg9lfhCxqUk+R4eGDtGxnhNaVnlk0I1+zZl0vUmj7EIIF2hyzPAX2x9lPDT5ZirNms5H0F
	i1xwkFu3lt9IZxhEIfJB5xP+DvhO6h5zXFbO8DPoaQIytw4gUfnkFnLY+poPW/ff9DRrXdoLyaI
	ri7pnMNMEkW/59aEPrdDY9rL1W+YaTEJrSXjJoYrBEtfJL6To4PbqRFRZWriSnbgPvZp+JUQM/H
	MfNU3kGTNtoUU7XDZE4FQwtIrfB4VZqsbdGsgc2LmKgiSa9qLc8bZOb7vi8KfJSZcPEwMOBh5kf
	wlRjH+uMFYsaWOhQV8ErcLvr6qOqOXYM3rKr0cANiltDUF5BnGHuK7jmkQUDrGgOqztRndrlaAQ
	Nbmacr20V7QixzW5fnkw612tEk8bq+4Tg==
X-Received: by 2002:a05:6512:15a3:b0:5b4:a388:63a with SMTP id 2adb3069b0e04-5b5e68a73f1mr8750331e87.4.1788213112244;
        Mon, 31 Aug 2026 14:51:52 -0700 (PDT)
Received: from dau-home-pc.. ([212.35.184.237])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e8a06a77sm2388782e87.48.2026.08.31.14.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:51:50 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 00/11] tunnels: add core and gre drop reasons
Date: Tue,  1 Sep 2026 00:51:26 +0300
Message-ID: <20260831215137.549324-1-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Only vxlan reports drop reasons among the tunnel drivers today.
Everything else, on both the receive and the transmit side, ends in a
plain kfree_skb(), so a packet that a tunnel throws away is invisible
to dropwatch, drop_monitor and perf trace -e skb:kfree_skb. The device
counters group the failures coarsely: rx_errors and tx_errors each
cover half a dozen unrelated conditions.

This series covers the generic paths shared by ipip, sit, vti, gre and
their IPv6 counterparts, plus the GRE specific parsing, on both
directions. A later series will do the same for geneve, bareudp, fou
and the remaining IP in IP drivers.

Patches 1-3 convert the generic receive paths, ip_tunnel_rcv() and
__ip6_tnl_rcv(), and add a test for them. Two reasons are added:

  IP_TUNNEL_CFG_OPTS_MISMATCH  the options a packet carries do not
                               match the tunnel configuration
  IP_TUNNEL_OLD_SEQ            the sequence number is older than the
                               one the tunnel expects, next to the
                               existing TCP_OLD_SEQUENCE

The second one has a failure mode worth naming: when a peer reboots,
its outgoing sequence number restarts at zero and the receiver drops
everything until its own counter catches up. That is indistinguishable
from a misconfiguration by the counters alone.

Patches 4-7 do the GRE specific receive path. gre_parse_header()
returns -EINVAL for six different reasons, and the only detail its
callers could get was a csum_err flag that none of them read: both
ip_gre and ip6_gre declared it, passed it in and ignored it. It is
replaced by a drop reason. Three reasons are added, mirroring vxlan:
GRE_INVALID_HDR, GRE_CSUM and GRE_TUNNEL_NOT_FOUND.

Patches 8-11 do the transmit side, about forty failure paths across
ip_tunnel, ip_gre, ip6_tunnel and ip6_gre. One reason is added,
IP_TUNNEL_ENCAP, for a failure to build the encapsulation header.

The transmit side has its own case worth naming: tnl_update_pmtu()
returns -E2BIG after it has already sent an ICMP fragmentation needed
back, which is path MTU discovery working exactly as intended, yet the
drop lands in tx_errors next to genuine failures. An MTU black hole
cannot be told from a broken route by looking at the counters.

Drop reasons on transmit are not new: vxlan already reports several
from its xmit path, and ip_tunnel_core.c reports RECURSION_LIMIT.

Tested under virtme-ng. The selftest checks twelve cases by the end
of the series and passes, with no DEBUG_NET splat from the
SKB_NOT_DROPPED_YET check in sk_skb_reason_drop(). Breaking the new
mechanisms on purpose makes exactly the corresponding cases fail.

Not covered by the test: GRE_CSUM, which veth cannot trigger since it
hands the skb over with CHECKSUM_UNNECESSARY, and the NOMEM paths.

Anton Danilov (11):
  ip_tunnel: add drop reasons to the generic RX path
  ip6_tunnel: add drop reasons to the generic RX path
  selftests: net: add a test for the tunnel RX drop reasons
  gre: make gre_parse_header() report a drop reason
  ip_gre: add drop reasons to the RX path
  ip6_gre: add drop reasons to the RX path
  selftests: net: cover the GRE specific drop reasons
  ip_tunnel: add drop reasons to the transmit path
  ip_gre: add drop reasons to the transmit path
  ip6_tunnel: add drop reasons to the transmit path
  selftests: net: cover the tunnel transmit drop reasons

 include/net/dropreason-core.h                 |  38 ++
 include/net/gre.h                             |   2 +-
 include/net/ip6_tunnel.h                      |   3 +-
 net/ipv4/gre_demux.c                          |  51 ++-
 net/ipv4/ip_gre.c                             | 144 +++++---
 net/ipv4/ip_tunnel.c                          |  60 ++-
 net/ipv6/ip6_gre.c                            | 163 ++++++---
 net/ipv6/ip6_tunnel.c                         |  95 +++--
 tools/testing/selftests/net/Makefile          |   1 +
 tools/testing/selftests/net/config            |   1 +
 .../selftests/net/tunnel_drop_reasons.sh      | 346 ++++++++++++++++++
 11 files changed, 762 insertions(+), 142 deletions(-)
 create mode 100755 tools/testing/selftests/net/tunnel_drop_reasons.sh

-- 
2.47.3

