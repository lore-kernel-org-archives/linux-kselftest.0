Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009D739B94C
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 23:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775172165; cv=none; b=jOXh/Tl3wDAteODzipPCJVGhGVl6CoUSWyq75t7NNRuGslYWDJ6kdz+moeG9TN1BAoax+ppNq5Ikh0pdSaBLnUt03z0vGVKkKvHoho1p+as1mjlNXGCDVoJqV8mQzrQ/oYQdSGp0lbtRpsXkHwF8lVnIB+rLobQiFpSZ3Ddg3Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775172165; c=relaxed/simple;
	bh=Tjl8imYH1OqXLWE1hPP3jcyr3QCjzn5ejtwy1XlU14c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FqOusMeTJLEWHlv1NEpxS9v+DTZa+YXf5TIqjJjGqkeQhs97uNu4LfM4GhGXLnXFJdwTRZrPgoGsMRo9D4L9OcA0CtyA4vMPpRmQ53FNjyGymoIMzHJQcjOLxToa8dbkl6sklEqesYkhgUVsvp7D+E5Gk27o9LRewBZAVMoMS5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=CNJijNab; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="CNJijNab"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82cef263bedso714319b3a.0
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Apr 2026 16:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1775172163; x=1775776963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Syye3jGbYJUGP9iil2Gf3tWEkqi92NaZ66fdyleX4E8=;
        b=CNJijNabvExYIGaObQNLzgv9yFh6J2hhDbMpfvlv3j0cS0QRWRFj+PLaRkHdimwYOA
         xxnihqq0KFrDxQywV6mcf9y5w1BJKKF4ISFqJFlutgpeQUwo7d/x0gulT0cpoTbSyF7o
         LSeFvKi4oIxHr2F3ZsRymVTqN6eTOWJapchTz8JY60gx7363UK7TVIsyXia0MbGEnPIo
         kdmDTPlWD7pqacX9ZMoOFkwr//XfRxDnBdiT4NXsR1JWo019XLYx01hIZ99E/ctfdeq6
         SHuElnk9jxHPhsryLNqn9QfSIWOeYhIJeqAXpq0Ze6S+dMWehlRDqjfDrk0pu2ZDAqhT
         py7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775172163; x=1775776963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Syye3jGbYJUGP9iil2Gf3tWEkqi92NaZ66fdyleX4E8=;
        b=NglkX44MAKdJTcPOkNMjtO0tqtvT53Iz8AjgRuHMLLjuccroASlDVl7CI/QMeWXXi0
         SOvm5/WhfHOtzLbWoyWu2ZPB4LVBLi3Teyk49+nACZPCDxOyBH1mZP8KmF35T5bo9lJY
         u0BSyE7NHJAq1Gn2BMmwabs7AfbMTQBeF9mnXVcDd4HDz02zYEGIsD72L7bJRoECKQVR
         Iqvv6bA7g2yjaC7UY0sCDyV3kz0W6EHtqPhW88Xs39JKCwFauPY4tG2OOe3n1bRBD4+w
         nK9urdJyjIB4AGzlkVhULJCk+1imsxogaBCJ4XHOQnmyV9kPbFJ2zpZIU58ZHOjI8J+3
         htow==
X-Forwarded-Encrypted: i=1; AJvYcCWCHme6gK88q63bD5aj+Bc2nKfBQm6OTqP/9w3LRLeLvL+nUUpYCb2v9eTI9Eb42qW2ogJoX5dzF+dYp8XLKSA=@vger.kernel.org
X-Gm-Message-State: AOJu0YydUIbU4Jg7Jvu5l9GSDizxmL909HnYvVq5cGaBU7gtcNqUXzSB
	Vh+NV1NJ12FnhzzGbsG+ZiDUlwohjnbnPD42jRJJm4OqbMbbPdBOP/ZV9PYH3uBK6w4=
