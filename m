Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9569045C6FA
	for <linux-kselftest@vger.kernel.org>; Fri,  7 Aug 2026 22:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786140602; cv=none; b=flWE+iL899jje33fhxU83vxgz8s8TV/LGh9Ymm8tgfRyR9kmxdxViOEPlHi8Shm46RURAytVJ7nbkvgsO+8Dd2SM08x/gWuWH3/ikYSbVxEkiBGZ8E4yQ0qx8yHGoQTo+QirE/cPSyh4EVA0C+1bzgsvl0zAkuQ39NLk/nxwL4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786140602; c=relaxed/simple;
	bh=V5PT+zcfv5kwBc3zsPLyOemrZEyr7x51j1JNaZhSLI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iEjXzJInQbh3vp8B7tQSI5V6mR70ZSDaPPYTQlTgYbY1lPV9TOSmyQEv6/enZHTGILK6j4puAbEwPmA+pZ+DtrRDorpT47XapKOmcxidwalF11SXQWD7zOZLqlJp4UE1Jme4HxQaawM0fcksNfCoJ1Kumgpan/fP45DRxdLnnNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXAqTPzL; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXAqTPzL"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cc891373e0so700595ad.2
        for <linux-kselftest@vger.kernel.org>; Fri, 07 Aug 2026 15:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786140600; x=1786745400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kZPO0FvOtEF8M9IFK2RY794kxXwOWSbOPIOTROMX56g=;
        b=VXAqTPzLDm4AnEFgYVxXKRuKSfYMxynzNJh5wMFTiE6JGFb9gYBebrPBoVsQRmnBtN
         Ls1LF0g2MSeM29/x3uSw7OVmtXcYvNxtBJ4wpNPYvjBJC7Ze5NJk5bmI0tpN4iHln2yM
         zPKSz7vnlSvd5gV05lKcQ1UoPsZuvGM2TfKLFRDk8wsuXR6oSMJYS/tQKYfqZG+IHzMX
         rBFx0+g2FovHppZS7RPTQ6Ewp60TxQ8B4zC119e5s/KNnS9loU/nxYHg/GxXfVgXVH12
         7+I35LPx3u7NthrcwR/Tg1lcubbL/mHmpsD5weCBXNV6Zo4vqiPLEagv4eOvcocrvOTO
         QzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786140600; x=1786745400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kZPO0FvOtEF8M9IFK2RY794kxXwOWSbOPIOTROMX56g=;
        b=ePkLv9u1jJdDYOZZjW9mAI9GQR1JfvEvaYx4br9ka7O+87et0Wnmih9KoekZq3F127
         EVYQREhpjYs7Kk5U3oFldnTkJXbKVJ0/mDFjSt0p0fZf3N67BkviTHkRMv3NkUaiWAgI
         T2bsxbNchtH2HKFRVnFol4jblK58s0fu6cFLYhmiyj5UCW6X87+Af9GMyRhguWO7QyBy
         1iU/wNJM5iWQGFyVzX/VH/5wsHqYEU81qvOMsRSf0F9RoMcW4hzfNDWu4hauh5wl8m00
         fR9ROOcq2V/Zq9LcDCml76oXjE7jEQCdJFCz9y8fn6RNQ/4S4OwCUp38H+3SbboDNYq2
         FP/Q==
X-Forwarded-Encrypted: i=1; AHgh+RqMFCQiYngHeU0ig5/IHpwQhdQTX5bSEb+ZVQJSrrzimlplxwTGuaR13Q+ySujR/W3wXAo9x6Ra38vTYlqsmKY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkOeE5r/nUOgR9MydlKRGtU5R3DICPdtRVxPGX7HAOweCXbyUS
	jTliSR9XEtsrN7/bTALb9atzaWgG5/vaNzUEyTmUk7erPl39mCGyIpLhmf8HyMWc
X-Gm-Gg: AR+sD12j9xd9DVLMwYBQG76RCLQjWsPP37bBwBFxuq6IHBYWNcqpBZxEIh/MmLzcZLI
	MQjx8U/AUXkUOuJwyi9Ezzz7GUypbuHeQsFg+QRF9QLVovIhJvl2uo6Z/Dp9aMGkrCbCA7UNbly
	nkKPHBNJgPCzJN5Pk3BheABqJvJahfh1aL/YYrfZJF0mXFxp/GVlJOELAzCms5clfQ7GiUAvylE
	9/2yrPmXNdVPoefcVcrDsv3aUGRVBJ/6jW6a9Tu1z3ZchThVjXRmneJYHs00+67N2qBctKQJD1E
	oFDLEQaJzbTmgxjkwrEpu/zQgFVT3IhS4IEaB7aRk0eEY8oEoFHikZvPEqwDl9b2NJqckkHeKRz
	VDTLyXqo1cGfMuDDFfds8+N3wwRvfapMB+wI7YuyEiU+Ag1Kpy78kAT+1O8n16E71GdYtNIaHqQ
	wIdSszGgKY7kg/BUimxFRtoh0MSp00ZSdAXjPwTVMhScCd53jjbbnsNIbyvQqmxK3F5g==
X-Received: by 2002:a05:6a21:3390:b0:3c3:93ce:663 with SMTP id adf61e73a8af0-3cb85f4a26emr28784462637.26.1786140599730;
        Fri, 07 Aug 2026 15:09:59 -0700 (PDT)
