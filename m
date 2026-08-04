Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4420030D3F0
	for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2026 02:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785812378; cv=none; b=CEGst4tlhRzvTwtplROWCtiV8YeH+a59atuLKDtQiN0AYCaIfCDTJpUiGtqaXOKVsgdOVb3jiLcV9d4Ii0w+34IgGRWUN6/l/TMHxZX3all8vw0tmJ/usfD8CeQHZULTx1kM/KBOW7l8xhcURYUMEcblEVVGeLX27arvBHYkheE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785812378; c=relaxed/simple;
	bh=kGHg5dJxMvflgLmIQwKaqqixfYXyjBoPcjsJhN7I9ys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uK7ZP4pJKHbXipL2gihQzx3dL3tkeqGPKWlm/WpdAy+AsCBBPJz0FTBwA5TD8H8eu7gymjoiJQeaUKQtO9ibWHC45dthCcSXfZi7bftpqA312lLQEgFQgffHdqnkppGcbTJ5EQzumx896ENvnmLAuHosxiJ57b1PpwUnjEARUnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DyXTQkr/; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DyXTQkr/"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-848761b5897so2750361b3a.3
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 19:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785812376; x=1786417176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QkQ333WBrChtciSILIhBH7Fyg9DmGWGZdjGTMAJJv4M=;
        b=DyXTQkr/8xC0usDA55oPDLTk+SbM0KXdIyo0Eh10qwsLOBND6x5lWiY9cxhgdMKVw7
         bkLsjl5QlK/xDVaBUKqiwU2u9d/dhK7mmpmtrIc7UGSsr1IuCsg0N/5T+ama6OOPMXkZ
         Xjy8UI2YHKQZ6iRqE1imkBnk38aHKV7c5kskoTVyUleAgBy67WNw8TX4ZON4Gv6OiXkd
         xWL7di0sFDMRJYNaNOxRJc5rQCWRr+rapGONzwxvMOWv0nzUd25TcV6wRbYe0qzmdBVs
         aKE4VxrcKq7f250754maIlAgtHvpo1J7v20Z13DRA9we1YoTo1tuCM91r+cA4iZda7V1
         w+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785812376; x=1786417176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QkQ333WBrChtciSILIhBH7Fyg9DmGWGZdjGTMAJJv4M=;
        b=MDRHIdCD3tDuytEgyElPjjMRg+bnG1F6aJJV5YMYtqnlYeC2IzJSqvMll2/qZACwxF
         8qIpzei7FXLZGGY/9Ax82tfG5Wf8SZzN29kEQZVKEMvQtuORnvrG+NLj0Fdoun/rY7h/
         xt4me1cCtvv9L5zIbakZ7uk7ZY26HM57MMKJGH6Nl5ZIlHxWA6nR7uYnatWcZsKfE71/
         a4VFJQ0JpGwqux2TrYoIzERuv4YV6KcJkCqYiDeBw8JU2yrpJg5D5EI/yNnnPLKgL5Ql
         H1G3B6IJ5kdnkCjWghwV/vCwLv3rKdfZc6f7RRHcXKBtRZ9fcpqUQhRfQxZMK+RFiVyZ
         3rng==
X-Forwarded-Encrypted: i=1; AHgh+RqlrlDspRJX0X2l/VuQxrdd8xXOIKO0kzJEtn/dx5E2hE/uCQw/HL7bRP/G0BMW6C1IfRfxPV9cOsFJrt+Nvm4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6LLmHR3UoeUiM+b8RXWnZIU29Ky+VvdZS2wE884MR533q6cW+
	SJR3t/LD8RHE0a3m5jVmpioh+tM4v/RqrFWYSv2v+OdeP3A/soVzXKPj
X-Gm-Gg: AR+sD13Er7x1yxz+KzxyD8OCHW2iZWPLISVCR5lqlRj62oKFn/UDQ+frTGRZjFIP/mK
	+EaHWbrKWJ8Szntb1CNFvpuiG7K6C1nD66NsF8fZfTKVp+heCIJwpd9dDKyNTCW88DyaHE953pi
	Vlz/Z3tQfePyLHcqqlBVxbmHwsQR+lr05llUBj+66n9ptLfO73GJBXNz2MMbOnZ2D6inqxtiGwE
	JWjOThXnQIa/eRM7v8p+W9VI8m+emCruvITlyikmaPSHxPGWk97E3WWwaFA307edoQ4/k9AmDy7
	dG1qLZxhzNC0QbzI2w44BKPsUh/6FefQlKWvHRhiHtpLutiiTHp9BG0bKZvtWeN/0lp1bOOYkkL
	j1dhawkGE9xs38QdZYmgoSfysPAJ1dEWtUfPLJOWM8jVmPjidmwe4X1PZXyJ8q0ls8iZ6KaPSr5
	TS7xsPX8TsmpmQa7olaViZzgJ3N259l50LbBHyp3Ug0Sx/VUhBOZsg52WWx7vigGbzPQ==
