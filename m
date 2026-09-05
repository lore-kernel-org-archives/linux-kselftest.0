Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7DF3019BA
	for <linux-kselftest@vger.kernel.org>; Sat,  5 Sep 2026 08:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788598409; cv=none; b=JmmeKj31zBWM2WPHNY96R3aY8EPn7jID0EZ9F3TjXb+zbBIWDJKTnKbFZTrQ/4iR0E57/0XILOLz45c0E0BwbrvEcD1SE5XF57E4U0K6OlMZBcuXqSIYoIs7KPZnFdhmG+LF2De3ceHT0IZwU1KMD6n3JMQG6T/5QkufSwCYFog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788598409; c=relaxed/simple;
	bh=D7JaeCOjdBjWc38JeD5hIJbaNJss77DXuSprCXTCyT8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ovvyzp/s8YtOLfNUMVw3hvLOCiUKBFj7700j3RYnXe6zrGV8ti73sA16oa6jfTD+7fCtZNiWU4Yrv+JMPQYR/eL1AerXzmVc+C6ZuvnnsiAnsTmYXEzMi90IOEqqwNIGSnjPsekJlhT1ec91/CgrMkargFZ5trNAk22+90aYLds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=iQyfZ20c; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="iQyfZ20c"
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3B2BD3F179
	for <linux-kselftest@vger.kernel.org>; Sat,  5 Sep 2026 08:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788598404;
	bh=bAyqUgf+I6QAh1/NXnB0FgN6nwCFM0fq8dEBHdP78N8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=iQyfZ20cHquVg2bhaAmAx7vhDm34iJttgaDAvpzKr9/63gdvVV7R0k7dwJuZUErgd
	 9jHDSyR0bYj52YLLnG/LsZ+vaFnFaRyn/18qD5dNUumWIkYyOFy0vt6Anwj9z0e1Rc
	 S1n55a4pA8IuQ/jQkUu7TSUJ1ViipVjAZ3ASTmwKa1Q+DNHvkBMsxx9e1Xw1PQvL1E
	 yFLVQuDX9YLPBD0+XNkQEPWQjuDw0zo7zO9xsDlVjALMvFVfsAfg+ier9tlsopfKXh
	 pLGS3FRZA9EMRRnN2sO9A5tkAESDv1vYK4MDGGfVEJLNu5omNOWQsO8XKgoricAjuZ
	 lCyir01KNECfB23VQrMn52u5HFw1x6V/CUEMqyEUbNmt76uq1JPRGk7OMLuTZXeMYi
	 HjZW9kesgPuebb1kpil2VZ7KCjE/sXgyhZdG7KNfh9SVj+wo4h+pojRfjV8XhmH04H
	 UdpfEaG6YyEAZnCZPCqF0kXOmLtQPzLa/RhCH8UEILYovut9yjBi5SUsDjnH7M43Fd
	 SqGS0DFTESCdPAEbHKz5Er/dHmtJeoqgye+xDyJ3xAYvCqKG8F3WjIMUcN/Iwaw2gV
	 Xp4yC6PrPD6jkcon7kz31S+P9Zl1hOCd1LsOWCvE8xixsWUFCo51MB6Xw0IiqRx05v
	 IJp8AxYWRK5jgS9lIS2LsgHE=
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4957d53427eso745405e9.0
        for <linux-kselftest@vger.kernel.org>; Sat, 05 Sep 2026 01:53:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788598404; x=1789203204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bAyqUgf+I6QAh1/NXnB0FgN6nwCFM0fq8dEBHdP78N8=;
        b=QOfnU2Zk6Kwtrqx3WRqUMSgU4Mn+Pwk0MhgriJWmlrL/NjPsQcSjI/Ampv7ZQT0UCR
         Jk+1aPnMmZbSiYWUCVwYyT40tO9qyLUmNjOWVudD0BAq9gbI2lviBM0oS0q+w3EWC/Tw
         8w+EwPzhza4JDGdTE7pLuCtCrThHO72S8U1mVw8veuuI+x9Il38waJ9KGBzjuREyxVAK
         wFmRAtrU1mysSRhB29ePvgrP5rtL0xkwAVJUeh160G7MLt2Zp3lL5fhgMTpzwvBaMg3d
         JtYd1g1xDF5yzjg2VBXTJDr32hBPlVQhFxmdCQQgvyhVCJgfXwwqLFPkd8md7hA2T5Dn
         XRxA==
X-Forwarded-Encrypted: i=1; AKwUvBwvu2nXSkyL4mSJCAOf4t6CFnJk8sJlf0NLCMhYVQ9u+EGGlrPvX1PuyTOdjEx+oYX67t2RqymwTWlBpkqvUcs=@vger.kernel.org
X-Gm-Message-State: AFuF++kw8YCnQXguHJ+mzzyjIjBmD68ji2E5VGCCtKmtSlKFtxh8DDYf
	GEZyPdlnILl6amP3rO3qcq3CCVek74A6Gbbd9EfEpG2FsyjWr3TInOmpYldIcc+/SncpCC2MxdY
	X1VcVih0UYzBXlykNPitjZ8cO4uHLQActgc9w2BXvt+MjiYz5VrH6D5MTiuXyn0/b1j8qup7WF4
	nwKw+1vc5u3A==
