Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793661175;
	b=EPkcJz5seWY2RY961Uw27gxSigEXk3iirMSH9ZA6AK9BWNxEaW53mLEOqI6lm44q10do
	 4m825VhOfVZ6t3D+lyxxZdEZwHjHcTRe4dsJ5P5rCrfWBJ6NJdKyuxep510lRdsV8Oily
	 /Jml7YAk9rvp87XzXdtthY/xWqYN73JfPdgTM16aGP1PBJCPhhtJJlJ7ygb627+3COj6f
	 Y7QLGKtbEclOZNfr4NMovgQl1+jgL4xJ7eBkfK6i8TXs7SmJTCXJtZYOSySPuHkeuKEtZ
	 SxDrC8dziXfNC60GpIu/+hxH3qxgJl78qSs73MsBdNAXkg7HxFQRa3WLDA6fskDPKoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=OXN/npWsGuscMDKYzwQyqKyh6TSWjmZFiWK4TeHONjs=;
	b=xkbTgEqwTAjmzclc2RtDAUF7wqEPKc0tarYb7zQeX5olKSVqwOtIJe7vF7Hg3TZ/9dsN
	 K7r+YCveGe8mbTIny6M7jxZWDoFDfYuop6KhON3if9akgI+gcUxvm6WsOd6U7O6bT0pja
	 nZj8P5E8sSUyi53PyrtJtKmZog3WWcQAyWyP0Gj24U2RwOBy3JlcUiaIBY0Ui6fEaqTiw
	 t11vQVHaDivBbgzGN8wpVyRE2lSCjR/Os5IUYqZ1u1T8nHmdWYTPIedflQBHO3iyvonP7
	 LvNRjpU7EAb+ZC/q4rbSqXmy9c5zzArYODF692y9+px2h7+vlVvFyuC2OxRbMp2qScg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=GuCtLrDd;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170FB606D827
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 23:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 170FB606D827
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=GuCtLrDd
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67921b515a7so2973158d50.2
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 15:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1793661174; x=1794265974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OXN/npWsGuscMDKYzwQyqKyh6TSWjmZFiWK4TeHONjs=;
        b=GuCtLrDdKx7WZqs6WOcKxAJeztLkuF4NCrr7VlX4Jhge7qBvmkIigLqpaIll3VC8Sn
         8Zmr/IJmoKc381jPHIBvLZn/invWMntUi/ZAJ+ao8q2+6gwUAGTHSYuvxT5h78kLv2Pm
         UcSw3SWWKxuplvPna5N06aDFoS+1PdJLxRYplIr2VBI3N7f/gd3dMLe+EVtzolbn1A7B
         w4NLgZ8gaoqBgQ+0wwmZmszEA6lLqvFrb+U9J76fSN7BgrwehR3702+IegtTEd0UFX+d
         6jiO+hvJlPKRrXNw+I78EBpD2hqMKz+2mh8z36VqzqlfXsuHs6ELm0fPoLq1MLEBqI8n
         d50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793661174; x=1794265974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OXN/npWsGuscMDKYzwQyqKyh6TSWjmZFiWK4TeHONjs=;
        b=z5vvwmn1rPCbg68Lkce7b2WOekRss6vfamlErCQXM6bsz5Q1YVlll9NQLcCPqNkdrI
         8yeq+aYaB3ir6JtqDo0YDZoUTgH5p8LsGYjLNoaurgrlUXqDC+3AXp698XcO/tmJ/e+F
         XQWB24EPdw2JUAPgSSO/DlmUv+DUGzf6bjQLhyMcolb2EqA5bJoChIRr8UJr1KoOTmKD
         UDgwrNzZ7AtejXimjqUqMgLBVRQFqmSgd/PzFTVC1as5tqu2mAz9gOyTNSRz5IIdFZbx
         gCaFxLrP+a91pav9Gso6zD4WfFrmFd8lZd9ZunqMxo1od5IXOFfZ0dKDe9hLqwbTAs2D
         /duQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWD0Y1pMZovIiY9LWe1Clp2eKH86kN938vbd0plhNQGRro7IDdz/l7d2cMSHGpnFbyHONAkk3IeliihVHsJKk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/U9MI6B0MHqemViFC4r4uzR92piI/Ov8SQJmv21022mQYULL88
	EPD2nrLnk+4rKW5xr9h8YHq/5aLYK1mzs7uqebryhA/0e5I78B5Zpiinz+n+xXnUwMq4
