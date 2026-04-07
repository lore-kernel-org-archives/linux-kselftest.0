Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9023368B1
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 14:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775573377; cv=none; b=YWdeQX6Djfhwz190tcKinRcM0N6bpvf6FP1pM1ILwAfTPIVFbvFo8YAh5Sd9etuFLNi4cNH5p5zb1eAy/6ThrHrI6a/PaSsfdY4Cs31338YxBMF30MEXEllr64GKwCLsCQ5R0xYGK7c3shV7aVODYGVodFNb4kHh2ERH/nMgHpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775573377; c=relaxed/simple;
	bh=XtIgdoH19ndIvGeCEmpFzfQqB5+kwXIGq8zRQkAd4/0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=taaHQLMw6S7jXWruiKNQICG3aUy52gNeqagDcAiXnZqRrw/CiNkS7GJbRch36igMdxx3zpjmV4Hgsg+PZ9QTyttETaFh3NKlg4NyPYUWqg6XJNSnP8e6hbQ+JRaOA0PvmnO1Jw5o4GN5lLD/uyxWW+Amb3OPj4ifuKFIgXcgFMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kmqyem/t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oe0UeI0/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kmqyem/t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oe0UeI0/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637D5QNu494121
	for <linux-kselftest@vger.kernel.org>; Tue, 7 Apr 2026 14:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jDMD46+vU9O7fXNFW5V6F3aRAp7klbVqL8u
	xr/vs318=; b=kmqyem/tg6XzlqkH1Kgt31zT0rxtwScPdhlxLZc0EEZ9jyd1Vkx
	lxzp2L9f0FkfhrBYXZE+XrKHNcLVez/WIMSqgmWWXgH510CZp3G9HMV8KMQXncPZ
	bZGBKe6C5y8N6iCtHwO41wDkrrkbYkrwUkYSd8joz6o7m83u1qkgJRpoauvdylZU
	4HBc8eZfLldUD1H3H0tZGNHShXHTCszH6p43TSQBDg/hIuleJIsby4k9w4UruCFa
	dP67wIju7U+Ges3a+JoHXUuECEA+ruFJ7yEbqIMM2Mn/kk4JQAtLUmtNQuPJBB5R
	/Id21XrNi7c0yOv3F2FzAsqLwIsjfgkwOTA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8u601-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 14:49:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3594620fe97so12132392a91.1
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 07:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775573371; x=1776178171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jDMD46+vU9O7fXNFW5V6F3aRAp7klbVqL8uxr/vs318=;
        b=Oe0UeI0/vvzYSrvbJ1ZWJz77EJcMRJBQYBL8oUGkKLtBUZQiG2ZfOV+YNbNg9mD1jz
         pwCPX+YsCMsegFSohpGU9wta8MRQ0Lh//OaH36xma8Gd/coHDt3fijk2BiWJEpK4XOID
         pR0DYLBEW7m/uuQ4WfKsPcduYrBJlYI1QANM5Cf96QfmDM8gnRLtf2OEdXhV4cIhPkhG
         dfbJo7Z4mosPy7HhIJ7YcZwqL94tLmcWPw2R6gegloyg9b6Z1PyIAgAZsE9AwtUAfNNY
         RKsluQJ0jza0sxVLGaW6p5IYW/XmY4nfd8EoLfYiOKWqmyZ9KHc05//k8sPZOvaRIlW2
         8+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775573371; x=1776178171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDMD46+vU9O7fXNFW5V6F3aRAp7klbVqL8uxr/vs318=;
        b=tE6e+hGKdSshsQ1cSkTvx32FkP7YGV84H6NvmKZrCYXKF9zkC27DgaYUeWVCDyqnT0
         UiIC8kO6qmoo2LwwAD0R93MRr2GFk8o5PhoFpbYxbMQ+CmIIihGtn42cIyTEHjvwIQqK
         RYdIxTFPWyNISfM4uYcnMCCr6EXR0UwPb6kQgXYHqvGuYTf+m4oN9GGKwCM7j3c2Df0w
         dkgpHIevRsQh09zp4U7gYWQe8gDuuSN3Qe46m8NCrRBr9iCwbI6k+Txtqxi8GufIw0dU
         Wkla9ORFNMvRWcLwg3P675OTNDJExqg9jV8XHH7YRsL197HW5hJn13dgA+aIz2T20dxH
         wtig==
