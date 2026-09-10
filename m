Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C30857982A;
	Thu, 10 Sep 2026 18:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789063791; cv=none; b=ByO6xQSYLo3yCJVt3hWIdVYIdmE+uYBfdPNsBHjbnUMnBaagIkB4VadGG5Ao7rpSYuxJ967tGh5TQvYceWEBMlgtiQJp8AsnBM4nc15omhJVmhjeD44ykGbjuNSXOzEI0C+2UPNA2zuMZsNBTNhlcBUzDR3UzCxuZjGtK9+RgnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789063791; c=relaxed/simple;
	bh=W8EE3u46dp8cHeR4vyIuI1eHp+oIhfLynDuPDtL+npk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ql2d9/8BrO8T9Vqlcfm+OvjdLkUJvPRD/JmUooz/Oq/tWNR74RniI2PVQrmcrb/2W+cFxw2b0esKSZxMUnz0zGDKDQu+Pb8bFZGjxVQ6W3glGsDSRXIwyujZHDIzTBX0BQcB5znEdDBDuuSX9kMldb6/V7L2oRKDQtY6LoQbh/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aCWIsRaa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aCWIsRaa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26D151F000FF;
	Thu, 10 Sep 2026 18:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789063788;
	bh=2kx4i/5vuO1bwBYb/SFslZeM845NWdOIhPQSfY8uSPU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aCWIsRaazdlT9pc/pa+zVL11V8omSJdY/oDvLyLze5Vp7+yNgwMJ7iaH+l6FKsGC1
	 aES/9Ulo8PnuqKYa6F6eN0pKNX92YtnvxoADcNDQuq7Ltmq+0ezPcXWv8GSccMzxqA
	 jIZtga21NM7cjvOJri0ls/NuWKQnKMpCIgiJ3IHvHWiMS8KDgLCv7LT17zpaSA//qY
	 R9S70NnqN1WZub8M7sbvnT+G+fNslkhjLB2RLpnXzTXynGvo+igT9GB2EMew3W5DEP
	 A+vbeBCL81oyli6V1IzKWm5MpQZPQLF8bSzHlc4ilM9JoqprXorzrb9WiidFxU/+Ww
	 6EMdW8UhZoNkw==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Dimitri Daskalakis <daskald@meta.com>,
	Weiming Shi <bestswngs@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Breno Leitao <leitao@debian.org>,
	Tao Cui <cuitao@kylinos.cn>,
	Pavel Begunkov <asml.silence@gmail.com>,
	David Wei <dw@davidwei.uk>
Subject: [PATCH net-next v2 5/5] selftests: drv-net: Test large zcrx buffers
Date: Thu, 10 Sep 2026 20:09:05 +0200
Message-ID: <20260910180908.1506533-6-bjorn@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910180908.1506533-1-bjorn@kernel.org>
References: <20260910180908.1506533-1-bjorn@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A zcrx RX buffer larger than PAGE_SIZE does not prove that the
driver uses space beyond the first MTU-sized part of the buffer.

The test assumes that a driver which accepts a large rx_buf_len uses
space beyond the first MTU-sized region during sustained receive
traffic. Drivers which do not support large buffers are expected to
reject the requested size; the feature probe then skips them. A driver
which accepts the size but only uses the first MTU-sized region fails.

Request a power-of-two RX buffer larger than twice the device MTU and
require one zero-copy receive CQE to end past the first MTU-sized
region.

Signed-off-by: Björn Töpel <bjorn@kernel.org>
---
 .../selftests/drivers/net/hw/iou-zcrx.c       | 33 ++++++++++++++++---
 .../selftests/drivers/net/hw/iou-zcrx.py      |  6 +++-
 2 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
index f6a8fc5fac24..c0d9065b2103 100644
--- a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
+++ b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
@@ -84,6 +84,9 @@ static int cfg_oneshot_recvs;
 static int cfg_send_size = SEND_SIZE;
 static struct sockaddr_in6 cfg_addr;
 static unsigned int cfg_rx_buf_len;
+static unsigned int cfg_min_data_end;
+static bool cfg_check_data_end;
+static bool seen_data_end;
 static bool cfg_dry_run;
 
 static char *payload;
@@ -298,6 +301,15 @@ static void process_recvzc(struct io_uring *ring, struct io_uring_cqe *cqe)
 	mask = (1ULL << IORING_ZCRX_AREA_SHIFT) - 1;
 	data = (char *)area_ptr + (rcqe->off & mask);
 
