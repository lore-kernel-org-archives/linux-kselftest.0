Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F01F3F4DD6
	for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2026 02:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785812382; cv=none; b=BhMGQPv30Z8IpHzWS8a7nHJmD0SDDQUM+A0LIdxyqXjwJ0I1FmF0BiozbqlT7mvPBMyhgrWBaTqvDBRIO/CRJv/0NuIm7aewKQx3BQ1GY7EB2W+6p0WP+CFtJuFU+FZArM+Kmk7uQ8nLRRr6BjuzppyI+3Zqmt62W3BD51BH+6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785812382; c=relaxed/simple;
	bh=H0UkMIe4CsIcpxmyZN1Ww99+u120SPTOqvKQ5GFRMAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G48MY2bhDu0V4rd3O9kBbrQ+cNepKhxra9dSTkyFMy8W10PE6pPjldbPp8ZMT3jZ5kyx6Mm/sPprKC0dxON+/SvkkmFz4EZLGqDV8jdaGkzG5kfD4Pz6BNniPqf2uLUOABfoiU4/v5dAdjDIbAS206TNGlVdTqRRRA4KIyxu7ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SLVNK0jc; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLVNK0jc"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8486ac3f347so511777b3a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 19:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785812381; x=1786417181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jmT/3flv0l5fERcYAXy6zGT7XeDtm3nxWHOeoNo8+6g=;
        b=SLVNK0jcCd9rz4z1O9bVlrwxWuIGHtT7Ov3Wia8WcOx7cah/lrc1t9r+jplPbJ5x91
         mp3DQW4EKBiWZX9ZUVw3DVnr/Pkvaw+wU2syXou1ul2+5qY/b6fj9hVAHWJD4VYYr9hx
         n8WVjRiask9+XzHyE4d9stsKEwbJ7Ye8jI+xEsE1fTWfxbCuDxyvNEswriY4n0WU3yLN
         gXUFF/JwWIklI1NqQHo8pszitiX5cC5KfnEaRZJ2+1QSOd1Cod3maTW7KG3yZrEaAX/k
         r5DDD0iBZiOJvrvH7+vxIMC0vEV9xGRwOfh1TBdHCgcKKU/A90Oo1uKMuLIJz9s0FCuz
         pS6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785812381; x=1786417181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jmT/3flv0l5fERcYAXy6zGT7XeDtm3nxWHOeoNo8+6g=;
        b=rYwXXdJluCFNEMZ5VVDv5K1S38PU6wM6UPe1X9HJu8JbXxNUlT/4wMXtsOm+3FYMQk
         Dhqhqf7FtILOmQzGdQwxhUA4kvfbkQ6L6bo3GtdaVHSIjgPJ+MI+0lS6eKx84icil71n
         O1O9h7BXBKPTdDBjMvEsQ3WG0t29zDFYUWY2bZgx2lbJ9i2nYCoty8oM1XiTWK48Kv5i
         5RCy2gZlqSo2eJ60RbgtgFB+TKuXXH7A8lQbWqFA+OMDF7vgQeHG337gyRuAnrFEGElr
         cIF+qvQ2URXsOALn6QHm6dbZGdEfbW2QV5RuRnthPzAC2cfCOBwWN+GIvcuWVxy2MPQk
         AL8g==
X-Forwarded-Encrypted: i=1; AHgh+RqNUIy8fRvbGSGjncOEoEwQlBWCyNsQB+WwKyL3QNsVkgKTwU37I/QHYl2GxyTPEU+aW16XU4qROdNX4M9CihY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHknH8QaXrAzKxEdF8i1xhkXY5VcrCIFkLOtz5409o+W8G3jPu
	nPlMmCWmJ/6AmCAd+aIU0l4QIfA1JET3+pCa8sks+cIVWmZCZVTCKzab
X-Gm-Gg: AR+sD11irsWcNDZl8s8xgGgo4b1/KiN9Xkj6wVOHpa+xbxSbnXyvdfcfy1qf4ACBzOG
	JHptAQyCJ0Lzt+J0q0BOrcbw99l4fB/7flryRH8hPuxmknB9hJnfW+12zIvJ7LGgLJLmw5Fe6Y7
	mOrMgA3yAUGH9yqz5rCyq5Vh8vvKDE06B6aUxPtL8pSLS1WGr98rdMkkUkmkwelZo/7/VUWZwJn
	sKxz9gLcrvjzrLX7VmRcix2lS1k30cNq9qAUK4Ay/4UpIRyBzJw/rFi2vw1meALPgPfZKAGfJ4M
	aplhAxMcnDYFduUVIgfdoNrqc6XU+hKwwTT5d4jE/Aarkrw2Y1/jle/vQqC4jbOzB6jon+wP646
	2ugY8+zvQ8lVtZgvxHmeTOEnIEwqoNDmfKlY/kgIV/XE8mVUdbJkgx1ewRveT+/DVZDa2AvEaIt
	nGGEp+D3Z+1uldmzDWPfJ79ez/pPsr1vMWEQdsEFOhRzcvp0xdYgeT88dp1qHD/rbeiQ==
X-Received: by 2002:a05:6a20:9e47:b0:3c0:b598:4983 with SMTP id adf61e73a8af0-3cb6ca54d23mr2124033637.30.1785812380841;
        Mon, 03 Aug 2026 19:59:40 -0700 (PDT)
