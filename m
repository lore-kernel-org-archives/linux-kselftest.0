Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9647537A493
	for <linux-kselftest@vger.kernel.org>; Tue,  2 Jun 2026 13:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780405943; cv=none; b=lQ9fK/qzdj+vpsyFGQ5TPIRTWbzU/ha//QRYKEVmK4/5A/coItVTBtdwmkBUJnH6vwbdGkd+J0J/5P0GutpvFXiW+WUnHLE7qtvjHYwdbzlnevq4c9AYEtP44GLGIAVBYtlu8M1Nmp99IB25Uwi/D9p5H97jrdPGdKHhjW/8Tds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780405943; c=relaxed/simple;
	bh=LWPMj7a+gzLg7XA9kVfxOsUzy221Pa84w68ETkj7T+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pNCTrR3pN9WPW8bY4gY6PxZkF5x/LgwBhJALfNznwzh4/b+xJft07EwmIZriL6YJwwHdGjXttwm3DcH+Cgbh9WtHz7kmVxF/fx9TTTmgsvXH3BfDOaJHsbXo+Slm0HXF+nClw9xBQgTwBZqnZtfvzbz02OAQ7r7XkoCnVDEO+zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KhaoBGAr; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KhaoBGAr"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45eec22fab7so2808390f8f.3
        for <linux-kselftest@vger.kernel.org>; Tue, 02 Jun 2026 06:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780405940; x=1781010740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gi0nkd00qoOiTXwyNBhW7SD2eFbz6g/U1mZvPVWCOeM=;
        b=KhaoBGArOkK+1Wod3xUaPAdEAaPTgLgXnVINzIsHn+nYl8i5eLoE+0PBt6thbXQCN9
         Ig+9T5sLsJD8cn/deEZUr71fVuwCJjkeBQ5WnyMvfwRkZxHKxx1LWWtn5dlDucurZjsD
         gDhKMfgxMiXOEKwHHmbs+riCxfZwpZ8aQrikWhTcskb3uhAjLxRMsl7bTyHx5W3TpiHX
         INysQIUiNkES3J9QVvswgva+KafdA8ReuIIHFYAgnT6du5QBfjgX3xerQfovujnP94v7
         0u4zFFtI+V6JaBhT8HuvdZ6jSrtI9QCbCqelpG6c4ls24Wt1rRgPidrN1q0PPmGNIKZp
         whsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780405940; x=1781010740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gi0nkd00qoOiTXwyNBhW7SD2eFbz6g/U1mZvPVWCOeM=;
        b=nSjlZKwmXUI+UlObYzXeWknAUuSlQwaAGcDEfnSkt51i89ShiZD9wC0kRtjM4tdsoX
         YO42BtXuQTcWfA/vLUF4P2FP4qSqgBgvAOmrxebm3SHDVFJIjNwS0JLSuZX8xZ8xQvHp
         I7YzL/OZI7kVNJ0e+i/2DKsm4oX1VxRqPmRARBEdwfNH2w8F/HtxogIdpeUlWPeDwFU2
         dWr6d9vQOYUgFNmQqTqfky7QDilenZZf11pti9sbtRVOGREEc6AxWjsH63HK7/HTQd2o
         S+QsQsf1bxeYsne3vkdkd2NAKMlttbZXclfyWh2nDx8FMP8NozsdhDjJFBsC+yiOuG7i
         /q7w==
X-Forwarded-Encrypted: i=1; AFNElJ83BUJXjd3yVHmt1FWlTyXBI/ApL2mch9Y2T3Dn883jTAprtmw0OS5qNBcgnmFXZy9BdlgenT6kU79k0/4WCbE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6EJSIsOKXyCe+F4eJvKAYK9iGQG5uE/KQc6VeXRyL4zvuPzqF
	YoPdq1n85jCIXMnnmnAasH6+iUyZPFhB0XxemXi+Kq7hmgLhuJRf92rH
