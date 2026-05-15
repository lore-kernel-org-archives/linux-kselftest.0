Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.68.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C972392C5A;
	Fri, 15 May 2026 16:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.68.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778863281; cv=none; b=OOc23vp6RLafBZDvmBdDdI9W1A/gtg/TNzleSnTiNPW7m4G1wqr8mYOBgJ7xmyLbzWgj1EXSuPbtD+HqolqQ/UcjDXpT6DRw5YuVze5s0LrgoZK82uvXD74EjET5Jjl5ByJEUtklaDkCx+U/h0gUszIEuFzuYlnFPY4USrz0BNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778863281; c=relaxed/simple;
	bh=fhQVGn8eCoyqgWZRFpQIKMnhVqGyNWNReSidO871/aw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RwWnZ1gH234NY5Kx3J/V55Ybs0tpA7h3i6aSGsl18wKiP/DWp0MJoY9CXobO4OIAlgPUIjAhPJj4fMngStA2Q3Ml9NvsZTXLIOjs5UC9gZArQpGoSavt/nG+Ws9VbIZ79jF3HFbV/tMQp6Pl8t+A7zv/jW43oduoamdimNJkyws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=lv/bSvg2; arc=none smtp.client-ip=44.246.68.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="lv/bSvg2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1778863278; x=1810399278;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wdV9Q0EwyYv6Y1Cx4DKYff4Ebn/kaxIhmn6o8hitAW0=;
  b=lv/bSvg2GhvIea0Rc6qMNFmjlvL4YReMlyPRPTXc1+DULhCwJRqdFF4o
   O4l4jSx1gafgJObO21kNKQnysLwScTcLYAhrU0fifuc4rjjkLpL8vzdze
   SJW6yXe6esvr9rThk2iJcerR8khTOWeaaEeCiIqQeMwPIhmPGFmw7hdw8
   CjIB0x880kHA4VkJ9F2z37ZSzyFR5BDsPbRtSvw6pI/aG/VXQ88l7KQJI
   gQTC80bTQ+5rE1VHSvnvj0Vy9aPsqESIHyMLy0DNvlEDjVlI/SOMcL2Ni
   hwjOqV3TYo5EaKVmaLWHktskT+sTYYSILnLUGzEdBA2gcn5fFc+ZLEnLM
   g==;
X-CSE-ConnectionGUID: pAmnmwzQTxSrkWaKqYeHdg==
X-CSE-MsgGUID: +ZgXbzlmQoyWaZ/u1m5F7Q==
X-IronPort-AV: E=Sophos;i="6.23,236,1770595200"; 
   d="scan'208";a="19764784"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 16:41:14 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:23065]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.17.30:2525] with esmtp (Farcaster)
 id f0bfc0ae-3647-42dd-9bf2-c38b46377a31; Fri, 15 May 2026 16:41:14 +0000 (UTC)
X-Farcaster-Flow-ID: f0bfc0ae-3647-42dd-9bf2-c38b46377a31
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Fri, 15 May 2026 16:41:12 +0000
Received: from dev-dsk-akiyano-1c-2138b29d.eu-west-1.amazon.com (172.19.83.6)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Fri, 15 May 2026 16:41:07 +0000
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
	<linux-kselftest@vger.kernel.org>, <shuah@kernel.org>,
	<vadim.fedorenko@linux.dev>
Subject: [PATCH v3 net-next 3/7] selftests/ptp: Add testptp support for attributes ioctls
Date: Fri, 15 May 2026 16:40:23 +0000
Message-ID: <20260515164033.6403-4-akiyano@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260515164033.6403-1-akiyano@amazon.com>
References: <20260515164033.6403-1-akiyano@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D038UWB003.ant.amazon.com (10.13.139.157) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Add support for testing the new PTP_SYS_OFFSET_EXTENDED_ATTRS and
PTP_SYS_OFFSET_PRECISE_ATTRS ioctls in the testptp utility.

New command-line options:
  -a: Get extended offset with attributes (error_bound, clock_status,
      timescale)
  -A: Get precise cross-timestamp with attributes

These options allow testing and validation of PHC devices that provide
clock quality information alongside timestamps.

