Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.1.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2223D952E;
	Fri, 17 Jul 2026 07:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.1.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784271602; cv=none; b=Ilri3Lou4stEE0Lf6VdjgqlKIB8ChXNAOirtkN9wFciNq/+uqJ2gga/qLwlmIW3nqNiHWUjMQfeb5s7rJdrV0p0/ni9oUxGalX4+emM4mrwmlISIrBQJLZdcDduZGRDb52ZQBOVmGKOPQATGtrtUWRnR3tzLNPFcwRiM5h5CcOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784271602; c=relaxed/simple;
	bh=ljp5VXSTO1lGSXr1y4bP8MuYjXivlUc285HbE6Tgc8U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fuC8evbKT1neoJsl7o93EgtBMcMJnItUo+UpywJOAsSDDVPc9I5uYMY+hc8+Y/kX2hCQeac2gyTMkfjh4Q8IAPCHX6HZ05v5TyFCchJABerNcAegAjSWDUjc7NddWE8Aca9kEsGQV2K+DXJihc7jKE31wo+3yQ3dVLTNmdt4ZCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=eaYiaAZ1; arc=none smtp.client-ip=44.246.1.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="eaYiaAZ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1784271600; x=1815807600;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l+Nz7EDk0se7GopD5elS1c4uv3ab2rIwSMAVRPVxek0=;
  b=eaYiaAZ1RNu73F0Fu2mii/6Iq543VYeVcGsuC7jmGDKKez1S+h8g+L2N
   dvyV2MbGLvk0VNeG3dW2WyMOXITP0uyk3d+xJ4TtFxrR9VcvaFDfW4Hyz
   fA5mERO0EYyzXkYmo8aNDm1zaISGAG280h7HyLe9qZdEM2Dw99+KXV+o5
   /Nu3YWleCtFfe7/maTtrsLGNDzazmkbd3/L/bZmL6Yh2SPWrn/lRIzzhu
   sZCrAkvB158XsNu4ygOnZXrwpZlpYdZJg2vFEfKD1cvBAc0lRhTY3Fzaq
   +SeVRZrilcvVvOpijOg1vFwDYNLb4/hZi9aiyzsitMGRmw7DwFGXvV3p8
   g==;
X-CSE-ConnectionGUID: gIDAOwXnTTG0hR6hNAAa2w==
X-CSE-MsgGUID: Or4t8s7BTFeYe0ZkTPnUtA==
X-IronPort-AV: E=Sophos;i="6.25,168,1779148800"; 
   d="scan'208";a="23849295"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 06:59:57 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.48:3109]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.35.17:2525] with esmtp (Farcaster)
 id 230cf052-c281-4ad8-9e7d-d72eae4983be; Fri, 17 Jul 2026 06:59:57 +0000 (UTC)
X-Farcaster-Flow-ID: 230cf052-c281-4ad8-9e7d-d72eae4983be
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Fri, 17 Jul 2026 06:59:57 +0000
Received: from dev-dsk-akiyano-1c-2138b29d.eu-west-1.amazon.com (172.19.83.6)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Fri, 17 Jul 2026 06:59:51 +0000
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
	<skhan@linuxfoundation.org>, Simon Horman <horms@kernel.org>, Bjorn Helgaas
	<bhelgaas@google.com>, <vadim.fedorenko@linux.dev>
Subject: [PATCH v5 net-next 3/7] selftests/ptp: Add testptp support for attributes ioctls
Date: Fri, 17 Jul 2026 06:59:14 +0000
Message-ID: <20260717065924.2556-4-akiyano@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260717065924.2556-1-akiyano@amazon.com>
References: <20260717065924.2556-1-akiyano@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D041UWA002.ant.amazon.com (10.13.139.121) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Add support for testing the new PTP_SYS_OFFSET_EXTENDED_ATTRS and
PTP_SYS_OFFSET_PRECISE_ATTRS ioctls in the testptp utility.

Add a "-a" modifier that requests clock quality attributes
(error_bound, status, timescale) alongside the existing extended (-x)
and precise (-X) offset requests:
  -x N -a: extended offset with attributes (N samples)
  -X -a:   precise cross-timestamp with attributes

When the device does not report a given attribute, print an explicit
"not reported" line so all attributes are always accounted for.

These options allow testing and validation of PHC devices that provide
clock quality information alongside timestamps.

Also display the new clock_attrs capability in the -c output, and
update print_system_timestamp to print unrecognized clock types instead
of silently dropping them.

Signed-off-by: Amit Bernstein <amitbern@amazon.com>
Signed-off-by: Arthur Kiyanovski <akiyano@amazon.com>
---
 tools/testing/selftests/ptp/testptp.c | 115 +++++++++++++++++++++++++-
 1 file changed, 111 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/ptp/testptp.c b/tools/testing/selftests/ptp/testptp.c
index d603d9f82237..b5c75d5337b3 100644
--- a/tools/testing/selftests/ptp/testptp.c
+++ b/tools/testing/selftests/ptp/testptp.c
@@ -148,6 +148,8 @@ static void usage(char *progname)
 		" -T val     set the ptp clock time to 'val' seconds\n"
 		" -x val     get an extended ptp clock time with the desired number of samples (up to %d)\n"
 		" -X         get a ptp clock cross timestamp\n"
+		" -a         also report clock quality attributes (error_bound,\n"
+		"            status, timescale); use together with -x or -X\n"
 		" -y val     pre/post tstamp timebase to use {realtime|monotonic|monotonic-raw}\n"
 		" -z         test combinations of rising/falling external time stamp flags\n",
 		progname, PTP_MAX_SAMPLES);
