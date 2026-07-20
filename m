Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4CC41737A
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 12:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784550449; cv=none; b=kk2ebYPM3bxGmuE2YQ6CtOxfeopNbflD0uEMbq+6ob2NQENZkPMLRAvKN/D/1e2ycqJOXixod6p+x5MI/AG2e2OYRNaSCDmExRvj4lD2ZRZg3y0pjoqPbikqfn8iVi7V2NxDrZjq7Ml7Mm1P4SNqkCCc13aVOa9D9s6ZZn80NLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784550449; c=relaxed/simple;
	bh=4TLrIvDe/bg8t4VrjCVE1fid6WLH027l0LXzVNxj/gY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b3jlrGjkjg1kMGjMhqe0S044f29E36lxs9O1XoON2a9pmbe8N8x41c/faynieiBmnCYupqSFoql+xyP88SN/ShpAuStgBDxCJSj0dk+Bp8hbb6ak8BbjvvPAxpkBNz4d+8J3/mFGuYVs9PlXdxFFfOFCeroJJaLAE9bHlOwTl0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=YCdSEJE2; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="YCdSEJE2"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ce7d2adef4so96247105ad.3
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 05:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1784550447; x=1785155247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kT3+457ZgQQK/w6X8ImwhZLDpK+RRyfUesrwJruiOJM=;
        b=YCdSEJE2gwWGNVSWaZE+AIy8vJMATbZtMa7ZSBOTDqrisMmT06NK56oRf8csgsB2jn
         nRNHZa+n4YqUJcqHPDcvEnPjI/DpUZLOJL1BPXGeGVR0yWfUnp327t1mWnCv0wPZ08Sz
         rc5DDXExP0vmmu0lS5d8l5JFgJ6bfPYX2Ms9eEr1yhYhLN+NdNj3rcw1Z+OpDSy8SSdu
         HMyIh1BFBWbun4DmpM1X2XW47BSFhojyvANxHB8m4JLhYaLPXYOiBxkgWAA2nZkgK8H3
         iRLjFB/BQ27JCUbXotxx6uME211KsS4Ab4Ze6e7CqtKApR7FyTZutBrr4lGSGEiNP5da
         xj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784550447; x=1785155247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kT3+457ZgQQK/w6X8ImwhZLDpK+RRyfUesrwJruiOJM=;
        b=VNm6btX2XF0kkc7fxPLW3lfwyScXalTm4Za9re0wM859Dv6ry8Q1YUcj/nqNE15pI1
         N+xLefEXWBVyHym9vTYz69RP79ogR03B7WpXjVqSN5rByd8gqyU2F1e+xbHZgtu/K0XC
         YGSIa+J3+i7kpK51QPsgcLnnV+iAaqLKSA+PkohIu8O6xYXrJb0OOVPPD+6R53/9wVup
         1tHMaxnlMr0f6fubMsGEd7SKDYtgaJEtGY8LRY8jBA6h5dSWuJEjR/A0H+SGlb3fUot5
         zC3iBP3P+0TY+XbZ3I6SP8rLfH8rvMP44nSiyBv9dkCJhYKvxosqhNFDtSS8hPqoG11s
         AZ5A==
X-Forwarded-Encrypted: i=1; AHgh+RphR7ebZFMWkz/Kym5u81upApoA87OGEJXNL/Ul2kVi7IxotJLye0h/Nmw2+NZioz72AeD4soLr/F3vY1mDrro=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK5QXlvqJuV4sYEvBKBulEATso3BYFGBlzdunzmBXXzOOkoFXC
	9D2nHGteAHFGMbLzZVk5TVwKMbWPu9B8d/aIW+5C7xz0Vjsg7nbZPQE2aC+PKjdvsfI=
