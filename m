Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794437517;
	b=Nov4AHy9Rej2dd6mJK9hWZV+pdwfGOjlPOudYGfJ/LwtzmJuSGFNyEeC0Mrrhtuas8md
	 mKtX9aAzETQ8n/vfvoY7aejhpL9LcgIDlO2Tii6NLGTtGcMI4eqddkSE7bYz3KrO7MO20
	 NqaSj0aXvlHFWnPw3cWxWh526TxW0pn8QBa/cN41FM0HRtQB1KkeEXLgjd4ekG+PcDuib
	 TbvW6Ttk/iLhKOyX10lRi1hgNG2lXYO1ZF7ua59o1Mc8a9ZZrcAvAV9fFRonG574Te216
	 0jxB1TYOFu+C95tqXeJIQglp9jgYplEHS21aYHOFTyU8mOzzV3e5Xdp6ku7XN9HbksQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6/vhofawT2SU6SgpF8OfaiGs0g+T9Ie9hyxAqVetXP4=;
	b=d/sH+gk2W8fdFX9gMv9ARHgfh3ljXJxQaXiV1U36y2sFHRvGBNhgGDRJDKjL+tAJ8tss
	 ayVeE4AKhWPTAoW46jDEKVG2gxd4psDOiIhEgkJIQNYDXDly0fZdwogEH2+CLdFY2u830
	 Zf/5912sPqDZzRpGg/mUzfeHfOoEbiVyabufl4iybdrtc9XaXbsnv/DUliTPijflkwWQe
	 zWv33aGKxPj11kVPijhPMJqKWg3eYmKLu0CXMUs6C1KtTed1jFnLfSdG+rlLcenlGwpkt
	 8beGNr8/xtipMYiBm4NsNNvx903llEH6uIZLq+fVWmbLdCSUCgBiH9PPILLgvC7CzGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S7Ljy7R6;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9AA606AED0
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 22:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED9AA606AED0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S7Ljy7R6
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a058315c79so1896544b3a.3
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 14:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794437516; x=1795042316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/vhofawT2SU6SgpF8OfaiGs0g+T9Ie9hyxAqVetXP4=;
        b=S7Ljy7R6P0pvsFfplRx8vmeSpwWlYryM2KtPN8g7PAd3MCWx0eHXmJwVwSCamyDoHo
         fY+A2Pc7gE2AWzo6Fy4uYb0L+DcX9VTlaEcA9lvfLYNO3Zud7lz7jLkxoAQH5SoZhoW1
         9TRDOIkH84I+Eue2lfJ2SETleTqSKo7htEsiPEkUKfejquFQ+N8b4qzki3DUnGoAJ5YB
         sbP69DPZTRGLBpPuKqxlEfL8qFfhykJQOR2byVPX9tcbW3xJFWg4f81Wa6rmf67sJ/tW
         LU/2X+S0/uXHYcegzexiwyYUGSq12JkrbocXZcNUesxt3R3E8nBFIQKey5IUdg8+P8Co
         iirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794437516; x=1795042316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6/vhofawT2SU6SgpF8OfaiGs0g+T9Ie9hyxAqVetXP4=;
        b=TYIJ139me+aRBzZm0wMwOpsscSdfHCLFSudrlgP4/SVRr/CYj/eAPE184PPCoba2XW
         QjCOZaqMb0wNP4Pk7jc9im+iOZ1Jfy2JvdwnoLkReUhs2jRonnBTO8lZ6FtdS1l6yEmr
         FxqlzJl/zf2HUyEntsfc2sUKk1bVE2MmzqubWJpOBvosTqvPU9kEk7Pi4Td4eOD40gs8
         aRv9WLUhliqeDl7Ez8qVZW0Obw04xUFbZsUs7xyLr215zKy8YjPpzsSosu29g8VCJiSe
         krLAfBbBK4LHbaKlhwzxe25GvB6RQb818VOziZOf/ZIBJNbTqgzET7hYLdzCaIaZDKpd
         udYw==
