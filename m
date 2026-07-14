Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.34.181.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F910360745;
	Tue, 14 Jul 2026 02:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.34.181.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783994661; cv=none; b=RoDIIy7ItG2oSDgtnQiWDhcNLepqyxMDx3a2o6CqM9YxE1HhTfdX+Bjs72Hbeq9aHgiAnQK/3uxfJtq0a2KsWWiCkX7Mfhjjg/InfIjUQ/3wkwEaIqzifj9qk5bONJMi42ZAGmR/GXWVfSQsRrWVfroS8+UKyyMmEShueR4l4wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783994661; c=relaxed/simple;
	bh=tmG7D+SzH+p0YW053gu5bNoTIum+yEJ5LbUV7rHPGtE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d4WF3WYHr7PObHsl9I+dViHM3rjQSFoFI+4w2GqbF/1fl9rm0NOkGxJb5UjT3MJoO5xe4kqTk54o5khU70wfhnJl/FJrtp5bvgV5Z0ORcZuIX7VklvmS4v0sP2kaRgkrs0FQF4GvwkkKTyZ1NWIzKXOAvxcfFgOGahQyvhB96N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=aNDYPvFQ; arc=none smtp.client-ip=52.34.181.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="aNDYPvFQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1783994660; x=1815530660;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gTRf8K+0IwD2tuhCECy86j1ytdxsmI/bdw2TWXexEho=;
  b=aNDYPvFQ/rMvpJkqyzg+55XivTreK5ahykJ7wy1oa0XTZwQ3UKliPftv
   dvNMDo1N4TcdSzAdQEwzSdzdPZhlodMQIASaD6VmZQJ7xAKWBrDVjExBG
   Rs4rop2w1+b+NDlF9I27EBvNa4Hx9HkaUPJ0FgJygUgH7onxxaTXeI9Vu
   DIS6Ywwkdpv0QoUiWWpzIkp1rdvmWL2myDZ5kslLmEm064Hxh+R0wtJ/L
   yl6lUpWrfucjeLPIwtcJBwLa3XccWZR/TrfWXS2br7Ig+TXzFo/C0fOwY
   JqR55CgTCEjKP0ZrKrvDaI0g3m3sSMNBESmLeUF0el0U99xuzcBnRXEJP
   w==;
X-CSE-ConnectionGUID: 7gmUYLmPSY6ulta8LUV7qA==
X-CSE-MsgGUID: qBMUFXeNReilvYKq6LDMRA==
X-IronPort-AV: E=Sophos;i="6.25,154,1779148800"; 
   d="scan'208";a="23592899"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 02:04:17 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:28211]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.11.115:2525] with esmtp (Farcaster)
 id 3afcfa8a-98b8-444c-bba3-d928e7361810; Tue, 14 Jul 2026 02:04:17 +0000 (UTC)
X-Farcaster-Flow-ID: 3afcfa8a-98b8-444c-bba3-d928e7361810
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Tue, 14 Jul 2026 02:04:16 +0000
Received: from dev-dsk-akiyano-1c-2138b29d.eu-west-1.amazon.com (172.19.83.6)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Tue, 14 Jul 2026 02:04:11 +0000
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
Subject: [PATCH v4 net-next 3/7] selftests/ptp: Add testptp support for attributes ioctls
Date: Tue, 14 Jul 2026 02:03:04 +0000
Message-ID: <20260714020340.25014-4-akiyano@amazon.com>
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
 tools/testing/selftests/ptp/testptp.c | 111 +++++++++++++++++++++++++-
 1 file changed, 109 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/ptp/testptp.c b/tools/testing/selftests/ptp/testptp.c
index d3bcfd03fce4..99607da01b22 100644
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
@@ -188,6 +193,7 @@ int main(int argc, char *argv[])
 	struct ptp_sys_offset *sysoff;
 	struct ptp_sys_offset_extended *soe;
 	struct ptp_sys_offset_precise *xts;
+	struct ptp_sys_offset_attrs *attrs_data;
 
 	char *progname;
 	unsigned int i;
@@ -208,7 +214,9 @@ int main(int argc, char *argv[])
 	int list_pins = 0;
 	int pct_offset = 0;
 	int getextended = 0;
+	int getextendedattrs = 0;
 	int getcross = 0;
+	int getcrossattrs = 0;
 	int n_samples = 0;
 	int pin_index = -1, pin_func;
 	int pps = -1;
@@ -226,7 +234,8 @@ int main(int argc, char *argv[])
 
 	progname = strrchr(argv[0], '/');
 	progname = progname ? 1+progname : argv[0];