Received: from fedora ([2804:1b3:a8c3:8ee5:1c39:64d9:e257:73dc])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab2530c0sm35974758c88.8.2026.08.03.19.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 19:59:40 -0700 (PDT)
From: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
Subject: [PATCH net-next v2 2/4] selftests: net: test IPV6_FL_F_REMOTE
Date: Mon,  3 Aug 2026 23:59:08 -0300
Message-ID: <20260804025910.50145-3-marcelomspessoto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260804025910.50145-1-marcelomspessoto@gmail.com>
References: <20260804025910.50145-1-marcelomspessoto@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This flag retrieves the flow label seen by the socket at connection
setup via a getsockopt query. Therefore, the validation of this flag
requires a brief connection setup (source code for flow label shows
it must be TCP).

The simple TCP connection logic was wrapped inside two simple helpers,
because there are other uncovered features of flow label mgr that
could benefit from it (such as IPV6_FL_F_REFLECT).

Signed-off-by: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
---
 .../selftests/net/ipv6_flowlabel_mgr.c        | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/tools/testing/selftests/net/ipv6_flowlabel_mgr.c b/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
index 01fab414895c..d482be2e9f9f 100644
--- a/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
+++ b/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
@@ -24,6 +24,9 @@
 #ifndef IPV6_FLOWLABEL_MGR
 #define IPV6_FLOWLABEL_MGR	32
 #endif
+#ifndef IPV6_FLOWINFO_SEND
+#define IPV6_FLOWINFO_SEND	33
+#endif
 
 /* from net/ipv6/ip6_flowlabel.c */
 #define FL_MIN_LINGER		6
@@ -95,6 +98,66 @@ static int flowlabel_renew(int fd, uint32_t label, uint16_t linger)
 	return setsockopt(fd, SOL_IPV6, IPV6_FLOWLABEL_MGR, &req, sizeof(req));
 }
 
+static struct sockaddr_in6 loopback_addr(void)
+{
+	struct sockaddr_in6 addr = {
+		.sin6_family	= AF_INET6,
+		.sin6_addr	= IN6ADDR_LOOPBACK_INIT,
+		.sin6_port	= htons(8888),
+	};
+
+	return addr;
+}
+
+static int tcp_listen(void)
+{
+	struct sockaddr_in6 addr = loopback_addr();
+	const int one = 1;
+	int fd;
+
+	fd = socket(PF_INET6, SOCK_STREAM, 0);
+	if (fd == -1)
+		error(1, errno, "socket listener");
+	if (setsockopt(fd, SOL_SOCKET, SO_REUSEADDR, &one, sizeof(one)))
+		error(1, errno, "setsockopt SO_REUSEADDR");
+	if (bind(fd, (void *)&addr, sizeof(addr)))
+		error(1, errno, "bind");
+	if (listen(fd, 1))
+		error(1, errno, "listen");
+
+	return fd;
+}
+
+static void tcp_connect(int listener, uint32_t flowlabel, int *client, int *accepted)
+{
+	struct sockaddr_in6 addr = loopback_addr();
+	const int one = 1;
+	int cfd, afd;
+
+	cfd = socket(PF_INET6, SOCK_STREAM, 0);
+	if (cfd == -1)
+		error(1, errno, "socket client");
+
+	if (flowlabel_get(cfd, flowlabel, IPV6_FL_S_EXCL, IPV6_FL_F_CREATE))
+		error(1, errno, "flowlabel_get");
+	if (setsockopt(cfd, SOL_IPV6, IPV6_FLOWINFO_SEND, &one, sizeof(one)))
+		error(1, errno, "setsockopt flowinfo_send");
+	addr.sin6_flowinfo = htonl(flowlabel);
+
+	if (connect(cfd, (void *)&addr, sizeof(addr)))
+		error(1, errno, "connect");
+
+	afd = accept(listener, NULL, NULL);
+	if (afd == -1)
+		error(1, errno, "accept");
+
+	if (flowlabel_put(cfd, flowlabel))
+		error(1, errno, "flowlabel_put");
+
+	*client = cfd;
+	*accepted = afd;
+}
+
 static void run_tests(int fd)
 {
 	int wstatus;
@@ -204,6 +267,27 @@ static void run_tests(int fd)
 		expect_fail_errno(flowlabel_get(fd, 6, IPV6_FL_S_ANY, IPV6_FL_F_CREATE), EPERM);
 	}
 
+	{
+		struct in6_flowlabel_req freq = {
+			.flr_action = IPV6_FL_A_GET,
+			.flr_flags = IPV6_FL_F_REMOTE,
+		};
+		socklen_t freq_len = sizeof(freq);
+		int remote_listener = tcp_listen();
+		int remote_cfd, remote_afd;
+
+		explain("Prepare TCP SYN for REMOTE flag validation");
+		tcp_connect(remote_listener, 7, &remote_cfd, &remote_afd);
+
+		explain("Query for label sent by client with IPV6_FL_F_REMOTE");
+		expect_pass(getsockopt(remote_afd, SOL_IPV6, IPV6_FLOWLABEL_MGR, &freq, &freq_len));
+		if (ntohl(freq.flr_label) != 7)
+			error(1, 0, "unexpected remote flowlabel %u", ntohl(freq.flr_label));
+
+		close(remote_afd);
+		close(remote_cfd);
+		close(remote_listener);
+	}
 }
 
 static void parse_opts(int argc, char **argv)
-- 
2.55.0

