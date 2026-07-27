Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E5E233947
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 04:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785127030; cv=none; b=aq0GFEx1zDe03AxojEQ2Zjgp1WkO1agsDiMvbgWejTXdNDOz+YUxGhsgm9HxY5r7Uh7t7EKzkPUni0+4R8jJwr/b18Yg7W0G0rG2pgLF0Bauuc6i2sqInr5Vp/MQFAHITdjpREWypLcpBBZaoQ3QF0LagiUx6w7oh0I+c54oCec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785127030; c=relaxed/simple;
	bh=8yIOk+X9NEuKWpbXjvD/OyYWvj985r7Yg8d93+e/D2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WHmDN0wEPHb+yqDtdzvv+/zrWA4MONhggEZ5fH40dqFCObNQnUvGHs4Bf8r/I5Y0QibP9gkTsk+xzcw3p0lZ+PQ74AGkQUISKKpJBY9HG4qb4ZHC/dqAT1cwNUyLCNhwPqaUqOaWrVa0+Ru+ds5wmW1/r5duSG1FyONoz9igLq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q22MZt9m; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q22MZt9m"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-848d21bbaffso2293143b3a.0
        for <linux-kselftest@vger.kernel.org>; Sun, 26 Jul 2026 21:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785127028; x=1785731828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5cVR5aPdVgFXqvQpKgHa2NEOrQFEwOzCtro749KqQxc=;
        b=Q22MZt9mIAvFlZOuYaoMXXJ5SlUfiNmCTxtRFW2OrrZ56U6eG2ycjUdSccF3FfaaaR
         CkZcVhFDIq/tYsrUgGhL8StCakVl7mus37pJ1X0yQ11R/uaKGFnnb3pTSIZIQaBVTb9j
         tCE5Czx7BwuomdwD2OtmnNpo1xDOvdd0nsiHtl3M+7oXR+pT92Rb3Lbw2rTOIpmXg8X6
         tPvdh7clICPb9FpiCG4UjApaCmngvBMNNPMzrcYILIXsqDxFDmL9PUwCnPoS9sP+juC9
         pdSxhNW3mzHOw4SddbN+qZuKIJHQGknqZ4ll774KLxqA/n+gIe6r3R92mExGNCx/Xs7Q
         D0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785127028; x=1785731828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5cVR5aPdVgFXqvQpKgHa2NEOrQFEwOzCtro749KqQxc=;
        b=MHYo6Z8xCNZOC0HvJSleSIEk4CXj+JELEr1ArWPIyFx1njRyKvYRtXDgc/ouhPXnWY
         PPGun4DdBewouQoASuXKPUUXjtHWPFMhET65DVM85e7TtY2iuD9Cq2RNkaNsZRUqnj9F
         w8RSEoIqEZyvDwYOOvzc6jtvq7prjnyl3z2ZdVW+LPX5isJcnHwvlZKUQPvn0cJpjUAb
         ghRJZqmT6k3kJ7cBsn+ZbYY5dHXKBEZhYWJwJuH3kEl0Rdh8iPMJs3yxJKUHdGHbVdME
         0NJH2uKi7ASeWk2slGYIuBNPItKJ7eeQkv0yW0bEt7JfEoZRCaLZutPlkZmU24LvqGc1
         ltVw==
X-Gm-Message-State: AOJu0YzWP80k5XIYcUuU1psyMsdRllFpxLAj538Swc+/4hlkK1pte8MQ
	cXhCseDYB+LyuHzbptTH4c5v+eJ0/jNAYgcmI/kKcMYQBqhEKuLVliKq
X-Gm-Gg: AR+sD13zMVROuftKXDFzE5Ip78IFVmRIQkZETSWSwiaOPsK3VgSZett/pJJsr+Sjr26
	j4R5UJ90VWs+srHl9+8vbKgYNerpm6SZh9w/NiOxIeJPUIrxlRDXEu21IfNLlODwwjQTSG4iYgw
	fi+AxIrlpvVPMzhpOBUHGT+CTjT6cGlsY2Lk9jWyqjUrvawnFyCsCWvt4xAp0mt67KiFmZt6HdC
	c2KIx2Y2j7fK+NSFBLGloiQ70WT+obtd85zeiKRdWza3Wr0Uc9R5CQFZ3iSe9yUDVzVegG7unhM
	V75ZwxfnJPASBx9o5KNG4am/132KDxzcvdP+Yrsn+OUz+WZXCp6hnJTixWcv8MGz4a8NH6csJAH
	/6Wov3UlrCB8wPGmEvwxfLinL4pHiKxDqFJsj3q7+MlHLYPvxLpterHu58GtqtLdE2xojjgHFgm
	hlOmo=
