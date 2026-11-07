Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794022491;
	b=v1KRgnWD0KO2bWd4vYvr4pWZO601P17vfBPxwORm6eyXD4n+0qXlC2AMW8ZcyBDKPkGJ
	 Yp7PmgidzEGrIKThiSG9x7My3IgheLm7UmxcCDmljUG5iTJVFh5gB0YN9+mb5DgWHfPk/
	 F3gp9hI3n9QdjyW7t4p1J3eqnZLYOKOtYLZs+Nx5nfaHSg35HT+PzQS96EuTb8B9K/097
	 naSpcxkYFVJdbidBx9Gjt0yt/t0m1s4OHagH9qpjUBDoJ1EykZ/TyRenQrMHsxuIsVPMR
	 778TL0urttZStaJdzy9l5ikge9OgyR3AhBw1L8nrk9sqerFPttUHmyJlU3ReICOQTow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794022491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=phfdfz8PzHsM0KuP/80pAKM/8zTKfUk4DuybrzxV7UA=;
	b=AWeRhBiPHGt/a2EaWwLzRRUy/z7HqJnGLjDfCBUnJdLvf9c03Flsk0NgsFPiCOglJCt5
	 El/piMUFbhLEheGT2XEOoO/+BlgDe7msi+qlBmdlXxncN4Y3inTcoT8Z/VxlU5U3dZNde
	 MRAf4Cn7C5QAa2fHpt3e6SSNNuqcWgtPiGjQ+dMx17acv1MzKCI+/fe+CO8c0vJJTK4c4
	 SMih0mro7OFdW99ohRd5/Dyyk7zsPmbNHDYOBb5gLzzsSOB8h5D6nRF/0fIxuA+lbBpB5
	 dtshxDu+96x2dLkg77pDCy5n5fVaL5cjOF7eDZ6NHHyj8ochub42DZOW/BEbeSwd1oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=XEerxCny;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5192A606A32C
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 03:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5192A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=XEerxCny
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4550d8ab15so167816766b.2
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 19:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794022490; x=1794627290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=phfdfz8PzHsM0KuP/80pAKM/8zTKfUk4DuybrzxV7UA=;
        b=XEerxCnyjwKcqVqFSagvaAZbHGgSLll5tfTp9WFV+MtB/Xamb/ZOeg7o0c4w0XiEMa
         xMLAkybvutqAKzAPJc3w2D3aLzm53kJswdbjIfF+dsxRxA1fFKLAnFY8qysufmZxqfyF
         ZeBZxaxgZ64egi+JXBsgu+x2yoPK9UKCTuPK3pOYRKOmAIULnss7ZcMXfrmG09bPPOQB
         7j1Oneomtfm8iwJxAb3JPGtNhwUlY9ZcY/9l4XHqDYBv9JIcHC4e+O112WzdidDsC9/W
         EILySWchV9M8g/upHyBA2AGTKppoPkzM9R3XXraFPUnC7o74Ncta280wQseYliN+SdlX
         /lnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794022490; x=1794627290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=phfdfz8PzHsM0KuP/80pAKM/8zTKfUk4DuybrzxV7UA=;
        b=sieXLIHSfCwvcup9yZB6CH/fwH2/bvekRGPLofqgV9P/DuE+ywX17Q10uT8e2qjTzx
         O720irOYEw0ehXDiNzQvcT63FWbelmifxNl6U2mHVyBjuGFkcFu4QN3E6t4WM4iZTyAg
         BUAzg1mQe8kWJYdJPY2YP2VKymDSo95apA4irbmHMir7V4uRPDTBC7OVkzcy35F9hQJc
         sV2bqeQPfwOHH1ZplDTKi8aVBfWaaJ7XJli+68HvL/8VsVtXRsgz079VNJXA2OS202mP
         mi685p4W4KqO8YcLv6AZlzo4wgDCP409BMMAYc6HTGs0NPOobTe1ZyHvVrZWFWJNE+a3
         uOgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxo2/kmwdnWK7xk/z1dRFPTaAHYq6bJpdXnEPwUbaN9OQP+rYwp28iBqUeteH6qaRXiTumn1hqSZn5abNgsuo4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3ih2O13l0xAcdZ1oeo9oWIZNY8cUCyVnHIP8h/NIzU1Kz2zyS
	44GqOWNQZKiCC8R5uQuDcAxhZMEU1AAmW0ZjKfhGOtmf0cVmhh0YMPFSfUCJuGQVAGQ=
