Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B063A782A
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 23:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775172167; cv=none; b=CUIxkDzMK6ZRpXMtdV7HIK+XvmzwdKUNVYJqKAPQ3qaaoDOzZXnWEMuSvGp9NbZvS8LUFl9hXALjnV7X3raTXpNnewfn1dX22wQ2YU4XkPs090lrJZaZQO7ldABWAASnni0lTAlgx4/+YAg0aA9WHCQFFqKyqOpTukEvmHPXyUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775172167; c=relaxed/simple;
	bh=DTdy0wGHn9nJPdYwvVneV3WjcTxwCTyqAhd+aFkuiNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SRqzytaXNlqQcopQ90SxmIujLzPLik282/rWctje95S9EPwJSRusP/YkiQTxkPrsyzB4BbGmTtUS0W+DijjaZI02ryoNQFMfAMCG6XLnlzy6t7VZCesVIpnLF7Alg3Kvq07pNW/+71Bb0miZIiXUdUi7yt4k0W7C6Wx2wO2PG7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=UjhHxjKB; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="UjhHxjKB"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c76cce85bd9so406498a12.1
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Apr 2026 16:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1775172165; x=1775776965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPx/23GDUuRn7oQUGbzWX+WqVXLgjJ891p+NWHhkBJw=;
        b=UjhHxjKB4J/ucIQj7IzKGn5JTn6iaN1jQ2phJYbD3qQjYP3JQNZYyzgsUzemltU19P
         LAXcC448YSqCnrv378IUKrc06/+7EZss4kPEeExTjLgRaRsSZoJCu30Vc8rsfIPXksnw
         FWFIxiNGRf5AQbpBfM9HZiEbqnarvsRND0AlXI5/FPN7ByZQlJ13/BUYMP8y2panWQ0X
         pGxjjZ3sEUpnqkmefTmf26MqjtBLDsZ6waPPPc3yS4/yIgXoTLoevSIsDtH2Frj8crek
         ggjn21Nq73noJsTwpOZaHJVZ4mt3H+LnQRtqm/ac0WYHeUPy4U7UPkyPizYauOkGg13H
         iQWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775172165; x=1775776965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tPx/23GDUuRn7oQUGbzWX+WqVXLgjJ891p+NWHhkBJw=;
        b=F+xaGpIL0HCzo7PL/x74X2AjafvG9nAWi4OClBS/PJUCq4/0ECnH2g4ZIZb1E7W3LK
         bxk15Rf3QjQvjJZd+ewtlGIv0imAoA3F3LgIa6vUqmCHgFMhjNSamMaj6QyhrQnI5Txt
         OQiKbkpnVS4U4e6kwFfWv6Fbr945xZz7NjA7JW9kHdns09pKhKA/YY25nuScmkzWA7zB
         0CRXp6pIJYoADb+XXm/Bnvq1tv+hM2GYgSTgDNnc3NAxkqRaGO/vXMxYuTVggawBqk9Q
         KrPDZFDlhWxkKvOAY2d+pGW5LvRZWkqJwD2AX3TYvi4nGLBnU7vdFIMXNuDZWgaTxis6
         ryRw==
X-Forwarded-Encrypted: i=1; AJvYcCW4bsWkvKYsMs4a9iNb9ztXT4XAbPfwV17A3vhxiTv/fCBTLriALdV/0nAV4oYAvBWJyhMsUidUZ+MvRByywrs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTS8eAK+jcON87+4ordyegvjRjgWLVQbsIfKmUVKe8o6LSPoNY
	oYzYJRRxEp6krebHUzp/7exr2ZZVdxID9oLPOI2zABNni9YI3mi2D7SvIXttFQ45wIM=
X-Gm-Gg: AeBDieulUv1T6HZqFIFO4SYBmQlJwYMFH15fg9ZxRSIlRd1hDje2kiaedhfkxVR09bH
	CesYWjtyKGKRxlIfLA1x4+FgvzkuSmbnEZK8lFFs9g1aMAkm/ry54SnJO4mMlnrN8WtqvzYwjCP
	ZZf9DeTAxHgHEmGs0YTqoouLkZn96AT/OX9UdhQIl0WWOA80hyrig7Rj3SUDF/rUEWlxzFiCasc
	x3lq3M4c6qM5kyfROHj7v5yQRdXgjsVvZGp/B+494aGGMKONOHhurUN3yd/6sttvM8kMN0GOrwJ
	gMuDQ3UWOP/i/e2Znmm97lqFfZ/QiEycNdB7nmIHQwu3lZMNE0FltIBRiklQ46skO2uTFdpzCMH
	OcI5z+mYGeFqeO56i1WvRZXYxdNVpMCRTTVNciAkYw4kklvBoWPOLB2BLu/wxk/Hhu6jTQhTow1
	OayPLTYzW6IXdOck8=
