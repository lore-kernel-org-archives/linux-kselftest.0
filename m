Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67B446D092
	for <linux-kselftest@vger.kernel.org>; Fri,  7 Aug 2026 22:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786140612; cv=none; b=DF+CT5DQQACt7JZsBgunMkJWALvWwrAHZPTQ2N9T7nLhKEXiBBkCg0/4JHXCg19r4s3A/ZsqOYniDXcsFlEdYwKbipdCpErRKmy9x09BxYe0yAmFIz0nGUPEGFXciG52SCLO7fvcDLcHDUD3mafOrs8r6oBU7h/HRID3lNfc/is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786140612; c=relaxed/simple;
	bh=RRCXOWIG7wQhsKY6MWJcWH1ko4HQP18F7eGyDZKZ3Yg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p3aBU0oBCMzwxa1c2NBFKjBvkvLKMooOcfe9er/Fsx2BhBrFSjSrXJEjHEPU/1deN21SrKqtFWqWBt/haMclqeopoyv0A03KDIFXgy+czq9MD4Ceftr+f0M0xr29kc34dBqz58Wpax8MioTM52UevdiAiZC/v4D3mX8CY17ZTCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fvzuz4Cc; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fvzuz4Cc"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ceab75934dso943245ad.2
        for <linux-kselftest@vger.kernel.org>; Fri, 07 Aug 2026 15:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786140610; x=1786745410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eE6hvbuq5iFYO3P8zMcP762X8R9vSoVUqqxZJnu8QhQ=;
        b=Fvzuz4CcrUyf5sMX3FKYg9wpSuPskQsGjO9/j1j4N1kNV5Q/6cuqg7PK7iV/5Agm0S
         Bne+IXb9gjzISZrrezC7AiqF3cLCWDQHzmqGrrBtVvjHjxOnTxy3hKuAhB9yMEK+1/QB
         ELeFmeijBXD8QIoo96S1c6wAKLV+oJjcnjTtjLsCK5pdelzW/YOm5G6GqKE4e9h5vIzx
         BJ98MdHCPMw0L8XeNfdlKJDXaeIEdTBr8MfC7d6WznP253hEV2UHlGjMsMX1B+b4oHv8
         LtEZvPu8PlqyzsKNIef9i27sB/ZQnEPj4m/Aa5iRk6lEwckN/DQO8QaVmnOTRHTgX2uB
         LYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786140610; x=1786745410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eE6hvbuq5iFYO3P8zMcP762X8R9vSoVUqqxZJnu8QhQ=;
        b=ejNKo6U9EfkayxEygeYcz5YaFY5rdJLSzcKbrsvrQiUj1+vg92rXsSAtrnP3vQqR4L
         Zf8TyTRTnXQqPwROnAQm9JEW9Ja/u9z2PuRw+e7me+VRjFG7IpmTdNjUqoy2SrBRjaN2
         R5wkC7j7nIqdmbg5P/HadpnpJUko/2o852XR43/8bFHMZQJuQTTDasMpqsJYBGQubZ8C
         fwnib9Y9C9vQv7GMyvixzNArkuo9EUVKKa9LEbTLek1TyaUVyTjmSRK8sCFG/mQm2B+S
         JrLQUGhj0ws/lSqQsH7Ar29+CNOttCKghKXYAtS5NvQd73cIUFrc/TMLHdqgLjrmY/GR
         EgNw==
X-Forwarded-Encrypted: i=1; AHgh+RqM/UKux0GeVpRDmGCwhqIBM163/a2905KR3hjOmvRLvJTCbl9mOsORF/VOee2OGWQjenoZ69DgTyRZpiincXE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFxPkpeejlVsmD5bxsFtiCp4VMMskqR+qzWV2ijj9PruCTyg06
	PdHmdemRxuIS8TzHw6S1UKSw7RtanckW674CTUGn+OBNXprlZY5MDHXN
X-Gm-Gg: AR+sD11L/Z9h3q00QeSZbtU0PmCkknrWreckaHSYStycx2Fu1h3dccMzPaZimEj+Wt5
	DoXH+poOZBby5S6scSKZ1G8TfuxcjZm/iOY4WFidO2Efj/6DCE4+Oho3a14MDOiJ1OtrF7K0W0A
	56CVkR68lVsmWgwLERcqqX6I4hwX23UeF4xWTSsaAdPeT2F8QUk8eCFrmjmmDrT6/VNmQgQh5Fz
	rVU9bk0bdcYNl2QcW4HINF31pt7clPz7nN3gLcepImULhbbHNQWahVyM8gF2IGHD7FcwDDAR/w4
	F07ryILIEzaXIIv6a5jg/jR81OIkLUQZs7+myQZUyLtmvEZKNNN4bjmtaDz3Sr9zDHror3qRbvT
	vkTO6dznNCV5WBIYJ0vOLPbhBPVIa+94bc6V20UnBy7so6ZUxyvfE6ChGcLq6REj2s59XoCFWf0
	GCfSqyubjo3Mmd2Z+1iDk4VYvcwx6vDyc0VQ7bgFviU8qAfNQo7Cb06GjEKNI7ihQWCg==
