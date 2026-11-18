Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794968913;
	b=UJWIeDUbWwyE6cEhVzxy+oOm+Ugwy4Mp8BsUNqstxdfrBSioQ+ClLrx6dyb8KB4stTa6
	 Ad7M8qWj3OMy1HghSqPVF2Jg6R9JNAbGqS+UJ5GivGq7FuVTUD0bue8jFrt/dKEKSTFXR
	 ayGojarm6frHs+0b9CGBHAnohXs0y7tOIEfv3lFh2Lyv2XM82XQfk/yyHmb3GtI+MOIXv
	 1E+tbDJJ364wzwWhPbriIhcgmsqeS0CBhC3H1b30BEwYxw5F7uu7TZ0U7KdU1aqsCymle
	 lIJEDX4ZeB2RfaC8yskGqp+NUPBIdhWuSe5MEOrWKtbUI/wXuiMTtTqu79yWmay8mVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794968913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ho54TYF6nZjSAVceuh96jk4faWMez+7R+0ZdE7pbCeo=;
	b=FaYMGx1hzN5hpK/zydFsSMEW+okIQ5jpG1ScIqd8qI9NpLzblSd1sujJXFNr+qgUh0TD
	 rYHnwo1hBt8hwq/c5J/Or3ZU/qwpZwueeN3675FPHLdbx6Vr61FIavh0m7IpYDVVCjlZM
	 E2oljncqT7s/n89K2wnhGb7bFY2bRIEGIjKoD8LSUzLmiw9T3Gqae9truwhaLsmgQfAeo
	 zssbcZioNT8dm7YUYrZUGNFZTpIrwdkR0B/yfMoBmLxlkX5+6zkfwEgBDPJKHVCWeZdUn
	 xUudF260f+lnun9I/TzpMrGYZCHZUMLeijy3Lp6G1iLeFJoIVuVC/+RZzR8qpSMIhdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=noSpeQOW;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FD3606A31C
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 02:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92FD3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=noSpeQOW
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdddc79a4afso234053a12.1
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 18:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794968912; x=1795573712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ho54TYF6nZjSAVceuh96jk4faWMez+7R+0ZdE7pbCeo=;
        b=noSpeQOWMnvjMUB6qRG1XQ4bNW0CovOzR4Vock8d8sRNJybt3HCHGEScStRD4rHXQw
         qz60TaqJL5yaoG7l01VvNRfzP3YN1ZG4Ockxhic+KD7NCdgifN0nu/W7rTvARuUm+j9C
         UugLhefh86fBh9EFvt56DLVHm0/6KtbPyKrdZnZU/3dCWq9T3EsNpZrQ6Clhh2VZlC5k
         KmVIaN5kugqEK8xGHodYrAaBq1/LBqURUOvPksHiVpUHVG2HvrVOnxzo90Jl0G6pqXxG
         n4fKFxn90Ayht0MnfjGbVYXAbHSCi0CKmZx0uhpL91VZy6+0RCBtcqznu8iF5PWcVAf3
         eSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794968912; x=1795573712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ho54TYF6nZjSAVceuh96jk4faWMez+7R+0ZdE7pbCeo=;
        b=tzpUAGWUfb745589xfnTZ7gZMHiw4/WUuS/VI2DjLNEi2QHzQQGiGX3HHJy1Tv/oqD
         PDv29M7Ufueyz9/acTYNidb9J0VH4ujiGodaJBrK9jh01mQMF5IQYBaYXXA687Bz0uaM
         nJ53HM7MusuLYM6vCYmNA6oJXRNu7zbeC7kE6H+oUmL5TPD0muj1915v1f3jqzG5fjN0
         jhkECjn1QwPDwdliWgLdTykGui0joKAaMrvY+nuItXzXIYLeXqWNbk0VJno6dD5BR8GK
         I1BZaZIimJMjqpc8MwpOmh4XkXLlW+rmU5xzf4LEdUeDi75L5ChaF2GtlSBz3rToTcfC
         fDEg==