X-Forwarded-Encrypted: i=1; AL+hErEtxu4PRMeh+ByvFCIFioLA4eTgMCmoq4LfLFFCkrbwC/MRwtWBW5KEqILVRNG1mhh2BMY8QZK5QIoHObMHX/M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zakPo5fnStG2NqvCN+YMB9RLWT3d9uXFSnQ4w5LLbLKILZzjc
	1XUae4lzkw2LkMStvnIIhTfmicTXOJz6H4t8O7SgDbY+7ibPi+0G50xj
X-Gm-Gg: AYBFou33OavfxElELSCERxufcXQrKpmxjvGYmGyIO8ceRou6Er4oKThmdQZDTRoUmkm
	qFmoeji6bXQ5HZdFdpG4jjw7AL/vTGJIi8Bay3LlZBSWGAQN7B/5fobsR1W4pAGI0lGJYbB3fcL
	3/syKxXQi3D4xKW2k1sXOkCXLl8IG7X8MhgU6I/nrr3rtuj2jufu46Uscu2502lgGMoWKYjpfmV
	UufbqEdHxzG2U/hwfnmv6yRGttvBKc0GCYDOdL6seGCvzpc6RKsyvxgdF0akf8JbQmYXW6aCHiC
	ebVcYUeIniIiMLenqKI5/yGBMxc6eSaEAzDUoRz0l0ByKKG+NJXSpxxbrnOu3vC3EbpB3tBfz4o
	syXIRf9r7G1tAXwM/MmI7yU9HJbCTiOJIGQNPsSr84Q6eVx2bKFG/97za+869wFtq7n+Wmh170B
	N5mTU4RiPgwVVDYQkGdBlBM32s0EBzYHc+BYIg+POhyAzH8U+OuVNDMRgEWTyi5hTm6MbmoRHvw
	6dS7bX1gLgk0ghgCcW2rTzH+jpKCNfioYRq/nfguJrFYjiNSJ0Ja+RgJN+Gyca/GWOxmbDZ7Ocw
	w91i+FdPGT4Gz0wBqM+EsFfylhYrGPaTi0JDG+mVThkpNGO979D3z/PvQS7bVHTw05F8qDdKYwf
	1k0gIVbnB+BDF/tHadWax5Odv33XAc7hfVt6wcFo7TTSbAZGjMOHHxIjtOgDMRmYiRfq5vGl8XV
	NY2h5HyrfdPHy3pWaQTW4ZDhe8YvkIW7txUq/MHJG8
X-Received: by 2002:a05:6a21:6f09:b0:3e1:a4ac:2d5b with SMTP id adf61e73a8af0-3f2ff4d9896mr3404820637.41.1794437516195;
        Wed, 11 Nov 2026 14:51:56 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa86dd0fsm2471575b3a.22.2026.11.11.14.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:51:55 -0800 (PST)
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
Subject: [PATCH net v2 2/2] selftest: af_unix: Test scm_fds on dgram disconnect.
Date: Wed, 11 Nov 2026 22:51:48 +0000
Message-ID: <20261111225148.88506-3-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111225148.88506-1-sidchintamaneni@gmail.com>
References: <20261111225148.88506-1-sidchintamaneni@gmail.com>
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
 .../selftests/net/af_unix/scm_rights.c        | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/tools/testing/selftests/net/af_unix/scm_rights.c b/tools/testing/selftests/net/af_unix/scm_rights.c
index c165f250220a..ced83d3173b7 100644
--- a/tools/testing/selftests/net/af_unix/scm_rights.c
+++ b/tools/testing/selftests/net/af_unix/scm_rights.c
@@ -395,4 +395,83 @@ TEST_F(scm_rights, mixed_lowpoint)
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
+	ASSERT_EQ(0, count_sockets(_metadata, &variant));
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
+
+	sleep(1);
+	ASSERT_EQ(0, count_sockets(_metadata, &variant));
+}
+
 TEST_HARNESS_MAIN
-- 
2.43.0

