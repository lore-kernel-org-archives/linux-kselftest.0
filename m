Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778174;
	b=5QY8BksWxb01vngkdOCDZhneZQbDkk6aoGqhbf08/ETRf5AV2gGgLUup3it9TX+/tYKe
	 T6KGKRZypLUbXN2tzRRNnh8dUoxyNqpzi7sjEBmAVG/WEYJ7DQsMwzRoyRD4Kr2nxAulH
	 7ce3onaFXMNqrHvf9Oew001YbOCamb4y7Y5vQCPC1bBPC1xbFLYlh0JoATLttgbpQyP8j
	 00FWADcB/YpanORPTu5khnItFG6xIFygxPKNSBPkbzkMNA4OsKnZuorh641Hiw8LHOyRt
	 ZNp15UNg9lw1K11olGmD+ddJ23KP5tpkZWyFOLYQkxY/d35yYvPQK0SIRkSg4aqitwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778174;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=224q4TxLJNS9A68QQ9nIN2qtqx9pJ0fVYXjA9THDv8w=;
	b=bIHlKnoFv/JjtH089UTUUNcglh/GhhnEu9HdPLVPCmLMI9b1D6cIUaJmUbPQ+DbvGIEm
	 OZMC6cI2qQJ5vG7BXCBYaBhIjVNFmHnXYKxX6Q04Lu2sR9djHaIGs941j6zISIMrxyhEF
	 Jpln5VpjZDR/QaZDE1wgzwdTM9dJvg593spy37JHcCsIQEc16kMI+3Jlnu0H1ZuhjaYwo
	 nP5jLVUZGwOKfgDIS3Wp3dVKSY0U369caq6KCeMfqDiZbiNBzkAQrsp2OEmh5krcsAGqV
	 bSNsGpYjsHlCQCKP0O2tuXBct98DgzvxwxXoVkHOmcgfxcRvqiBKyeFC+gWgei8v92w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=XjbGPcvy;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B53C606A31B;
	Wed,  4 Nov 2026 07:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B53C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=XjbGPcvy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=XjbGPcvyNBp0pvYp6VMJ/LDg1bHwN/OpfKLT5ZC2VJI8/s5puXA6ocqa0wN1g/HPQ4XASnmSEAl2g
	 rU6kiIwQDJL7YtD1QBf61vS+I1ogplPKR18vr9YIofOchMBcF4MQqwS63QNciO9AoE5ppTFGrQtBNE
	 48cVhDl9TrY60PH0=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86aeae1f7375-3b06e;
	Wed, 04 Nov 2026 15:42:49 +0800 (CST)
X-RM-TRANSID:2ee86aeae1f7375-3b06e
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from desktop-eb75daa8a6be458c-20260816004526035 (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16aeae1f732c-19a40;
	Wed, 04 Nov 2026 15:42:49 +0800 (CST)
X-RM-TRANSID:2ee16aeae1f732c-19a40
From: zhangchujun <zhangchujun@cmss.chinamobile.com>
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhangchujun <zhangchujun@cmss.chinamobile.com>
Subject: [PATCH] selftests/mqueue: fix timespec printf format specifiers
Date: Wed,  4 Nov 2026 15:42:44 +0800
Message-ID: <20261104074245.1832-1-zhangchujun@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tv_nsec members of struct timespec are signed long values on
the target Linux ABI, but mq_perf_tests.c prints them using %lu.

Use %ld to match the argument type when printing the clock
resolution and the TEST1 and TEST2 timing summaries.

Signed-off-by: zhangchujun <zhangchujun@cmss.chinamobile.com>

diff --git a/tools/testing/selftests/mqueue/mq_perf_tests.c b/tools/testing/selftests/mqueue/mq_perf_tests.c
index 303c46eebd94..b87dac20cab4 100644
--- a/tools/testing/selftests/mqueue/mq_perf_tests.c
+++ b/tools/testing/selftests/mqueue/mq_perf_tests.c
@@ -448,7 +448,7 @@ void *perf_test_thread(void *arg)
 		shutdown(2, "clock_getres()", __LINE__);
 
 	printf("\t\tMax priorities:\t\t\t%d\n", mq_prio_max);
-	printf("\t\tClock resolution:\t\t%lu nsec%s\n", res.tv_nsec,
+	printf("\t\tClock resolution:\t\t%ld nsec%s\n", res.tv_nsec,
 	       res.tv_nsec > 1 ? "s" : "");
 
 
@@ -462,12 +462,12 @@ void *perf_test_thread(void *arg)
 	recv_total.tv_nsec = 0;
 	for (i = 0; i < TEST1_LOOPS; i++)
 		do_send_recv();
-	printf("\t\tSend msg:\t\t\t%ld.%lus total time\n",
+	printf("\t\tSend msg:\t\t\t%ld.%lds total time\n",
 	       send_total.tv_sec, send_total.tv_nsec);
 	nsec = ((unsigned long long)send_total.tv_sec * 1000000000 +
 		 send_total.tv_nsec) / TEST1_LOOPS;
 	printf("\t\t\t\t\t\t%lld nsec/msg\n", nsec);
-	printf("\t\tRecv msg:\t\t\t%ld.%lus total time\n",
+	printf("\t\tRecv msg:\t\t\t%ld.%lds total time\n",
 	       recv_total.tv_sec, recv_total.tv_nsec);
 	nsec = ((unsigned long long)recv_total.tv_sec * 1000000000 +
 		recv_total.tv_nsec) / TEST1_LOOPS;
@@ -501,12 +501,12 @@ void *perf_test_thread(void *arg)
 			cur_test->func(&prio_out);
 		}
 		printf("done.\n");
-		printf("\t\tSend msg:\t\t\t%ld.%lus total time\n",
+		printf("\t\tSend msg:\t\t\t%ld.%lds total time\n",
 		       send_total.tv_sec, send_total.tv_nsec);
 		nsec = ((unsigned long long)send_total.tv_sec * 1000000000 +
 			 send_total.tv_nsec) / TEST2_LOOPS;
 		printf("\t\t\t\t\t\t%lld nsec/msg\n", nsec);
-		printf("\t\tRecv msg:\t\t\t%ld.%lus total time\n",
+		printf("\t\tRecv msg:\t\t\t%ld.%lds total time\n",
 		       recv_total.tv_sec, recv_total.tv_nsec);
 		nsec = ((unsigned long long)recv_total.tv_sec * 1000000000 +
 			recv_total.tv_nsec) / TEST2_LOOPS;
-- 
2.50.1.windows.1



