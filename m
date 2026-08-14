Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05292C15A9;
	Fri, 14 Aug 2026 01:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786670642; cv=none; b=d1cC9ErBf+s4KhYlTu4RYuHZNaKz1EYoppgyuHb7XNTn2PC6YCMBvgAME4wIwCBsltVazOm6GYL/A1ApcdZywedgNggp3DkJ/C/GxwTTF45Fl+8Jo/UHKE/+bH9/LFUqLce0ur7r6Nx17ikDTEbizf+uQTCVao9cCdQ0n/XqOkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786670642; c=relaxed/simple;
	bh=JsyvOg9rjTf2hAeKT1VysvEtzgppe/dkSdHBwPkBKBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZURkvUazEG0qV0GOoyaxUpLXAE/186g45KWxn66B2p4uo12NYBtfxufTHVFfHddOvMSPJw/elB644SykG0sktdF3Vkg0E9Xirnqz0t9/o3W3FJ++TAan535i5RU7P8o0fAcq+qa98gkG8WL/eJuwVnpbu6oCiLyVFAwstKL0m2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com; spf=pass smtp.mailfrom=fastmail.com; dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b=chkyoF/a; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WZE6aCbG; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="chkyoF/a";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WZE6aCbG"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 0AD321D00369;
	Thu, 13 Aug 2026 21:23:59 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 13 Aug 2026 21:23:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1786670638; x=
	1786757038; bh=rJLxpVcsRT8Jm6zvl8Grul58U/k9DfNInr4+C1bG06c=; b=c
	hkyoF/aUNVMiMve8rGi0EEwgyfGHkY+7bg0kb1seeKX2ASrqOscc80aG0dfAtnDQ
	ikfzwl0KbFiJodnD5Y6vNEW/fsKGLcqBqF9QheYGhh3+P6/35bYTuOtqlhuWw6d8
	DgV0E430Qi0rwV5RZuyV4xDnS32WV6VDlKVuwnpBJDQ7NSZpIZRXbE850DKHlzo9
	Q4f3pqEVyIN7WQkA7003VhW48m8V/b0U2RrZorCqHa0ZUk91NnWWCgxE5YdR8coT
	F1QMp0aZRzc61GgEK7YCZCs+ESFsGQ3K2DOoiDbwQFWatqOrIYk52qLmTAw7uXfI
	o/lOMzL39+3yIPMQty/CA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786670638; x=1786757038; bh=r
	JLxpVcsRT8Jm6zvl8Grul58U/k9DfNInr4+C1bG06c=; b=WZE6aCbGVSvpRqXeV
	VXxCYnOQsz9deuooCRCHXnRxp2jBhyNNPLHt5ysWeMSOFFbHlpnhxwFJfv3JC4JA
	s42UekWlMNKvH6Xh0mt6XAzygbQlV55G1mv+V5HZSHnlNcRojQkZNSMVNaeRWWpi
	lqSbHDDedENRSxpmj6Lh9rLrBcKcQXe6C6VY6tneftnx8SmDi9AIPNo7MyzPKBgP
	4/150Eq72GKmyXED6pIpIYYgPSevrKUhH3lVd6QoQRq5p7JQdb5wlRV+gyse+LbY
	JjvSTg4NxNe+BtPC3rCxxI3M1xixkkXkk2M9yAe53ozpX76nE3BK7vHJ29PIcrgh
	NJjYQ==
X-ME-Sender: <xms:Lm5-akVyN0kYU9g6Syo8qtIoteiGXOHlY4mdmvLpZWriWIMU3_-K_g>
    <xme:Lm5-agy2U-2KcRW-_y8r51z_lQqGksEPk440R-lHRWX8k12smRN4afhBYaPhPPfh1
    65oah28G4sr0ZWTVCSX2Qbx5E7WuG3rLJLHS4otsN_zFVhOPjxhBM4>
X-ME-Received: <xmr:Lm5-aj8NvgZrL7FCg-Wd3e581WQ18iJ63FiIjDMI4sMGiCchEay3AsshoeObxcvMhAwZT3ZtXwzvPhgpIhRo3cxsq1EMPNc>
X-ME-Proxy-Cause: dmFkZTGlnKkc0TwPTb5JNCkAi+5Y8WSjcjjDWnkOIL2wNpUcV13CZto/qOXRm0nqGz7tPy
    KJEebetoFzGPCWAi43zBJPWh3lU6UkLAyBFZ6j4oxxM9R/f/XZ4XCVK2pzL/y7LQGFZvpR
    D/CrmLT9KZ1KsmxXyRJ2t1g6Nt6RO09HBhWhLe5eSw/EkIsnwI9+bk4+c3v7X8vnF67GAZ
    x5aPFmOtLpYkgdaSPCL5jXIqRgeyslKNbDZfP9OeqYyBjk5QInrgyNovvVM3MvStCRC0Vf
    KMYutq9dcLsVOl/YKHQj65USZyVlLayx+Z5CvgQ+ECO90Jd7U6/TgSqqZrFbLu3cB39ngO
    m8WCv8SRr8SVjfatIJpnKDbHvvyYPYGihdxKWE6oXt1NvXMNMf5d2ohaHZTvR36J1WQBPH
    AJ9JIG/VFfPwHWoHh4CmoI9UZ54Y67Mpvj7iBs7vmfhVAoITAFm/cPc5JfKC3YKzva0Kyk
    frUhty89a+OTQ0BqQW09Y/s4ZKl2oqpMZkYAL1Dwq95OXlKtAe28v6kXZ3gWNbZ2Zl7XFS
    6S9CbK8AZtvrDid2c1qf87W1PPdICY5NTAhj2dNv+mqgD28+dFsbH3dmRkiYvp7L5dgP77
    YENw9rOKQA75TIH8XnV/q6QAgxFiy1cE37Y+oIHS1xMEy3FYmCfPI0G5JLJg
