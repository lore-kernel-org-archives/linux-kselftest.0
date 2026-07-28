Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2AD459AF9
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 16:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785255007; cv=none; b=RdjpDYAQpBDTkXSD14uX/aMKy+WY3COUVnZCeYlEZtIQBE1cVzB1x4zoNL3OEb8pbMmSx9hM9Bi3IZNSN4tKEQKzsG46nkjmx0sS2EyJ+lLRDlm8dyT6NzXUh0hn9DrvoM7bBSwVA/JIq6HJciFLpbP4ZapJZTJk9gmY3tdXGzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785255007; c=relaxed/simple;
	bh=qTQ94GDWz13qQ8wsjs5bSk//XeqVn3eDxi9Sa9U6g0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iWsc4Cpdn8zk9xNBAEbPEpdXAGpWJxBR27xziFg70OEX4t2/jr+XZ5E2FlnFPp7vklnXW3g/4bGla1ZWwi85Rfc9ZOEFENtKY90nhEdeDmendJjeUBoo6wU+OyjHW6+XQhyJJ1suVx0YJ3vlzyrsgnUmux1W92c0vBC8UVxcyNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=zSBcpFFc; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="zSBcpFFc"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so2775586a12.1
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 09:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1785255005; x=1785859805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VPWxgaLDrPWFJHW7bhO6DGEGBljMDa2/8aUKOWLglUQ=;
        b=zSBcpFFc9OJ0y8G80rCopiYnw2FdTELIU55N2GCaSW9pnoDzVkFQ+w99xVz/oSeBmK
         v7/EE6N2UsApb2AvHaUcTJhEUvSKVQwQ+w68CfnTZeH48jwCMlYbZv3AM56wu0FG5GrH
         1jedfxzjGRK44DoCyqRdeulz45AHxE4gBrzslokBxMjt4Y9r6qIsd/BdeoBv6mhkZ0bw
         jpo4RlxcdKRfuW2epxdSrYjh27HDblw1eBjspjOjDyhbrUYdgsq+E8pmP7Psh0PP1ziO
         ji7Xy2BdQDx4928ce0q7l4tK18TBZdS5Gc/a6DK/O9+zdbzORqTdRzxsE/MNa/FUNBiY
         8sSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785255005; x=1785859805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VPWxgaLDrPWFJHW7bhO6DGEGBljMDa2/8aUKOWLglUQ=;
        b=bx6QZUkP8XFF2deSqOTJujfWw76XlXp3lk80rdNWaCETcUhd/bGO0f8+A/xAzIsnnr
         BjDu3X9XnMeg99zNU64NMC7/lfXJ+oUKx0OQ7CFaSDBGlGZ2NMEcvdw5wcRdWifHJKr1
         mUaErhAq+IFktuHsUFwK3ASs0t3UHksnpTuMZLI1y4qgUz16I4YHCcIV0BJipqo6YV8n
         iZluJnIVTU/S9RDtqwQb0/iQVAFxi3z4vLYlA8bB3v9LAs7yfzHvUfqATUgMVpU4J6Yu
         KTdeHZS6KaICPRbNm/ba7VqzfoVm1nsA2vCIw6VovCucwQLODgulCBNKo0IST8p0egSv
         0rdw==
X-Forwarded-Encrypted: i=1; AHgh+RpMsMNSH7+ond+EprPy5lhaivCPfF+CUSsjmsj9yd0JKcIpYnjwSY5iDNm3Tf5sZFZ8kibm/39IlI65/CRH7Lw=@vger.kernel.org
X-Gm-Message-State: AOJu0YydCfJdTEe38ErC6RdVWb1RAOEQYOyaisnK/469VhLunOMsMVWM
	mU0IRHFg/+GycxFDBjn2s6ICv+lNYl9Kt1yeQ53ouJOQsHuW0RxEOqMoW1/eR8GKV6U=