X-Received: by 2002:a05:6a20:c98d:b0:3bf:6f30:1ccd with SMTP id adf61e73a8af0-3c67e071b78mr6414267637.42.1785127028392;
        Sun, 26 Jul 2026 21:37:08 -0700 (PDT)
Received: from marceloPC ([2804:1b3:a8c2:99cf:6381:2414:ebe3:a179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc4164ddsm26249985eec.9.2026.07.26.21.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 21:37:07 -0700 (PDT)
From: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
X-Google-Original-From: Marcelo Mendes Spessoto Junior <marcelospe@proton.me>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	Marcelo Mendes Spessoto Junior <marcelospe@proton.me>
Subject: [PATCH net-next 2/4] selftests: net: test IPV6_FL_F_REMOTE
Date: Mon, 27 Jul 2026 01:25:08 -0300
Message-ID: <20260727043516.93101-3-marcelospe@proton.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727043516.93101-1-marcelospe@proton.me>
References: <20260727043516.93101-1-marcelospe@proton.me>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This flag retrieves the latest label received by the socket with
a getsockopt query. Therefore, the validation of this flag requires
a brief connection setup (source code for flow label shows it must
be TCP).

The simple TCP connection logic was wrapped inside two simple helpers,
because there are other uncovered features of flow label mgr that
could benefit from it (such as IPV6_FL_F_REFLECT).

Signed-off-by: Marcelo Mendes Spessoto Junior <marcelospe@proton.me>
---
 .../selftests/net/ipv6_flowlabel_mgr.c        | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/tools/testing/selftests/net/ipv6_flowlabel_mgr.c b/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
index cfa7e6270994..383a84ea9385 100644
--- a/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
+++ b/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
@@ -24,10 +24,20 @@
 #ifndef IPV6_FLOWLABEL_MGR
 #define IPV6_FLOWLABEL_MGR	32
 #endif
+#ifndef IPV6_FLOWINFO_SEND
+#define IPV6_FLOWINFO_SEND	33
+#endif
 
 /* from net/ipv6/ip6_flowlabel.c */
 #define FL_MIN_LINGER		6
 
+#define INIT_SIN6_LOOPBACK(name)					\
+	struct sockaddr_in6 name = {					\
+		.sin6_family	= AF_INET6,				\
+		.sin6_addr	= IN6ADDR_LOOPBACK_INIT,		\
+		.sin6_port	= htons(8888),				\
+	}
+
 #define explain(x)							\
 	do { if (cfg_verbose) fprintf(stderr, "       " x "\n"); } while (0)
 
@@ -82,6 +92,52 @@ static int flowlabel_renew(int fd, uint32_t label, uint16_t linger)
 	return setsockopt(fd, SOL_IPV6, IPV6_FLOWLABEL_MGR, &req, sizeof(req));
 }
 
+static int tcp_listen(void)
+{
+	INIT_SIN6_LOOPBACK(addr);
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
+	INIT_SIN6_LOOPBACK(addr);
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
+	*client = cfd;
+	*accepted = afd;
+}
+
 static void run_tests(int fd)
 {
 	int wstatus;
@@ -183,6 +239,21 @@ static void run_tests(int fd)
 		expect_fail(flowlabel_get(fd, 5, IPV6_FL_S_ANY, IPV6_FL_F_CREATE));
 	}
 
+	explain("Prepare TCP SYN for REMOTE flag validation");
+	int remote_listener = tcp_listen();
+	int remote_cfd, remote_afd;
+	tcp_connect(remote_listener, 6, &remote_cfd, &remote_afd);
+	struct in6_flowlabel_req freq = {
+		.flr_action = IPV6_FL_A_GET,
+		.flr_flags = IPV6_FL_F_REMOTE,
+	};
+	socklen_t freq_len = sizeof(freq);
+	explain("Query for label sent by client with IPV6_FL_F_REMOTE");
+	expect_pass(getsockopt(remote_afd, SOL_IPV6, IPV6_FLOWLABEL_MGR, &freq, &freq_len));
+	expect_pass(ntohl(freq.flr_label) != 6);
+	close(remote_afd);
+	close(remote_cfd);
+	close(remote_listener);
 }
 
 static void parse_opts(int argc, char **argv)
-- 
2.55.0