X-ME-Proxy: <xmx:Lm5-at_DXtnf_bxU0uDfhTEdXdLdQ8FclnZTD7TDg2PKT8N3q1O4bg>
    <xmx:Lm5-aqUDNpyXuOKZDphdIiSdopv3UuplUKfRvCDUjwLtUgYvnXP9_w>
    <xmx:Lm5-aieeRnNF6k8RVFcsjevNwRmDk9gp3bcHQIFgzCCbGly4_Wp9bQ>
    <xmx:Lm5-arZ75_R7xn0SridGAYLGDLZKuPR0mLQknVXjNm_RnUsBoUNRow>
    <xmx:Lm5-aq-BtEYfESBVtzI24BhuqIv7ZJsWbuVpU4BRxPK_6DkSxcw7ACZ1>
Feedback-ID: i80b64ba7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Aug 2026 21:23:58 -0400 (EDT)
From: Juanlu Herrero <juanlu@fastmail.com>
To: netdev@vger.kernel.org,
	dw@davidwei.uk
Cc: io-uring@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kuba@kernel.org,
	asml.silence@gmail.com,
	pabeni@redhat.com,
	shuah@kernel.org,
	Juanlu Herrero <juanlu@fastmail.com>
Subject: [PATCH net-next v5 4/6] selftests: net: add multithread client support to iou-zcrx
Date: Thu, 13 Aug 2026 20:23:46 -0500
Message-ID: <20260814012348.46958-5-juanlu@fastmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260814012348.46958-1-juanlu@fastmail.com>
References: <20260814012348.46958-1-juanlu@fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add pthreads to the iou-zcrx client so that multiple connections can be
established simultaneously. Each client thread connects to the server
and sends its payload independently.

Introduce the -t option to control the number of threads (default 1),
preserving backwards compatibility with existing tests.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Juanlu Herrero <juanlu@fastmail.com>
---
 .../testing/selftests/drivers/net/hw/Makefile |  2 +-
 .../selftests/drivers/net/hw/iou-zcrx.c       | 35 +++++++++++++++++--
 2 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/Makefile b/tools/testing/selftests/drivers/net/hw/Makefile
index 78bb0169350b2..37023ba580de7 100644
--- a/tools/testing/selftests/drivers/net/hw/Makefile
+++ b/tools/testing/selftests/drivers/net/hw/Makefile
@@ -91,5 +91,5 @@ include ../../../net/ynl.mk
 include ../../../net/bpf.mk
 
 ifeq ($(HAS_IOURING_ZCRX),y)
-$(OUTPUT)/iou-zcrx: LDLIBS += -luring
+$(OUTPUT)/iou-zcrx: LDLIBS += -luring -lpthread
 endif
diff --git a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
index 9b62fd0703e61..f793a6c04e412 100644
--- a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
+++ b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
@@ -4,6 +4,7 @@
 #include <error.h>
 #include <fcntl.h>
 #include <limits.h>
+#include <pthread.h>
 #include <stdbool.h>
 #include <stdint.h>
 #include <stdio.h>
@@ -85,6 +86,7 @@ static int cfg_send_size = SEND_SIZE;
 static struct sockaddr_in6 cfg_addr;
 static unsigned int cfg_rx_buf_len;
 static bool cfg_dry_run;
+static int cfg_num_threads = 1;
 
 static char *payload;
 
@@ -379,7 +381,7 @@ static void run_server(void)
 		error(1, 0, "test failed\n");
 }
 
-static void run_client(void)
+static void *client_worker(void *arg)
 {
 	ssize_t to_send = cfg_send_size;
 	ssize_t sent = 0;
@@ -405,12 +407,36 @@ static void run_client(void)
 	}
 
 	close(fd);
+	return NULL;
+}
+
+static void run_client(void)
+{
+	int total_conns = cfg_num_threads * cfg_num_threads;
+	pthread_t *threads;
+	int i, ret;
+
+	threads = calloc(total_conns, sizeof(*threads));
+	if (!threads)
+		error(1, 0, "calloc()");
+
+	for (i = 0; i < total_conns; i++) {
+		ret = pthread_create(&threads[i], NULL, client_worker, NULL);
+		if (ret)
+			error(1, ret, "pthread_create()");
+	}
+
+	for (i = 0; i < total_conns; i++)
+		pthread_join(threads[i], NULL);
+
+	free(threads);
 }
 
 static void usage(const char *filepath)
 {
 	error(1, 0, "Usage: %s (-4|-6) (-s|-c) -h<server_ip> -p<port> "
-		    "-l<payload_size> -i<ifname> -q<rxq_id>", filepath);
+		    "-l<payload_size> -i<ifname> -q<rxq_id> -t<num_threads>",
+		    filepath);
 }
 
 static void parse_opts(int argc, char **argv)
@@ -428,7 +454,7 @@ static void parse_opts(int argc, char **argv)
 		usage(argv[0]);
 	cfg_payload_len = max_payload_len;
 
-	while ((c = getopt(argc, argv, "sch:p:l:i:q:o:z:x:d")) != -1) {
+	while ((c = getopt(argc, argv, "sch:p:l:i:q:o:z:x:dt:")) != -1) {
 		switch (c) {
 		case 's':
 			if (cfg_client)
@@ -469,6 +495,9 @@ static void parse_opts(int argc, char **argv)
 		case 'd':
 			cfg_dry_run = true;
 			break;
+		case 't':
+			cfg_num_threads = strtoul(optarg, NULL, 0);
+			break;
 		}
 	}
 
-- 
2.53.0-Meta