X-Gm-Gg: AYBFou2vw0RVoQFQFOWp76W++ue2Taz1D+Rnxt7hxvsYG7YMq3rjRNuiaqL98J1BWsM
	sQKzIqxAQw9e6hhTHO/veVCHH3D82QoJj6oMS4urjosqsXD/pv+Rwo9sMzDB7I8Vbu5WMGqP0d9
	imMqnCV9MVQPHCXbCFAA1BHrmcnGGZ0lAeEZzPVqrIcCycHHmviFaeXwQm18e2UD3DmZc0gyvx2
	A9ZF9IYlo6hDNb2vDuGw8GBG/zoaQoUTFsU1ASqgAraNKaLsyvfLbANvx0jrlHtFahqTRzrjr4D
	A9ig623IQACqQIS0ZfP7mq+jrwp8UzoJlwISF4clnBsJgZgXAe8V2cJaKSHH2Lh0YfGfiUZBnG5
	Jz5Mw7xRX36J68V7WI8RKANxiFPMBEy82+j9uesqmRxQ12iBY5kCxlAYJqSIVfAl8ZCr+yUTvnM
	Jt2H4RTOuxqaqPIrsbTgiefQCJrOl25wuv9sS1c+wEU0BQU7cPpNd9xuCnE3JR8fxvyeCJ4Rscq
	zuGhW8/odtLqQlvPT3evApuObJHQz2RKhgPDgHRZJk9ev60fYyR0/RzKZUkj+utMKImUUMCBwzm
	RAe8nyHFNId3Amp6tN7KqchcMMN58Z4jaBumIgJ6mwEYtWgInrcf20fxwQxBmEvOtPwDey8m1AY
	FzeTdCyvE
X-Received: by 2002:a17:907:60c8:b0:c34:1ed:54d9 with SMTP id a640c23a62f3a-c4d344a872bmr442362766b.4.1794022489809;
        Fri, 06 Nov 2026 19:34:49 -0800 (PST)
Received: from L9JK9NPFH9.lan ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3562e00dsm121104166b.21.2026.11.06.19.34.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 19:34:47 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@kernel.org>,
	David Keogh <dkeogh@amazon.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	David Woodhouse <dwmw2@infradead.org>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	Nimrod Oren <noren@nvidia.com>,
	Alasdair McWilliam <alasdair@mcwilliam.dev>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Alexei Starovoitov <ast@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Breno Leitao <leitao@debian.org>,
	=?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
	Danielle Ratson <danieller@nvidia.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-team@cloudflare.com,
	nh-open-source@amazon.com,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net-next 4/8] selftests: net: add tx_extra_headroom test
Date: Sat,  7 Nov 2026 03:34:23 +0000
Message-ID: <0a1936109734e9bbc443ec34744112a7f6a83976.1794020868.git.tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794020868.git.tianyi@cloudflare.com>
References: <cover.1794020868.git.tianyi@cloudflare.com>
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

From: David Keogh <dkeogh@amazon.com>

Exercise the IFLA_TX_EXTRA_HEADROOM attribute through YNL: the default
of zero, setting values up to the maximum and back to zero, rejection of
a value above the maximum, supplying the attribute at link creation, the
change notification, persistence across link down/up and across a
network namespace move, and that a VLAN created on top of a configured
device does not inherit the setting. It also checks that setting the
attribute does not change needed_headroom. On a kernel without the
attribute, every case is skipped.

Signed-off-by: David Keogh <dkeogh@amazon.com>
[tianyi: skip on old kernels, check needed_headroom exactly]
Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
 tools/testing/selftests/net/Makefile          |   1 +
 .../selftests/net/tx_extra_headroom.py        | 147 ++++++++++++++++++
 2 files changed, 148 insertions(+)
 create mode 100755 tools/testing/selftests/net/tx_extra_headroom.py

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 9180b9bec515..4a931c010762 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -121,6 +121,7 @@ TEST_PROGS := \
 	test_vxlan_vnifiltering.sh \
 	tfo_passive.sh \
 	traceroute.sh \
+	tx_extra_headroom.py \
 	txtimestamp.sh \
 	udpgro.sh \
 	udpgro_bench.sh \
