Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C553B9D81;
	Mon, 31 Aug 2026 17:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788197713; cv=none; b=a/EnkDvE15e5XN50ZokMrFge0yZp6dEfLf9zRNYqJpji+t6TzU7dYZ+APSodEpEpnZuWVx7m/Uj8Nn6sVWb9aMMCYbbivGkN8uJBWJIgmYN6S2dMvGTQ4o65qGHSqhTVsq0l8Bo7Ab+XjQGDeSTuJo+Li+Uew3ER3t1o/GZAS4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788197713; c=relaxed/simple;
	bh=+cZeEo+a0++I1r0xjOE4IQlexdTAzk6BpO64xwnD9Oo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dRgjjIKUp9ipYvjjsJuHl8CBgThcDIctGrFwbS1mmrlZDj5Xxh7uy9HT/elzQnjFsJx4lZZ8fcEeaF9Qh13He5m0GSAJeO5a/DzhEv+/V0qWIcZ49m6enyvxbq1YWaEb43ZfqhouWtMGCfPT9T8tePhvYoqC/4cnMuE2Y4PVR+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com; spf=pass smtp.mailfrom=fastmail.com; dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b=hbwEBcGr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LYbV3aXL; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="hbwEBcGr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LYbV3aXL"
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6BCEB140015A;
	Mon, 31 Aug 2026 13:35:10 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Mon, 31 Aug 2026 13:35:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1788197710;
	 x=1788284110; bh=Eoz5RTS9FtP/9zGLBVui0sj/D8MYQnKfLx8NTj9JzOc=; b=
	hbwEBcGruTFdD04FXX0c+0GvPwheet92R53ZguWaPeZuJye2VojKELWlT+CGqC2f
	rr/gmmEynNbBbFEqf/vGcJNQZg12fqMsdPqpLBqriNDF6jL4BGrzM18kwl6yeoOj
	qTy7L1UPykIso8LYnR4fqCFehYk4FshzBs/jvDGaTo3mc0gebUpRwfntH7yUs+Uo
	1UKYWx8imDHUFGEFLgTh5R02sWkJcmFJbtJ3bwoMKJs8hmzl+K0kcEqJ8YWPT02Z
	vXf67UeI5LgJ6UvDoMRX2eNioZV+qa0RtsEybpcmUZ6Bxb0NJr/2EzRZKC2ME7a/
	WwJmj3R9majjf6GSA9z9TA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1788197710; x=
	1788284110; bh=Eoz5RTS9FtP/9zGLBVui0sj/D8MYQnKfLx8NTj9JzOc=; b=L
	YbV3aXLO88mNwSpexB0zDYYOMF6KwPa2E0w8b2Kpvn3rERERx/mNqR3c+k1s+JGW
	bqAwCdRiM6g3dvVTuYBj1fDuFkjLQxBZqmJamv3GEn3+7OBmvfQB7NDdCJz8TsLN
	7THp4pYUFuPz2bszhMEgE9Nn/v/a6V/v4RmPE0RalkP+PnyzX/0FDv58km+FF16r
	tD5+hl8xB+0Y/S42/oWwL0vRdy2oWxMaVM1Sm3R9Yp1OxdUxyBH6LdLqVVxn+3xC
	sxrtQRoGeJmOAKtqKrXsH2a188KALhM/ZcZpsTmjpE57QSLZsmyYDF1Y4hyBPa9T
	5SLk5IDJDpVFbKTtbxkDw==
X-ME-Sender: <xms:TruVasAUuhR-qk4QnkrHMAFzvu-WxHu8HPw3zYRsMgYmD9JlMdokkQ>
    <xme:TruVamtmUWVQiDMjHjRLyEcLnJ6pBpvpRiEVunvsqS1YjcwtLIl9LiXaHlJwVwIro
    UiaCn4b343TqH6_fYhX33FT0qIGHhW0qc5OI02RRETe0DmagldaD6Z->