X-Gm-Gg: Acq92OHZ58VSo18HlDFMh2k/xGjwOgZhmD8cgKUzWhvKjhqeKNqkvWVnrv455hy+PeP
	zuY2VbQ3UzVoigWmj9TdQi6ii698zzBu1EoKcFT8xKsz9v4k3sZRI9ktKRiQsu5vKA/1V51YCc9
	8sSySja5N46HTqLYYIIsw1U9R2BoTYGiBOrQgOSTjNeKN59F6XRMTaqx+mJ0QFaqMuXz2bzR9Tt
	+KU29yAalYzGjpSTKUq528qv40AGz6ZconS7v0aR65EJhJ2UwbYs0ZTgnATL7RZP3sa1ui1B6hN
	KZ/pDZEkQngZNdoNyiXbBfHYm6f+XIiAisysHVzKng5g2UulMXCKXPlaNoDJpEzuKlP61+On/M2
	wxzzmtYyc3gTtbWyLKXz2ZhbZaD3M1beLx3e9NkVSah70jW2FUn0c7Jv/xR75zTSz/cf1NZ4I1k
	Cr0AAbEWOMTUCd0Tqu4F9Xx9ZjBzRNKC/CjzDnPt3hSg==
X-Received: by 2002:a5d:50ce:0:b0:44a:2cb3:b633 with SMTP id ffacd0b85a97d-45ef6b18708mr24074083f8f.12.1780405939786;
        Tue, 02 Jun 2026 06:12:19 -0700 (PDT)
Received: from x1.tail0e71db.ts.net ([46.140.7.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34c3081sm33234665f8f.15.2026.06.02.06.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 06:12:19 -0700 (PDT)
From: Ruslan Valiyev <linuxoid@gmail.com>
To: SeongJae Park <sj@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxoid@gmail.com
Subject: [PATCH 1/2] selftests/damon/_damon_sysfs: support kdamond refresh_ms
Date: Tue,  2 Jun 2026 15:12:16 +0200
Message-ID: <20260602131217.2210912-2-linuxoid@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602131217.2210912-1-linuxoid@gmail.com>
References: <20260602131217.2210912-1-linuxoid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Kdamond class has no way to set the kdamond-level 'refresh_ms' sysfs
file, which makes DAMON periodically update the read-only sysfs files
(DAMOS stats, tuned monitoring intervals and the kdamond pid) on its own.

Add a 'refresh_ms' parameter to Kdamond.  When it is set (including to
zero, to disable the periodic update), write it before turning the
kdamond on, so tests can exercise the auto-update behavior.  Leaving it
unset keeps the previous behavior of not touching the file, so callers
running against kernels without the feature are unaffected.

Signed-off-by: Ruslan Valiyev <linuxoid@gmail.com>
---
 tools/testing/selftests/damon/_damon_sysfs.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/damon/_damon_sysfs.py b/tools/testing/selftests/damon/_damon_sysfs.py
index 2b4df655d9fd0..1a498c78a4149 100644
--- a/tools/testing/selftests/damon/_damon_sysfs.py
+++ b/tools/testing/selftests/damon/_damon_sysfs.py
@@ -667,12 +667,14 @@ class DamonCtx:
 class Kdamond:
     state = None
     pid = None
+    refresh_ms = None
     contexts = None
     idx = None      # index of this kdamond between siblings
     kdamonds = None # parent
 
-    def __init__(self, contexts=[]):
+    def __init__(self, contexts=[], refresh_ms=None):
         self.contexts = contexts
+        self.refresh_ms = refresh_ms
         for idx, context in enumerate(self.contexts):
             context.idx = idx
             context.kdamond = self
@@ -695,6 +697,11 @@ class Kdamond:
             err = context.stage()
             if err is not None:
                 return err
+        if self.refresh_ms is not None:
+            err = write_file(os.path.join(self.sysfs_dir(), 'refresh_ms'),
+                             '%d' % self.refresh_ms)
+            if err is not None:
+                return err
         err = write_file(os.path.join(self.sysfs_dir(), 'state'), 'on')
         if err is not None:
             return err
-- 
2.43.0