+	if (cfg_check_data_end) {
+		unsigned int rx_buf_len = cfg_rx_buf_len ?: page_size;
+		unsigned int data_end_off;
+
+		data_end_off = (rcqe->off & mask) % rx_buf_len + n;
+		if (data_end_off > cfg_min_data_end)
+			seen_data_end = true;
+	}
+
 	for (i = 0; i < n; i++) {
 		if (*(data + i) != payload[(received + i)])
 			error(1, 0, "payload mismatch at %d", i);
@@ -373,7 +385,10 @@ static void run_server(void)
 		server_loop(&ring);
 
 	if (!stop)
-		error(1, 0, "test failed\n");
+		error(1, 0, "test failed after receiving %zu bytes", received);
+	if (cfg_check_data_end && !seen_data_end)
+		error(1, 0, "no payload CQE ending past offset %u",
+		      cfg_min_data_end);
 }
 
 static void run_client(void)
@@ -406,8 +421,11 @@ static void run_client(void)
 
 static void usage(const char *filepath)
 {
-	error(1, 0, "Usage: %s (-4|-6) (-s|-c) -h<server_ip> -p<port> "
-		    "-l<payload_size> -i<ifname> -q<rxq_id>", filepath);
+	error(1, 0,
+	      "Usage: %s (-4|-6) (-s|-c) -h<server_ip> -p<port>\n"
+	      "\t-l<payload_size> -i<ifname> -q<rxq_id>\n"
+	      "\t[-x<rx_buf_pages>] [-E<min_data_end>] [-d]\n",
+	      filepath);
 }
 
 static void parse_opts(int argc, char **argv)
@@ -425,7 +443,7 @@ static void parse_opts(int argc, char **argv)
 		usage(argv[0]);
 	cfg_payload_len = max_payload_len;
 
-	while ((c = getopt(argc, argv, "sch:p:l:i:q:o:z:x:d")) != -1) {
+	while ((c = getopt(argc, argv, "sch:p:l:i:q:o:z:x:E:d")) != -1) {
 		switch (c) {
 		case 's':
 			if (cfg_client)
@@ -463,6 +481,10 @@ static void parse_opts(int argc, char **argv)
 		case 'x':
 			cfg_rx_buf_len = page_size * strtoul(optarg, NULL, 0);
 			break;
+		case 'E':
+			cfg_check_data_end = true;
+			cfg_min_data_end = strtoul(optarg, NULL, 0);
+			break;
 		case 'd':
 			cfg_dry_run = true;
 			break;
@@ -484,6 +506,9 @@ static void parse_opts(int argc, char **argv)
 
 	if (cfg_payload_len > max_payload_len)
 		error(1, 0, "-l: payload exceeds max (%d)", max_payload_len);
+	if (cfg_check_data_end &&
+	    cfg_min_data_end >= (cfg_rx_buf_len ?: page_size))
+		error(1, 0, "-E: offset outside rx_buf_len");
 }
 
 int main(int argc, char **argv)
diff --git a/tools/testing/selftests/drivers/net/hw/iou-zcrx.py b/tools/testing/selftests/drivers/net/hw/iou-zcrx.py
index b7a225fe4bea..a9f62c6b950b 100755
--- a/tools/testing/selftests/drivers/net/hw/iou-zcrx.py
+++ b/tools/testing/selftests/drivers/net/hw/iou-zcrx.py
@@ -175,9 +175,13 @@ def test_zcrx_large_chunks(cfg) -> None:
 
     single(cfg)
     page_size = resource.getpagesize()
+    mtu = cfg.dev["mtu"]
     nr_pages = 2
+    while nr_pages * page_size <= 2 * mtu:
+        nr_pages *= 2
     rx_buf_len = nr_pages * page_size
-    rx_cmd = f"{cfg.bin_local} -s -p {cfg.port} -i {cfg.ifname} -q {cfg.target} -x {nr_pages}"
+    rx_cmd = (f"{cfg.bin_local} -s -p {cfg.port} -i {cfg.ifname} "
+              f"-q {cfg.target} -x {nr_pages} -E {mtu}")
     tx_cmd = f"{cfg.bin_remote} -c -h {cfg.addr_v['6']} -p {cfg.port} -l 12840"
 
     probe = cmd(rx_cmd + " -d", fail=False)
-- 
2.55.0