X-ME-Received: <xmr:TruVarJ_ywN392SaMS6g045MF5PaLAP8p0Spz0x4EISAOckKxFA_AQeDh2E1kDxmTls_aZTQfzACY8jQioH1JgzSFOtZZQ>
X-ME-Proxy-Cause: dmFkZTF6JiRdfk5Vs3phyclJ7AyUnOw1eG5omI5b6IFtHmdMG1Lppg8fUif7VfKKU3b6EJ
    RBQvPQj6dVCJiEi5e+7Y3+kf8PG/Ge5w4TzaXZZ7j3sTkSkMwX4Mi+MkjA0yTzQsSv7usH
    00naaOBrgEdSne1kiz+bIxzSnoR/CSvQ0vMfe1Kjg/eHzpDhX2WM56g/1khOZ1TxFjNTNE
    9tDn1+PQ5yGMB+HjfDSkKDiUv+BDB6Z7IT1pYyJBpAMs+BnD/He17cBJuXR66FgqKrkqHU
    Ytvp0Z86JKudXFPmiy+Ok/IProGM+X4xLlD7XvjGiC7GqHdfdQ3Y+1rrG51Zu4Reqb29Bu
    SiaSZFMpNLIiYkvrGAB1Kc7+eikSe1b4x+tWtV3luTMSpDUNzo7lsrgJtm2xU1+b4asTSn
    zR1Hm7isf/1Sbbzd355wpmkkeg2M31+F1qV9U/0oWRhDDLbgwA8f5RQ4B71zgPTJlOHJhL
    pdJn3nrXH8XpyOF1mHsbB6NHsU/QL7jAxgjOSgHYusU/OMdmaKnqnVSIARhKwe6gSqu+on
    VriSQuVI2fPA05G6UTAFRidP+LMWMBzAJmWWF5oU/yMNFlKWIp1zTz3b3BZ3T+wU8EDs4m
    xX5usFPjb/QaO0rGW8PZargBINgsap5rVOQdabW7cEfadGB+i6XQJO92dRaA
X-ME-Proxy: <xmx:TruVatbQ7-hEdKiv3w600edb5rEzmV7Q7T2VocTTf10Eq9NygC4Jdw>
    <xmx:TruVatByUrT_vHndDx01QiQEh2FIe-ce5WTZmafnBjBQIGZcMiQeeg>
    <xmx:TruVanaV5ggS3wgWlv35nog1xYtHMjQ42BJ6Pjh3M_f40BbxdQ6SZA>
    <xmx:TruValnCCOFy3c98zivkmQVOZGoAoubAc59Qxg4IraroNtvwoqi3GA>
    <xmx:TruVatKLsKq2YmLMqOkULHJiJh7GHcJfrMMvKGS4XXZzOdhjAnCKYYmM>
Feedback-ID: i80b64ba7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Aug 2026 13:35:09 -0400 (EDT)
From: Juanlu Herrero <juanlu@fastmail.com>
Date: Mon, 31 Aug 2026 12:34:40 -0500
Subject: [PATCH net-next v6 4/6] selftests: net: add multithread client
 support to iou-zcrx
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-iou-zcrx-v6-4-02d1d012f0fd@fastmail.com>
References: <20260831-iou-zcrx-v6-0-02d1d012f0fd@fastmail.com>
In-Reply-To: <20260831-iou-zcrx-v6-0-02d1d012f0fd@fastmail.com>
To: dw@davidwei.uk, netdev@vger.kernel.org
Cc: io-uring@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kuba@kernel.org, asml.silence@gmail.com, 
 pabeni@redhat.com, shuah@kernel.org, juanlu@fastmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3455; i=juanlu@fastmail.com;
 h=from:subject:message-id; bh=+cZeEo+a0++I1r0xjOE4IQlexdTAzk6BpO64xwnD9Oo=;
 b=owGbwMvMwCWW/91SPSt7w03G02pJDFlTd3v6zuXvNW0vmDehtHaC1r6nbi9kZ67U0uG9n3fne
 V2JSIBGx0QWBjEuBksxRRaPlyItGlMrGu+qRgjCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjoGOsYMXJwCMNX7kxn+V5Uct7zpk+63402+6hLP/ossjgVx5/hWvbNPK5rK3a2xk5HhSGzeiRk
 rtW/llfSXRD7llFVrmRa4der33EvV3No+s1/wAwA=
X-Developer-Key: i=juanlu@fastmail.com; a=openpgp;
 fpr=48E9148428957881DD2558116FF739276A6BB0D9

Add pthreads to the iou-zcrx client so that multiple connections can be
established simultaneously. Each client thread connects to the server
and sends its payload independently.

Introduce the -t option to control the number of threads (default 1),
preserving backwards compatibility with existing tests.

Assisted-by: Claude:claude-opus-4-8
Reviewed-by: David Wei <dw@davidwei.uk>
Signed-off-by: Juanlu Herrero <juanlu@fastmail.com>
---
 tools/testing/selftests/drivers/net/hw/Makefile   |  2 +-
 tools/testing/selftests/drivers/net/hw/iou-zcrx.c | 35 +++++++++++++++++++++--
 2 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/Makefile b/tools/testing/selftests/drivers/net/hw/Makefile
index 78bb0169350b..37023ba580de 100644
--- a/tools/testing/selftests/drivers/net/hw/Makefile
+++ b/tools/testing/selftests/drivers/net/hw/Makefile
@@ -91,5 +91,5 @@ include ../../../net/ynl.mk
 include ../../../net/bpf.mk
 
 ifeq ($(HAS_IOURING_ZCRX),y)
-$(OUTPUT)/iou-zcrx: LDLIBS += -luring
+$(OUTPUT)/iou-zcrx: LDLIBS += -luring -lpthread
 endif
diff --git a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
index 9b62fd0703e6..f793a6c04e41 100644
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
2.50.1

