Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737A836683D
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 10:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775125807; cv=none; b=D/Ieyr+t5p74X9M61nkxbyOL61LahMBCA7n1bOgZZgBPogR5b+HKx5W36AtXnl/Qq7CU+PxOvrWPOoHs705fzgtZdeXi4hfUr3DcFnuoOplDf4IdGv8lgVUGv4y6rOJXkzmuIoZovQ71n1D2KCnTVRw5ntHGlbtvrSozcqDIteY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775125807; c=relaxed/simple;
	bh=Apf46VY2eRXVnlhJrBxjZLycYAs41xkNO2juTIz/8oY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DB4KqbXpIWKPNKDB/ofab98HjJ78Gw/X32ube5RAr9IdN65Xk6bx6YspR08sAyMV0sbWp0U0b8TPaA2x7B66HUyeOyy9OI1AbwPIXpZAIdaHs3X3NICbDk8cJOv2jUto9LC2rzfiR6krMPz4SfTktqODapcjip2JdJwD5B18Ja0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SbykqPkM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=enS9wpjr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SbykqPkM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="enS9wpjr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6326guQP2799332
	for <linux-kselftest@vger.kernel.org>; Thu, 2 Apr 2026 10:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jVA0PNY2T7z+2J6cH7LyrW0flJBfZw06ogl
	OzXoDyKU=; b=SbykqPkMQgcsQjhK8hLj2w4eJxlCtSlflWR7+zs8jV+gO2zzbaz
	LfCaZ3KlGudaYi1o6LwwP2WNvGkhUzji21ycQsGIozZH/vAiSG7bqvFkhTc9Eljd
	/e0/906vm9+Fu9VCYqg5bgTG2Ce5mj17D1L/QOHzYbQzKSVwFKCCQu5srhY1itzW
	V9A/P90FxtHSMFz+bHiKBtT0WUNMGvGetDivDBCRwU/hm77kKha0IW+HfX20/jCr
	77ERrVTOkJB7m8ywhc3H0VHDc0MovGUQMwJuBQCS5e8Lh1oMSd3xsPDEtZihGNNT
	1jndEmwcDZzx1hEuWKiVCiGp7TX+i/tSdUA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d96hk3kws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 02 Apr 2026 10:30:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35c1107da15so790809a91.2
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Apr 2026 03:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775125804; x=1775730604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jVA0PNY2T7z+2J6cH7LyrW0flJBfZw06oglOzXoDyKU=;
        b=enS9wpjrOPtBR4ZD2HuB2v1HytRLZPaNFpQR/dZhekO2zpQxZYfuBx/NAu2FFpSfoD
         kH6mGIVFwOkLctLlGMlCW6jY1F+oj8oEVeR/QKMnIToAioGu0R6vOgm7/mA2ipUOLv3C
         yjRbRD16M9nw7LfLEkYYQxSMnfQDS63Ghii9biTszCwCWEJ7lPVCZjoV/MRtppMh0O8G
         9bQnc9SdRe1vjG2EAvxXtUuBLCY2iys5heEOcUkdEJde3yrsbG+QizK5gYI2ShgceJH0
         1WDLPEux+gJ5rkDAXEvNUuAhd8AReDbRZAdxjMb7rF9jsJcyeP1EJZnEsYxaOXTNJC6i
         ywhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775125804; x=1775730604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVA0PNY2T7z+2J6cH7LyrW0flJBfZw06oglOzXoDyKU=;
        b=Dbg8b99XIQbGr5Dx71pPNImd8hdLSjtTtsxe5qTSBloiG4RtGsGEgUUDLF17s89WN9
         bGbbSKH6s7Ons+LETv2V7U2lPPN3qpDPQ3+gzJvtMuP2luJXKU63LYu9oFwM7Muo9Mf3
         3P52CnW6Yfyqi+SZWd9zJJ04SjdJYfYrmnuLEcuFlr073VyUVpuy39WLlzDD2E0yGko+
         IFIaulNMZ++DWXTgYP/9QlfwG7jMGwjhFMExTLkeKOReok43uNCsU3a1xCMp6RA0yN3S
         9QPJpltvvSSeKcGaQeS63xaK5bzdgXsj0tA0JW1XnIV9sLUakju7DmnbB+j0K/QH/TU5
         kTEg==
X-Forwarded-Encrypted: i=1; AJvYcCXZOP6b4Ue8o6xGsBsPqCvq8fc2MbYrrEFQ8ZTEOTEI+b9Q44UMEg5GJo4wMjhHM4Ttoq8yHnY6SN4AXfW11a8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7Kft7NQEigmsmKikIg3cqTDnVR/8leXmqqCEJpVGMQHxdO5f6
	SOUMbItgE5P/Fd4ek6Uw+gWUkcbODABIEm+gGkKDUEBxrEV0skuvzu3iDI0Dya4JdKOr7cd1gqD
	g7SDf5UpcJHQGu2UqUkxYx2KXhukd6evit9ek5Bi0zM13jhh+120XAnkv1nNMS33VD5dFuSc=