X-Gm-Gg: AR+sD12ff1Zhp5agrPEJD7SbzeYanMXWxx8kh+OdnO8JrnGya6fDp3GiHOnRfAf6mdt
	cXo9COhPr2QO3uxRBZA1Oaxh88FzdKq7wzgFVkCn5DjGo8+92aY5DblQnNtmGvixcdmvXVvaAEU
	32QUt+a8VBPvV+NnLxbviftA3s+o6IEzd5cb6lqyLo/xWcuF7alIrZMlyy6iQ5Lp3zy26rUXbxw
	/h/c6jDFEHLJ9Vvw+XTMoyg8q7EfKsCav2ANHqwlyFqYISxuK7VCwNfEfoPZZsix/OKM0cnyB60
	HvDm4VY8ETWM9GikGlamcZZcJvpXxk5g3TLPVSuVNj55TDzn9sGMdIZTlbpJc++yfJTLwNanC+2
	LsJGS4iLNvFxW9CAidxrh/tzNWFGVmkuZXP3Q08oJFsrIc6oqvHX44ux+L/I=
X-Received: by 2002:a05:6a21:4cc7:b0:3c3:9fc4:3ff5 with SMTP id adf61e73a8af0-3c8ba45e8eemr3908138637.29.1785255004809;
        Tue, 28 Jul 2026 09:10:04 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:42::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb660deeasm4872205a12.3.2026.07.28.09.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 09:10:04 -0700 (PDT)
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
Subject: [PATCH net-next 5/5] selftests/net: test PACKET_IGNORE_OUTGOING
Date: Tue, 28 Jul 2026 09:09:30 -0700
Message-ID: <20260728160935.4128982-6-joe@dama.to>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260728160935.4128982-1-joe@dama.to>
References: <20260728160935.4128982-1-joe@dama.to>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Test that setsockopt PACKET_IGNORE_OUTGOING:

 - works with valid values (0 and 1),
 - rejects values outside of that range, and

When enabled for a loopback sniffer, it only produces 1 copy of the
packet (rx) instead of two copies (tx and rx). Use sll_pkttype to check
the direction of the packet to ensure the correct packet is sniffed.

Signed-off-by: Joe Damato <joe@dama.to>
---
 tools/testing/selftests/net/psock_snd.c  | 84 +++++++++++++++++++++++-
 tools/testing/selftests/net/psock_snd.sh |  5 ++
 2 files changed, 87 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/psock_snd.c b/tools/testing/selftests/net/psock_snd.c
index f23877942ea3..0f6a30b26912 100644
--- a/tools/testing/selftests/net/psock_snd.c
+++ b/tools/testing/selftests/net/psock_snd.c
@@ -41,6 +41,7 @@ static bool	cfg_use_vlan;
 static bool	cfg_use_vnet;
 static bool	cfg_drop;
 static bool	cfg_aux_data;
+static bool	cfg_ignore_outgoing;
 
 static char	*cfg_ifname = "lo";
 static int	cfg_mtu	= 1500;
@@ -377,7 +378,14 @@ static int setup_sniffer(void)
 			error(1, errno, "setsockopt PACKET_AUXDATA");
 
 	pair_udp_setfilter(fd);
-	do_bind(fd);
+
+	/* binding to ETH_P_ALL adds the sniffer to ptype_all, which will see
+	 * the dev_queue_xmit_nit copy. ignore_outgoing should suppress this.
+	 */
+	if (cfg_ignore_outgoing)
+		do_bind_proto(fd, ETH_P_ALL);
+	else
+		do_bind(fd);
 
 	return fd;
 }
