Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794673610;
	b=LmeskqnHk/Ylkrd8PCVOrTzQCbjg8htkHsta1ZNdwCQorI2pmoNqCA/hC4uQsASZevNm
	 iZmI9cVWA3xTVdVAzBsjTl0DaHjc9w0eOdXCycUBOtAdw5Yh1Fy0V47Ps+3MdfUWhesHM
	 1bVmd4hr+7UdHlGyJ+k/w87bnGGqd7w9xm+F5d2QCnFqObtVmVXlYEgsD3IbdqFFax7br
	 gW2AkbX6VCBOLRZE+GQGgCn/kOw4ckir0NLXQg7klP1YX2wA8ZL3g7x6D/+nCrQjHB+Xn
	 5p9NIsPm2Ts/AUSygzRh2q80wk7KzVBjxwlZKPBN7cqF9oWeMuYJCQX4K9fZdlGfjYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794673610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=soJ4jjpDPBCnxqBMue7ymudhbAVotnUPrgSAUa7XWXo=;
	b=4g3ZPFwB4nBpOiiHRyWoewkOn3IUpVJdODNIIbQP9X6fDYNDnX428MCNbWZaBq51GYaw
	 zg6PqSpR8IhSIgoW9cfXaFdEKjdHhJfsFU0Mwp10YE0nx9tWnQ2wrfvgz6GYFkTR3B0bU
	 mj7rkMUeaBnN9yHWSQnEYSLeu30mP9kzQ7zHeajij+GHrzjsn5M8joTKdR7sZvis9RrM4
	 /jXb1RXOGmlLlR+E8Lt3iCu9cvBfzMtvFPwNS5jKROW602ScyE84txT86i9MvlQomaEBp
	 OtDLU+StHluV9TGDoxQqdl9JkGN6uiUxsPO++Pc3KHR62tYVROxEVtizwDQ+nqHZYzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0PE367vk;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF4F606A8A6
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 16:26:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EF4F606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0PE367vk
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdb2893531bso1764763a12.1
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 08:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794673609; x=1795278409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=soJ4jjpDPBCnxqBMue7ymudhbAVotnUPrgSAUa7XWXo=;
        b=0PE367vkhMov64BmEHF86qirTh/Zmd0NSzk3nADN94n23tbjdGS+qcKsgD5PGI3qnx
         yWS8iMxIyoa7AAlQ/E37sXKWDZ0+MS9yIZjfrfdMjNC0Thf3pkkl97FYGRClRhuBLLzg
         rXhivnz0kCOlq35pKwouKf2g6hOCQSXTAqM5Y/YWkXGv5wB0VXPgv86XY1C/3vkGX1C3
         UayUE200nbgk91Nfnq/GPSxl/SWuSLMWf7Goo0bAmUTk0fUHufyu5eWQF61zNx+lw+uN
         Ar/i/zGogt3DIeWHK4PF2jWmZNM/Jrz4VMNNfHsc+sOwaN0k9om0F8t0CLzw2J38YpEm
         ZmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794673609; x=1795278409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=soJ4jjpDPBCnxqBMue7ymudhbAVotnUPrgSAUa7XWXo=;
        b=lGf1F+CiwrptzRn46ZMgM4n4cGsnW9s20SD4F8Zpt89XIiZuK82NBcXV0ulinZRglW
         KSJk7swJ7qQ0yztHlZ+ud+dAnzIuVIkvFe3yJ3wQfcnU5b5oTN+idTDmLE5ViOe4o/yd
         7Y87+fn0kminBSrriF+8vaawVPiB4utRbrYGoDSa2zhmkqR0imXyvXqIsk5axrAs5E6M
         wMUzrnAWMikMpMtaeUD5Z/VMbqzZvbmBQcaVrqUH9Tedik4ZLQ9S6hi8fV/454nhieVe
         3RODwuDC+fv7JDlrJ3AXaxm+a6swikd+ac7SyAAlKi5kjw8xLkcAkKPwpJ0A6+jheJFb
         bynA==
X-Forwarded-Encrypted: i=1; AL+hErEgXHxjAEeEAOlTOUMKH/hr74MA1lz8kw14z6g6NPJFbycY1TsYzvjB5H6sR6SNF5EqOtSVOfndH9KnF+fdjq0=@vger.kernel.org
X-Gm-Message-State: APuU4Z816/hSEwBfJkfH3ar3W13rvnCz6s0bQLdYb4EcBXF7MjZHaWqx
	oGgmPV1JgRAnUxO5ye41w1nFo3Y8jNXhcJsnCguOU5erT4Ty89kS2pny