X-Gm-Gg: ATEYQzyZQo2Cc9dH4Q2Oc+qsvGmcXtiEM//Tc50ouNsFPXhbBPWowqyNirhMCfulFoK
	Cmg5lEJSphF0Cp+9TtHsuI74b+vi3h8gSVPx744taz+FUkgU8i8re9LQO+8ZlkMrpJrb/b9+Oaj
	QuegdkOrWD9TCfSUfep4dJHi3R/OVP4bguuuKEKm7gweFXQ13y/t1Z6b19a3iIDii8masB7RrCg
	PIw5Z7Zb2UPJM2ZVTwun/+EVs0oThbfav9wP0ALOWVgb/s4zJoMs1O2znQubQK81qQ6BnCAwfA3
	CPOqCjkPkQ38vFKkQKtKbBctNi/YnBMJRvy2xzCdZlHB4ORvTAtcm3Ya8AMV/WDaHx/C/Lc0PNQ
	4B8yIUFqtrRaGmAS+bXi0hJS8h4XVxNl5yC+dTewf5vo9l55bbKUz48n7/wY=
X-Received: by 2002:a05:6a20:1595:b0:39b:ba95:b14c with SMTP id adf61e73a8af0-39f1098ef84mr3226926637.24.1775125804265;
        Thu, 02 Apr 2026 03:30:04 -0700 (PDT)
X-Received: by 2002:a05:6a20:1595:b0:39b:ba95:b14c with SMTP id adf61e73a8af0-39f1098ef84mr3226894637.24.1775125803758;
        Thu, 02 Apr 2026 03:30:03 -0700 (PDT)
Received: from hu-mchitale-hyd.qualcomm.com ([202.46.22.19])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c76c64a99ecsm2387075a12.14.2026.04.02.03.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 03:30:03 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>, kvm@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: selftests: memslot_perf_test: make host wait timeout configurable
Date: Thu,  2 Apr 2026 15:59:52 +0530
Message-ID: <20260402102953.2984284-1-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA5MyBTYWx0ZWRfXyDlge1aGwyM+
 7CNvh7qmS6/qXVfSkXhPfiIkkM/vpInuk51KAJrn18MaSOTY7O0lq5zZu9Y4mRMr7tHpx+L96Od
 uetoLoe5UqWife7HI0crTYolxJse7ixbm3maPExcL1gu5JtYRqeBpc0IVJKb44H0kO41BmyepWM
 ruiooPosY3Ph8puClO33xtZM25w+0BTL7jZurmjU6Ewvf/7ruRQw0ceDyattmgcVfKMZRR9JZF8
 OG0Zbrcgu2QMzf1jiucqJSW319zWlbI/WwwI08GZy2jzHF6jNtnWSkSn4Xv7PbhtcQrGA7PXN8r
 o/JIm5yVTLONbfEGs2uQPLlOxCcd8ml/1ppsyq1hO5qsP6AfSWyAlNMGoRKp2mDgQCpiuW052qF
 NzE+XrEC4fkHtvpr9ikaatMRaqYYFzYyy2l24uXbYim4w3b6pwGUG9t5hCpPF0h6vm0/rjkxhK2
 FHnihSe4ISr4HrClU1w==
X-Proofpoint-GUID: yv--UuPcnWGiqy52AWXQ9QDLdqLu5Qpb
X-Proofpoint-ORIG-GUID: yv--UuPcnWGiqy52AWXQ9QDLdqLu5Qpb
X-Authority-Analysis: v=2.4 cv=e9ULiKp/ c=1 sm=1 tr=0 ts=69ce452d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=gtbmaYlBKaLh0XEAUCIA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020093

When memslot_perf_test is run on qemu, sometimes the RW subtest fails
due to sigalarm, indicating that the guest sync did not finish within
the expected duration of 10 seconds. Since the current timeout value is
itself a bump up from the original 2s, making the host timeout value
configurable via a new command line parameter. Now the test can be
invoked with '-a' argument to run the test with a suitable host timeout
value.

Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 tools/testing/selftests/kvm/memslot_perf_test.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/memslot_perf_test.c b/tools/testing/selftests/kvm/memslot_perf_test.c
index 5087d082c4b0..432dbb5fde82 100644
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
+	pr_info("usage: %s [-h] [-v] [-d] [-s slots] [-f first_test] [-e last_test] [-l test_length] [-r run_count] [-a wait_timeout]\n",
 		name);
 	pr_info(" -h: print this help screen.\n");
 	pr_info(" -v: enable verbose mode (not for benchmarking).\n");
@@ -916,6 +917,8 @@ static void help(char *name, struct test_args *targs)
 		targs->seconds);
 	pr_info(" -r: specify the number of runs per test (currently: %i)\n",
 		targs->runs);
+	pr_info(" -a: specify the number of seconds for host wait timeout (currently: %i)\n",
+		wait_timeout);
 
 	pr_info("\nAvailable tests:\n");
 	for (ctr = 0; ctr < NTESTS; ctr++)
@@ -964,7 +967,7 @@ static bool parse_args(int argc, char *argv[],
 	uint32_t max_mem_slots;
 	int opt;
 
-	while ((opt = getopt(argc, argv, "hvdqs:f:e:l:r:")) != -1) {
+	while ((opt = getopt(argc, argv, "hvdqs:f:e:l:r:a:")) != -1) {
 		switch (opt) {
 		case 'h':
 		default:
@@ -1007,6 +1010,9 @@ static bool parse_args(int argc, char *argv[],
 		case 'r':
 			targs->runs = atoi_positive("Runs per test", optarg);
 			break;
+		case 'a':
+			wait_timeout = atoi_positive("Host wait timeout", optarg);
+			break;
 		}
 	}
 
-- 
2.43.0

