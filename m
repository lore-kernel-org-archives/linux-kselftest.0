Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDE93CFF6A;
	Wed,  9 Sep 2026 19:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788983504; cv=none; b=oELZ0jMzOVDadZLXZMnYWoBrOmsLQuFgEQLKWIgPgap629Wbmp1pIbFZHmZkk2FddPI+2H/qnaZWSxSwBom4PSmTMSAYXFb16vv+OLS8y7dp+neY+AjjP8ivOwrgyVFTEWE1kjfdo6dro0b7K5j3HGw3HZO8e6iMrA26mbW0mQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788983504; c=relaxed/simple;
	bh=n5X3NrCeblxlM4cRe2Sh01teMU9r2Vw+FZMMsZ9rUJo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ka80EiIa1atoZB/wlbwa9WOL1Rw9YYy3kVdjM49HjXQNtsYzbrInG88jrEZ3xZ9iop3lPds+mxwuLeVzgze4VsblftNxmHoUApsRDYSCR4QghkiBY8+b1PQWHE6jq8Ed6Z7WGFeQPV1gjfexJ7metOcPvIgHEN0/W/3SGKMZR8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com; spf=pass smtp.mailfrom=fastmail.com; dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b=SKdtBmsE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gsm1NLd1; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="SKdtBmsE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gsm1NLd1"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id D472C1D0005F;
	Wed,  9 Sep 2026 15:51:39 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 09 Sep 2026 15:51:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1788983499;
	 x=1789069899; bh=uHN8MmMii1bFhhJmK5NBxpCQ2Ex26UEj9yicFGS6wx0=; b=
	SKdtBmsEY3YzQ8jVmKU7/OFPSjpyofOqY3QIz/Px6UVC5g5yKalKRto7bUHju6XQ
	7Y0mUNIvUFoN0KZUm8yslw9VZGOWd3LkMjis7XOWlEAhYCJwRwLpN5XNcfQYlycE
	kPixRStnl/0kJMokB6yMR6rDb8lMUPXFhFMJlasbCS/AorM4nrU1yDtIypZ8LSgC
	VSc1c++XS91p6exgKHj128Z30tSZx+WxLDDJdteIbbk5uSidA38HmkqyEGZKhxJd
	yAz321DaJswNBMC/DmaSR6KxUkqssmUw+sQBdaT712FrSvKwheQa9j4KcCPZK/eQ
	adtKjXAWI0F6Qe25F2r1og==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788983499; x=
	1789069899; bh=uHN8MmMii1bFhhJmK5NBxpCQ2Ex26UEj9yicFGS6wx0=; b=g
	sm1NLd1StgMOSSK9JCB8u1dggqMEFv7y//5ZJcMLY5wFEYha60qJmpjSZ5LKXrU/
	pUUfB0+NblOW+xTPl7PnYMz5KPiO3XncX6zg5nOSSiHDcM2/U3V2JrCwAATJBlkQ
	O+WKylGYoOjHzg1tT1vaRNxGRu+3GYe0FDUbeWMZNzz9Ze1qaz3+uLBEKA8LANq4
	veDnghDxx1mlIh56b+xiR8Up2GisbmFoOJSztdCcJfcweaxbVScitzPKV/y0x6Nj
	2fi2MzxgNVbH4npObcJ5fKCVNVBpNsF5zpXxu3bGxrE32brVw8uCuLsfZfBqasTx
	EfHnvYI/cizIKAkWQczmA==
X-ME-Sender: <xms:y7ihat6d-1vd9vi-aXy4IR9UUzHqayngEJKGv74F50-ICbVC4e_7SA>
    <xme:y7ihajG8EQkBd9A_hXq5xHEaW7aqn03jsTUP9dHU_Vo5QFhxTbwezLbJ_xfEh6HQZ
    KPfZJmK65x76xt8CzDuwhJDQl4lNl7o6xyeb27SU0AMddSYTT3FDcqyDg>