X-Gm-Gg: ATEYQzwOJMqrdXeR9erQlK9LORyNIOF9/1R9P+DyF2XdJI7m2uCv2E8iZ0cU3MkZu+k
	l+S5oJ4b1NfZaeoXZpDtkOwW0gthyofCgXHEskx02VMEa9uIbAP1uvSg2SX+aRf5g6SogZhCPG3
	3Cyc7ayzydlNlasaURuCngTg9GKtBanvMKvSR6ap85aMhBrCGiotrvft4F2VYeL5D9WNXgGpdm4
	AQt87SlYxQAGZiKMkG1Ux/T+Ki2K9uBUtN56CrtJy8C8d9cox/ieGjucHUPlnNDfuPx8QzSsv4/
	QvO20nLZTsZ82frlzYIpDxrfz71/v413IxVcZRk4ZKXDo5OZUPYZmnSQBrpuvtkOsKxjCmLsWaQ
	xrn/kQ+9IUV0Vn0JkJxT+7QhmJqXl0Dz4s2pIwAx+NiYWXKz56WTLAmV6H+d3T0U0FCSNhXSREg
	hQTzvO
X-Received: by 2002:a05:6a00:4b53:b0:82c:e1a3:986f with SMTP id d2e1a72fcca58-82d0db93629mr734500b3a.43.1775172163414;
        Thu, 02 Apr 2026 16:22:43 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:47::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3ccc8sm5445968b3a.19.2026.04.02.16.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 16:22:43 -0700 (PDT)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: andrew+netdev@lunn.ch,
	linux-kernel@vger.kernel.org,
	willemb@google.com,
	Joe Damato <joe@dama.to>,
	linux-kselftest@vger.kernel.org
Subject: [net-next 2/3] selftests/net: Test PACKET_STATISTICS drops
Date: Thu,  2 Apr 2026 16:21:58 -0700
Message-ID: <20260402232203.2004496-3-joe@dama.to>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260402232203.2004496-1-joe@dama.to>
References: <20260402232203.2004496-1-joe@dama.to>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend psock_snd to test drops by setting a tiny receive buffer and
sending a large burst of packets.

Signed-off-by: Joe Damato <joe@dama.to>
---
 tools/testing/selftests/net/psock_snd.c  | 52 ++++++++++++++++++++----
 tools/testing/selftests/net/psock_snd.sh |  5 +++
 2 files changed, 48 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/net/psock_snd.c b/tools/testing/selftests/net/psock_snd.c
index 5be481a3d2bd..7bbce274b9f0 100644
--- a/tools/testing/selftests/net/psock_snd.c
+++ b/tools/testing/selftests/net/psock_snd.c
@@ -39,6 +39,7 @@ static bool	cfg_use_gso;
 static bool	cfg_use_qdisc_bypass;
 static bool	cfg_use_vlan;
 static bool	cfg_use_vnet;
+static bool	cfg_drop;
 
 static char	*cfg_ifname = "lo";
 static int	cfg_mtu	= 1500;
@@ -49,6 +50,8 @@ static uint16_t	cfg_port = 8000;
 /* test sending up to max mtu + 1 */
 #define TEST_SZ	(sizeof(struct virtio_net_hdr) + ETH_HLEN + ETH_MAX_MTU + 1)
 
+#define BURST_CNT (1000)
+
 static char tbuf[TEST_SZ], rbuf[TEST_SZ];
 
 static unsigned long add_csum_hword(const uint16_t *start, int num_u16)
@@ -212,13 +215,14 @@ static void do_send(int fd, char *buf, int len)
 	if (ret != len)
 		error(1, 0, "write: %u %u", ret, len);
 
-	fprintf(stderr, "tx: %u\n", ret);
+	if (!cfg_drop)
+		fprintf(stderr, "tx: %u\n", ret);
 }
 