-	while (EOF != (c = getopt(argc, argv, "cd:e:E:f:F:ghH:i:k:lL:n:o:p:P:rsSt:T:w:x:Xy:z"))) {
+	while (EOF != (c = getopt(argc, argv,
+				  "a:Acd:e:E:f:F:ghH:i:k:lL:n:o:p:P:rsSt:T:w:x:Xy:z"))) {
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
@@ -367,6 +389,8 @@ int main(int argc, char *argv[])
 			       "  %d programmable pins\n"
 			       "  %d cross timestamping\n"
 			       "  %d adjust_phase\n"
+			       "  %d extended_attrs\n"
+			       "  %d precise_attrs\n"
 			       "  %d maximum phase adjustment (ns)\n",
 			       caps.max_adj,
 			       caps.n_alarm,
@@ -376,6 +400,8 @@ int main(int argc, char *argv[])
 			       caps.n_pins,
 			       caps.cross_timestamping,
 			       caps.adjust_phase,
+			       caps.extended_attrs,
+			       caps.precise_attrs,
 			       caps.max_phase_adj);
 		}
 	}
@@ -648,6 +674,49 @@ int main(int argc, char *argv[])
 		free(soe);
 	}
 
+	if (getextendedattrs) {
+		attrs_data = calloc(1, sizeof(*attrs_data) +
+				    getextendedattrs * sizeof(struct ptp_timestamp));
+		if (!attrs_data) {
+			perror("calloc");
+			return -1;
+		}
+
+		attrs_data->request.num_samples = getextendedattrs;
+		attrs_data->request.clock_id = ext_clockid;
+
+		if (ioctl(fd, PTP_SYS_OFFSET_EXTENDED_ATTRS, attrs_data)) {
+			perror("PTP_SYS_OFFSET_EXTENDED_ATTRS");
+		} else {
+			printf("extended attrs timestamp request returned %d samples\n",
+			       getextendedattrs);
+
+			for (i = 0; i < getextendedattrs; i++) {
+				struct ptp_timestamp *ts = &attrs_data->timestamps[i];
+
+				printf("  sample #%u:\n", i);
+				printf("    sys before: %lld ns\n",
+				       (long long)ts->pre_systime.sys_time);
+				printf("    phc time:   %lld.%09u\n",
+				       ts->devtime.device_time.sec,
+				       ts->devtime.device_time.nsec);
+				if (ts->devtime.attrs.valid & PTP_ATTRS_VALID_ERROR_BOUND)
+					printf("    error_bound: %u ns\n",
+					       ts->devtime.attrs.error_bound);
+				if (ts->devtime.attrs.valid & PTP_ATTRS_VALID_STATUS)
+					printf("    status: %u\n",
+					       ts->devtime.attrs.status);
+				if (ts->devtime.attrs.valid & PTP_ATTRS_VALID_TIMESCALE)
+					printf("    timescale: %u\n",
+					       ts->devtime.attrs.timescale);
+				printf("    sys after:  %lld ns\n",
+				       (long long)ts->post_systime.sys_time);
+			}
+		}
+
+		free(attrs_data);
+	}
+
 	if (getcross) {
 		xts = calloc(1, sizeof(*xts));
 		if (!xts) {
@@ -671,6 +740,44 @@ int main(int argc, char *argv[])
 		free(xts);
 	}
 
+	if (getcrossattrs) {
+		attrs_data = calloc(1, sizeof(*attrs_data) +
+				    sizeof(struct ptp_timestamp));
+		if (!attrs_data) {
+			perror("calloc");
+			return -1;
+		}
+
+		attrs_data->request.num_samples = 1;
+		attrs_data->request.clock_id = ext_clockid;
+
+		if (ioctl(fd, PTP_SYS_OFFSET_PRECISE_ATTRS, attrs_data)) {
+			perror("PTP_SYS_OFFSET_PRECISE_ATTRS");
+		} else {
+			struct ptp_timestamp *ts = &attrs_data->timestamps[0];
+
+			puts("precise attrs crosstimestamp request okay");
+			printf("device time: %lld.%09u\n",
+			       ts->devtime.device_time.sec,
+			       ts->devtime.device_time.nsec);
+			printf("system time: %lld ns\n",
+			       (long long)ts->systime.sys_time);
+			printf("raw time:    %lld ns\n",
+			       (long long)ts->systime.sys_rawtime);
+			if (ts->devtime.attrs.valid & PTP_ATTRS_VALID_ERROR_BOUND)
+				printf("error_bound: %u ns\n",
+				       ts->devtime.attrs.error_bound);
+			if (ts->devtime.attrs.valid & PTP_ATTRS_VALID_STATUS)
+				printf("status: %u\n",
+				       ts->devtime.attrs.status);
+			if (ts->devtime.attrs.valid & PTP_ATTRS_VALID_TIMESCALE)
+				printf("timescale: %u\n",
+				       ts->devtime.attrs.timescale);
+		}
+
+		free(attrs_data);
+	}
+
 	if (channel >= 0) {
 		if (ioctl(fd, PTP_MASK_CLEAR_ALL)) {
 			perror("PTP_MASK_CLEAR_ALL");
-- 
2.47.3