X-Forwarded-Encrypted: i=1; AL+hErGQZAjxblZIpDtu9LVi170d9Ox5xVss4EAQjhFwwnNpUpty6caF7QVdLwzUwoBI9l2T/y2WPhNM6xaoYKtsVgQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z93uB1Uh8SJ/Ja6F61K+MUcMMK9OpCV0fWmHBxeXZ0qfzdSQYTY
	4XtkR7zu7DRNxORKHX7vLmeMq5x/erP4ZKzO4mCT61m5c/mUvJ+gslSl
X-Gm-Gg: AZFdTZdF4D4gLzWvK34WzMGjPxYx9TFjkggtIN28r3Jq14ZEAwziIAa9V5EdquJGpst
	rDBEAnlPYyYZ1K9M9s2E9IXonyoYAhAUSKyyVChtEYkABWhIbn4HuoKV88IkOLwD42cuPh9CveK
	t2nxGvPDSKYjgH1eqX/QQJRSWkxboHMl4trz7rl+p7W7neq7BsUGLxTpjmLEWdJ1dMZ5jrs26Ts
	VHzx95uwHDmTA7M3hdybQOiD/7Q5DsTQL3kJ/RyZC+OAcur0N6LZ0MQH0tjlmW02uw0j3aX/cor
	gds+OjOlKF25qv8JNVZkknwvTcGbGG/pd4FQ/ReRSf1pXDlDhkJcHTWWB6xp5frp5vMwEE/+OOI
	6G1YcjUxtmgqZKpqFEVCYJGylwdT28hlGt6ovtsTNYjmKdXvgiU09SYJx/mwHWLOZsnX8qlv9lx
	deUuCIUoEBrq2T672qNm0MjJTpcADeqH+wv7UDao7T8OTofRzK2G401RxiAH71HyDT3FS08Sv8f
	9LcCN3L990U/4esgA5PkWSSE8JFuJQIT3G/GzL34aipIXkKJjRIX4e7XX8+lSCrx2QWInEGndyq
	visS/SSR2ekGoVAtIyImClZUUL2J85+QxnEN3BY7wDRVvWQOtjjCWRNWN7bD7hvFQEP7f3h6XNt
	VRT82h4TRcF45XqxOPvWZ32E=
X-Received: by 2002:a17:90a:dfc8:b0:3b0:9cc6:62ba with SMTP id 98e67ed59e1d1-3b3d07d410cmr1041938a91.38.1794968911769;
        Tue, 17 Nov 2026 18:28:31 -0800 (PST)