X-Forwarded-Encrypted: i=1; AJvYcCVJzag9aeBVjjiMy6J4M7Z1eL86JKitekAf6FwigSfIKeDCAXRWshdPo5/e+whzEa6ApzXw0Sk4IxKDyQetyFI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHqHiJs5g7JUTlfzZ5GCCb4t96saa5f84Op4haHjNkiofE5W3n
	ah2F+GtliXTEVIG+tPuWTA4mfXy0jqSuHO1+oyDbHIibdQZfOBNfdNmSUL9cBGAw0qQLxGTynq4
	Ol86kmYatIBws5AYjvjGHW6TTdmWQPqplSHpQNV11lrIHiYRnSeXUsAVyslulBRKmY2vFWfo=
X-Gm-Gg: AeBDiesPXHIFpwk/0o7BSH4kO6sruo1zNpQiB5i+mETjkv/mxSOW6YyGRteupWY6N1V
	AFvIDmsfCQZqTLZVPNe8arwDfwwBhny96tBZroFYX5ozn6qPMEq/CBOtKNKjvtQzFYIv9hOxEfL
	PhQfzzqvXptTC4ms39je24iVZlLGtWblBmOsvlkOcOxsJyBfCY1yr5Ho6cYwXXof3eIZZECnhL8
	WTz1dcFnR8+EbkwVPGG2DWfvhDj3oJc50OKk1FvCJUj22C927naArIBOO37W6fWXYOVHMWmYHxv
	7k8nUAcVJgOLGMPfnaO/jfUpFMajkxOVuelQgfA/pptorQlzmI8kvvG7hFKHPJXcgs7iT5bzbEn
	k7Zgl3uL/rHcZE4xdtcUANT709jLntvUCwj2s21tTSjF0YQexsmO2wZWgEgI=
X-Received: by 2002:a05:6a20:7494:b0:398:8d38:c5ef with SMTP id adf61e73a8af0-39f2f05052cmr17137268637.34.1775573371318;
        Tue, 07 Apr 2026 07:49:31 -0700 (PDT)
X-Received: by 2002:a05:6a20:7494:b0:398:8d38:c5ef with SMTP id adf61e73a8af0-39f2f05052cmr17137237637.34.1775573370783;
        Tue, 07 Apr 2026 07:49:30 -0700 (PDT)
Received: from hu-mchitale-hyd.qualcomm.com ([202.46.22.19])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c76c65935cbsm16116998a12.26.2026.04.07.07.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 07:49:30 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>, kvm@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] KVM: selftests: memslot_perf_test: make host wait timeout configurable
Date: Tue,  7 Apr 2026 20:19:12 +0530
Message-ID: <20260407144914.2621843-1-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: o_rk-w6GRCPcTKM2vKCWZLfhAD5yDkLn
X-Proofpoint-ORIG-GUID: o_rk-w6GRCPcTKM2vKCWZLfhAD5yDkLn
X-Authority-Analysis: v=2.4 cv=c9abhx9l c=1 sm=1 tr=0 ts=69d5197c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Q6LddUHKALiUaiREB9sA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEzNSBTYWx0ZWRfXy3fAJBIWtyCN
 NftTIcyhRxOv+1mpTHBR0fqxGK//d42SNHql3n/Q6hjYdKO0LjL0IJjY7glILWfTGVW4WcWHeLM
 +3iuesJHRLxiepZ9+E1uaJGwe/ZeiN9LXstCf+Lk64Yj0L3xJROmmXQ/yATBcFCQs+QNslzlXuN
 lSxbWDZn2xpXADvFPwfuaLha1/fygjGkxnSMidYwxIl1AMBW1i4YH60UqyomA22rH5PHKmu6Rwv
 5iY5HJvNOfEtUKxm3gkr6XrXeUa02GAfJTF2T3tJYEdRSsTBPYol4pgy8qMPDocOtg7rbguC/Ci
 8NRgvFwMdE1Ui95q77kvyo80lC9/z050htZu+cxD+2cZVAxvyyU7earfMxb2K0uDpINXoNxv7dt
 vzgmNsONBRup4LCIPoC2pY9CTiXgOHzonjZH5sFl2BeQ44tVIoYBbonX6kh/UdExmS80tQJCBpC
 ZSF4GpQ9tVGTgVW8U0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_03,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070135

