Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794019234;
	b=UWXJJti/QIiZOL+DvEjZoDk/HKKuuvz9Rgayp7ecSCRDIJUxkDhfGLs+2kHvQNq5DqCx
	 8djob9WsisysfKVWXA3PaTz563hAObymKF2lEk/ge6DZwtw3+Tbd0XwMP30IvxmHx2+Tc
	 9079Slfv4rj/0nwpDEzPH0SHkC3SKU41uVDwZF3rjb85oVEQypFowc7lx/YvjPdStNrNQ
	 ZPpDn6HdJxJZs+4vmW6XSUOX3tdw2ox3Mps4a3QqF/uIZFOZNnNuwWzwSPUd7OZY/Yhra
	 WfajGfko5x6SgvpXAvyc7+5bdjle6v6RPpH9Ds8S3pQkNKNcbbCxx+KvOZEZHLq0JNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794019234;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3GIOH+/c8ZlwAH4hdy3vTg9Fnv+nr6QlL6HrUi9JjUI=;
	b=fVxeWDVznBC+g10WuMpkzB18qWmogQy/BsExbYK5i5+noet9mhCvg7KP9AavwrwjYY4Y
	 g2nYhWLg0ODmZ6gxefTeZCUxv+u3wCHdkbUEmnr4SwoXnZeo70djzcDQe+0JsrfE05yPD
	 fM0VIGTZGZ6P/TYsuCHmxpJJxuga4Kt/M/W2hv4t96VRzxmJNNon9zIL5csEunJ6/rn4w
	 K/Eo9rAbaaQ8evMd6wbiVzjpKfnMmFqd1ruH1oFOhhDjqIANtDiczhbMkdftRgaM1IA4Z
	 L02LssdqOw9ZqtcA/6DI0OkI6xE1P/ACd97nQJOTZfKBnIVYgvf3A9GP98PWJpgV7OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nop8ZZz5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KPIvxkBy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21628606A330
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 02:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21628606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nop8ZZz5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KPIvxkBy
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A72Afh3568265
	for <linux-kselftest@vger.kernel.org>; Sat, 7 Nov 2026 02:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3GIOH+/c8Zl
	wAH4hdy3vTg9Fnv+nr6QlL6HrUi9JjUI=; b=nop8ZZz50KWkS8urDJT3hxpTV4k
	BAEPCnNgvlCV5nW/ALTCX9VJTey5w3I10a/mjLDouG3WOysCbGYEzn7gNFkNg8M/
	nzpOsFkzTU0Z/dY4mPagcZ7QvQcIjZqzc44YLqeoKSxhr7/j/HR9z2FI+0DuoyDV
	i1bCmfL8UTAFZpvehzU413xo0+FAgXLAC7BKlCtlyydehZhLOkP/Qs49TEO2o2Rm
	Tt6kwxWKzdvHE5kMzJ0E0bXvcpYIna7EiRYtn8YmVfbrX5esD/ex4wFvDxncrpOF
	kmJbd5Xw6pX9NV4pmdQJWV8D0BfLJPqH+N0rZNvJ+7Dyq9HYKMns1MG1JZg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmyk17st-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Sat, 07 Nov 2026 02:40:33 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-351788121cfso3044642eec.0
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 18:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794019233; x=1794624033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3GIOH+/c8ZlwAH4hdy3vTg9Fnv+nr6QlL6HrUi9JjUI=;
        b=KPIvxkByE1KosgLgqW5Sb95C1rvj70WDTN6BwrXk8vyEP6VBYI8yomA40wDJHuSNM2
         Kp8cLocrUsVZPMGIFgRVEL1QAeWWnRrlRH8Yw5U3c4qSVUoahCveUzk4mwnC7qMxiMJ2
         +yYfiRK6saosxIPN0EsLqmAP84GCPJbSN5JENUXsmb3TQNKqBy8jDIQGbLcnY6K/YS/k
         KxQqVL7KkJbfHAelgU+7/8j+85aVZOiL+pW4aorm5yQEqVd62fTBcMp8KMbUgqYTMfo8
         wb9P1MrgmtvSm5HCHlH3timskyIg1ODJ5Gv7oTW2LwweiIXHlO9uMAXQx8fIf/6eCS5r
         9kkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794019233; x=1794624033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3GIOH+/c8ZlwAH4hdy3vTg9Fnv+nr6QlL6HrUi9JjUI=;
        b=D/onLebGH6ivhgbbX3dYegs3tw/6oMPT0PW/Wrdr4TDOhEESpUp+yIqQw46cbE4hJ8
         MSB2ipOJt2j5gnoRuyJTJXwmODT++Sdya8AVoSJ6h+ALHIX5hTCXq3q5gA9b2CXemafV
         f465Tq67wk9kXQ6IgV5WqxP3+bu8dbxHMej1gDcGmztWNA4aMja0EOvnMVKBzuu2Y9F5
         7gWgTFmYXxeSTULg0g9Lh5hqgq1mBzM8lyXRVo5v1YmCyO8tT/x2Lh2Oub2XzXHHuQTD
         UhgCLxa1mUNYRkjuktEtRCksyhNsW80Fqx14sfRvmfMjm8Tes/Di9nsb/XaNoV8SIFsi
         tA3Q==