@@ -174,8 +176,10 @@ static void print_system_timestamp(int sample_num, __kernel_clockid_t clockid,
 		break;
 	}
 
-	if (!name)
+	if (!name) {
+		printf("sample #%2d: unknown clock %d\n", sample_num, clockid);
 		return;
+	}
 
 	printf("sample #%2d: %s time %s: %lld.%09u\n",
 	       sample_num, name, when, sec, nsec);
@@ -194,6 +198,7 @@ int main(int argc, char *argv[])
 	struct ptp_sys_offset *sysoff;
 	struct ptp_sys_offset_extended *soe;
 	struct ptp_sys_offset_precise *xts;
+	struct ptp_sys_offset_attrs *attrs_data;
 
 	char *progname;
 	unsigned int i;
@@ -215,6 +220,7 @@ int main(int argc, char *argv[])
 	int pct_offset = 0;
 	int getextended = 0;
 	int getcross = 0;
+	int use_attrs = 0;
 	int n_samples = 0;
 	int pin_index = -1, pin_func;
 	int pps = -1;
@@ -232,7 +238,8 @@ int main(int argc, char *argv[])
 
 	progname = strrchr(argv[0], '/');
 	progname = progname ? 1+progname : argv[0];
-	while (EOF != (c = getopt(argc, argv, "cd:e:E:f:F:ghH:i:k:lL:n:o:p:P:rsSt:T:w:x:Xy:z"))) {
+	while (EOF != (c = getopt(argc, argv,
+				  "acd:e:E:f:F:ghH:i:k:lL:n:o:p:P:rsSt:T:w:x:Xy:z"))) {
 		switch (c) {
 		case 'c':
 			capabilities = 1;
@@ -317,6 +324,9 @@ int main(int argc, char *argv[])
 				return -1;
 			}
 			break;
+		case 'a':
+			use_attrs = 1;
+			break;
 		case 'X':
 			getcross = 1;
 			break;
@@ -373,6 +383,8 @@ int main(int argc, char *argv[])
 			       "  %d programmable pins\n"
 			       "  %d cross timestamping\n"
 			       "  %d adjust_phase\n"
+			       "  %d extended_attrs\n"
+			       "  %d precise_attrs\n"
 			       "  %d maximum phase adjustment (ns)\n",
 			       caps.max_adj,
 			       caps.n_alarm,
@@ -382,6 +394,8 @@ int main(int argc, char *argv[])
 			       caps.n_pins,
 			       caps.cross_timestamping,
 			       caps.adjust_phase,
+			       caps.extended_attrs,
+			       caps.precise_attrs,
 			       caps.max_phase_adj);
 		}
 	}
@@ -619,7 +633,7 @@ int main(int argc, char *argv[])
 		free(sysoff);
 	}
 
-	if (getextended) {
+	if (getextended && !use_attrs) {
 		soe = calloc(1, sizeof(*soe));
 		if (!soe) {
 			perror("calloc");
@@ -654,7 +668,56 @@ int main(int argc, char *argv[])
 		free(soe);
 	}
 
-	if (getcross) {
+	if (getextended && use_attrs) {
+		attrs_data = calloc(1, sizeof(*attrs_data) +
+				    getextended * sizeof(struct ptp_timestamp));
+		if (!attrs_data) {
+			perror("calloc");
+			return -1;
+		}
+
+		attrs_data->request.num_samples = getextended;
+		attrs_data->request.clock_id = ext_clockid;
+
+		if (ioctl(fd, PTP_SYS_OFFSET_EXTENDED_ATTRS, attrs_data)) {
+			perror("PTP_SYS_OFFSET_EXTENDED_ATTRS");
+		} else {
+			printf("extended attrs timestamp request returned %d samples\n",
+			       getextended);
+
+			for (i = 0; i < getextended; i++) {
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
+				else
+					printf("    error_bound: not reported\n");
+				if (ts->devtime.attrs.valid & PTP_ATTRS_VALID_STATUS)
+					printf("    status: %u\n",
+					       ts->devtime.attrs.status);
+				else
+					printf("    status: not reported\n");
+				if (ts->devtime.attrs.valid & PTP_ATTRS_VALID_TIMESCALE)
+					printf("    timescale: %u\n",
+					       ts->devtime.attrs.timescale);
+				else
+					printf("    timescale: not reported\n");
+				printf("    sys after:  %lld ns\n",
+				       (long long)ts->post_systime.sys_time);
+			}
+		}
+
+		free(attrs_data);
+	}
+
+	if (getcross && !use_attrs) {
 		xts = calloc(1, sizeof(*xts));
 		if (!xts) {
 			perror("calloc");
@@ -677,6 +740,50 @@ int main(int argc, char *argv[])
 		free(xts);
 	}
 
+	if (getcross && use_attrs) {
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
+			else
+				printf("error_bound: not reported\n");
+			if (ts->devtime.attrs.valid & PTP_ATTRS_VALID_STATUS)
+				printf("status: %u\n",
+				       ts->devtime.attrs.status);
+			else
+				printf("status: not reported\n");
+			if (ts->devtime.attrs.valid & PTP_ATTRS_VALID_TIMESCALE)
+				printf("timescale: %u\n",
+				       ts->devtime.attrs.timescale);
+			else
+				printf("timescale: not reported\n");
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