X-Gm-Gg: AR+sD13d7ZivTs1n2XaOevGMVLgfyJNnbzP01LBQyGp2B6B4PEg6OcDrJ57XCjWUf/B
	W2X8jLidUm2/cQ/m191YhsKWUkI68oMoHRG9UlwnBRib72G3ZoQvBYBiIYZ9BndGO/Y4ayK4cKn
	JSppClvWOxG7DhtsMv/OT6CeXUEZjjTWgnIcZ1MQ4PCOP8hDtYXdNbNFOU9N+YKitS0qKW47xGP
	q0Q+pY55y3JJdSQg9SVnFCrTtvoDwC+mb+jBJrpij+X5qX/EOyMuh/cXSTk0IxKHv+MuCf3Jqxq
	zhfSReu4Dr0rl/4wkwSUe/YLlevB4YsWP1RcSMIcVVzZ+fjvHAPMDXXkopuPrDeVF018WsAuknU
	g7INP6u3YQqK/+umF2Q5fY9k6otYIttUTB9bvk5O78Rk3q7AH4rpj6MQjhpk=
X-Received: by 2002:a17:903:4405:b0:2ca:ca48:c380 with SMTP id d9443c01a7336-2cf34a07a97mr151607535ad.47.1784550447012;
        Mon, 20 Jul 2026 05:27:27 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:52::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344b1ef8sm58641475ad.21.2026.07.20.05.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 05:27:26 -0700 (PDT)
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
Subject: [PATCH net-next v3 3/3] selftests/net: Test PACKET_AUXDATA
Date: Mon, 20 Jul 2026 05:27:12 -0700
Message-ID: <20260720122714.759175-4-joe@dama.to>
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

Extend the packet socket selftest, adding a recvmsg path, to test
PACKET_AUXDATA. Check basic attributes of tpacket_auxdata.

Signed-off-by: Joe Damato <joe@dama.to>
---
 tools/testing/selftests/net/psock_snd.c  | 70 ++++++++++++++++++++++--
 tools/testing/selftests/net/psock_snd.sh |  5 ++
 2 files changed, 70 insertions(+), 5 deletions(-)

 v3:
  - Prevent combining test_auxdata and test_drops.
  - Include an aligned(8) for the cmsg to ensure (1) buffer
    alignment for cmsg struct fields and (2) aligned payload access.

 v2:
  - Add is_psock bool argument to do_rx.
  - Factor out aux data check into its own function for readability.

diff --git a/tools/testing/selftests/net/psock_snd.c b/tools/testing/selftests/net/psock_snd.c
index 81096df5cffc..bee81227f5b0 100644
--- a/tools/testing/selftests/net/psock_snd.c
+++ b/tools/testing/selftests/net/psock_snd.c
@@ -40,6 +40,7 @@ static bool	cfg_use_qdisc_bypass;
 static bool	cfg_use_vlan;
 static bool	cfg_use_vnet;
 static bool	cfg_drop;
+static bool	cfg_aux_data;
 
 static char	*cfg_ifname = "lo";
 static int	cfg_mtu	= 1500;
@@ -279,11 +280,54 @@ static int setup_rx(void)
 	return fd;
 }
 
-static void do_rx(int fd, int expected_len, char *expected)
+static void check_aux_data(struct cmsghdr *cmsg, int expected_len)
 {
+	struct tpacket_auxdata *adata;
+
+	if (!cmsg)
+		error(1, 0, "auxdata null");
+
+	if (cmsg->cmsg_level != SOL_PACKET)
+		error(1, 0, "cmsg_level != SOL_PACKET");
+
+	if (cmsg->cmsg_type != PACKET_AUXDATA)
+		error(1, 0, "cmsg_type != PACKET_AUXDATA");
+
+	adata = (struct tpacket_auxdata *)CMSG_DATA(cmsg);
+
+	if (adata->tp_net != ETH_HLEN)
+		error(1, 0, "cmsg tp_net != ETH_HLEN");
+
+	if (adata->tp_len != expected_len)
+		error(1, 0, "cmsg tp_len != %u", expected_len);
+
+	if (adata->tp_snaplen != expected_len)
+		error(1, 0, "cmsg tp_snaplen != %u", expected_len);
+}
+
+static void do_rx(int fd, int expected_len, char *expected, bool is_psock)
+{
+	char cmsg_buf[1024] __attribute__((aligned(8))) = {};
+	bool aux = is_psock && cfg_aux_data;
+	struct msghdr msg = {};
+	struct iovec iov[1];
 	int ret;
 
-	ret = recv(fd, rbuf, sizeof(rbuf), 0);
+	if (aux) {
+		iov[0].iov_base = rbuf;
+		iov[0].iov_len = sizeof(rbuf);
+
+		msg.msg_iov = iov;
+		msg.msg_iovlen = 1;
+
+		msg.msg_control = cmsg_buf;
+		msg.msg_controllen = sizeof(cmsg_buf);
+
+		ret = recvmsg(fd, &msg, 0);
+	} else {
+		ret = recv(fd, rbuf, sizeof(rbuf), 0);
+	}
+
 	if (ret == -1)
 		error(1, errno, "recv");
 	if (ret != expected_len)
@@ -292,6 +336,12 @@ static void do_rx(int fd, int expected_len, char *expected)
 	if (memcmp(rbuf, expected, ret))
 		error(1, 0, "recv: data mismatch");
 
+	if (aux) {
+		struct cmsghdr *cmsg = CMSG_FIRSTHDR(&msg);
+
+		check_aux_data(cmsg, expected_len);
+	}
+
 	fprintf(stderr, "rx: %u\n", ret);
 }
 