@@ -386,7 +394,7 @@ static void parse_opts(int argc, char **argv)
 {
 	int c;
 
-	while ((c = getopt(argc, argv, "abcCdDgl:qt:vV")) != -1) {
+	while ((c = getopt(argc, argv, "abcCdDgil:qt:vV")) != -1) {
 		switch (c) {
 		case 'a':
 			cfg_aux_data = true;
@@ -409,6 +417,9 @@ static void parse_opts(int argc, char **argv)
 		case 'g':
 			cfg_use_gso = true;
 			break;
+		case 'i':
+			cfg_ignore_outgoing = true;
+			break;
 		case 'l':
 			cfg_payload_len = strtoul(optarg, NULL, 0);
 			break;
@@ -443,6 +454,10 @@ static void parse_opts(int argc, char **argv)
 
 	if (cfg_aux_data && cfg_drop)
 		error(1, 0, "option aux data (-a) conflicts with drop (-D)");
+
+	if (cfg_ignore_outgoing && (cfg_drop || cfg_aux_data))
+		error(1, 0,
+		      "option ignore outgoing (-i) conflicts with -D and -a");
 }
 
 static void check_packet_stats(int fd, unsigned int expected_packets)
@@ -486,6 +501,66 @@ static void check_packet_stats(int fd, unsigned int expected_packets)
 		error(1, 0, "stats: tp_drops %u != 0 after clear", st.tp_drops);
 }
 
+static void set_ignore_outgoing(int fd, int val)
+{
+	socklen_t len = sizeof(int);
+	int got = -1;
+
+	if (setsockopt(fd, SOL_PACKET, PACKET_IGNORE_OUTGOING,
+		       &val, sizeof(val)))
+		error(1, errno, "setsockopt PACKET_IGNORE_OUTGOING %d", val);
+
+	if (getsockopt(fd, SOL_PACKET, PACKET_IGNORE_OUTGOING, &got, &len))
+		error(1, errno, "getsockopt PACKET_IGNORE_OUTGOING");
+	if (got != val)
+		error(1, 0, "getsockopt: expected %d got %d", val, got);
+}
+
+static void check_ignore_outgoing_range(int fd)
+{
+	int val;
+
+	/* Values outside [0, 1] must be rejected with -EINVAL. */
+	val = 2;
+	if (setsockopt(fd, SOL_PACKET, PACKET_IGNORE_OUTGOING,
+		       &val, sizeof(val)) != -1 || errno != EINVAL)
+		error(1, errno,
+		      "setsockopt PACKET_IGNORE_OUTGOING val=2: expected EINVAL");
+
+	val = -1;
+	if (setsockopt(fd, SOL_PACKET, PACKET_IGNORE_OUTGOING,
+		       &val, sizeof(val)) != -1 || errno != EINVAL)
+		error(1, errno,
+		      "setsockopt PACKET_IGNORE_OUTGOING val=-1: expected EINVAL");
+}
+
+static void test_ignore_outgoing(int fds)
+{
+	char *expected = tbuf + sizeof(struct virtio_net_hdr);
+	int expected_len;
+
+	/* ptype_all sniffer on loopback should produce two copies per packet
+	 * (RX and TX).
+	 */
+	expected_len = do_tx();
+	expected_len -= sizeof(struct virtio_net_hdr);
+	do_rx(fds, expected_len, expected, true, PACKET_OUTGOING);
+	do_rx(fds, expected_len, expected, true, PACKET_HOST);
+	check_packet_stats(fds, 2);
+
+	/* 0 and 1 accepted; anything else rejected. */
+	set_ignore_outgoing(fds, 0);
+	set_ignore_outgoing(fds, 1);
+	check_ignore_outgoing_range(fds);
+
+	/* With PACKET_IGNORE_OUTGOING set, only the rx copy survives. */
+	do_tx();
+	do_rx(fds, expected_len, expected, true, PACKET_HOST);
+	if (recv(fds, rbuf, sizeof(rbuf), 0) != -1 || errno != EAGAIN)
+		error(1, errno, "expected EAGAIN, got extra packet");
+	check_packet_stats(fds, 1);
+}
+
 static void run_test(void)
 {
 	int fdr, fds, total_len;
@@ -493,6 +568,11 @@ static void run_test(void)
 	fdr = setup_rx();
 	fds = setup_sniffer();
 
+	if (cfg_ignore_outgoing) {
+		test_ignore_outgoing(fds);
+		goto out;
+	}
+
 	total_len = do_tx();
 
 	if (cfg_drop) {
diff --git a/tools/testing/selftests/net/psock_snd.sh b/tools/testing/selftests/net/psock_snd.sh
index 111c9e2f0d21..7fa0a3297988 100755
--- a/tools/testing/selftests/net/psock_snd.sh
+++ b/tools/testing/selftests/net/psock_snd.sh
@@ -102,4 +102,9 @@ echo "test drops statistics"
 echo "test aux data"
 ./in_netns.sh ./psock_snd -a
 
+# test ignore outgoing
+
+echo "test ignore outgoing"
+./in_netns.sh ./psock_snd -i
+
 echo "OK. All tests passed"
-- 
2.53.0-Meta