diff --git a/tools/testing/selftests/net/tx_extra_headroom.py b/tools/testing/selftests/net/tx_extra_headroom.py
new file mode 100755
index 000000000000..153384a1fb0d
--- /dev/null
+++ b/tools/testing/selftests/net/tx_extra_headroom.py
@@ -0,0 +1,147 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""Tests for the IFLA_TX_EXTRA_HEADROOM link attribute."""
+
+from lib.py import ksft_run, ksft_exit, ksft_eq, ksft_raises, KsftSkipEx
+from lib.py import ip
+from lib.py import NetNS, NetNSEnter
+from lib.py import Netlink, NlError, RtnlFamily
+
+ATTR = "tx-extra-headroom"
+MAX = 512
+
+
+def ifindex(name):
+    """Return the ifindex of device name."""
+    return ip(f"link show dev {name}", json=True)[0]["ifindex"]
+
+
+def get(rtnl, idx):
+    """Return the IFLA_TX_EXTRA_HEADROOM value of ifindex idx."""
+    link = rtnl.getlink({"ifi-index": idx})
+    if ATTR not in link:
+        raise KsftSkipEx("no IFLA_TX_EXTRA_HEADROOM support")
+    return link[ATTR]
+
+
+def set_hr(rtnl, idx, val):
+    """Set IFLA_TX_EXTRA_HEADROOM of ifindex idx to val."""
+    get(rtnl, idx)  # an old kernel ignores the attribute
+    rtnl.setlink({"ifi-index": idx, ATTR: val})
+
+
+def test_default_and_set() -> None:
+    """Default is 0, values up to the maximum are accepted, 0 resets."""
+    with NetNS() as ns, NetNSEnter(str(ns)):
+        ip("link add dummy0 type dummy")
+        rtnl = RtnlFamily()
+        idx = ifindex("dummy0")
+
+        ksft_eq(get(rtnl, idx), 0)
+        for val in (1, 256, MAX):
+            set_hr(rtnl, idx, val)
+            ksft_eq(get(rtnl, idx), val)
+            ksft_eq(rtnl.getlink({"ifi-index": idx})["headroom"], 0,
+                    "needed_headroom")
+        set_hr(rtnl, idx, 0)
+        ksft_eq(get(rtnl, idx), 0)
+
+
+def test_reject_above_max() -> None:
+    """Values above the maximum are rejected by the policy."""
+    with NetNS() as ns, NetNSEnter(str(ns)):
+        ip("link add dummy0 type dummy")
+        rtnl = RtnlFamily()
+        idx = ifindex("dummy0")
+
+        set_hr(rtnl, idx, 128)
+        with ksft_raises(NlError):
+            set_hr(rtnl, idx, MAX + 1)
+        ksft_eq(get(rtnl, idx), 128)
+
+
+def test_newlink() -> None:
+    """The attribute can be supplied when the link is created."""
+    with NetNS() as ns, NetNSEnter(str(ns)):
+        rtnl = RtnlFamily()
+        rtnl.newlink({"ifname": "dummy0", "linkinfo": {"kind": "dummy"},
+                      ATTR: 64},
+                     flags=[Netlink.NLM_F_CREATE, Netlink.NLM_F_EXCL])
+        ksft_eq(get(rtnl, ifindex("dummy0")), 64)
+
+
+def test_notification() -> None:
+    """A change produces a link notification carrying the new value."""
+    with NetNS() as ns, NetNSEnter(str(ns)):
+        ip("link add dummy0 type dummy")
+        ip("link set dev dummy0 up")
+        rtnl = RtnlFamily()
+        idx = ifindex("dummy0")
+
+        rtnl.ntf_subscribe("rtnlgrp-link")
+        set_hr(rtnl, idx, 192)
+
+        seen = None
+        for msg in rtnl.poll_ntf(duration=1):
+            if msg["name"] == "getlink" and msg["msg"]["ifi-index"] == idx:
+                seen = msg["msg"][ATTR]
+                break
+        ksft_eq(seen, 192)
+
+
+def test_survives_down_up() -> None:
+    """Toggling the link does not reset the value."""
+    with NetNS() as ns, NetNSEnter(str(ns)):
+        ip("link add dummy0 type dummy")
+        rtnl = RtnlFamily()
+        idx = ifindex("dummy0")
+
+        set_hr(rtnl, idx, 96)
+        ip("link set dev dummy0 up")
+        ksft_eq(get(rtnl, idx), 96)
+        ip("link set dev dummy0 down")
+        ksft_eq(get(rtnl, idx), 96)
+
+
+def test_survives_netns_move() -> None:
+    """Moving the link to another namespace keeps the value."""
+    with NetNS() as ns1, NetNS() as ns2:
+        with NetNSEnter(str(ns1)):
+            ip("link add dummy0 type dummy")
+            rtnl = RtnlFamily()
+            set_hr(rtnl, ifindex("dummy0"), 160)
+            ip(f"link set dev dummy0 netns {ns2}")
+
+        with NetNSEnter(str(ns2)):
+            rtnl = RtnlFamily()
+            ksft_eq(get(rtnl, ifindex("dummy0")), 160)
+
+
+def test_not_inherited() -> None:
+    """Stacked devices do not inherit the value of the device below."""
+    with NetNS() as ns, NetNSEnter(str(ns)):
+        ip("link add dummy0 type dummy")
+        rtnl = RtnlFamily()
+        set_hr(rtnl, ifindex("dummy0"), 224)
+
+        ip("link add link dummy0 name dummy0.10 type vlan id 10")
+        ksft_eq(get(rtnl, ifindex("dummy0.10")), 0)
+        ksft_eq(rtnl.getlink({"ifi-index": ifindex("dummy0.10")})["headroom"],
+                4, "vlan needed_headroom")
+
+
+def main() -> None:
+    """Run all test cases."""
+    ksft_run([test_default_and_set,
+              test_reject_above_max,
+              test_newlink,
+              test_notification,
+              test_survives_down_up,
+              test_survives_netns_move,
+              test_not_inherited])
+    ksft_exit()
+
+
+if __name__ == "__main__":
+    main()
-- 
2.56.0