X-Forwarded-Encrypted: i=1; AL+hErE49qV6R9Xyb8X3SPtfw7rPTYjplT9rZfWx9R2QhNMNVBpGT5MRgNMBaf7PetG2T7MzuoCFsfDIxVXn4R6M8lI=@vger.kernel.org
X-Gm-Message-State: APuU4Z82TuTehmF8Q5pUjieGlvwWdssAJ+pCGKQU3rW9Ln1gSUOrpacn
	a8T0u/3u6+if8EpHs8GQ76wgEI9/DUlZYGzz7VUTpBXAFWtmKDfP1H7uB+EqRdX59/CXrm71YR+
	kk9tFwELcDQtPPEd/PwGgZk/qI24qVW0PdZphW7yuUedoDH/YQxKZe+g27afLF8JY/UKiH7w=
X-Gm-Gg: AYBFou3NqsAJoGYM2S8D01BPuRTE6aGViqO7WIpK/RvXtKfi4F7cK84CLXRvQlnElzd
	Y4Nl/SC8dFP7EzDWslchHY1RR0PU7OQ5oav8FkEAtWveqXUHzb5aRk1KvX6r4EafiwIk9FkusRN
	uKxh/V365gc88zIQr7aXfbJJX7JCmWI9bAcqQ+s2zDj4W+gBanSqGdIp1cWBNwa4ddzsCRqscK9
	kAQN48k/vfA/O435mnmflzGBvBsYsyJhLqCM0xjVtc++HwAkZ8Cx/o1C2wutqHq3Fut1YdfVW1q
	FTdYsZtu1yiXgbGqVcsG+eDlGptl9O8QBtuOGo6QpZMkG+Q0se5Dp9oaU6Yl69vkMXxonkTO7Rl
	oA1HXcxfYCPUfMRTBa7cr32p3BcnGuQ8OXeEmH7sgzAz8+e8oIO6OJIZ6gyNQrwFewgWx/a/bXl
	OGwA0Wt5m9AlCrKvT238H7jGCdYONBijXt6RcxsRqAzYoWik1tuve/IJ07xT5VI1LE9K4S2FD/i
	Q==
X-Received: by 2002:a05:7301:d805:b0:362:fa87:2aa6 with SMTP id 5a478bee46e88-36f6fc79169mr4866629eec.0.1794019232661;
        Fri, 06 Nov 2026 18:40:32 -0800 (PST)
X-Received: by 2002:a05:7301:d805:b0:362:fa87:2aa6 with SMTP id 5a478bee46e88-36f6fc79169mr4866588eec.0.1794019232016;
        Fri, 06 Nov 2026 18:40:32 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faac86a96sm11069040eec.29.2026.11.06.18.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:40:31 -0800 (PST)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alex@ghiti.fr>, Jesse Taube <jtaubepe@redhat.com>,
        Oleg Nesterov <oleg@redhat.com>, Kees Cook <kees@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        James Clark <james.clark@linaro.org>, Shuah Khan <shuah@kernel.org>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v8 8/8] perf tests: keep bp_signal memory accesses visible