-static int do_tx(void)
+static int do_tx(bool burst)
 {
 	const int one = 1;
-	int fd, len;
+	int i, fd, len;
 
 	fd = socket(PF_PACKET, cfg_use_dgram ? SOCK_DGRAM : SOCK_RAW, 0);
 	if (fd == -1)
@@ -242,6 +246,10 @@ static int do_tx(void)
 
 	do_send(fd, tbuf, len);
 
+	if (burst)
+		for (i = 0; i < BURST_CNT; i++)
+			do_send(fd, tbuf, len);
+
 	if (close(fd))
 		error(1, errno, "close t");
 
@@ -290,6 +298,7 @@ static void do_rx(int fd, int expected_len, char *expected)
 static int setup_sniffer(void)
 {
 	struct timeval tv = { .tv_usec = 100 * 1000 };
+	const int one = 1;
 	int fd;
 
 	fd = socket(PF_PACKET, SOCK_RAW, 0);
@@ -299,6 +308,10 @@ static int setup_sniffer(void)
 	if (setsockopt(fd, SOL_SOCKET, SO_RCVTIMEO, &tv, sizeof(tv)))
 		error(1, errno, "setsockopt rcv timeout");
 
+	if (cfg_drop)
+		if (setsockopt(fd, SOL_SOCKET, SO_RCVBUF, &one, sizeof(one)))
+			error(1, errno, "setsockopt SO_RCVBUF");
+
 	pair_udp_setfilter(fd);
 	do_bind(fd);
 
@@ -309,7 +322,7 @@ static void parse_opts(int argc, char **argv)
 {
 	int c;
 
-	while ((c = getopt(argc, argv, "bcCdgl:qt:vV")) != -1) {
+	while ((c = getopt(argc, argv, "bcCdDgl:qt:vV")) != -1) {
 		switch (c) {
 		case 'b':
 			cfg_use_bind = true;
@@ -323,6 +336,9 @@ static void parse_opts(int argc, char **argv)
 		case 'd':
 			cfg_use_dgram = true;
 			break;
+		case 'D':
+			cfg_drop = true;
+			break;
 		case 'g':
 			cfg_use_gso = true;
 			break;
@@ -367,11 +383,23 @@ static void check_packet_stats(int fd)
 	if (getsockopt(fd, SOL_PACKET, PACKET_STATISTICS, &st, &len))
 		error(1, errno, "getsockopt packet statistics");
 
-	if (st.tp_packets != 1)
-		error(1, 0, "stats: tp_packets %u != 1", st.tp_packets);
+	if (cfg_drop) {
+		/* PACKET_STATISTICS reports all packets seen (including
+		 * drops) in tp_packets
+		 */
+		if (st.tp_packets < st.tp_drops)
+			error(1, 0, "stats: tp_packets %u < tp_drops %u",
+			      st.tp_packets, st.tp_drops);
 
-	if (st.tp_drops != 0)
-		error(1, 0, "stats: tp_drops %u != 0", st.tp_drops);
+		if (st.tp_drops == 0)
+			error(1, 0, "stats: expected drops but tp_drops == 0");
+	} else {
+		if (st.tp_packets != 1)
+			error(1, 0, "stats: tp_packets %u != 1", st.tp_packets);
+
+		if (st.tp_drops != 0)
+			error(1, 0, "stats: tp_drops %u != 0", st.tp_drops);
+	}
 
 	/* verify clear on read */
 	memset(&st, 0xff, sizeof(st));
@@ -394,7 +422,12 @@ static void run_test(void)
 	fdr = setup_rx();
 	fds = setup_sniffer();
 
-	total_len = do_tx();
+	total_len = do_tx(cfg_drop);
+
+	if (cfg_drop) {
+		check_packet_stats(fds);
+		goto out;
+	}
 
 	/* BPF filter accepts only this length, vlan changes MAC */
 	if (cfg_payload_len == DATA_LEN && !cfg_use_vlan) {
@@ -405,6 +438,7 @@ static void run_test(void)
 
 	do_rx(fdr, cfg_payload_len, tbuf + total_len - cfg_payload_len);
 
+out:
 	if (close(fds))
 		error(1, errno, "close s");
 	if (close(fdr))
diff --git a/tools/testing/selftests/net/psock_snd.sh b/tools/testing/selftests/net/psock_snd.sh
index 1cbfeb5052ec..b6ef12fad5d5 100755
--- a/tools/testing/selftests/net/psock_snd.sh
+++ b/tools/testing/selftests/net/psock_snd.sh
@@ -92,4 +92,9 @@ echo "raw gso max size"
 echo "raw gso max size + 1 (expected to fail)"
 (! ./in_netns.sh ./psock_snd -v -c -g -l "${max_mss_exceeds}")
 
+# test drops statistics
+
+echo "test drops statistics"
+./in_netns.sh ./psock_snd -D
+
 echo "OK. All tests passed"
-- 
2.52.0