X-Gm-Gg: AYBFou14NAZDPPEGMl0DXsMTFHv9mjeX8dfCk5NOBVnF3YkYm/GLGc9BVZ/cJ3aPLCG
	mt5PIpdolANLPaOTdJjYArIUcQbwrKs0n3BkhlhtzN6cjFKtBTN137zS6G2UuqGIGoUrBEwGVXq
	r0vzAYIsnR5uIHGWNXV5lye57ZwlYbd1z5L66bvycNfiyrTJwVnY4pcS8EiR849+m8lB58qaYvp
	FaP8qnLWAdZBF/g5kYo1u3YYeKhaOeaiBvOx58po8wlB3Z/2ZreMiPUCM13GwRmQfjNV0a0/8Dl
	/Jm7MJ68zjeHsbWIxXXBYaoxERa0qA7kurxH+8av/glohdFcL0IRzmhbRwqyiNCoOeZQR2CN9ay
	hieRFdxhZJsv+tMBVFGYRXb9Ov9r95bHdgG+tK8LI/YQECou9GFaQ7pxeT/9hu8gyY3q73mQRNf
	R/FTUAmCJb/PC1l6uDi4T0FBKVVwrC1n909m9Ud2GkPFeV9PcfqR69ebPW6zg1LcMMCHEpdaaQr
	sE/bwMu95/RpUzu81eqPzussHJ+OzkLJNZjRY9FYr3d4j5FanlOicz9n1r0CDMow8fZL65ZsUeK
	f9x4cAWyJAzKWI4+EhtX8x2FfHyzqcfThikp1nvSm5ixqEC2vnUVhx3wTDdCvO1myR801HLwYim
	5HqCMms90fQ==
X-Received: by 2002:a53:da06:0:b0:679:b50e:9a with SMTP id 956f58d0204a3-67ba5114fb5mr6079051d50.108.1793661173861;
        Mon, 02 Nov 2026 15:12:53 -0800 (PST)
Received: from [192.168.1.110] (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf3303ebsm5946481d50.18.2026.11.02.15.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:12:53 -0800 (PST)
From: Andrew Halaney <andrew@amutable.com>
Date: Mon, 02 Nov 2026 17:12:36 -0600
Subject: [PATCH net-next 3/3] selftests/net: Add tests for
 SO_PASSCRED_THREAD
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-halaney-scm-creds-thread-v1-3-0b4d75dbf35f@amutable.com>
References: <20261102-halaney-scm-creds-thread-v1-0-0b4d75dbf35f@amutable.com>
In-Reply-To: <20261102-halaney-scm-creds-thread-v1-0-0b4d75dbf35f@amutable.com>
To: Kuniyuki Iwashima <kuniyu@google.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Christian Brauner <brauner@kernel.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>, 
 Willem de Bruijn <willemb@google.com>, Arnd Bergmann <arnd@arndb.de>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, 
 Andrew Halaney <andrew@amutable.com>
X-Mailer: b4 0.14.3

Add SO_PASSCRED_THREAD tests to the af_unix scm_pidfd selftests.

Signed-off-by: Andrew Halaney <andrew@amutable.com>
---
 tools/testing/selftests/net/af_unix/scm_pidfd.c | 160 +++++++++++++++++++++++-
 1 file changed, 156 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/net/af_unix/scm_pidfd.c b/tools/testing/selftests/net/af_unix/scm_pidfd.c
index 7524f3f6a8aa..75387ede1eeb 100644
--- a/tools/testing/selftests/net/af_unix/scm_pidfd.c
+++ b/tools/testing/selftests/net/af_unix/scm_pidfd.c
@@ -40,6 +40,14 @@
 #define SO_PEERPIDFD_THREAD 87
 #endif
 
+#ifndef SO_PASSCRED_THREAD
+#define SO_PASSCRED_THREAD 88
+#endif
+
+#ifndef SCM_CREDENTIALS_THREAD
+#define SCM_CREDENTIALS_THREAD 0x06
+#endif
+
 #define CHILD_EXIT_CODE_OK 123
 
 static void child_die()
@@ -689,6 +697,10 @@ struct pidfd_msg {
 	int thread_flags;
 	bool have_tgid;
 	bool have_thread;
+	struct ucred creds;
+	struct ucred thread_creds;
+	bool have_creds;
+	bool have_thread_creds;
 };
 
 static int get_pidfd_info(int pidfd, struct pidfd_info *info)
@@ -703,11 +715,12 @@ static int get_pidfd_info(int pidfd, struct pidfd_info *info)
 }
 
 /* One recvmsg(), reporting how many bytes came back and what the pidfd
- * cmsgs that came with them say.
+ * and credentials cmsgs that came with them say.
  */
 static int read_pidfd_msg(int fd, struct pidfd_msg *out)
 {
-	char control[CMSG_SPACE(sizeof(int)) * 2] = { 0 };
+	char control[CMSG_SPACE(sizeof(int)) * 2 +
+		     CMSG_SPACE(sizeof(struct ucred)) * 2] = { 0 };
 	int tgid_pidfd = -1, thread_pidfd = -1;
 	struct thread_ids buf[2] = { 0 };
 	struct msghdr msg = { 0 };
@@ -739,10 +752,18 @@ static int read_pidfd_msg(int fd, struct pidfd_msg *out)
 		if (cmsg->cmsg_level != SOL_SOCKET)
 			continue;
 
-		if (cmsg->cmsg_type == SCM_PIDFD)
+		if (cmsg->cmsg_type == SCM_PIDFD) {
 			memcpy(&tgid_pidfd, CMSG_DATA(cmsg), sizeof(tgid_pidfd));
-		else if (cmsg->cmsg_type == SCM_PIDFD_THREAD)
+		} else if (cmsg->cmsg_type == SCM_PIDFD_THREAD) {
 			memcpy(&thread_pidfd, CMSG_DATA(cmsg), sizeof(thread_pidfd));
+		} else if (cmsg->cmsg_type == SCM_CREDENTIALS) {
+			memcpy(&out->creds, CMSG_DATA(cmsg), sizeof(out->creds));
+			out->have_creds = true;
+		} else if (cmsg->cmsg_type == SCM_CREDENTIALS_THREAD) {
+			memcpy(&out->thread_creds, CMSG_DATA(cmsg),
+			       sizeof(out->thread_creds));
+			out->have_thread_creds = true;
+		}
 	}
 
 	out->have_tgid = tgid_pidfd >= 0;