X-Received: by 2002:a17:90b:1d8d:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-3903c56c2eamr23722431a91.9.1786140609850;
        Fri, 07 Aug 2026 15:10:09 -0700 (PDT)
Received: from fedora ([2804:1b3:a8c3:8ee5:1c39:64d9:e257:73dc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be568bd3sm11182762eec.0.2026.08.07.15.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 15:10:09 -0700 (PDT)
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
Subject: [PATCH net-next v3 4/5] selftests: net: test IPV6_FL_F_REFLECT
Date: Fri,  7 Aug 2026 19:09:41 -0300
Message-ID: <20260807220942.421382-5-marcelomspessoto@gmail.com>
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

According to the source code, flowlabel_consistency must be
deactivated for the IPV6_FL_F_REFLECT flag to work. Since
ipv6_flowlabel_mgr now runs in its own network namespace, do this
directly from the test binary. Attempt to disable
net.ipv6.flowlabel_consistency and skip the reflect test if that
fails. A disabled flowlabel_consistency does not affect the remaining
features being tested on the file, and failing to disable is not fatal
and skips the reflect test only.

The previously defined tcp_listen and tcp_connect helpers were reused,
since the connection flow required for REFLECT validation is very
similar to REMOTE.

Signed-off-by: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
---
 .../selftests/net/ipv6_flowlabel_mgr.c        | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/tools/testing/selftests/net/ipv6_flowlabel_mgr.c b/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
index f8d8b09b9d86..d32150abd8ff 100644
--- a/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
+++ b/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
@@ -6,6 +6,7 @@
 #include <arpa/inet.h>
 #include <error.h>
 #include <errno.h>
+#include <fcntl.h>
 #include <limits.h>
 #include <linux/in6.h>
 #include <net/if.h>
@@ -168,6 +169,23 @@ static void tcp_connect(int listener, uint32_t flowlabel,
 	*accepted = afd;
 }
 
+static bool disable_flowlabel_consistency(void)
+{
+	int fd;
+
+	fd = open("/proc/sys/net/ipv6/flowlabel_consistency", O_WRONLY);
+	if (fd == -1)
+		return false;
+
+	if (write(fd, "0", 1) != 1) {
+		close(fd);
+		return false;
+	}
+	close(fd);
+
+	return true;
+}
+
 static void run_tests(int fd)
 {
 	int wstatus;
@@ -307,6 +325,54 @@ static void run_tests(int fd)
 		close(remote_cfd);
 		close(remote_listener);
 	}
+
+	if (!disable_flowlabel_consistency()) {
+		fprintf(stderr,
+			"[INFO] skip REFLECT: cannot disable net.ipv6.flowlabel_consistency\n");
+	} else {
+		struct in6_flowlabel_req reflect_query = {
+			.flr_action = IPV6_FL_A_GET,
+		};
+		struct in6_flowlabel_req reflect_off = {
+			.flr_action = IPV6_FL_A_PUT,
+			.flr_flags = IPV6_FL_F_REFLECT,
+		};
+		struct in6_flowlabel_req reflect_on = {
+			.flr_action = IPV6_FL_A_GET,
+			.flr_flags = IPV6_FL_F_REFLECT,
+		};
+		socklen_t reflect_query_len = sizeof(reflect_query);
+		int reflect_listener = tcp_listen();
+		int reflect_cfd, reflect_afd;
+
+		explain("Enable REFLECT on listener before client connects");
+		expect_pass(setsockopt(reflect_listener, SOL_IPV6,
+				       IPV6_FLOWLABEL_MGR, &reflect_on,
+				       sizeof(reflect_on)));
+
+		tcp_connect(reflect_listener, 8, &reflect_cfd, &reflect_afd);
+
+		explain("accepted socket's label should be reflected");
+		expect_pass(getsockopt(reflect_afd, SOL_IPV6,
+				       IPV6_FLOWLABEL_MGR, &reflect_query,
+				       &reflect_query_len));
+		if (ntohl(reflect_query.flr_label) != 8)
+			error(1, 0, "unexpected reflected flowlabel %u",
+			      ntohl(reflect_query.flr_label));
+
+		explain("PUT+REFLECT disables reflection on accepted socket");
+		expect_pass(setsockopt(reflect_afd, SOL_IPV6,
+				       IPV6_FLOWLABEL_MGR, &reflect_off,
+				       sizeof(reflect_off)));
+		explain("cannot disable reflection twice");
+		expect_fail(setsockopt(reflect_afd, SOL_IPV6,
+				       IPV6_FLOWLABEL_MGR, &reflect_off,
+				       sizeof(reflect_off)));
+
+		close(reflect_afd);
+		close(reflect_cfd);
+		close(reflect_listener);
+	}
 }
 
 static void setup(void)
-- 
2.55.0

