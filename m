Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.1.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EF0125AA;
	Tue, 14 Jul 2026 02:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.1.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783994657; cv=none; b=hZ2QfHfrOuHfU+SQ9NmE200oDhRZf6xvoZHQUIpgsHVbilNyEkYSj4NcngQ9h/WbmTpU4tyPJcYkZbTEsRRONbvNtFIOBFmaYwIUWPjrW0T8S6NgG8TB/768MVMuTU5d/9gBwPZmsJYYdpiWtiLz3udn9CbKsgJ4NbC6tAz5c8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783994657; c=relaxed/simple;
	bh=DheTKIgYUtNaxYiXUiufcykIdtP+ggfxq7H5yhe5Q4Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hWRqULnxeLZ1gavscXSDLlKkW2PpX5LzZOXlEod69AAn2sDpXigXFBmjPXF5AX6Z9WvYPko3qNYvweAhzN9a2SOHfHsNcamwIFLtoSDCryr8lgbxDZxFPp2Nj31bL2NfJrhH0URVUZ8DzjB6Mt9QqC3SglxpqoPzM/LglQlVkMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=i9ZVRaUz; arc=none smtp.client-ip=44.246.1.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="i9ZVRaUz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1783994655; x=1815530655;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9rAKLh8Dva0h6cqTIUIHllon5JJNuSn/UHdT/Jc6bQg=;
  b=i9ZVRaUzNOU3g4U4fPH1Fr6XlLYFfeXJZ9ixkqoELqxm+xfZzwCG2rU8
   6Hnnu1qlFYBE2Aghi3KhNPgS/fcNdyt8XVWH/0e9sDmXMZplJijfPhjPM
   pU9XnI/B2uWHr8snTyLpSkFuU7QjkXsF8YHsDzZ634UQcXWxssMpq6Vk/
   0Q+s7QoFmp/RTYBe5SqwZ1MRayEPc2MhBf0YF1IvEyXTi7HUb214eN7NE
   a+WqYbDAs+p9Bp4qeGRP6zhQd0dX4bNPbdrtslP0UANOc4i01gAA7LEAb
   ChB0RSRn5Fwap5QUtt0/Q/9MFuAE3UTWxii76CaqA2g3IyW9+irIlcm+T
   Q==;
X-CSE-ConnectionGUID: 4Edgzql8RiW5BZtCvHuCvQ==
X-CSE-MsgGUID: cnpcKNgHTJCAsIOhmEz0IQ==
X-IronPort-AV: E=Sophos;i="6.25,154,1779148800"; 
   d="scan'208";a="23613906"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 02:04:12 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:9385]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.51.175:2525] with esmtp (Farcaster)
 id bcd7232f-2a86-4c52-86e8-57a024b68881; Tue, 14 Jul 2026 02:04:11 +0000 (UTC)
X-Farcaster-Flow-ID: bcd7232f-2a86-4c52-86e8-57a024b68881
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Tue, 14 Jul 2026 02:04:11 +0000
Received: from dev-dsk-akiyano-1c-2138b29d.eu-west-1.amazon.com (172.19.83.6)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Tue, 14 Jul 2026 02:04:06 +0000
From: Arthur Kiyanovski <akiyano@amazon.com>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
	<netdev@vger.kernel.org>
CC: Arthur Kiyanovski <akiyano@amazon.com>, Richard Cochran
	<richardcochran@gmail.com>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
	<pabeni@redhat.com>, David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner
	<tglx@linutronix.de>, Miroslav Lichvar <mlichvar@redhat.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, Wen Gu <guwen@linux.alibaba.com>, Xuan Zhuo
	<xuanzhuo@linux.alibaba.com>, David Woodhouse <dwmw@amazon.com>, "Yonatan
 Sarna" <ysarna@amazon.com>, Zorik Machulsky <zorik@amazon.com>, "Alexander
 Matushevsky" <matua@amazon.com>, Saeed Bshara <saeedb@amazon.com>, Matt
 Wilson <msw@amazon.com>, Anthony Liguori <aliguori@amazon.com>, Nafea Bshara
	<nafea@amazon.com>, Evgeny Schmeilin <evgenys@amazon.com>, Netanel Belgazal
	<netanel@amazon.com>, Ali Saidi <alisaidi@amazon.com>, Benjamin Herrenschmidt
	<benh@amazon.com>, Noam Dagan <ndagan@amazon.com>, David Arinzon
	<darinzon@amazon.com>, Evgeny Ostrovsky <evostrov@amazon.com>, Ofir Tabachnik
	<ofirt@amazon.com>, Amit Bernstein <amitbern@amazon.com>,
	<linux-kselftest@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>, Simon Horman <horms@kernel.org>,
	<vadim.fedorenko@linux.dev>
