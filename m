Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D8C37F8D7
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 20:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778530338; cv=none; b=kJ+4t8/M2KURPnP7rmoQ24CrY7Mt/wfSvGeNunHwdibW8BnygmWPH90cbBTXjVb1mOhN6BOS5KE7ZYAtpotxhSGAd18EFPF5MsPJ1ufrqbxjlIh3OJKb5jFPpTmGw768W1FP1zNJYIRine5ibKZGXHfmsYO1ZnlTkx6yqpgypOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778530338; c=relaxed/simple;
	bh=LosrAfSQxPVTows0XSpMtnUfobK50ocOZjr+K95JoDw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nDnHU3lFLU5T99BOvOKZLoFeiKPW4lGFaY913NJdjp06goWmJHje85Fh4dQhXJf2optWHUp+c0CVnkdeyTEryLy00ZgO9XVjguIKxqnZLKjvruuqlhEH6G8nIn+vxmoCEWRq2CAH0NovWzPDpFqYxkhTF3X3GSbsN606elPePQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jKYmkClf; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jKYmkClf"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-366344513a3so8537285a91.3
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 13:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778530337; x=1779135137; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6W1DGO62TtNbBO2D5FHY4ip+Jsk22YoIIigyNl95Iuk=;
        b=jKYmkClfkELQQdtoojtMi7t9aGwdawOHymKABNWAC0U62iuKtzb1GCPvjkp0/ciARx
         RrKo6n0Qyae+IWVJLOI+d8DJ7LzhXfdPd76Xwh7y/n8K5uWVATCnRSui2XoPghd1CvqF
         FpP9BVLeG4513IHG8Z+PC9caRnvgLp7i9sNPcRnelrJFSBtWvfufTlqThmIOO43mV4Hg
         cXaG4HVAGQhdKHRQMdfp9EzxeckMouxQP4jrTAl/jhdTw0+opAlaj/mAXZMOKJVbypST
         JnIvB+UFwpbZQOtB8cjA24+KMIsuBKckacajYCrMmx6VWG6+g+vWOounsMDa3qu++G3e
         2M6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778530337; x=1779135137;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6W1DGO62TtNbBO2D5FHY4ip+Jsk22YoIIigyNl95Iuk=;
        b=BdF8byThzRVKOdVHa83U5J9Wd+gUElQobuUa3m+8tUTKU3B/3vaH9ivGi0/fGkjH2B
         afTSH07iUd5RmEyREk1WkvY4fA7h185F0Pct7dwI30oO1ytocyXp4l0WLqjg68ukWKkk
         9rjLj/9/Rm26kg3tgFeYojGJAd3JthwkgsjYipvqqmvV4LuBmdPm83viPJfa1PCPB1bD
         fqu7xZftRrKsJFu6lOmdIkyH2UDdvCaLwOQGXLXuLVViNlYClPfL5d7ARudaU0mUDbEQ
         byaxRYmGDnALD5EjI1JOkgGU0nqXqIpM8MtR5kVIKHlTtzZuTKRi6eWG9qIrOaFrCYTj
         DzGg==
X-Forwarded-Encrypted: i=1; AFNElJ/uMDj5tJpTzUFg77ZZzQ3NABlCFp4buRGnKBhUF6wJgzAe2mH+EDWrSD6NELuKcyejzCUizGHdkp4rBe7+oec=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHykOtSHjTxQpkEADhzCjzCk6e23qRuSYCBRsDq4G1VgjQAxJu
	r2eSFK3AxjoZQdHFWRgHZjhJpUqzWoSBrQTML9tx6yeMyEP2IogjsYP6lQ3be/d+gh5iva4vk9Y
	y4GXKJn1DVg==
X-Received: from pjbsb13.prod.google.com ([2002:a17:90b:50cd:b0:368:a71f:a24a])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:17ce:b0:35e:3e86:e2d1
 with SMTP id 98e67ed59e1d1-367d46b8151mr11314907a91.7.1778530336737; Mon, 11
 May 2026 13:12:16 -0700 (PDT)
Date: Mon, 11 May 2026 13:11:55 -0700
In-Reply-To: <20260511201155.1488670-1-vipinsh@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260511201155.1488670-1-vipinsh@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260511201155.1488670-3-vipinsh@google.com>
Subject: [PATCH 2/2] selftests/liveupdate: Add helpers to preserve/retrieve FDs
From: Vipin Sharma <vipinsh@google.com>
To: pasha.tatashin@soleen.com, rppt@kernel.org, pratyush@kernel.org
Cc: shuah@kernel.org, dmatlack@google.com, skhawaja@google.com, 
	tarunsahu@google.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"