Received: from fedora ([2804:1b3:a8c3:8ee5:1c39:64d9:e257:73dc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be568bd3sm11182762eec.0.2026.08.07.15.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 15:09:59 -0700 (PDT)
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
Subject: [PATCH net-next v3 1/5] selftests: net: test IPV6_FL_A_RENEW
Date: Fri,  7 Aug 2026 19:09:38 -0300
Message-ID: <20260807220942.421382-2-marcelomspessoto@gmail.com>
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

RENEW was the only flow label action without selftests coverage.

Assert renew returns no error on correct usage and fails for labels
that do not exist.

This test is based on the previously implemented EXCL share test,
which demonstrates that a new flow label with the same value can be
created after the linger period. Renew is used here to show that a
flow label can last longer and block a new flow label creation after
the previous linger time. This test, however, demands sleep during
execution, and should be placed as a conditional test under the -l
option.

The addition of the expect_fail_errno helper is necessary to assert
the corresponding error when a function can fail in multiple ways.

Signed-off-by: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
---
 .../selftests/net/ipv6_flowlabel_mgr.c        | 58 ++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/ipv6_flowlabel_mgr.c b/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
index af95b48acea9..ec187890a1ed 100644
--- a/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
+++ b/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
@@ -42,6 +42,23 @@
 #define expect_pass(x)	__expect(x)
 #define expect_fail(x)	__expect(!(x))
 
+#define expect_fail_errno(x, e)						\
+	do {								\
+		int __exp = (e);					\
+		int __ret = (x);					\
+		int __err = errno;					\
+		if (__ret && __err == __exp)				\
+			fprintf(stderr, "[OK]   " #x "\n");		\
+		else if (!__ret)					\
+			error(1, 0, "[ERR]  " #x			\
+			      " (line %d): unexpectedly succeeded",	\
+			      __LINE__);				\
+		else							\
+			error(1, 0, "[ERR]  " #x			\
+			      " (line %d): expected errno %d, got %d",	\
+			      __LINE__, __exp, __err);			\
+	} while (0)
+
 static bool cfg_long_running;
 static bool cfg_verbose;
 
@@ -71,6 +88,19 @@ static int flowlabel_put(int fd, uint32_t label)
 	return setsockopt(fd, SOL_IPV6, IPV6_FLOWLABEL_MGR, &req, sizeof(req));
 }
 
+static int flowlabel_renew(int fd, uint32_t label, uint8_t share,
+			   uint16_t linger)
+{
+	struct in6_flowlabel_req req = {
+		.flr_action = IPV6_FL_A_RENEW,
+		.flr_label = htonl(label),
+		.flr_share = share,
+		.flr_linger = linger,
+	};
+
+	return setsockopt(fd, SOL_IPV6, IPV6_FLOWLABEL_MGR, &req, sizeof(req));
+}
+
 static void run_tests(int fd)
 {
 	int wstatus;
@@ -94,7 +124,7 @@ static void run_tests(int fd)
 	expect_pass(flowlabel_get(fd, 1, IPV6_FL_S_ANY, IPV6_FL_F_CREATE));
 	explain("cannot get it again with the exclusive (FL_FL_EXCL) flag");
 	expect_fail(flowlabel_get(fd, 1, IPV6_FL_S_ANY,
-					 IPV6_FL_F_CREATE | IPV6_FL_F_EXCL));
+				  IPV6_FL_F_CREATE | IPV6_FL_F_EXCL));
 	explain("can now put exactly three references");
 	expect_pass(flowlabel_put(fd, 1));
 	expect_pass(flowlabel_put(fd, 1));
@@ -160,6 +190,32 @@ static void run_tests(int fd)
 		error(1, errno, "wait");
 	if (!WIFEXITED(wstatus) || WEXITSTATUS(wstatus) != 0)
 		error(1, errno, "wait: unexpected child result");
+
+	explain("It is not possible to renew a label that does not exist");
+	expect_fail_errno(flowlabel_renew(fd, 5, IPV6_FL_S_EXCL,
+					  2 * (FL_MIN_LINGER * 2 + 1)),
+			  ESRCH);
+
+	explain("Create a label for basic renew validation");
+	expect_pass(flowlabel_get(fd, 5, IPV6_FL_S_EXCL, IPV6_FL_F_CREATE));
+	explain("renew does not error for an existing, valid label");
+	expect_pass(flowlabel_renew(fd, 5, IPV6_FL_S_EXCL,
+				    2 * (FL_MIN_LINGER * 2 + 1)));
+
+	if (cfg_long_running) {
+		explain("create a new label with FL_MIN_LINGER linger time");
+		expect_pass(flowlabel_get(fd, 6, IPV6_FL_S_EXCL,
+					  IPV6_FL_F_CREATE));
+		explain("renew the label to extend linger, then put it");
+		expect_pass(flowlabel_renew(fd, 6, IPV6_FL_S_EXCL,
+					    2 * (FL_MIN_LINGER * 2 + 1)));
+		expect_pass(flowlabel_put(fd, 6));
+		sleep(FL_MIN_LINGER * 2 + 1);
+		explain("cannot create: new linger time not over yet");
+		expect_fail_errno(flowlabel_get(fd, 6, IPV6_FL_S_ANY,
+						IPV6_FL_F_CREATE),
+				  EPERM);
+	}
 }
 
 static void parse_opts(int argc, char **argv)
-- 
2.55.0