Subject: [PATCH v4 net-next 2/7] selftests/ptp: Extract print_system_timestamp helper in testptp
Date: Tue, 14 Jul 2026 02:03:03 +0000
Message-ID: <20260714020340.25014-3-akiyano@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260714020340.25014-1-akiyano@amazon.com>
References: <20260714020340.25014-1-akiyano@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D035UWB002.ant.amazon.com (10.13.138.97) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Extract the repeated switch-on-clockid pattern used for printing
system timestamps into a reusable helper function. This removes
code duplication in the -x (PTP_SYS_OFFSET_EXTENDED) output path
and prepares for additional callers.

The "after" timestamp lines now include the sample number prefix
for consistency with the "before" lines, slightly changing the
output format.

Signed-off-by: Arthur Kiyanovski <akiyano@amazon.com>
---
 tools/testing/selftests/ptp/testptp.c | 70 ++++++++++++---------------
 1 file changed, 32 insertions(+), 38 deletions(-)

diff --git a/tools/testing/selftests/ptp/testptp.c b/tools/testing/selftests/ptp/testptp.c
index ed1e2886ba3c..d3bcfd03fce4 100644
--- a/tools/testing/selftests/ptp/testptp.c
+++ b/tools/testing/selftests/ptp/testptp.c
@@ -153,6 +153,28 @@ static void usage(char *progname)
 		progname, PTP_MAX_SAMPLES);
 }
 
+static void print_system_timestamp(int sample_num, __kernel_clockid_t clockid,
+				   long long sec, unsigned int nsec,
+				   const char *when)
+{
+	switch (clockid) {
+	case CLOCK_REALTIME:
+		printf("sample #%2d: real time %s: %lld.%09u\n",
+		       sample_num, when, sec, nsec);
+		break;
+	case CLOCK_MONOTONIC:
+		printf("sample #%2d: monotonic time %s: %lld.%09u\n",
+		       sample_num, when, sec, nsec);
+		break;
+	case CLOCK_MONOTONIC_RAW:
+		printf("sample #%2d: monotonic-raw time %s: %lld.%09u\n",
+		       sample_num, when, sec, nsec);
+		break;
+	default:
+		break;
+	}
+}
+
 int main(int argc, char *argv[])
 {
 	struct ptp_clock_caps caps;
@@ -608,46 +630,18 @@ int main(int argc, char *argv[])
 			       getextended);
 
 			for (i = 0; i < getextended; i++) {
-				switch (ext_clockid) {
-				case CLOCK_REALTIME:
-					printf("sample #%2d: real time before: %lld.%09u\n",
-					       i, soe->ts[i][0].sec,
-					       soe->ts[i][0].nsec);
-					break;
-				case CLOCK_MONOTONIC:
-					printf("sample #%2d: monotonic time before: %lld.%09u\n",
-					       i, soe->ts[i][0].sec,
-					       soe->ts[i][0].nsec);
-					break;
-				case CLOCK_MONOTONIC_RAW:
-					printf("sample #%2d: monotonic-raw time before: %lld.%09u\n",
-					       i, soe->ts[i][0].sec,
-					       soe->ts[i][0].nsec);
-					break;
-				default:
-					break;
-				}
+				print_system_timestamp(i, ext_clockid,
+						       soe->ts[i][0].sec,
+						       soe->ts[i][0].nsec,
+						       "before");
+
 				printf("            phc time: %lld.%09u\n",
 				       soe->ts[i][1].sec, soe->ts[i][1].nsec);
-				switch (ext_clockid) {
-				case CLOCK_REALTIME:
-					printf("            real time after: %lld.%09u\n",
-					       soe->ts[i][2].sec,
-					       soe->ts[i][2].nsec);
-					break;
-				case CLOCK_MONOTONIC:
-					printf("            monotonic time after: %lld.%09u\n",
-					       soe->ts[i][2].sec,
-					       soe->ts[i][2].nsec);
-					break;
-				case CLOCK_MONOTONIC_RAW:
-					printf("            monotonic-raw time after: %lld.%09u\n",
-					       soe->ts[i][2].sec,
-					       soe->ts[i][2].nsec);
-					break;
-				default:
-					break;
-				}
+
+				print_system_timestamp(i, ext_clockid,
+						       soe->ts[i][2].sec,
+						       soe->ts[i][2].nsec,
+						       "after");
 			}
 		}
 
-- 
2.47.3