Received: from message.eml ([2a09:bac1:76e0:450::21f:e8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac2b5ec6sm6700682a91.10.2026.11.17.18.28.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 18:28:31 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Tim Fuechsel <t.fuechsel@gmx.de>,
	Lukas Prause <lukas.prause@ikt.uni-hannover.de>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 2/2] selftests: net: packetdrill: add ROCCET RTO test
Date: Wed, 18 Nov 2026 10:28:13 +0800
Message-ID: <20261118022813.9778-3-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118022813.9778-1-zhiqizhangg@gmail.com>
References: <20261118022813.9778-1-zhiqizhangg@gmail.com>
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

Add a packetdrill test for the ROCCET idle restart on RTO.  TLP is
enabled, so the first RTO is affected; the test asserts that
tp->snd_ssthresh stays at the prior cwnd (20) across the first and
second RTOs.

The test fails at the first RTO without the preceding fix
(snd_ssthresh == 10) and passes with it.  A variant with
tcp_early_retrans=0 (no TLP) fails at the second RTO only.

CONFIG_TCP_CONG_ADVANCED and CONFIG_TCP_CONG_ROCCET are added to the
packetdrill config; ROCCET is only visible when advanced congestion
control is enabled.

Test written by Eric Dumazet.

Suggested-by: Eric Dumazet <edumazet@kernel.org>
Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---
 .../testing/selftests/net/packetdrill/config  |  2 +
 .../net/packetdrill/tcp_roccet_rto.pkt        | 63 +++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_roccet_rto.pkt

diff --git a/tools/testing/selftests/net/packetdrill/config b/tools/testing/selftests/net/packetdrill/config
index b7df8bf309..6e012141d5 100644
--- a/tools/testing/selftests/net/packetdrill/config
+++ b/tools/testing/selftests/net/packetdrill/config
@@ -6,6 +6,8 @@ CONFIG_NET_SCH_FIFO=y
 CONFIG_NET_SCH_FQ=y
 CONFIG_SYN_COOKIES=y
 CONFIG_SYSCTL=y
+CONFIG_TCP_CONG_ADVANCED=y
 CONFIG_TCP_CONG_CUBIC=y
+CONFIG_TCP_CONG_ROCCET=y
 CONFIG_TCP_MD5SIG=y
 CONFIG_TUN=y
diff --git a/tools/testing/selftests/net/packetdrill/tcp_roccet_rto.pkt b/tools/testing/selftests/net/packetdrill/tcp_roccet_rto.pkt
new file mode 100644
index 0000000000..dabaf07f32
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_roccet_rto.pkt
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0
+// Test that ROCCET does not take its "restart after idle" path on RTO.
+//
+// An RTO retransmit raises CA_EVENT_TX_START, because all outstanding
+// packets were just marked lost (tcp_packets_in_flight() == 0) while
+// tp->packets_out is not zero. If (now - tp->lsndtime) >= icsk_rto,
+// roccet_cwnd_event_tx_start() used to overwrite the snd_ssthresh
+// that tcp_enter_loss() had just set with TCP_INIT_CWND.
+//
+// TLP is enabled here. The RTO timer is rearmed for a full icsk_rto when
+// the loss probe is sent, and the probe is the last transmit, so the
+// very first RTO is affected.
+
+`./defaults.sh
+./set_sysctls.py /proc/sys/net/ipv4/tcp_slow_start_after_idle=1`
+
+    0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 setsockopt(3, SOL_TCP, TCP_CONGESTION, "roccet", 6) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 1) = 0
+
+   +0 < S 0:0(0) win 65535 <mss 1000,sackOK,nop,nop,nop,wscale 7>
+   +0 > S. 0:0(0) ack 1 <mss 1460,nop,nop,sackOK,nop,wscale 8>
+  +.1 < . 1:1(0) ack 1 win 511
+   +0 accept(3, ..., ...) = 4
+
+// ROCCET paces its packets: do not expect precise outgoing packets,
+// rely on TCP_INFO instead.
+   +0 write(4, ..., 10000) = 10000
+  +.1 < . 1:1(0) ack 10001 win 511
+   +0 %{ assert tcpi_snd_cwnd == 20, tcpi_snd_cwnd }%
+
+// RTT is 100ms, RTO is ~300ms. Nothing is acked from now on.
+   +0 write(4, ..., 20000) = 20000
+
+// TLP fires ~250ms after the write.
+  +.4 %{
+assert tcpi_ca_state == TCP_CA_Open, tcpi_ca_state
+assert tcpi_total_retrans == 1, tcpi_total_retrans
+}%
+
+// First RTO, ~300ms after the TLP probe.
+// ROCCET is still in LAUNCH state: ssthresh is set to the prior cwnd.
+  +.3 %{
+assert tcpi_ca_state == TCP_CA_Loss, tcpi_ca_state
+assert tcpi_backoff == 1, tcpi_backoff
+assert tcpi_total_retrans == 2, tcpi_total_retrans
+assert tcpi_snd_cwnd == 10, tcpi_snd_cwnd
+assert tcpi_snd_ssthresh == 20, tcpi_snd_ssthresh
+}%
+
+// Second RTO, ~600ms after the first one.
+  +.6 %{
+assert tcpi_ca_state == TCP_CA_Loss, tcpi_ca_state
+assert tcpi_backoff == 2, tcpi_backoff
+assert tcpi_total_retrans == 3, tcpi_total_retrans
+assert tcpi_snd_cwnd == 10, tcpi_snd_cwnd
+assert tcpi_snd_ssthresh == 20, tcpi_snd_ssthresh
+}%
+
+// Reset sysctls
+`/tmp/sysctl_restore_${PPID}.sh`
-- 
2.54.0 (Apple Git-157)


