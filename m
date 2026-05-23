Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BA8345731
	for <linux-kselftest@vger.kernel.org>; Sat, 23 May 2026 07:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779520514; cv=none; b=XA9sUsFicvT6kgN5j/bU5yU2JITs0ywGar2fyiLMJstz5sHtPr9yyybTGLa0m8K/eWm4EtKb9OlnY1pd6atB91SF6XwxZFXPHrPKS+BhuImwobILQkd8twZj5qThjwfFsGllgEqgVAXPdSMYGGeMS7j4f2C/boqM8HWbJ+Hv+14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779520514; c=relaxed/simple;
	bh=ifMjdOv9s5iBVhpB9m4hzA/NaIvmwyfWNqe78zgQbz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N+Y+iTyyNtheK1VbBG/kBx3q9K+IOYldt5/DZNAgN8iSUK0QdNGaj7aawUAXrFXCHuNVEuRJPB+RB2jxDCb9c7jBorpEMwJayR3TgqL9LqC3XTEuaA1lbu6t/x2jswh6ERYkTXV2yvBlIzq3Zi7L1jOyENTs9gj8UhDYTk/s22Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qZUgjL3i; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qZUgjL3i"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49050ff7cbdso3195305e9.2
        for <linux-kselftest@vger.kernel.org>; Sat, 23 May 2026 00:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779520507; x=1780125307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x+DQN3gI8cDIPCl5342KuGjmmS7ZUCk1xMik8PQu+to=;
        b=qZUgjL3iv//xwuJlIrY389JLxW3S6fZBEJgpnFbI35vm+BN4NMXNWVQk1zap98s4F8
         E0Mh9Vm2ddKzFl4ZtWTjaYVWJ2y4kNXgZSXks7VznjJoRAbHux5b5yMkLZ5JXn12gLL7
         AvzWg02SKE/AUZZPn+AepYaTPIBDjVGibYJQRpDXJvIUHXcA5rrS6z7ipP4/nCv8vgWJ
         a6gPgvH+CM1Q4nPqFwnvQCEQBGrRIaH1znz3DX8zC0hbXy2obrFr7pstshsDhnA3ebiu
         aYXiKsNFpWqpHAcKFMtyz603HObbilaLSm4hyVOYadJx6atfSVkon8XI8bt1n5FYqR5s
         PTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779520507; x=1780125307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x+DQN3gI8cDIPCl5342KuGjmmS7ZUCk1xMik8PQu+to=;
        b=c+a3IczaqmGnMLUrakaxh6mVGciiqRfS1O/aBGJFExfWVVPVMaj1JUmz6/7DXtBX5V
         VGjiASCLt29M7UDvDJrqBL0fEFL0hw+Q0HAfnS3xl2Oiw6Zdxg5/gafad+tlAHQUWyxn
         o/4STvKOM7Gt/oC0ZmAaCTnhzwMAuqu//ELgxc3VCxA7OSA09xceBZPzpfLBbr+D3LEY
         X0TFQM3QZswHVL4LvX73qvaX5bwOMMsVsRzJbv3qd2LjlKNKmD9gXTFrNuNeqj0RB2TJ
         sv+n1JjEKQJIxuKHKlBmfuJIM5JBjy6N0zlZ58aS/GVsJZBrLesZ3bGoiS7ppef4gag6
         f6vA==
X-Forwarded-Encrypted: i=1; AFNElJ+XoI3aE5045VsQVk50cMxkXsIZPy6mPT9nPIH9VHe5tU2ZDfxL2Otrd9qKM9HL5dGT2IkctaZsaUgOm6OtxV8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwObZSc5p/EWa7+OwzhTJqD/JTCXHtuMbSvaHzfA/HORHVV2IqC
	8lQLuypXiFczKW46AqQ5OS6zDWNjlGWEJRa5Y/ibqi0K/gc4emV3rcHh
X-Gm-Gg: Acq92OFdjqQJQPESXvRA9hdS62Io7ErKfyysNInKkC4GrSiLr1R0JQVZnqq+c/+6ksJ
	tZsO1erCWVaHLxgIckllAhPi+Ok5G+yqxGla1EhwX3XbrtlWrSLbswzW0Mmgq4jClQ0A8uVsHUm
	i1X8PyJm7lqxBb1UYHYUMBDJH8P2w9NCnYbVckGcKT2UgcDDTOiLL1ODHozs8RI4E0hOJhavBUA
	PV4ko5rSDy+8vtNTagD823wW2kpKjLGIyw3ZcfxmbWp2n+DW/zGX1FN8A54o643LTJ3qpLqdcF3
	FKxObwVTHYXpwQXjqCGoAtfpOe1+eXti3z5ZwI4aOg8l8i5nq8E+dSqe83/Qhi8/zdAp5ElKXZq
	h6grW0yuU80cxWS/lN0u/9CzVgxVE/YCkJ/nSTee0nmhV5tgkOw+sr7/KX0u8ZhlCtIS4YptlmB
	GyqAH7ECOpdb3BqJcxcYxWqmVYj5Tt
