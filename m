Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37933A8730
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 19:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781291365; cv=none; b=X5L/rVqodxSnn4yem+oADgb5mhpFjYFQwC2Lj8IB9dXcrmLVHniLiKgPrI7ZhKEKFn++f2yCmag3ANjumgplAt4Xwsk+n5a+6aGcrzQe349bqmpYzVnmItWgul5Do+PkO7V0FO69t4tGgQyBkthfMlxcW82pYGvSjh6VrL86E5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781291365; c=relaxed/simple;
	bh=NF17neuBAb5a8ZbW82OAWrN4gb0hnuoHKYOLDGcV2ME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rqYW/cYlBDdP2+P4bSljaXFtSkITjoToTat2870hvhAxgsfkKNc2aWtFUp6ZyhHmUpXuYUYwkYbMavpNQn/yaPN0pJlUPpCFbyKA7R/WLbrnXojEUOXGrQc15mIphvjq5AvR77LoUiUUJnqkgWAB/HVHzWvPhhwDU5KIjw2yHiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XfGaaI4Y; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XfGaaI4Y"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36d9794d82aso853307a91.0
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 12:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781291363; x=1781896163; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ct/qd6zlmAVpaNbmF/piz+twUpeV9ONsk7D+rB9vo00=;
        b=XfGaaI4YaKaJs0W2t2ZzcMeChSsY7r7x5zdnqPwYr+aE8xm18eUpUlTkIGStsq/cpW
         oloKcRcyjZDquVOKGHpwt/HE5fYR1aFy4gtH1ai+WXS0VElyEbKO/wincPl9dIE9O9tJ
         MA6zY6J1aPzFe+rwZ6+a0P6V98LAxkX/fjpxi42iPVNM5waynI+g8Wm2rFANWpTMlkOt
         1xNL0uIE0iswMuHo0cfEkpfiqcxnfeAlj4M6EDL5tyQRWke8KDj7BmrmksJxGLDUoLQy
         n52S6jNO7H5yb3ZBhMJPpp0BgTT4hDsZo4vuMheQgYfJgf6ZC4BWJrjZNlP9I05GK0nR
         Du0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781291363; x=1781896163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ct/qd6zlmAVpaNbmF/piz+twUpeV9ONsk7D+rB9vo00=;
        b=EP1sGXlyug/UL6pbXuadMDmCT1Evqfge2Jp19VfFE7xCOOTiqvqkzx6vAzryonWZ4b
         ccxXlt1Fp6yTIIj2jFxm/+NVaT13nJ1WFfojdL/5nHQULGkEM3uOS2z2ClyHu+zWFhg8
         C67i7baYSFAG9sbE7fhDQ/2mbm2xBP4qDctvI4c0gf0F7gAAP9vlu44BaNCxQssLuWC/
         wFAzgCHa3XTkW2s9c0SDtQSMBQ0zbpk4G5EOmH+AT/aZvc4tCwe/W/u+hMPlD++cAVj/
         pogjcJ2dHTzcRWuEXc8sMj+31q8cYS9uHs3oCSMPRT6QorsMrXJR9/aVHeQAP79n9LRk
         FK2Q==
X-Forwarded-Encrypted: i=1; AFNElJ/ojYeooTD9aN4QrwYLnIxPUTJLRdR1DbnEc+s3hUqBScMH7uYcUyc43BQgij95DNmYhja+zSBBkpwdoSDujW4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTVUmuIkBOv6FXdr96BV++hdRannYeMh4A9IMsjnAIBvWzDAtv
	H6o6m1ajW4VT0WrYXdcMTDnoopxGHyZ26TuowWf4hwtkxrR4vtJUg+vz
X-Gm-Gg: Acq92OGZoxZ5BEVA1OvETWpbddC99TfrZAwaJ5fC/ED350EDqe0BIZ8ckk+2xXPqBgj
	4wMRsPG2yA+2GteFU+ociG3GZ2eduPnb9PTyr1BmozWcHnzLo8827M8TV3l6Bk7Nrbt6fQc+0bW
	ESY0+hHMq6zhAKyRuapJ0oFqTzkcRYx8nGRvWM1f5lUvmJluY6vskPLcOC/jKB8C0xz6MP3FW3X
	MNx6NZQ9dAfsBUzNHM7VBwIGStRlcqANVwzn0i17j2afE2XFWAeboUjNhiVD0hXWWmBDZSDC2RW
	K8LW6wl6cgcIzBV89pv5BmCvqCrqAhLrG0PrKMYPq12upT22zpuIlXZYYpGExRf/RLPi5QpP7sF
	2lRuSOnSdnSX/sYOVq9uwC61ufz56bUsa3b1CONu0pNpEMm2CCSh/tByR9b+xuG+Pw2m+zqEqm6
	I/g79l7sslVU7s0DeoPbI=
X-Received: by 2002:a17:90a:dfd0:b0:369:2e00:1ff0 with SMTP id 98e67ed59e1d1-37a024176dbmr4400885a91.6.1781291363277;
        Fri, 12 Jun 2026 12:09:23 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:5e::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a233f58ccsm2848924a91.3.2026.06.12.12.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 12:09:23 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Fri, 12 Jun 2026 12:08:42 -0700
Subject: [PATCH net-next 2/2] selftests/vsock: skip vng setsid workaround
 on >= 1.41
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-vsock-test-update-v1-2-7d7eeed3ac8f@meta.com>
References: <20260612-vsock-test-update-v1-0-7d7eeed3ac8f@meta.com>
In-Reply-To: <20260612-vsock-test-update-v1-0-7d7eeed3ac8f@meta.com>
To: Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

virtme-ng 1.41 ships the upstream fix for the SIGTTOU hang
(https://github.com/arighi/virtme-ng/pull/453), so the setsid wrapper in
vng_dry_run() is no longer needed there. Gate the workaround on the vng
version: setsid is used for vng < 1.41, and vng is invoked directly on
>= 1.41.

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 tools/testing/selftests/vsock/vmtest.sh | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vsock/vmtest.sh b/tools/testing/selftests/vsock/vmtest.sh
index ee69ac9dd3dc..310dfc2a39ad 100755
--- a/tools/testing/selftests/vsock/vmtest.sh
+++ b/tools/testing/selftests/vsock/vmtest.sh
@@ -445,8 +445,14 @@ vng_dry_run() {
 	# stopped with SIGTTOU and hangs until kselftest's timer expires.
 	# setsid works around this by launching vng in a new session that has
 	# no controlling terminal, so tcsetattr() succeeds.
+	#
+	# Fixed in 1.41 (https://github.com/arighi/virtme-ng/pull/453).
 
-	setsid -w vng --run "$@" --dry-run &>/dev/null
+	if version_lt "$(vng --version | awk '{print $2}')" "1.41"; then
+		setsid -w vng --run "$@" --dry-run &>/dev/null
+	else
+		vng --run "$@" --dry-run &>/dev/null
+	fi
 }
 
 vm_start() {

-- 
2.53.0-Meta

