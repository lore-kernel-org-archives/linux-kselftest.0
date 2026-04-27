Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820DA3EBF3C
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 18:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777314680; cv=none; b=Sah0+xS9elp4uaTX1GNNlX/cjaH1yudhIx00K7Yl/L24UAECvea7RJdRisuwFDl3xzeIOZQsQgyNTlufe6xlsD7LzAircIC9yn5WSCnqXnBQp6XWN9Ut9qu6R87mr+KmLq33HKNGBa2tdtrZ3YKzuvnoSw1TwxsmC7d3OQV/M8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777314680; c=relaxed/simple;
	bh=zwVAcfIrB5gkKSQrtegRJbhzNles6rOGTmiKmx6GRWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kVcF5UOhMXSHxbPTwd78yyDYVvJDt1feM9QQ3XKBVQhHWytDISaXqlYHiGkHjzkyU0RdlObSjwpXEuAdHFZgQbkL7JGnPG/7aXcet6kC/qwXRRr44xNq+hG4+TU4FmDmxsun6dGUkQh0BIA3lSVUUMZLj2rbqDZc+WyBl5JgpcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gk+EouAU; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gk+EouAU"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488ad135063so96660275e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 11:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777314676; x=1777919476; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/rb04HihRpFGGRez1OC1FkeRKyhSIjAaQFdeNYoGCmo=;
        b=gk+EouAUkmmw6ejIs0bZcaMtTLrPEmsQehq9QLSbxtM27d7LIJaV+wfCNYUNbUKaGd
         GSFFs541NbeJAjFQPdy89FbeXkQtECA3vEIzc5pc38qLkROsNg/yeCfhNhaSBMCGHWiI
         wPW++9UJWXSAwzGyx2E9kslvvPWAFVA3G02SG4vt7uKpVZCl0R48EtJeFpVu/YyNmZWw
         j31oOODSHrD3v70jNKvAOHmq6F59spTD3l0txUIboQc0uanTZg1AXWrPb7C+QdTg9Lti
         4CcUP8wJnE7wfbnfGLZTc2DHieeWQRJDc+2AxwUvC+7p0dvY3+lxPOli8vF/VmWsQteU
         6/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777314676; x=1777919476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/rb04HihRpFGGRez1OC1FkeRKyhSIjAaQFdeNYoGCmo=;
        b=gM+VUyIoKRM8ZtC/ZrFsLZ8lB5Iv6hDy8Ee/ipTP31DqMCMGI7t2tECTv2+W/dn4HG
         eCGI2pDyW4f5WOoJpdLIS66FQyHn/IsvcigsK+Lj5+uWQ4uazWysZdwbHCOXGXyF26wv
         HjnW/2goO9BhJTaOwc/gdrOXdTwHWfBA+8lKXcL6nisYIW4KQJX2rNLe38rNISZgyelY
         XGlBTU65kqI/O4qsYGq/VHa2yY97gQDeGbtW3DSYhsSsT91r0p3C3H+MqthwJCuQmz8o
         mkCLUD8P2UftQ41etWPGLbvtF8uX8KWzx0QuMCcxGZbFLGiheKgu/Wlq67OA6Pwf5Jat
         uJmg==
X-Forwarded-Encrypted: i=1; AFNElJ/CCNIi9JggPRnKz3VBSV9y4IaPe0diASx4m2bjuOFl9YYZojVJnW+yfu5vn9cmwRoriWv4NujGsYyDUR8D0QI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwC+6GMcqZfq7+i1gacm/uqCtWAH4CQTIWBOQePuE/PWuM7Eynl
	6WrajplxHdpSwgXyXO4PgD2q+l/SGgr3spTK+DAnKXbtQGphD9+iEZ7CMNqS9TyLSYc=
X-Gm-Gg: AeBDiescdQHFFSmS3i1upq3qvdCQ8eYNRJrLYSvBO3Xzy5aT41sYrfdAS93w4LSANkN
	G9mU693/OWHMjOx3B+NEEuPHg+vBxXkBdprTqEZ/QM+nV7tIuVuh6VEN8rV4wMCN30rjRT5vS7y
	B+rR3YPDYurma96yKzUsIuVwJJ8mKcHw6WtcYEtluu/xs7YrFzt0l6+vKpiMRvRFomZx3HT2LdZ
	rKAaoeFFuNYnrAbqgVjKYVsWRdSgioaoYE5qtfiv6dN3AET8TrqAl/LFWLTH5+I5/s+PSVgVm2Y
	lJyYtbC3tX4j9CJiyJZAzfQZnhvm0m3G+RAAe1tvMkKfFQAFtoCAv0OZc7YqhvmmVOolX+RhX/3
	XZw47KE4B04fDPvLHc4cXurkOq6cLxxpaxtHey3nLaKvi2lk+oWC5Gvt39y3AnDm5R03/yGKbQG
	W8bBXLGauTTZoFwM010riYvAlzKJPDXXdgDA==
X-Received: by 2002:a05:600c:8588:b0:48a:5821:5ffc with SMTP id 5b1f17b1804b1-48a76f4d4eamr5060945e9.2.1777314675876;
        Mon, 27 Apr 2026 11:31:15 -0700 (PDT)
Received: from [127.0.0.1] ([2804:1bc4:224:7800:585c:db3a:fcb:e21f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7749cabdsm1182065e9.9.2026.04.27.11.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 11:31:15 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Mon, 27 Apr 2026 15:30:59 -0300
Subject: [PATCH v3 3/6] selftests: livepatch: Introduce does_sysfs_exist
 function
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-lp-tests-old-fixes-v3-3-ccf3c90f744c@suse.com>
References: <20260427-lp-tests-old-fixes-v3-0-ccf3c90f744c@suse.com>
In-Reply-To: <20260427-lp-tests-old-fixes-v3-0-ccf3c90f744c@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777314662; l=1087;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=zwVAcfIrB5gkKSQrtegRJbhzNles6rOGTmiKmx6GRWQ=;
 b=uwrNh3NOvNhP4CUH8KIrYnpyJhIr9yii3s+MOQSBeKBBfupCiNw+N5m+vDWSe3YLLzJ+5M8Pm
 YTUyXceBvuxCNGEsjLumSvbgeg9+B00KoUFrWE4V1EPy9JJVtaQDWPs
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

Returns true if the livepatch sysfs attribute exists, and false otherwise.
This new function will be used in the next patches.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 tools/testing/selftests/livepatch/functions.sh | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/testing/selftests/livepatch/functions.sh b/tools/testing/selftests/livepatch/functions.sh
index 8ec0cb64ad94..2bc50271729c 100644
--- a/tools/testing/selftests/livepatch/functions.sh
+++ b/tools/testing/selftests/livepatch/functions.sh
@@ -339,6 +339,16 @@ function check_result {
 	fi
 }
 
+# does_sysfs_exist(modname, attr) - check sysfs attribute existence
+#	modname - livepatch module creating the sysfs interface
+#	attr - attribute name to be checked
+function does_sysfs_exist() {
+	local mod="$1"; shift
+	local attr="$1"; shift
+
+	[[ -f "$SYSFS_KLP_DIR/$mod/$attr" ]]
+}
+
 # check_sysfs_rights(modname, rel_path, expected_rights) - check sysfs
 # path permissions
 #	modname - livepatch module creating the sysfs interface

-- 
2.54.0