@@ -769,6 +790,9 @@ static int read_pidfd_msg(int fd, struct pidfd_msg *out)
 static const int pass_tgid[] = { SO_PASSPIDFD, 0 };
 static const int pass_thread[] = { SO_PASSPIDFD_THREAD, 0 };
 static const int pass_both[] = { SO_PASSPIDFD, SO_PASSPIDFD_THREAD, 0 };
+static const int creds_tgid[] = { SO_PASSCRED, 0 };
+static const int creds_thread[] = { SO_PASSCRED_THREAD, 0 };
+static const int creds_both[] = { SO_PASSCRED, SO_PASSCRED_THREAD, 0 };
 
 static int set_opts(int fd, const int *opts)
 {
@@ -1061,6 +1085,134 @@ TEST(scm_pidfd_thread_creds)
 	EXPECT_EQ(msg.ids.pid, msg.thread_info.tgid);
 }
 
+TEST(scm_creds_thread_setsockopt_values)
+{
+	int sk[2];
+	int inet;
+
+	ASSERT_EQ(0, socketpair(AF_UNIX, SOCK_STREAM, 0, sk));
+
+	/* Verify that the options are truly set independently */
+	ASSERT_EQ(0, sockopt_set(sk[0], SO_PASSCRED_THREAD, 1));
+	ASSERT_EQ(1, sockopt_get(sk[0], SO_PASSCRED_THREAD));
+	ASSERT_EQ(0, sockopt_get(sk[0], SO_PASSCRED));
+
+	ASSERT_EQ(0, sockopt_set(sk[0], SO_PASSCRED, 1));
+	ASSERT_EQ(1, sockopt_get(sk[0], SO_PASSCRED));
+	ASSERT_EQ(1, sockopt_get(sk[0], SO_PASSCRED_THREAD));
+
+	/* Verify that the options are truly cleared independently */
+	ASSERT_EQ(0, sockopt_set(sk[0], SO_PASSCRED, 0));
+	ASSERT_EQ(0, sockopt_get(sk[0], SO_PASSCRED));
+	ASSERT_EQ(1, sockopt_get(sk[0], SO_PASSCRED_THREAD));
+
+	ASSERT_EQ(0, sockopt_set(sk[0], SO_PASSCRED_THREAD, 0));
+	ASSERT_EQ(0, sockopt_get(sk[0], SO_PASSCRED_THREAD));
+	ASSERT_EQ(0, sockopt_get(sk[0], SO_PASSCRED));
+
+	close(sk[0]);
+	close(sk[1]);
+
+	/* Only AF_UNIX records the sending thread */
+	inet = socket(AF_INET, SOCK_DGRAM, 0);
+	ASSERT_LE(0, inet);
+	EXPECT_EQ(-1, sockopt_set(inet, SO_PASSCRED_THREAD, 1));
+	EXPECT_EQ(EOPNOTSUPP, errno);
+	close(inet);
+}
+
+/* A receiver that only asked about the process cannot tell the two
+ * threads apart, so their writes are glued into one read.
+ */
+TEST(scm_creds_stream_glues_threads)
+{
+	struct pidfd_msg msg[1] = { 0 };
+
+	ASSERT_EQ(0, pidfd_flow(send_ids_thread, 2, creds_tgid, msg, 1));
+	EXPECT_EQ(sizeof(struct thread_ids) * 2, msg[0].len);
+
+	EXPECT_TRUE(msg[0].have_creds);
+	EXPECT_FALSE(msg[0].have_thread_creds);
+	EXPECT_EQ(msg[0].ids.pid, msg[0].creds.pid);
+}
+
+/* SO_PASSCRED_THREAD on its own is enough to split a stream per thread */
+TEST(scm_creds_thread_stream_splits_on_threads)
+{
+	struct pidfd_msg msg[2] = { 0 };
+	int i;
+
+	ASSERT_EQ(0, pidfd_flow(send_ids_thread, 2, creds_thread, msg, 2));
+
+	for (i = 0; i < 2; i++) {
+		EXPECT_EQ(sizeof(struct thread_ids), msg[i].len);
+		EXPECT_FALSE(msg[i].have_creds);
+		EXPECT_TRUE(msg[i].have_thread_creds);
+		EXPECT_NE(msg[i].ids.pid, msg[i].ids.tid);
+		EXPECT_EQ(msg[i].ids.tid, msg[i].thread_creds.pid);
+	}
+
+	/* Make sure we really got unique threads per message */
+	EXPECT_NE(msg[0].thread_creds.pid, msg[1].thread_creds.pid);
+}
+
+TEST(scm_creds_thread_leader_sender)
+{
+	struct pidfd_msg msg = { 0 };
+
+	ASSERT_EQ(getpid(), gettid());
+
+	ASSERT_EQ(0, leader_flow(creds_both, &msg));
+	ASSERT_TRUE(msg.have_creds);
+	ASSERT_TRUE(msg.have_thread_creds);
+
+	EXPECT_EQ(getpid(), msg.creds.pid);
+	EXPECT_EQ(getpid(), msg.thread_creds.pid);
+}
+
+TEST(scm_creds_thread_and_group)
+{
+	struct pidfd_msg msg = { 0 };
+
+	ASSERT_EQ(0, pidfd_flow(send_ids_thread, 1, creds_both, &msg, 1));
+	ASSERT_NE(msg.ids.pid, msg.ids.tid);
+	ASSERT_TRUE(msg.have_creds);
+	ASSERT_TRUE(msg.have_thread_creds);
+
+	EXPECT_EQ(msg.ids.pid, msg.creds.pid);
+	EXPECT_EQ(msg.ids.tid, msg.thread_creds.pid);
+	EXPECT_EQ(msg.creds.uid, msg.thread_creds.uid);
+	EXPECT_EQ(msg.creds.gid, msg.thread_creds.gid);
+}
+
+TEST(scm_creds_thread)
+{
+	struct pidfd_msg msg = { 0 };
+
+	ASSERT_EQ(0, pidfd_flow(send_ids_thread, 1, creds_thread, &msg, 1));
+	ASSERT_NE(msg.ids.pid, msg.ids.tid);
+	ASSERT_TRUE(msg.have_thread_creds);
+	EXPECT_FALSE(msg.have_creds);
+
+	EXPECT_EQ(msg.ids.tid, msg.thread_creds.pid);
+	EXPECT_EQ(getuid(), msg.thread_creds.uid);
+	EXPECT_EQ(getgid(), msg.thread_creds.gid);
+}
+
+/* A sender passing its own SCM_CREDENTIALS still reports the sending thread */
+TEST(scm_creds_thread_explicit_creds)
+{
+	struct pidfd_msg msg = { 0 };
+
+	ASSERT_EQ(0, pidfd_flow(send_ids_creds_thread, 1, creds_both, &msg, 1));
+	ASSERT_NE(msg.ids.pid, msg.ids.tid);
+	ASSERT_TRUE(msg.have_creds);
+	ASSERT_TRUE(msg.have_thread_creds);
+
+	EXPECT_EQ(msg.ids.pid, msg.creds.pid);
+	EXPECT_EQ(msg.ids.tid, msg.thread_creds.pid);
+}
+
 static void *peer_connect_thread(void *arg)
 {
 	struct sock_addr *sa = arg;

-- 
2.56.0