X-Gm-Gg: AYBFou0iXBO4da+5eMuPXzdfKLrpi5JC+M8yaEQfI5PqQbPAHdMCX61yaCqHRxqKUW4
	lhSBWjGyX6FHq1fAGLoSj8xtMIhFLTtf/R/PLJ+p5KLekasAgUtAwiRfnCF1Mak7zr/AQ/F3UtI
	5mmf7hdnsYzQGLsSGDTvX3WhFziYNJS2ZuGV/c9xOH6KhS1NArJ93wpNMbuBPxdqIN+gGKC1F7L
	7DDhX5JfxvgmwN3vymC2xTMIzT0vUSSQB8EKOCt7bEBiP2mU1HkZwm1ygIY6FvHQwhorZknZVb2
	VLALRzW3NjkhHJo3gv0vPoml1Yr7XHQuXxfD6UZCOxvXGLyhu6rNq1R40b3VJBh4COUUgTIB/jJ
	zdVCkEBoYPT+0kf4jYmNMdJhzWeKdUjEUx962p5HDP+BIAatner/WAE9rd884nrX9WeziJdXS56
	ooiaBcwIxSBBm/DDySH1oDTGQpTPUQoP0pJhYMUFAEWhIs9aXFkTcxgNGDHnop7SIy8a9LTjaMs
	hExEO6iMqaMChj4cgPGICQf3d57AAyiju6fxj/iSyB7ORop0RYjb8B8Uy/IHdueR7XKt54+XxUm
	WQaHYHbXV2+rnehUWTC5EmaqrVtYl/4SR/7fOs3uCg94Gnxd73K/ltYMXo3syTUcfqAHvy1oKZm
	ieNs+HC3NvTgdVfQ5zTn9ndQ2rkoNJRA8IHfuiXRJ/mcS/G0/HPxLqt7Db6bQZ/TxOOocx3CsNP
	KsoQmtCw3jLY1+JoSScoJsYe1n0fX9xECuQ64xSHXq
X-Received: by 2002:a17:90a:d2cf:b0:3aa:fdad:7d6e with SMTP id 98e67ed59e1d1-3b1b0b669d6mr5757395a91.10.1794673609429;
        Sat, 14 Nov 2026 08:26:49 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec622b6sm10229142a91.11.2026.11.14.08.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:26:49 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Kirill Tkhai <tkhai@ya.ru>,
	apais@microsoft.com,
	hargar@linux.microsoft.com,
	rlmenge@gmail.com,
	egoriluk@gmail.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: [PATCH net v3 2/2] selftest: af_unix: Test scm_fds on dgram disconnect.
Date: Sat, 14 Nov 2026 16:26:32 +0000
Message-ID: <20261114162632.16346-3-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114162632.16346-1-sidchintamaneni@gmail.com>
References: <20261114162632.16346-1-sidchintamaneni@gmail.com>
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

Add dgram_disconnect_fdinfo in scm_rights.c verifying that scm_fds in
/proc/self/fdinfo/<fd> returns to 0 when a connected SOCK_DGRAM socket
with queued SCM_RIGHTS datagrams disconnects via connect(AF_UNSPEC) or
observes a dead peer in send().

Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 .../selftests/net/af_unix/scm_rights.c        | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/tools/testing/selftests/net/af_unix/scm_rights.c b/tools/testing/selftests/net/af_unix/scm_rights.c
index c165f250220a..19aa26c60f3b 100644
--- a/tools/testing/selftests/net/af_unix/scm_rights.c
+++ b/tools/testing/selftests/net/af_unix/scm_rights.c
@@ -395,4 +395,79 @@ TEST_F(scm_rights, mixed_lowpoint)
 	close_sockets(6);
 }
 
+static int count_scm_fds(struct __test_metadata *_metadata, int fd)
+{
+	char path[64], *line = NULL;
+	int scm_fds = -1, ret;
+	size_t unused = 0;
+	FILE *f;
+
+	snprintf(path, sizeof(path), "/proc/self/fdinfo/%d", fd);
+
+	f = fopen(path, "r");
+	ASSERT_NE(NULL, f);
+
+	while (getline(&line, &unused, f) != -1) {
+		if (strncmp(line, "scm_fds:", 8))
+			continue;
+
+		ret = sscanf(line + 8, "%d", &scm_fds);
+		ASSERT_EQ(1, ret);
+
+		break;
+	}
+
+	free(line);
+
+	ret = fclose(f);
+	ASSERT_EQ(0, ret);
+
+	return scm_fds;
+}
+
+TEST(dgram_disconnect_fdinfo)
+{
+	const FIXTURE_VARIANT(scm_rights) variant = {
+		.name = "UNIX ",
+		.type = SOCK_DGRAM,
+	};
+	FIXTURE_DATA(scm_rights) self = {};
+	struct sockaddr addr = {
+		.sa_family = AF_UNSPEC,
+	};
+	int ret;
+
+	ret = unshare(CLONE_NEWNET);
+	ASSERT_EQ(0, ret);
+
+	create_socketpairs(_metadata, &self, &variant, 2);
+
+	/* 1. Disconnect via connect(AF_UNSPEC) */
+	__send_fd(_metadata, &self, &variant, 0, 0);
+	ASSERT_EQ(2, count_scm_fds(_metadata, self.fd[0]));
+
+	ret = connect(self.fd[0], &addr, sizeof(addr.sa_family));
+	ASSERT_EQ(0, ret);
+	ASSERT_EQ(0, count_scm_fds(_metadata, self.fd[0]));
+
+	/* 2. Dead-peer disconnect via send() */
+	__send_fd(_metadata, &self, &variant, 1, 1);
+	ASSERT_EQ(2, count_scm_fds(_metadata, self.fd[2]));
+
+	ret = close(self.fd[3]);
+	ASSERT_EQ(0, ret);
+
+	ret = send(self.fd[2], "x", 1, 0);
+	ASSERT_EQ(-1, ret);
+	ASSERT_EQ(ECONNREFUSED, errno);
+	ASSERT_EQ(0, count_scm_fds(_metadata, self.fd[2]));
+
+	ret = close(self.fd[0]);
+	ASSERT_EQ(0, ret);
+	ret = close(self.fd[1]);
+	ASSERT_EQ(0, ret);
+	ret = close(self.fd[2]);
+	ASSERT_EQ(0, ret);
+}
+
 TEST_HARNESS_MAIN
-- 
2.43.0

