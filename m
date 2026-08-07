Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B0A463B77
	for <linux-kselftest@vger.kernel.org>; Fri,  7 Aug 2026 22:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786140606; cv=none; b=XkEwmlO0/JVN5Y8bVhiYFWsBXTeonfBDxBoyktB97B839wnkTFop5ZZCSe47SGUI/8GndUM+KgqqCrRSmxlZfMyaM+vyRtGQpAdg6UI8vgrA17uQkgBkUMJPuO6W5DP2sTZYUEc4dlt/s++2PPXEt347WYw7GMdohFQdM9KOJYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786140606; c=relaxed/simple;
	bh=HgtG2lJaDXD2Ez34y3RSHzeEVJH+VzPy71sbxtDt4GE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PNga34JGEhes/nhWOjAA88aRZctpbHretC5e2EXMA63RUQ3G19btpy0hMv16PeUNAbGIj380qBNgR395LgTwswftozZUFP7JLxb3jAK2YTNaDH/Op8TYe6mUnlgPLdMrrjtVcYyXH1wEATYVH92mdr2karYEhNHuwI8ycAIaPPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ETj5mQmy; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ETj5mQmy"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ced3386430so733005ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 07 Aug 2026 15:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786140603; x=1786745403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XE0UzVUXwsGoJ/wVoGB07+IWtuFU1IC6Kjeaw1YnJIU=;
        b=ETj5mQmygvBNvtapE4Iq86SAnuTSFr27de/vM2vm9oVbpDg421vXR+t0oQV1CD7ZKq
         wQmrE4+qPYQ8TQl1/7vteEyYM97SYLndzAyYTs5X5AjvNa2hKc0+LbzpiVx6jnOXWYvo
         Zd7E4NZsVrRSg6RuTA0t9xf3Bm9qYcEETAhfGuhn2u5f1rRu8VHVtGd8hlIzZMD0MJrG
         Q1vUrcg9mVBeSrzhdFC1TAlFxBSqI+D7lWRfTqQgYpRksrTMK8YYgV6+aMnbFfUzNmdf
         UHPVFvsa1L0c0cQ69ydFpkAy7Rc/+rF4QB1oBOHXjQxwwlBzdqVjIJj6BJEDwOpVOGEZ
         g4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786140603; x=1786745403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XE0UzVUXwsGoJ/wVoGB07+IWtuFU1IC6Kjeaw1YnJIU=;
        b=mmdDANn8b7lTAkXPLG03pVZcQD0qy54oG9wrGChnpHeN52AIASIfPysr5vXLMjJ2+N
         MCgxhqzE+u1PUAZpNLlopwygcghmuTgSTt9J/1igstgy0zGp1YxdYm7Ihyk8qMGsEPdf
         pW2kNsr/WETp+Y7rMblqeQl47ICBmpHUc5xAPiuiOIsNJRgQsaQVgsGGbAniMj7Ai3MS
         j523t3goR9ahYCBLJ3h74FDCGekqQkv5TIZ7Brwp8giULIKms7tD1KunWgQK32HPqLWI
         q5qExMHu4pA7mxPdBl9+KDCVWS/p2CmbKBgqsF3pKM+MpzlFcwlKXva5J7bQKPH5/FPy
         RmYQ==
X-Forwarded-Encrypted: i=1; AHgh+RpexwjF3Ws6JHX4tWhVpKuZ+9Li9lumJqfNDS++IpSQDlYdBmaaVsE6bjHar9aQ7FXZ+Rlp+l6NjvpllHYVmw4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywku1wR2w8BM5P4E5UuX9JDeVItm3wfZZqfMSvgGHjwylLhyhwq
	ys3sMfxhRt8RP+dLyaPKIfg3WNy5XYxneNcZZoAhTOrdPI3FiozW7imF
X-Gm-Gg: AR+sD12gZGZD3QfxnAsbXSnM1n3CFC/3fNt40ZK3N86ZyUYIdjiGJt9S/erpckvAorl
	UJqjMXB3180pjRsBQvNFubVwUMPidavvGF4Fkg6hzujuKxxOTa/5/7U4Fd8tu8GyPXaZTUoAiwc
	fyKEP/GiGct/UIZ1rQFimkE3b1vgCp2ap75JhGnOCvlCjuMyUBrfQLJQX33+HX9TgbQlJ+Ft2Vf
	AVHzeXqVCreGYaGM8wcdwfTlma/hqmyjLQW0cRZZlBPA/Vjjru8prHeM/XKPIEuYFpT2oKtsiVI
	MTLeqJF8vjd8fKPszLIfQDFidjbrPoi0DMW/X6fRfhbTMCp4A6oW/hk/SAHN6Am254D1AkBoe/p
	GkZG+CtvaZIolDed0JPiAWY7L5UHi0uWhP4fLaynyf4mIBYyUpzUgBimrqUjQlVR/588dndQzvR
	zJTKxzvkuFtLwYpwaWyLCunQV+E7/8liLTaTONpfy65LJelRHEn7JMjnSLEsSwMkCcjw==
X-Received: by 2002:a05:6a20:728c:b0:3c0:b4f8:bbfb with SMTP id adf61e73a8af0-3cbc03b5531mr7505750637.22.1786140603049;
        Fri, 07 Aug 2026 15:10:03 -0700 (PDT)
Received: from fedora ([2804:1b3:a8c3:8ee5:1c39:64d9:e257:73dc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be568bd3sm11182762eec.0.2026.08.07.15.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 15:10:02 -0700 (PDT)
From: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
Subject: [PATCH net-next v3 2/5] selftests: net: test IPV6_FL_F_REMOTE
Date: Fri,  7 Aug 2026 19:09:39 -0300
Message-ID: <20260807220942.421382-3-marcelomspessoto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807220942.421382-1-marcelomspessoto@gmail.com>
References: <20260807220942.421382-1-marcelomspessoto@gmail.com>
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
 .../selftests/net/ipv6_flowlabel_mgr.c        | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/tools/testing/selftests/net/ipv6_flowlabel_mgr.c b/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
index ec187890a1ed..51541e792257 100644
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
@@ -101,6 +104,67 @@ static int flowlabel_renew(int fd, uint32_t label, uint8_t share,
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
+static void tcp_connect(int listener, uint32_t flowlabel,
+			int *client, int *accepted)
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
@@ -216,6 +280,30 @@ static void run_tests(int fd)
 						IPV6_FL_F_CREATE),
 				  EPERM);
 	}
+
+	{
+		struct in6_flowlabel_req freq = {
+			.flr_action = IPV6_FL_A_GET,
+			.flr_flags = IPV6_FL_F_REMOTE,
+		};
+		int remote_listener = tcp_listen();
+		socklen_t freq_len = sizeof(freq);
+		int remote_cfd, remote_afd;
+
+		explain("Prepare TCP SYN for REMOTE flag validation");
+		tcp_connect(remote_listener, 7, &remote_cfd, &remote_afd);
+
+		explain("Query for label sent by client with IPV6_FL_F_REMOTE");
+		expect_pass(getsockopt(remote_afd, SOL_IPV6, IPV6_FLOWLABEL_MGR,
+				       &freq, &freq_len));
+		if (ntohl(freq.flr_label) != 7)
+			error(1, 0, "unexpected remote flowlabel %u",
+			      ntohl(freq.flr_label));
+
+		close(remote_afd);
+		close(remote_cfd);
+		close(remote_listener);
+	}
 }
 
 static void parse_opts(int argc, char **argv)
-- 
2.55.0