Also display the new clock_attrs capability in the -c output, and
update print_system_timestamp to print unrecognized clock types instead
of silently dropping them.

Signed-off-by: Amit Bernstein <amitbern@amazon.com>
Signed-off-by: Arthur Kiyanovski <akiyano@amazon.com>
---
 tools/testing/selftests/ptp/testptp.c | 105 +++++++++++++++++++++++++-
 1 file changed, 103 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/ptp/testptp.c b/tools/testing/selftests/ptp/testptp.c
index d3bcfd0..99eb346 100644
--- a/tools/testing/selftests/ptp/testptp.c
+++ b/tools/testing/selftests/ptp/testptp.c
@@ -147,10 +147,13 @@ static void usage(char *progname)
 		" -t val     shift the ptp clock time by 'val' seconds\n"
 		" -T val     set the ptp clock time to 'val' seconds\n"
 		" -x val     get an extended ptp clock time with the desired number of samples (up to %d)\n"
+		" -a val     get extended timestamps with attributes (error_bound,\n"
+		"            clock_status, timescale, counter), up to %d samples\n"
 		" -X         get a ptp clock cross timestamp\n"
+		" -A         get a precise cross timestamp with attributes\n"
 		" -y val     pre/post tstamp timebase to use {realtime|monotonic|monotonic-raw}\n"
 		" -z         test combinations of rising/falling external time stamp flags\n",
-		progname, PTP_MAX_SAMPLES);
+		progname, PTP_MAX_SAMPLES, PTP_MAX_SAMPLES);
 }
 
 static void print_system_timestamp(int sample_num, __kernel_clockid_t clockid,
@@ -171,6 +174,8 @@ static void print_system_timestamp(int sample_num, __kernel_clockid_t clockid,
 		       sample_num, when, sec, nsec);
 		break;
 	default:
+		printf("sample #%2d: unknown clock %d %s: %lld.%09u\n",
+		       sample_num, clockid, when, sec, nsec);
 		break;
 	}
 }
@@ -188,6 +193,8 @@ int main(int argc, char *argv[])
 	struct ptp_sys_offset *sysoff;
 	struct ptp_sys_offset_extended *soe;
 	struct ptp_sys_offset_precise *xts;
+	struct ptp_sys_offset_precise_attrs *xtsa;
+	struct ptp_sys_offset_extended_attrs *soea;
 
 	char *progname;
 	unsigned int i;
@@ -208,7 +215,9 @@ int main(int argc, char *argv[])
 	int list_pins = 0;
 	int pct_offset = 0;
 	int getextended = 0;
+	int getextendedattrs = 0;
 	int getcross = 0;
+	int getcrossattrs = 0;
 	int n_samples = 0;
 	int pin_index = -1, pin_func;
 	int pps = -1;
@@ -226,7 +235,7 @@ int main(int argc, char *argv[])
 
 	progname = strrchr(argv[0], '/');
 	progname = progname ? 1+progname : argv[0];
-	while (EOF != (c = getopt(argc, argv, "cd:e:E:f:F:ghH:i:k:lL:n:o:p:P:rsSt:T:w:x:Xy:z"))) {
+	while (EOF != (c = getopt(argc, argv, "a:Acd:e:E:f:F:ghH:i:k:lL:n:o:p:P:rsSt:T:w:x:Xy:z"))) {
 		switch (c) {
 		case 'c':
 			capabilities = 1;
@@ -311,9 +320,22 @@ int main(int argc, char *argv[])
 				return -1;
 			}
 			break;
+		case 'a':
+			getextendedattrs = atoi(optarg);
+			if (getextendedattrs < 1 ||
+			    getextendedattrs > PTP_MAX_SAMPLES) {
+				fprintf(stderr,
+					"number of extended attrs timestamp samples must be between 1 and %d; was asked for %d\n",
+					PTP_MAX_SAMPLES, getextendedattrs);
+				return -1;
+			}
+			break;
 		case 'X':
 			getcross = 1;
 			break;
+		case 'A':
+			getcrossattrs = 1;
+			break;
 		case 'y':
 			if (!strcasecmp(optarg, "realtime"))
 				ext_clockid = CLOCK_REALTIME;
@@ -367,6 +389,7 @@ int main(int argc, char *argv[])
 			       "  %d programmable pins\n"
 			       "  %d cross timestamping\n"
 			       "  %d adjust_phase\n"
+			       "  %d clock_attrs\n"
 			       "  %d maximum phase adjustment (ns)\n",
 			       caps.max_adj,
 			       caps.n_alarm,
@@ -376,6 +399,7 @@ int main(int argc, char *argv[])
 			       caps.n_pins,
 			       caps.cross_timestamping,
 			       caps.adjust_phase,
+			       caps.clock_attrs,
 			       caps.max_phase_adj);
 		}
 	}
