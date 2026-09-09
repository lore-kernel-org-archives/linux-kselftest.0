Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.83.148.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4A73E16B2;
	Wed,  9 Sep 2026 07:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.83.148.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788939142; cv=none; b=HMoGmKtQ8CcGycf5JbwGuqDtAVqNBFOg0fwC01YU37Y6bYyHvp+t+iEoVO4VdPzET6flrDMqy2P+8LKAAFIoKNLoeGeZMbBb7PmEqNbBTZJAfr7cRNLffq0Wy6FCiQSKoKqLF70kNjGers9V4uDjtxEHZKZEYNMU0YOdrs7yHGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788939142; c=relaxed/simple;
	bh=p63/VyVnvrcpZ4JkDlVtLOwCo4FKOTJQrRtebJlXSbU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VGWWEn50HzrjlGdRFp84D5AOwjpJCSuXmwCk6JGDxWJPmvHHHwD4C14NwpFgAOFmdLFViCN3e6dsTijVF1ZylAx0gk+N+zHxs3Z0urjpFYVu0ja0uskcFzkhIOV12vMIwHGtsbvCrNcf1RiuwC7N9qc9SUA5i+aquGzHWusEbdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=OVQMZUpS; arc=none smtp.client-ip=35.83.148.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="OVQMZUpS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1788939141; x=1820475141;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rVehCezAzednY5lkGXLVwgHxJ+0eORcEgWhCQFpAWxI=;
  b=OVQMZUpSKEZOGS7zDZGP2QbSG/Qd0qjNjdNrH0gWm19Jtm9lDBljiFIr
   FoiLIKuBKli7b7kBenVMPtfy/uK6HS1i63VQ9fsVqHoZHmvohgwyUClcd
   a9pntDEw+JaRdl0Y0wzaDdY6Us77li+vblYoJb3Cr5WbEUZVVMp0G7e6a
   Bc8wIyW2IuvcmQDAeikjDW1XjPMnGHw72TIpZ2AGK90Gytc8atW3HkpkI
   Nn4hufvGiyqawmnoqw7go/NHUbZ9ayGvFxqvdKOLuHe/nPayuRjYxKUsr
   B4h5SyGQTRm+FPdV53dOzLB3ZQFdzOpgP7MO8TB9XOg2mrd5MxNGmXTKA
   w==;
X-CSE-ConnectionGUID: vB/weSpPTeydtY0DsYh1lw==
X-CSE-MsgGUID: CRgFnyBWTuemfrL202Upkw==
X-IronPort-AV: E=Sophos;i="6.25,270,1779148800"; 
   d="scan'208";a="27988807"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 07:32:18 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:5260]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.12.178:2525] with esmtp (Farcaster)
 id 902b31d8-9a1d-4105-87ae-4198546fe4bc; Wed, 9 Sep 2026 07:32:17 +0000 (UTC)
X-Farcaster-Flow-ID: 902b31d8-9a1d-4105-87ae-4198546fe4bc
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Wed, 9 Sep 2026 07:32:17 +0000
Received: from dev-dsk-akiyano-1c-2138b29d.eu-west-1.amazon.com (172.19.83.6)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Wed, 9 Sep 2026 07:32:11 +0000
From: Arthur Kiyanovski <akiyano@amazon.com>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>, <netdev@vger.kernel.org>
CC: Arthur Kiyanovski <akiyano@amazon.com>, Eric Dumazet
	<edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, David Woodhouse
	<dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Miroslav Lichvar
	<mlichvar@redhat.com>, Maciek Machnikowski <maciek@machnikowski.net>, "Andrew
 Lunn" <andrew+netdev@lunn.ch>, Andrew Lunn <andrew@lunn.ch>, Carolina Jubran
	<cjubran@nvidia.com>, Wen Gu <guwen@linux.alibaba.com>, Xuan Zhuo
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
	<skhan@linuxfoundation.org>, Simon Horman <horms@kernel.org>, Bjorn Helgaas
	<bhelgaas@google.com>, <vadim.fedorenko@linux.dev>, David Woodhouse
	<dwmw@amazon.co.uk>
Subject: [PATCH v7 net-next 2/7] selftests/ptp: Extract print_system_timestamp helper in testptp
Date: Wed, 9 Sep 2026 07:31:28 +0000
Message-ID: <20260909073136.12863-3-akiyano@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260909073136.12863-1-akiyano@amazon.com>
References: <20260909073136.12863-1-akiyano@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC004.ant.amazon.com (10.13.139.246) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Extract the repeated switch-on-clockid pattern used for printing
system timestamps into a reusable helper function. This removes
code duplication in the -x (PTP_SYS_OFFSET_EXTENDED) output path
and prepares for additional callers.

The "after" timestamp lines now include the sample number prefix
for consistency with the "before" lines, slightly changing the
output format.

Signed-off-by: Arthur Kiyanovski <akiyano@amazon.com>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
---
 tools/testing/selftests/ptp/testptp.c | 76 +++++++++++++--------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/tools/testing/selftests/ptp/testptp.c b/tools/testing/selftests/ptp/testptp.c
index ed1e2886ba3c..d603d9f82237 100644
--- a/tools/testing/selftests/ptp/testptp.c
+++ b/tools/testing/selftests/ptp/testptp.c
@@ -153,6 +153,34 @@ static void usage(char *progname)
 		progname, PTP_MAX_SAMPLES);
 }
 
+static void print_system_timestamp(int sample_num, __kernel_clockid_t clockid,
+				   long long sec, unsigned int nsec,
+				   const char *when)
+{
+	const char *name;
+
+	switch (clockid) {
+	case CLOCK_REALTIME:
+		name = "real";
+		break;
+	case CLOCK_MONOTONIC:
+		name = "monotonic";
+		break;
+	case CLOCK_MONOTONIC_RAW:
+		name = "monotonic-raw";
+		break;
+	default:
+		name = NULL;
+		break;
+	}
+
+	if (!name)
+		return;
+
+	printf("sample #%2d: %s time %s: %lld.%09u\n",
+	       sample_num, name, when, sec, nsec);
+}
+
 int main(int argc, char *argv[])
 {
 	struct ptp_clock_caps caps;
@@ -608,46 +636,18 @@ int main(int argc, char *argv[])
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