Add helper functions to preserve and retrieve file descriptors from an
LUO session. This allows library users to work with FD preservation.

No functional change intended.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
Co-developed-by: David Matlack <dmatlack@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 .../liveupdate/lib/include/libliveupdate.h    |  3 ++
 .../selftests/liveupdate/lib/liveupdate.c     | 41 +++++++++++++++----
 2 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
index 4390a2737930..2b04b3256382 100644
--- a/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
+++ b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
@@ -26,6 +26,9 @@ int luo_create_session(int luo_fd, const char *name);
 int luo_retrieve_session(int luo_fd, const char *name);
 int luo_session_finish(int session_fd);
 
+int luo_session_preserve_fd(int session_fd, int fd, __u64 token);
+int luo_session_retrieve_fd(int session_fd, __u64 token);
+
 int create_and_preserve_memfd(int session_fd, int token, const char *data);
 int restore_and_verify_memfd(int session_fd, int token, const char *expected_data);
 
diff --git a/tools/testing/selftests/liveupdate/lib/liveupdate.c b/tools/testing/selftests/liveupdate/lib/liveupdate.c
index 60121873f685..7bc6707d8bb7 100644
--- a/tools/testing/selftests/liveupdate/lib/liveupdate.c
+++ b/tools/testing/selftests/liveupdate/lib/liveupdate.c
@@ -54,9 +54,35 @@ int luo_retrieve_session(int luo_fd, const char *name)
 	return arg.fd;
 }
 
+int luo_session_preserve_fd(int session_fd, int fd, __u64 token)
+{
+	struct liveupdate_session_preserve_fd arg = {
+		.size = sizeof(arg),
+		.fd = fd,
+		.token = token,
+	};
+
+	if (ioctl(session_fd, LIVEUPDATE_SESSION_PRESERVE_FD, &arg) < 0)
+		return -errno;
+
+	return 0;
+}
+
+int luo_session_retrieve_fd(int session_fd, __u64 token)
+{
+	struct liveupdate_session_retrieve_fd arg = {
+		.size = sizeof(arg),
+		.token = token,
+	};
+
+	if (ioctl(session_fd, LIVEUPDATE_SESSION_RETRIEVE_FD, &arg) < 0)
+		return -errno;
+
+	return arg.fd;
+}
+
 int create_and_preserve_memfd(int session_fd, int token, const char *data)
 {
-	struct liveupdate_session_preserve_fd arg = { .size = sizeof(arg) };
 	long page_size = sysconf(_SC_PAGE_SIZE);
 	void *map = MAP_FAILED;
 	int mfd = -1, ret = -1;
@@ -75,9 +101,8 @@ int create_and_preserve_memfd(int session_fd, int token, const char *data)
 	snprintf(map, page_size, "%s", data);
 	munmap(map, page_size);
 
-	arg.fd = mfd;
-	arg.token = token;
-	if (ioctl(session_fd, LIVEUPDATE_SESSION_PRESERVE_FD, &arg) < 0)
+	ret = luo_session_preserve_fd(session_fd, mfd, token);
+	if (ret)
 		goto out;
 
 	ret = 0;
@@ -92,15 +117,13 @@ int create_and_preserve_memfd(int session_fd, int token, const char *data)
 int restore_and_verify_memfd(int session_fd, int token,
 			     const char *expected_data)
 {
-	struct liveupdate_session_retrieve_fd arg = { .size = sizeof(arg) };
 	long page_size = sysconf(_SC_PAGE_SIZE);
 	void *map = MAP_FAILED;
 	int mfd = -1, ret = -1;
 
-	arg.token = token;
-	if (ioctl(session_fd, LIVEUPDATE_SESSION_RETRIEVE_FD, &arg) < 0)
-		return -errno;
-	mfd = arg.fd;
+	mfd = luo_session_retrieve_fd(session_fd, token);
+	if (mfd < 0)
+		return mfd;
 
 	map = mmap(NULL, page_size, PROT_READ, MAP_SHARED, mfd, 0);
 	if (map == MAP_FAILED)
-- 
2.54.0.563.g4f69b47b94-goog

