Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706F2416D05
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 12:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784550446; cv=none; b=Fqz8P3ENh29JEcr20s814BMkH2KOiA03RZS24BCrunkCvzLSi9RbJIcCArTDBlLgH7Kf7B6R1ykuLGqsQ6K/HT1ajDSeHeSYNqVUpLmtpdvwnjNa3ET2DHpcF/MiVc1NuWdgK44wOjkVeYe2IytUOIgWXdiWEOK+F82LYAds75s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784550446; c=relaxed/simple;
	bh=CNmiZdmgooNTqtdT5NQZe8BpDimcizn5EFpVphYmeqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l0pqkGEKjG0gYMferlvmBhhvJ+/z0cbXarWK1ntj81sSCNQMZoiJwony8i9X78mq1mAjNOGIJtyX2g5NkdTJUaGyzd7RGbRtmENgOHUTCXBcab+TyPpbMUvGUiVSmDupCPMAnfpNo5UkMGfecb6DPpwwtSuPvK+QsEwV23Bnh34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=bg8PppHj; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="bg8PppHj"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so109002025ad.1
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 05:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1784550445; x=1785155245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iwYlMaW1hn49wtQhaqD49Ih8d5vTNFYDo+jkZ7kq2vU=;
        b=bg8PppHj4FSm2e3JL9GzJKaU6XwJ3gb9WZi7p7SMSdxCZvXscsuidjiJvhLlOV3xO1
         BFqQ32TL5X4tG1+Zje2lF5w1bBq7VOWDgoygncgVPpaGCcbVifoQqOUM3RTQcnWI0qru
         PYuPR5ZnuTvqZMhm5vk00uAkw9td8zKW/ZuPlhSrR8fr7hIpo1Vw/XXuEzdsmLQeeeoi
         OvEZs+DBQppz2IrYkhqYAKPz0llhEQkSBdCownN6C3/4g4Jryzt0ZIc4oikYleMyqJ7v
         c4mwwiRkcRH3DYCqa6UO6BsiZSZTgupBiEbxoqThVHgHZ62Z4nwVvhWtXXcUkZJTa3tB
         0hlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784550445; x=1785155245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iwYlMaW1hn49wtQhaqD49Ih8d5vTNFYDo+jkZ7kq2vU=;
        b=A4FBrLofOmI785AQ2KVNEccP94PkD2Zl5+NG1qY/gJdY3SvrYNyz+kEUJamnY5iAsP
         /HonqSOOpwIDteB2iWQRTINZTQ8fSS0TTQs3RSD4nLvbzrzkoH6JtFUrK6BJ/xtFgCWt
         Tn64UJ6AWT6YKMErL71ziFU7Mev2AK3iUYlAHo5cP6HyLXEpeCYqyhZMagsjwbb5FGy8
         FCEyFvIGFXhAnPeXa3bKHt9if4rAimjIxDgv+MYurwdrmdkZ6qZKPOJiyDQ6aKZjNULJ
         il5K33snRUi18bzGYDl+zccfCAyPP0Z+a59EQrVTi7iWC2ZDm6qaq9HfvXg4sNRvLgL4
         icxA==
X-Forwarded-Encrypted: i=1; AHgh+RqTGgrYhoUHhqYzcqVPEnGmJ8Gk2/8n9CbJowkRwkfhjQ8zMkQMYJzzayI4KsY3El+oGRwp3wWLJFLymJSjqfI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyni/BDbDsFYUkn9G901CmHUIASx4SKlzHMEcbeu4+XZEZG7fM0
	Dqtcbi1WMNZIw+XoMoyQjdSxnsi1txTPfuIn01IKMirB8WMZ/BotUw1GQDxmV4EgW9eTtiJvmb8
	+/mEa9V8svg==
X-Gm-Gg: AR+sD13nxppNquFpLOR1NK3XebGHoVZ1dtLUTah2YU4Fqibk9qHliBBtSe03VcnZyLE
	VirVsD7UucU3s0kebARhMJExoEzlbuEIDLD4IO/6cWHcK+7QygypsdkpUAtTSf30ZN9hGmkJgTm
	5FaRBMIBX86nO9SKTeQckJcBzHNmf2wHE+ERj26u52cXKKgHeV3RIksNc3H+YnuVVGPsKOv8xP5
	p2ygYBi8p1308MuaJEtO5BAdW0dufrXz9tinhU8asI/EMWVHQUaB6jXhDz/9IE/IDHLhi7+hsTH
	UbLEi1dgsCjLbtOmZgweyg+bXHkrLkgtkKea15mOgNjFpsuVKtDs3zVPFPoHuBrwGkac6FhRf83
	frehM+gw/t5KOrcyIFVNYPbBQfBNtWygM9J6acnjwcWcz9dkKvrvSR5WstZs=
X-Received: by 2002:a17:903:2350:b0:2ce:d5e4:2fcf with SMTP id d9443c01a7336-2cf34a18da5mr150640345ad.42.1784550444849;
        Mon, 20 Jul 2026 05:27:24 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:54::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344be458sm56660465ad.25.2026.07.20.05.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 05:27:24 -0700 (PDT)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: andrew+netdev@lunn.ch,
	willemb@google.com,
	linux-kselftest@vger.kernel.org,
	Joe Damato <joe@dama.to>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 2/3] selftests/net: Test PACKET_STATISTICS drops
Date: Mon, 20 Jul 2026 05:27:11 -0700
Message-ID: <20260720122714.759175-3-joe@dama.to>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260720122714.759175-1-joe@dama.to>
References: <20260720122714.759175-1-joe@dama.to>
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
2.53.0-Meta