X-Received: by 2002:a05:6a21:9206:b0:3c0:9c18:d5a6 with SMTP id adf61e73a8af0-3c92a8cc15bmr12885686637.67.1785812376564;
        Mon, 03 Aug 2026 19:59:36 -0700 (PDT)
Received: from fedora ([2804:1b3:a8c3:8ee5:1c39:64d9:e257:73dc])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab2530c0sm35974758c88.8.2026.08.03.19.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 19:59:36 -0700 (PDT)
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
Subject: [PATCH net-next v2 1/4] selftests: net: test IPV6_FL_A_RENEW
Date: Mon,  3 Aug 2026 23:59:07 -0300
Message-ID: <20260804025910.50145-2-marcelomspessoto@gmail.com>
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

RENEW was the only flow label action without selftests coverage.

Assert renew returns no error on correct usage and fails for labels
that do not exist.

Based on the previously implemented EXCL share test, that demonstrates
that a new flow label with same label can be created after the linger
period, use renew to show that the flow label can last longer and
block a new flow label creation after the previous linger time. This
test, however, demands sleep during execution, and should be placed as
a conditional test under the -l option.

The addition of expect_fail_errno helper is necessary to assert the
corresponding error when a function can fail on multiple ways.

Signed-off-by: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
---
 .../selftests/net/ipv6_flowlabel_mgr.c        | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tools/testing/selftests/net/ipv6_flowlabel_mgr.c b/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
index af95b48acea9..01fab414895c 100644
--- a/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
+++ b/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
@@ -27,6 +27,7 @@
 
 /* from net/ipv6/ip6_flowlabel.c */
 #define FL_MIN_LINGER		6
+#define FL_MAX_LINGER	150
 
 #define explain(x)							\
 	do { if (cfg_verbose) fprintf(stderr, "       " x "\n"); } while (0)
@@ -42,6 +43,18 @@
 #define expect_pass(x)	__expect(x)
 #define expect_fail(x)	__expect(!(x))
 
+#define expect_fail_errno(x, e)						\
+	do {								\
+		int __exp = (e);					\
+		int __ret = (x);					\
+		int __err = errno;					\
+		if (__ret && __err == __exp)				\
+			fprintf(stderr, "[OK]   " #x "\n");		\
+		else							\
+			error(1, 0, "[ERR]  " #x " (line %d): expected errno %d, got %d", \
+			      __LINE__, __exp, __err);			\
+	} while (0)
+
 static bool cfg_long_running;
 static bool cfg_verbose;
 
@@ -71,6 +84,17 @@ static int flowlabel_put(int fd, uint32_t label)
 	return setsockopt(fd, SOL_IPV6, IPV6_FLOWLABEL_MGR, &req, sizeof(req));
 }
 
+static int flowlabel_renew(int fd, uint32_t label, uint16_t linger)
+{
+	struct in6_flowlabel_req req = {
+		.flr_action = IPV6_FL_A_RENEW,
+		.flr_label = htonl(label),
+		.flr_linger = linger,
+	};
+
+	return setsockopt(fd, SOL_IPV6, IPV6_FLOWLABEL_MGR, &req, sizeof(req));
+}
+
 static void run_tests(int fd)
 {
 	int wstatus;
@@ -160,6 +184,26 @@ static void run_tests(int fd)
 		error(1, errno, "wait");
 	if (!WIFEXITED(wstatus) || WEXITSTATUS(wstatus) != 0)
 		error(1, errno, "wait: unexpected child result");
+
+	explain("It is not possible to renew a label that does not exist");
+	expect_fail_errno(flowlabel_renew(fd, 5, 2 * (FL_MIN_LINGER * 2 + 1)), ESRCH);
+
+	explain("Create a label for basic renew validation");
+	expect_pass(flowlabel_get(fd, 5, IPV6_FL_S_EXCL, IPV6_FL_F_CREATE));
+	explain("Check if renew does not return errors for existing and valid label");
+	expect_pass(flowlabel_renew(fd, 5, 2 * (FL_MIN_LINGER * 2 + 1)));
+
+	if (cfg_long_running) {
+		explain("create a new label with FL_MIN_LINGER linger time");
+		expect_pass(flowlabel_get(fd, 6, IPV6_FL_S_EXCL, IPV6_FL_F_CREATE));
+		explain("renew the label to increase its linger time and put it");
+		expect_pass(flowlabel_renew(fd, 6, 2 * (FL_MIN_LINGER * 2 + 1)));
+		expect_pass(flowlabel_put(fd, 6));
+		sleep(FL_MIN_LINGER * 2 + 1);
+		explain("The label cannot be created because the new linger time is not over yet");
+		expect_fail_errno(flowlabel_get(fd, 6, IPV6_FL_S_ANY, IPV6_FL_F_CREATE), EPERM);
+	}
+
 }
 
 static void parse_opts(int argc, char **argv)
-- 
2.55.0