Date: Sat,  7 Nov 2026 08:09:17 +0530
Message-ID: <20261107023917.40606-9-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107023917.40606-1-himanshu.chauhan@oss.qualcomm.com>
References: <20261107023917.40606-1-himanshu.chauhan@oss.qualcomm.com>
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
X-Proofpoint-GUID: R1TBTxiUnaKakHKnH37AlplVe2zzwasl
X-Proofpoint-ORIG-GUID: R1TBTxiUnaKakHKnH37AlplVe2zzwasl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDAxMCBTYWx0ZWRfX3hBBweEH6yt8
 jmY0ImEzcF8g6SYgYZeNEZa3bvO57H7yRMEZTCnHiqTQyjr6tmvJSXBG2AIgHMrF4JsLIKIhAno
 /gdwUH9lOU1UABHqf20QgO4p+dfJzQI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDAxMCBTYWx0ZWRfX07pznrj9LrYH
 pjoPdsU1GF6qQXKtkgEntMOFHP/swLDovH3B5ZNdE8trTNXGFDoUE2/kBdf43G3MPHOzmb3nD+e
 syDqFFFhkrnxKZkcc58MHB9uxArS0AG4iBuQt/A/KVV6VegsBZGT0Y2NQCS/zB7yT6eeuj2/xm5
 XxFoRCI+MfYBRcxoRXuU4r/45jp/5WV0hcmcPx81tCyIEZxyR97MlAzpom98c1pcjr7MwhGKLGo
 4LS0CPCwTEByG3HPkyGYmsAF0Cniyc7DauQdM2WpqOLaJsXgX13nG1MpJDdkbJZ0U7ASIOAUesu
 +wwM0jPFS20YXdHe/9E+9iB4EZpGRhaFCafYj7lxMrv/5zOr4HuNi7SvpEhb36GtAjaWiegSJuU
 /a9jfLfqKQ5/xuik45pOUBn04NkndwfJ2MgqBGrI7WGzxEBocobLkwyRpXfBwKqbA9vwraEYCnq
 oEcgXV+gcy4jhd4vi4g==
X-Authority-Analysis: v=2.4 cv=I5Tw19gg c=1 sm=1 tr=0 ts=6aee8fa1 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=tsqkxpHE8OKeFbBeJjEA:9 a=O8hF6Hzn-FEA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611070010

In the breakpoint signal handler test, a breakpoint is set on
__test_function. Keep that helper as a real call target so the breakpoint
has a stable address.

The test also relies on the watched variable being accessed as distinct
memory operations. Use READ_ONCE() and WRITE_ONCE() for those accesses
instead of making the object volatile, so the source marks the exact
operations that must be preserved.

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 tools/perf/tests/bp_signal.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/tools/perf/tests/bp_signal.c b/tools/perf/tests/bp_signal.c
index f580ba7486b1..2e4f7747d32f 100644
--- a/tools/perf/tests/bp_signal.c
+++ b/tools/perf/tests/bp_signal.c
@@ -36,15 +36,14 @@ static int fd3;
 static int overflows;
 static int overflows_2;
 
-static volatile long the_var;
-
+static long the_var;
 
 /*
  * Use ASM to ensure watchpoint and breakpoint can be triggered
  * at one instruction.
  */
 #if defined (__x86_64__)
-extern void __test_function(volatile long *ptr);
+extern void __test_function(long *ptr);
 asm (
 	".pushsection .text;"
 	".globl __test_function\n"
@@ -54,16 +53,19 @@ asm (
 	"ret\n"
 	".popsection\n");
 #else
-static void __test_function(volatile long *ptr)
+static noinline void __test_function(long *ptr)
 {
-	*ptr = 0x1234;
+	WRITE_ONCE(*ptr, 0x1234);
 }
 #endif
 
 static noinline int test_function(void)
 {
+	long value;
+
 	__test_function(&the_var);
-	the_var++;
+	value = READ_ONCE(the_var);
+	WRITE_ONCE(the_var, value + 1);
 	return time(NULL);
 }
 
-- 
2.43.0