X-Received: by 2002:a17:902:f611:b0:2b2:65db:8c51 with SMTP id d9443c01a7336-2b28164cba3mr11916705ad.8.1775172165399;
        Thu, 02 Apr 2026 16:22:45 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:5d::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749794e8sm42617235ad.53.2026.04.02.16.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 16:22:44 -0700 (PDT)
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
Subject: [net-next 3/3] selftests/net: Test PACKET_AUXDATA
Date: Thu,  2 Apr 2026 16:21:59 -0700
Message-ID: <20260402232203.2004496-4-joe@dama.to>
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

Extend the packet socket selftest, adding a recvmsg path, to test
PACKET_AUXDATA. Check basic attributes of tpacket_auxdata.

Signed-off-by: Joe Damato <joe@dama.to>
---
 tools/testing/selftests/net/psock_snd.c  | 57 ++++++++++++++++++++++--
 tools/testing/selftests/net/psock_snd.sh |  5 +++
 2 files changed, 59 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/net/psock_snd.c b/tools/testing/selftests/net/psock_snd.c
index 7bbce274b9f0..682e0afe364d 100644
--- a/tools/testing/selftests/net/psock_snd.c
+++ b/tools/testing/selftests/net/psock_snd.c
@@ -40,6 +40,7 @@ static bool	cfg_use_qdisc_bypass;
 static bool	cfg_use_vlan;
 static bool	cfg_use_vnet;
 static bool	cfg_drop;
+static bool	cfg_aux_data;
 
 static char	*cfg_ifname = "lo";
 static int	cfg_mtu	= 1500;
@@ -281,9 +282,26 @@ static int setup_rx(void)
 
 static void do_rx(int fd, int expected_len, char *expected)
 {
+	char cmsg_buf[1024] = {};
+	struct msghdr msg = {};
+	struct iovec iov[1];
 	int ret;
 
-	ret = recv(fd, rbuf, sizeof(rbuf), 0);
+	if (cfg_aux_data) {
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
@@ -292,6 +310,31 @@ static void do_rx(int fd, int expected_len, char *expected)
 	if (memcmp(rbuf, expected, ret))
 		error(1, 0, "recv: data mismatch");
 
+	if (cfg_aux_data) {
+		struct cmsghdr *cmsg = CMSG_FIRSTHDR(&msg);
+		struct tpacket_auxdata *adata;
+
+		if (!cmsg)
+			error(1, 0, "auxdata null");
+
+		if (cmsg->cmsg_level != SOL_PACKET)
+			error(1, 0, "cmsg_level != SOL_PACKET");
+
+		if (cmsg->cmsg_type != PACKET_AUXDATA)
+			error(1, 0, "cmsg_type != PACKET_AUXDATA");
+
+		adata = (struct tpacket_auxdata *)CMSG_DATA(cmsg);
+
+		if (adata->tp_net != ETH_HLEN)
+			error(1, 0, "cmsg tp_net != ETH_HLEN");
+
+		if (adata->tp_len != expected_len)
+			error(1, 0, "cmsg tp_len != %u", expected_len);
+
+		if (adata->tp_snaplen != expected_len)
+			error(1, 0, "cmsg tp_snaplen != %u", expected_len);
+	}
+
 	fprintf(stderr, "rx: %u\n", ret);
 }
 
@@ -312,6 +355,10 @@ static int setup_sniffer(void)
 		if (setsockopt(fd, SOL_SOCKET, SO_RCVBUF, &one, sizeof(one)))
 			error(1, errno, "setsockopt SO_RCVBUF");
 
+	if (cfg_aux_data)
+		if (setsockopt(fd, SOL_PACKET, PACKET_AUXDATA, &one, sizeof(one)))
+			error(1, errno, "setsockopt PACKET_AUXDATA");
+
 	pair_udp_setfilter(fd);
 	do_bind(fd);
 
@@ -322,8 +369,11 @@ static void parse_opts(int argc, char **argv)
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
@@ -436,7 +486,8 @@ static void run_test(void)
 		check_packet_stats(fds);
 	}
 
-	do_rx(fdr, cfg_payload_len, tbuf + total_len - cfg_payload_len);
+	if (!cfg_aux_data)
+		do_rx(fdr, cfg_payload_len, tbuf + total_len - cfg_payload_len);
 
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
2.52.0

