Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248953E714B
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 18:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774031372; cv=none; b=insJAwsj7qOrHNTtKHIu0XvrF0NYb7wI73jzJDWhulqqeHMXUjCR4K7aU83ltzXaA5os5iV4xwG3LxTZ2WMuubZJzvf4WXBi8xuOaGYZrLuXKwVUjzYEVuabAXyQnDVEG9kYCil33yVPoek4zA8SsxD7RdeTVfOhZScbcd3hNTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774031372; c=relaxed/simple;
	bh=O7o7FBrPlToXKzC8pwAquL6Os+AvG4huHyd9CtSYQdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PSaX+9wo9XYzTeBcGviugVQ2EYq79t3tgCizuF9JPi/SVe171la0BOPtv8nENvN2SWNA8PGzd+RHGIc/Ci+CMqSVbGykpAirD6jyIrjl7aL8AxxLOMTuKDpPMJ/zSYA6N4ZcNm8124xAguaQkC9sI1gJnjTOlK0WQabiBGzolec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HLDZLO08; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HLDZLO08"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso10654365e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 11:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774031369; x=1774636169; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EVnHCyxPSc13ZQGZZoG5qnRzMcihNg1l/YgU2d0QRXU=;
        b=HLDZLO08EijGIj3i1NCrBWixoJ1Gqj95z7/ezrdjqeovFJldXbZIHuAj4psQrUjCRx
         YolOaxSz1GZYwk9/F+Zyw29GPNbcZiTkvMfHcBJJHvpGx5odhpM6+qkNhOfhNEdbg9RH
         nZHsHH2yIyfo05Ad5h4PAmMGwiX1ica7AkabGPyuwb+nvsv+67wUpNZZ1ngSOWtUEvUY
         JYm+XllKYZzZVYCNPXIJw19HCJosUl84zz82tt13OW/vqydzaR8+ZzNSRV+gl14MKbw3
         zjZg5RuzOrl42LtTd3LMFFsNvMjDX2xQiHXbiPC7hXV4KtVtisAdNYDp2gksd+9yX6gO
         aQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774031369; x=1774636169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EVnHCyxPSc13ZQGZZoG5qnRzMcihNg1l/YgU2d0QRXU=;
        b=nUeyRKyEZk7iRS/wec+RxJC0YkkoqlwYXTe/wfDLJeXjFFyMfNwCrZjRLw9t+hisl1
         QjMx5DKFTY71vZR4wH5e430EEDEW6KouBtBIfX6RjMJlvma6GcYGibOR82gSHKi84bSW
         eacKxa1NBIbbNnewI+Pz+ctwLGPUU/DACq+LHO6yHDBQD7La5C/NRFNpRNa5gLYDo2me
         K8B4p7L3zprRlrLJ7EkoQYDLV1RHrQlk4zFaPEQ9NQMFdXkL4ErR/stkNMxbT9rLq4rW
         mV1K88zkuuRUlWAfV2ZzT36kAJFEIbAFZ5r6x3m1RCBK2CbiT4nrwyJliR49IoFu+4yd
         8GIw==
X-Gm-Message-State: AOJu0YwIiSTzm+v/n+1OUngEvvQSjU6c8KCVPVtF4JcJobTERXlpyAve
	QAJbLJmrrtLhJkyua3OB+3KDrIWe+n2mpfkfsRrceveB5lwPGtQH8m49JBtKdi42DjfSRBD+lgs
	fIVfq
X-Gm-Gg: ATEYQzyTAsbWXH+PLYjy5OReHfl0dHw/kfOJNzkxAKEKOh0U5fGlKfmS81PwE/QF9gk
	ngekAw3w/l1E4sRQS01/hzNCdU7yArRF4X+LVPk3MLLHkWz12sZe7jBrnERTpQGx/VpsNkyibzW
	3AdPA2t8CcNdO5NDwKk3Ft61c61vDfLSq5/LrR2IFTMIpPFJnMu2kqJzgLh5caBArbPc7CewnvH
	sD95jVbMKR9yA9JrMjTLobjBNx7FLRIk3aBFz4cqPGVOV9RuDSlKz02yHKl9wmJ91Wjw8VeOIUQ
	Jb+F4qf/5O1bJ48wrjdXaK+hvIwW/WdRe9Vc+QHkyihemjOVk64J1+GJRVcJR5pq3ULmGeZjlFk
	kPQpI+81Y4IoZev1IkKkzBZb4A8V2/6ppRvtW216vlQlh8FgTjCwtWeZtDj3iYbSdnJF0BjQy0I
	I0mvPDmoW/YQ==
X-Received: by 2002:a05:600c:17d8:b0:483:703e:4ad9 with SMTP id 5b1f17b1804b1-486ff0291d7mr36513385e9.19.1774031369285;
        Fri, 20 Mar 2026 11:29:29 -0700 (PDT)
Received: from localhost ([189.99.238.44])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a903e0b8csm19938127b3.12.2026.03.20.11.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 11:29:28 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Fri, 20 Mar 2026 15:29:16 -0300
Subject: [PATCH 1/6] selftests/run_kselftest.sh: Remove unused $ROOT
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260320-selftests-fixes-v1-1-79144f76be01@suse.com>
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
In-Reply-To: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
To: Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1774031363; l=594;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=O7o7FBrPlToXKzC8pwAquL6Os+AvG4huHyd9CtSYQdo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGTUlS6YOvkJjppJyfBvXK+uRYUVLQot9lB+mJUvYRjukWYP1Bcj5+pxL/nZwWFDAkKeJr2lRpf
 /0YazDWx3yAw=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Fix the following shellcheck warning:

ROOT appears unused. Verify use (or export if used externally). [SC2034]

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/run_kselftest.sh | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/run_kselftest.sh b/tools/testing/selftests/run_kselftest.sh
index 84d45254675c..9abea79018d7 100755
--- a/tools/testing/selftests/run_kselftest.sh
+++ b/tools/testing/selftests/run_kselftest.sh
@@ -21,7 +21,6 @@ else
 fi
 
 . ./kselftest/runner.sh
-ROOT=$PWD
 
 usage()
 {

-- 
2.53.0