@@ -312,6 +362,10 @@ static int setup_sniffer(void)
 		if (setsockopt(fd, SOL_SOCKET, SO_RCVBUF, &one, sizeof(one)))
 			error(1, errno, "setsockopt SO_RCVBUF");
 
+	if (cfg_aux_data)
+		if (setsockopt(fd, SOL_PACKET, PACKET_AUXDATA, &one, sizeof(one)))
+			error(1, errno, "setsockopt PACKET_AUXDATA");
+
 	pair_udp_setfilter(fd);
 	do_bind(fd);
 
@@ -322,8 +376,11 @@ static void parse_opts(int argc, char **argv)
 {
 	int c;
 
-	while ((c = getopt(argc, argv, "bcCdDgl:qt:vV")) != -1) {
+	while ((c = getopt(argc, argv, "abcCdDgl:qt:vV")) != -1) {
 		switch (c) {
+		case 'a':
+			cfg_aux_data = true;
+			break;
 		case 'b':
 			cfg_use_bind = true;
 			break;
@@ -373,6 +430,9 @@ static void parse_opts(int argc, char **argv)
 
 	if (cfg_use_gso && !cfg_use_csum_off)
 		error(1, 0, "option gso (-g) requires csum offload (-c)");
+
+	if (cfg_aux_data && cfg_drop)
+		error(1, 0, "option aux data (-a) conflicts with drop (-D)");
 }
 
 static void check_packet_stats(int fd)
@@ -432,11 +492,11 @@ static void run_test(void)
 	/* BPF filter accepts only this length, vlan changes MAC */
 	if (cfg_payload_len == DATA_LEN && !cfg_use_vlan) {
 		do_rx(fds, total_len - sizeof(struct virtio_net_hdr),
-		      tbuf + sizeof(struct virtio_net_hdr));
+		      tbuf + sizeof(struct virtio_net_hdr), true);
 		check_packet_stats(fds);
 	}
 
-	do_rx(fdr, cfg_payload_len, tbuf + total_len - cfg_payload_len);
+	do_rx(fdr, cfg_payload_len, tbuf + total_len - cfg_payload_len, false);
 
 out:
 	if (close(fds))
diff --git a/tools/testing/selftests/net/psock_snd.sh b/tools/testing/selftests/net/psock_snd.sh
index b6ef12fad5d5..111c9e2f0d21 100755
--- a/tools/testing/selftests/net/psock_snd.sh
+++ b/tools/testing/selftests/net/psock_snd.sh
@@ -97,4 +97,9 @@ echo "raw gso max size + 1 (expected to fail)"
 echo "test drops statistics"
 ./in_netns.sh ./psock_snd -D
 
+# test aux data
+
+echo "test aux data"
+./in_netns.sh ./psock_snd -a
+
 echo "OK. All tests passed"
-- 
2.53.0-Meta