X-Gm-Gg: AYBFou0RQdmQlX3fBH8TEO6xwFpfEWw7iHMnEODRILmSc5Cnkdgh36wJKGB6YfnF8RA
	xaz2DldJEChC910BsF0N/SfEpLMNBogvx5E/1ir9Eaommr3WapxsqxeXMdGq3GDyCwdCb8diz/P
	RfTX9G2jhlZDVgICVPeMn/hSVGubHcH672kQ5UkElGRRuPC0eEdDdrXiNUl3DQe3PHXtdxR/ghF
	EQoRc+eRm4ZUFGDIgiPV1N/Cc1M+mHyZQ7X89CnK7maG9n/z9aG/Mzra90OitiRkbZY4C61h2yN
	MMKDeppe4FJT78HoCbESfXSTC1Y7UuUvc1NVznGtFNG6vjBNObTPsAVBsG9nSpQ15XlSKTlR4iY
	nEg7RoDPegKTX
X-Received: by 2002:a05:6000:983:b0:484:3d59:5ed with SMTP id ffacd0b85a97d-4858ffa115fmr3139801f8f.0.1788598403757;
        Sat, 05 Sep 2026 01:53:23 -0700 (PDT)
X-Received: by 2002:a05:6000:983:b0:484:3d59:5ed with SMTP id ffacd0b85a97d-4858ffa115fmr3139774f8f.0.1788598403365;
        Sat, 05 Sep 2026 01:53:23 -0700 (PDT)
Received: from localhost ([2a02:1388:a28:ba0f:6fd4:24de:787b:7c01])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12692505f8f.34.2026.09.05.01.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 01:53:22 -0700 (PDT)
From: Edoardo Canepa <edoardo.canepa@canonical.com>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Xu Du <xudu@redhat.com>,
	Po-Hsu Lin <po-hsu.lin@canonical.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] selftests/net: run tun tests in a dedicated network namespace
Date: Sat,  5 Sep 2026 11:53:02 +0300
Message-ID: <20260905085318.3416670-1-edoardo.canepa@canonical.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tun_vnet_udptnl fixture creates a fresh tap device and installs an
IPv6 outer neighbor entry as NUD_PERMANENT before sending packets.  On
systems where systemd-udevd is running and a systemd .link file sets

    MACAddressPolicy=persistent

(the default shipped by systemd in 99-default.link, so this is what
most systemd-based hosts inherit), systemd-udevd's net_setup_link
builtin asynchronously sends an RTM_SETLINK to reassign the freshly
created tap device's MAC to a machine-persistent value.  When that
netlink message races the test's ip_neigh_add() call, the address
change kicks the following path:

    do_setlink
    -> netif_set_mac_address
       -> call_netdevice_notifiers_info
          -> ndisc_netdev_event
             -> neigh_changeaddr
                -> neigh_flush_dev(tbl, dev, /* skip_perm = */ false)

which flushes every neighbor entry on the interface, including the one
the test just installed as NUD_PERMANENT.  The subsequent packet
therefore hits __neigh_create(), triggers NDISC, and times out with:

  tun.c:947:send_gso_packet:Expected ret (0) == variant->data_size (1423)
  tun.c:948:send_gso_packet:Expected r_num_mss (0) == variant->r_num_mss (2)

The failure is non-deterministic and can affect both directions.  Both
recv_gso_packet and send_gso_packet variants can hit it; the failure
reproduces on a plain systemd-based VM with no containers, and is
triggered whenever the udev worker's RTM_SETLINK lands after the test
has installed its neighbor entry.

Fix by calling unshare(CLONE_NEWNET) once, from main(), before invoking
the kselftest_harness.  All tap and geneve devices are then created in
a namespace that systemd-udevd (running in the init netns) does not
watch, so its RTM_SETLINK never fires against them.  This mirrors the
approach used by selftests/net/ipsec.c, which also unshares from main()
rather than per-fixture; it keeps the harness output ordering intact
and avoids paying the netns-creation cost on every variant.

Verified on a plain systemd-based VM running the affected kernel:
1000 repeated invocations of
tun_vnet_udptnl.4in6_nogsosz_1byte.recv_gso_packet produce 7 failures
without the fix and zero failures with it.  A 20-iteration run of the
full test binary produces 4 failed runs (across different variants,
all send_gso_packet) without the fix and zero failed runs with it.

Reported-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
Closes: https://bugs.launchpad.net/bugs/2158217
Fixes: 24e59f26eef2 ("selftest: tun: Add helpers for GSO over UDP tunnel")
Assisted-by: LLM
Signed-off-by: Edoardo Canepa <edoardo.canepa@canonical.com>
---
 tools/testing/selftests/net/tun.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/tun.c b/tools/testing/selftests/net/tun.c
index abe488bac50b..7f118ba3ae0b 100644
--- a/tools/testing/selftests/net/tun.c
+++ b/tools/testing/selftests/net/tun.c
@@ -4,6 +4,7 @@
 
 #include <errno.h>
 #include <fcntl.h>
+#include <sched.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
@@ -985,4 +986,12 @@ XFAIL_ADD(tun_vnet_udptnl, 6in4_over_maxbytes, recv_gso_packet);
 XFAIL_ADD(tun_vnet_udptnl, 4in6_over_maxbytes, recv_gso_packet);
 XFAIL_ADD(tun_vnet_udptnl, 6in6_over_maxbytes, recv_gso_packet);
 
-TEST_HARNESS_MAIN
+int main(int argc, char **argv)
+{
+	if (unshare(CLONE_NEWNET) < 0) {
+		perror("unshare(CLONE_NEWNET)");
+		return 1;
+	}
+
+	return test_harness_run(argc, argv);
+}

base-commit: 80dd7e754b3aa9637a0758ad93fa209f9650ec48
-- 
2.53.0