X-ME-Received: <xmr:y7ihagDpR1BZ2sLjdSewzP28TbCOIeaBawLgtLmvPcogWa5bE6N9epb1yaJYRv__>
X-ME-Proxy-Cause: dmFkZTEnhrolNfQ4AYw8TgLeB94Mda0JkhAUpDCtNqjs3dVrNQ1Y3y24lWMKgZmP8M95oP
    2gJq/DMxnaGsu+6QjX7RRo3FHFhH6qoL0nA6qxBJ/BKeCqKtSa8UiT1st0s+WommnsIVhR
    zrryFxfOfOJ0iCZOrtpYmWbPt77+adxEoHzrpoW7jaVPoJlPv6OXuqYmf4qa4Y1qM+8fCm
    eYhl3u7jduesafENw0QWE6trJLZ5Zoi4rrkrILiuRWncZXKRmZFbqyobdaP73cf8kUgU+Q
    MkXKfM/U7z0W4xl9fkxpVSW9Mi2tlQIyMy71z6GBm7ROkMxBwnd0DjX6DU3w6BN8RSa0hd
    xtZURV5WjGsEJgHmiouJuYbPPHi/a7iQExxm9ZyzIIJRXZZczVfg38/BCIlLsqJeqr/3B/
    wXBEooCHb4K6O4ARe3AhUYMZj7yP6kGrBu+VKdBozWT0Vgn+e3bvTb/TxbjqqabwQYzl42
    dIG+6+Ekfqdr2wUmRNg81uUBcWU6e2XJ8IHZ/VVhJUwRM0nZQ7wl7xWj2TbbaH27wn1XXE
    JVcwd0pbWfU+Bt54f/ISKVnw64ownyeQ58Mv2h4gJIGW00T0xxzZvqe+TR+Y/jyAT3NBAh
    R8FfbjVtxjJ9xH/qAdVh6HKzxHMtMJ0EbQuKVxpa5No8fuv3PtQinqnApGNg
X-ME-Proxy: <xmx:y7ihagy7bPj3XWgzyVRxT_SzLxSHT1HnQCMBAIB6kw8W4vWT0q9VKQ>
    <xmx:y7ihas6vtkSCPT0K6RMSD2CGIeMHBASJInopr-g7Cfskwq310puHwQ>
    <xmx:y7ihapzBiBBEnhjGk6gFhWHlDx1xNaz9HIi3OhlEDFjeue577bgE9w>
    <xmx:y7ihaoeyx3vijuSxI36oHBb-kK6wl0VDQ8UzDSpbvsRCzwlCM8Vj-Q>
    <xmx:y7ihagDnKq5Brj-KcIWy-N50kN5ssK55qWjmWvdb6Hk-nlEHkIzk0GKz>
Feedback-ID: i80b64ba7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 15:51:38 -0400 (EDT)
From: Juanlu Herrero <juanlu@fastmail.com>
Date: Wed, 09 Sep 2026 14:51:26 -0500
Subject: [PATCH net-next v7 4/6] selftests: net: add multithread client
 support to iou-zcrx
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-iou-zcrx-v7-4-6b5d48a2a922@fastmail.com>
References: <20260909-iou-zcrx-v7-0-6b5d48a2a922@fastmail.com>
In-Reply-To: <20260909-iou-zcrx-v7-0-6b5d48a2a922@fastmail.com>
To: dw@davidwei.uk, netdev@vger.kernel.org
Cc: io-uring@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kuba@kernel.org, asml.silence@gmail.com, 
 pabeni@redhat.com, shuah@kernel.org, juanlu@fastmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3455; i=juanlu@fastmail.com;
 h=from:subject:message-id; bh=n5X3NrCeblxlM4cRe2Sh01teMU9r2Vw+FZMMsZ9rUJo=;
 b=owGbwMvMwCWW/91SPSt7w03G02pJDFkLdxx5/f/Vztq6ntWpG7q6+Sazf/gY8P+YzrwzSjGyl
 j/fLjfi6ZjIwiDGxWAppsji8VKkRWNqReNd1QhBmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHQMeYgYtTAKb6Qxkjw+KVDc2NIl2WbdJnltfsWvlZv7X2p5bYlYlBS0qvxt5UfcPwT+8eZ9C
 59fqOSxIbeeKqtgtss1QpWTtRN6WpPLVcqNKMBQA=
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
index bd3b8d2fa47e..69be4d052ef5 100644
--- a/tools/testing/selftests/drivers/net/hw/Makefile
+++ b/tools/testing/selftests/drivers/net/hw/Makefile
@@ -97,5 +97,5 @@ include ../../../net/ynl.mk
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