When memslot_perf_test is run on the Qemu Risc-V Virt machine,
sometimes the RW subtest fails due to sigalarm, indicating that the
guest sync did not finish within the expected duration of 10 seconds.
Since the current timeout value is itself a bump up from the original
2s, making the host timeout value configurable via a new command line
parameter. The test can be invoked with '-t' option to set a suitable
timeout value for the host.

Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---

Changes in v2:
  - Change the timeout option flag from 'a' to 't'
  - Specify the test platform (Qemu Risc-V Virt) in the commit message

 tools/testing/selftests/kvm/memslot_perf_test.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/memslot_perf_test.c b/tools/testing/selftests/kvm/memslot_perf_test.c
index 5087d082c4b0..567474168c1c 100644
--- a/tools/testing/selftests/kvm/memslot_perf_test.c
+++ b/tools/testing/selftests/kvm/memslot_perf_test.c
@@ -111,6 +111,7 @@ struct sync_area {
  */
 static_assert(ATOMIC_BOOL_LOCK_FREE == 2, "atomic bool is not lockless");
 
+static int wait_timeout = 10;
 static sem_t vcpu_ready;
 
 static bool map_unmap_verify;
@@ -418,7 +419,7 @@ static bool _guest_should_exit(void)
  */
 static noinline void host_perform_sync(struct sync_area *sync)
 {
-	alarm(10);
+	alarm(wait_timeout);
 
 	atomic_store_explicit(&sync->sync_flag, true, memory_order_release);
 	while (atomic_load_explicit(&sync->sync_flag, memory_order_acquire))
@@ -900,7 +901,7 @@ static void help(char *name, struct test_args *targs)
 {
 	int ctr;
 
-	pr_info("usage: %s [-h] [-v] [-d] [-s slots] [-f first_test] [-e last_test] [-l test_length] [-r run_count]\n",
+	pr_info("usage: %s [-h] [-v] [-d] [-s slots] [-f first_test] [-e last_test] [-l test_length] [-r run_count] [-t wait_timeout]\n",
 		name);
 	pr_info(" -h: print this help screen.\n");
 	pr_info(" -v: enable verbose mode (not for benchmarking).\n");
@@ -916,6 +917,8 @@ static void help(char *name, struct test_args *targs)
 		targs->seconds);
 	pr_info(" -r: specify the number of runs per test (currently: %i)\n",
 		targs->runs);
+	pr_info(" -t: specify the number of seconds for host wait timeout (currently: %i)\n",
+		wait_timeout);
 
 	pr_info("\nAvailable tests:\n");
 	for (ctr = 0; ctr < NTESTS; ctr++)
@@ -964,7 +967,7 @@ static bool parse_args(int argc, char *argv[],
 	uint32_t max_mem_slots;
 	int opt;
 
-	while ((opt = getopt(argc, argv, "hvdqs:f:e:l:r:")) != -1) {
+	while ((opt = getopt(argc, argv, "hvdqs:f:e:l:r:t:")) != -1) {
 		switch (opt) {
 		case 'h':
 		default:
@@ -1007,6 +1010,9 @@ static bool parse_args(int argc, char *argv[],
 		case 'r':
 			targs->runs = atoi_positive("Runs per test", optarg);
 			break;
+		case 't':
+			wait_timeout = atoi_positive("Host wait timeout", optarg);
+			break;
 		}
 	}
 
-- 
2.43.0

