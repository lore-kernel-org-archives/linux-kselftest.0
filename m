Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E1F390C8D
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 23:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775259169; cv=none; b=PdS2nRAp2jdEgiObkMoJ8atx5buJ1iLK/cK7JHzUrQb4nSVa4zatV8rkwqsqYHI1JUA0BauxDKVys1uLBSHE0W+7JEMPZSy9dbKgBSRWIt5X2V6Vtv3/pIlTkBFfcY/S0dJZK4PHKw0n+GMEmg/zzl+OXse10rv831zwYLYU3F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775259169; c=relaxed/simple;
	bh=8u6Vcz4YEaqdwMjUhYyBFSVV6aDirjiazJWuyGBCAys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QCoJG9Hi1mG1UQM1HTOTyommSCzhUjBGb5Gu+pFdfao+cvy+aoBEHGIXBPE3a3yS3NWBr8Yly49AxaAoVpBdsbFHgXUDwn3AjKu2yXfKH2LGVHv3xb8LWNv7y6WJmmXgy3y1gzMjMWJ9cEs6mv00j4J0bDtLmM1RAKP46XVn2cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=gmEdLujT; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="gmEdLujT"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b2503753efso18890365ad.0
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Apr 2026 16:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1775259168; x=1775863968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENmI8Ny0OErVg3hwraYcnSl67J/rk4Ki/13t8pRcNeM=;
        b=gmEdLujT/oYX1U0zkkB5QfBKgnGzae9znyVcJS+mdzOpYcSy3eLu3O0Ic1KlRaCpS2
         nYwWhAizM9QhYIw3432SNbc1OgsHplYHEkAcPuUC9ftNQUAX0ePdM7EmaJPq76pdKhsw
         hoTcI4sX8bY5IPHfdnlZf8R10thUvrAcawtwkfZPN+V+uXqScNA8eGB3wIOeUqlniErA
         C73JAEENZQGnm6IlahInD0Kj5XiCMeBmZhbKBkUJ+a4ddPJQKbdUzYjy7lf9Vu3gzDc+
         OhxHben3W/sTmL+1dQfEz5djq7OKtLX/aDxtGKzsJtW56bCSjJLX/he3LfAKelVTk99e
         53Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775259168; x=1775863968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ENmI8Ny0OErVg3hwraYcnSl67J/rk4Ki/13t8pRcNeM=;
        b=eFbXP1zoHooRVsisoH5QZ29xDtLXyocq7b/5KsdKYISRsOLGBvnHLXWs2yT6WGXCar
         6zTD4Da39Qwz5G3Vd+5B7RU9YQhogmI2+eE1FAaTL6aNWYzv25pAz3iw9ZMdNMqmjfvQ
         igZwSlyKNn6nlfR9TSklFLaRVjOSIsrc/miPXhAAcwmuZWn+m3yD+Ow5Kqn8lWKkqV5s
         dmLbq/4/pRd5lEPd4dY1taVYcq1+yXoCyZl82RqMvqvRV3jwU9EQiuZSHLFGund826VF
         u55yj5g0kKNirTzQzrWjhDvQbtk/hP81QgCKg2He4THScO5/RVqE4YQEXEV9H5QoU7o8
         A9zA==
X-Forwarded-Encrypted: i=1; AJvYcCXFH6kGn2I3SNObLDxDCQawYNsEWCbv1RzeOgX/MnNQbNPOQKsH8NxGhGQN7GR0fSRVxmPKWW4vzpFJMVxkips=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg6Kdby7e6tYFPN9nmDz6rhl4WSZQ/w8FVXdSPi6Zpd2iUwW99
	zQGJbliC8TtUpZDNRWTg7nZoXK0Jwyn2nHGCY2YOV2TT6B+jV7+lwdZj8hx3KTv/m0o=
X-Gm-Gg: AeBDievoAMbgxaVuMvBjKNmfLmeF8vfMdAFhFctYCrRFUAFKTTSyyURR8WKSf28YHq+
	zzaqmGGtZI9s91rRzYUz0XwfOJBeM4I8Q7Oj4PqTZtZ35Js1QODvU6X3AfsLwIE3OTDMnQ6s69+
	zLsR756KAuQShccFzZO5oISpvhU1mtJKK1FVPqBnENM5X3if12P6VdKgNiv/tdjfD1rw/lHqBc4
	cZ1KiKyINGirfHEa2+0QD8ugvn8SH4jdj+WaY6iAu2F0wKxVr24urjptQleeLCIgCTSuMv3LwoY
	PEosLIuHMW5rdpSXbiXLjhf+eopHEjyAZanzT0UEI+hEVaNnIELR4aVAzopj6C60z1qO+kc8kZe
	5gxYN0wtMkvjnCOT4MA1z4njgTr6qm4E3Ow7JBIOmKhzEf7WOhZGKjIq6CaOhnLU3ZSojkP/6tf
	b2D1Y=
X-Received: by 2002:a17:903:b0e:b0:2b2:52af:52b8 with SMTP id d9443c01a7336-2b28184a5cfmr45941305ad.11.1775259168002;
        Fri, 03 Apr 2026 16:32:48 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:6::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478cb4fsm75994305ad.29.2026.04.03.16.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 16:32:47 -0700 (PDT)
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
Subject: [net-next v2 2/3] selftests/net: Test PACKET_STATISTICS drops
Date: Fri,  3 Apr 2026 16:32:37 -0700
Message-ID: <20260403233240.178948-3-joe@dama.to>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260403233240.178948-1-joe@dama.to>
References: <20260403233240.178948-1-joe@dama.to>
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
 tools/testing/selftests/net/psock_snd.c  | 48 ++++++++++++++++++++----
 tools/testing/selftests/net/psock_snd.sh |  5 +++
 2 files changed, 46 insertions(+), 7 deletions(-)

v2:
  - Remove do_tx argument and use global cfg_drop instead

diff --git a/tools/testing/selftests/net/psock_snd.c b/tools/testing/selftests/net/psock_snd.c
index 5be481a3d2bd..81096df5cffc 100644
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
 
 static int do_tx(void)
 {
 	const int one = 1;
-	int fd, len;
+	int i, fd, len;
 
 	fd = socket(PF_PACKET, cfg_use_dgram ? SOCK_DGRAM : SOCK_RAW, 0);
 	if (fd == -1)
@@ -242,6 +246,10 @@ static int do_tx(void)
 
 	do_send(fd, tbuf, len);
 
+	if (cfg_drop)
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
@@ -396,6 +424,11 @@ static void run_test(void)
 
 	total_len = do_tx();
 
+	if (cfg_drop) {
+		check_packet_stats(fds);
+		goto out;
+	}
+
 	/* BPF filter accepts only this length, vlan changes MAC */
 	if (cfg_payload_len == DATA_LEN && !cfg_use_vlan) {
 		do_rx(fds, total_len - sizeof(struct virtio_net_hdr),
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