@@ -648,6 +672,50 @@ int main(int argc, char *argv[])
 		free(soe);
 	}
 
+	if (getextendedattrs) {
+		soea = calloc(1, sizeof(*soea));
+		if (!soea) {
+			perror("calloc");
+			return -1;
+		}
+
+		soea->n_samples = getextendedattrs;
+		soea->clockid = ext_clockid;
+
+		if (ioctl(fd, PTP_SYS_OFFSET_EXTENDED_ATTRS, soea)) {
+			perror("PTP_SYS_OFFSET_EXTENDED_ATTRS");
+		} else {
+			printf("extended timestamp request returned %d samples\n",
+			       getextendedattrs);
+
+			for (i = 0; i < getextendedattrs; i++) {
+				print_system_timestamp(i, ext_clockid,
+						       soea->ts[i][0].pct.sec,
+						       soea->ts[i][0].pct.nsec,
+						       "before");
+
+				printf("            phc time: %lld.%09u, error bound: %u, clock status: %u, timescale: %u\n",
+				       soea->ts[i][1].pct.sec,
+				       soea->ts[i][1].pct.nsec,
+				       soea->ts[i][1].att.error_bound,
+				       soea->ts[i][1].att.status,
+				       soea->ts[i][1].att.timescale);
+
+				if (soea->ts[i][1].att.counter_id)
+					printf("            counter: %llu (id: %u)\n",
+					       (unsigned long long)soea->ts[i][1].att.counter_value,
+					       soea->ts[i][1].att.counter_id);
+
+				print_system_timestamp(i, ext_clockid,
+						       soea->ts[i][2].pct.sec,
+						       soea->ts[i][2].pct.nsec,
+						       "after");
+			}
+		}
+
+		free(soea);
+	}
+
 	if (getcross) {
 		xts = calloc(1, sizeof(*xts));
 		if (!xts) {
@@ -671,6 +739,39 @@ int main(int argc, char *argv[])
 		free(xts);
 	}
 
+	if (getcrossattrs) {
+		xtsa = calloc(1, sizeof(*xtsa));
+		if (!xtsa) {
+			perror("calloc");
+			return -1;
+		}
+
+		if (ioctl(fd, PTP_SYS_OFFSET_PRECISE_ATTRS, xtsa)) {
+			perror("PTP_SYS_OFFSET_PRECISE_ATTRS");
+		} else {
+			puts("system and phc crosstimestamping with attributes request okay");
+
+			printf("device time: %lld.%09u\n",
+			       xtsa->device.pct.sec, xtsa->device.pct.nsec);
+			printf("error_bound: %u ns\n",
+			       xtsa->device.att.error_bound);
+			printf("status: %u\n",
+			       xtsa->device.att.status);
+			printf("timescale: %u\n",
+			       xtsa->device.att.timescale);
+			if (xtsa->device.att.counter_id)
+				printf("counter: %llu (id: %u)\n",
+				       (unsigned long long)xtsa->device.att.counter_value,
+				       xtsa->device.att.counter_id);
+			printf("system time: %lld.%09u\n",
+			       xtsa->sys_realtime.sec, xtsa->sys_realtime.nsec);
+			printf("monoraw time: %lld.%09u\n",
+			       xtsa->sys_monoraw.sec, xtsa->sys_monoraw.nsec);
+		}
+
+		free(xtsa);
+	}
+
 	if (channel >= 0) {
 		if (ioctl(fd, PTP_MASK_CLEAR_ALL)) {
 			perror("PTP_MASK_CLEAR_ALL");
-- 
2.47.3