X-Received: by 2002:a05:600c:a402:b0:488:a882:c7 with SMTP id 5b1f17b1804b1-490426ddc0fmr71710015e9.25.1779520506947;
        Sat, 23 May 2026 00:15:06 -0700 (PDT)
Received: from [192.168.0.174] ([31.96.183.250])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45eb6d5cb76sm8639838f8f.25.2026.05.23.00.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 00:15:05 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Sat, 23 May 2026 01:14:42 -0600
Subject: [PATCH v2 09/24] dyndbg: add stub macro for
 DECLARE_DYNDBG_CLASSMAP
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-dd-maint-2-v2-9-b937312aa083@gmail.com>
References: <20260523-dd-maint-2-v2-0-b937312aa083@gmail.com>
In-Reply-To: <20260523-dd-maint-2-v2-0-b937312aa083@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Jason Baron <jbaron@akamai.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779520485; l=3163;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=ifMjdOv9s5iBVhpB9m4hzA/NaIvmwyfWNqe78zgQbz8=;
 b=LeMzd2IbaJ/MfJTQ8bBott6YzzK/865ef38iQIRe1CPdRfS1+ivfNf7LDpy3XOiDG+YorXBjg
 f4f4T/LpU6FCIfIwOpBiTzv+K7o8iQSsvt2GsNwVVpUWk1TbcwvciNF
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

Add the stub macro for !DYNAMIC_DEBUG builds, after moving the
original macro-defn down under the big ifdef.  Do it now so future
changes have a cleaner starting point.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 43 ++++++++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 05743900a116..a10adac8e8f0 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -93,27 +93,6 @@ struct ddebug_class_map {
 	enum class_map_type map_type;
 };
 
-/**
- * DECLARE_DYNDBG_CLASSMAP - declare classnames known by a module
- * @_var:   a struct ddebug_class_map, passed to module_param_cb
- * @_type:  enum class_map_type, chooses bits/verbose, numeric/symbolic
- * @_base:  offset of 1st class-name. splits .class_id space
- * @classes: class-names used to control class'd prdbgs
- */
-#define DECLARE_DYNDBG_CLASSMAP(_var, _maptype, _base, ...)		\
-	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
-	static struct ddebug_class_map __aligned(8) __used		\
-		__section("__dyndbg_classes") _var = {			\
-		.mod = THIS_MODULE,					\
-		.mod_name = KBUILD_MODNAME,				\
-		.base = _base,						\
-		.map_type = _maptype,					\
-		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
-		.class_names = _var##_classnames,			\
-	}
-#define NUM_TYPE_ARGS(eltype, ...)				\
-        (sizeof((eltype[]){__VA_ARGS__}) / sizeof(eltype))
-
 /* encapsulate linker provided built-in (or module) dyndbg data */
 struct _ddebug_info {
 	struct _ddebug *descs;
@@ -138,6 +117,27 @@ struct ddebug_class_param {
 #if defined(CONFIG_DYNAMIC_DEBUG) || \
 	(defined(CONFIG_DYNAMIC_DEBUG_CORE) && defined(DYNAMIC_DEBUG_MODULE))
 
+/**
+ * DECLARE_DYNDBG_CLASSMAP - declare classnames known by a module
+ * @_var:   a struct ddebug_class_map, passed to module_param_cb
+ * @_type:  enum class_map_type, chooses bits/verbose, numeric/symbolic
+ * @_base:  offset of 1st class-name. splits .class_id space
+ * @classes: class-names used to control class'd prdbgs
+ */
+#define DECLARE_DYNDBG_CLASSMAP(_var, _maptype, _base, ...)		\
+	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
+	static struct ddebug_class_map __aligned(8) __used		\
+		__section("__dyndbg_classes") _var = {			\
+		.mod = THIS_MODULE,					\
+		.mod_name = KBUILD_MODNAME,				\
+		.base = _base,						\
+		.map_type = _maptype,					\
+		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
+		.class_names = _var##_classnames,			\
+	}
+#define NUM_TYPE_ARGS(eltype, ...)				\
+	(sizeof((eltype[]) {__VA_ARGS__}) / sizeof(eltype))
+
 extern __printf(2, 3)
 void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...);
 
@@ -314,6 +314,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 
 #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)
 #define DYNAMIC_DEBUG_BRANCH(descriptor) false
+#define DECLARE_DYNDBG_CLASSMAP(...)
 
 #define dynamic_pr_debug(fmt, ...)					\
 	no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)

-- 
2.54.0

