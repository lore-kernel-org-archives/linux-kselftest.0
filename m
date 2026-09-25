Received: from mail-oi2-f42.google.com (mail-oi2-f42.google.com [74.125.231.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680DE4FB9CC
	for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 21:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790370969; cv=none; b=csWrV31ZC2z0t3F7f/0cZTOorbp4FB5knmXUoQCxsujW7mC7y92NpEc84pJgRaBmTmB9w5k98X3oqpu+KL7n3/lwC9ZI+4maDvgKjvQ106oBSYjS2ILMEAnbyZMCm6FMZPRjRjJeesEzdmnIvm3M8aX5a+8/lRy5WWqsJ1HJIzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790370969; c=relaxed/simple;
	bh=FOgGHwMNVv7MDQRWm8PMQdcyvauGb9qPaca/j6c2+2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cejNtfEziqesNOJsjnHg4gpVSalF0v+jPGZjmEtzVK2k1I64miceWOW+5VLffTc0WpbFxc3vdor2OBCTN8PHHwTEcXolnvk7+vjHr10SsDh/wAYinBoxA9iRYoI0FAZK8gRr0LFqXATU/Bd8RaQUzg66zn8+h1FVvHS+BD6sDQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AJzZmoBw; arc=none smtp.client-ip=74.125.231.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AJzZmoBw"
Received: by mail-oi2-f42.google.com with SMTP id 5614622812f47-4e47db1adb8so590b6e.1
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 14:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790370966; x=1790975766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y0wPevywQ4L6aM+vJB6sNB98D8zol2vthwx/ONSkXJE=;
        b=AJzZmoBwbZvFngn2UWptjxQ3zcVcUXL2C2hG6nZlnl2ghmGwY9FoKAwkaLKYy2+kET
         jUX9RYUe76uKp4sIC6AvzVZL78EPWdbaOXMqfB800qCduqviINXmqD/wb5ztkljupxzP
         6pufL8Jk9sErw/AaDRmTfbi3dNMCMZH8Mo+cQyHvgePhTRapbS+fxObJFTrEs+CV6vbb
         nBqFoFWlQDqm+CLZqW5xqT9u4PubqILjx0pcar3K7XWN0kc0OswJkOkAENe51zji6YSJ
         0fnVyjqnr9o49vdHpt+skVJPwHuiaaf0LhRrR48O6Y8Ml7arxxRFGTnKvl6F84hwrhcf
         EHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790370966; x=1790975766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y0wPevywQ4L6aM+vJB6sNB98D8zol2vthwx/ONSkXJE=;
        b=bUxwc2yGhYD7sLihgb5dSq3HGIT7eGxdT9cfrIxwtXIi6B0Zo7y8ea+RbMYTaIZnsY
         NV4TirOQW++GkyRePdrNSCC6+gs+I0Cn8pJ7PJvW3S4ZUeF+TEVZDLL44EO5LqoMlBL6
         b/HI/f58umzTjz6KZ8iDtJot++9Odu96jP1f/5dtRP3ICPhn+2ec3jCrMq9zFVvltQ2h
         2jUdND4BBagMLFbjl+gjkmxbm+QGswgYkfw+iONp6dlu5euRA+qcBCYPdia5n68lZkoY
         1OcILDHrIhlvkAz1TlrkeSVx6yUVfeABftK0w7Ell2InnRkiK9FlcDq9UevvMBWJi5so
         ewxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpYhakq+Xbk0aljM/IAHNdo9VauyDAE0S8CM1dIf59Pv4f+iXvjQgUCD4FIOHUW/xT7jueyqldRmRQ/6x9Ulc=@vger.kernel.org
X-Gm-Message-State: AFuF++m5zEYUk1SBnUVqCxvYBxjaliN2InvfBDFq5A0gs90+Aow6Qsev
	23VrFeR5leNap9o1LY5g+SIOWfygZ6wvZ5UL0wkquhk7pEHjPES2mYA0
X-Gm-Gg: AYBFou0RtrYrii7o8IkfLzNTg5bblrBhjlKxO8S+Vj0GgcdaKds6zFvTY6naJ5FRbUh
	atzOkXy8dOpxfaAOLru3PaHjQUqG6iTFYA7uebmos9GMriQlxEe/eEcFNAHd/gHIyoL7sJJ5mRS
	PdcAgaLV21vY2nKJoVWZeBjfzRfGj9AmvNuA37hiheZzN78dEb61MPBacFKaCoI5C5dJB9fzFaH
	WJSzes6HFrjUHSItXTEi5/cbeR0NE8iBe3FQuYEoKTKfCtLijr6ofr3ZqfHptelMtgrveDj45qg
	1Ykfs5Rvww0GO3BMQrmvQbb81S9VZyXYV+K3gw8fWGUFGicE5AQezRUtv0O7yN4VnJyxWaKdseB
	txBI8FHbXBZbrZrcaOF5iUcQyZyYaLTvXslqUorfShceEVXtB8/T8NIW1uk9TdKy0Lkxbu2xaGG
	kgiKe2zC+eZBqjVxlDRFKHeFZ9uMV5ckKU+PynJjmGMSAirHtvvzwfbUNPmEIJEN0krovkazc34
	2yeDYnvFDEzXHRnxeyPH6Lsz/U6WKKC33C3md5J
X-Received: by 2002:a05:6808:2394:b0:4b5:b13a:9001 with SMTP id 5614622812f47-4d72a34d1edmr7683917b6e.14.1790370966306;
        Fri, 25 Sep 2026 14:16:06 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4dbf3d72057sm3066734b6e.6.2026.09.25.14.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 14:16:05 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	Sven Schnelle <svens@linux.ibm.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH v2 2/3] tools/nolibc: fix FD_SET(), FD_CLR() and FD_ISSET() on 64-bit
Date: Fri, 25 Sep 2026 16:15:59 -0500
Message-ID: <20260925211600.119116-3-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925211600.119116-1-danishkhateeb03@gmail.com>
References: <20260925211600.119116-1-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit feaf75658783 ("nolibc: fix fd_set type"), an fd_set is an
array of unsigned long, but the FD_* macros still build their masks as
an int or an unsigned int: 1 << n in FD_SET(), 1U << n in FD_CLR() and
FD_ISSET(), where n is the fd modulo 64 on 64-bit architectures. So:

- FD_SET() of an fd with n == 31 sets the bits for n = 31-63, as
  1 << 31 is negative and gets sign-extended.
- For n >= 32 the shifts are undefined. x86-64, for instance, masks
  the shift count, so FD_SET(40) and FD_ISSET(40) use the bit of fd 8.
- FD_CLR() zero-extends ~(1U << n), so it also clears the bits for
  n = 32-63, whichever fd it is given.

select() on fd 40, for instance, fails with EBADF, or watches fd 8
instead if that one is open.

Build the masks from 1UL.

Fixes: feaf75658783 ("nolibc: fix fd_set type")
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    v2: No changes except dropping Cc: stable.
    
    v1: https://lore.kernel.org/all/20260924015222.31693-3-danishkhateeb03@gmail.com/

 tools/include/nolibc/sys/select.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/include/nolibc/sys/select.h b/tools/include/nolibc/sys/select.h
index 6d65d9ef3d6a..f299c79939f5 100644
--- a/tools/include/nolibc/sys/select.h
+++ b/tools/include/nolibc/sys/select.h
@@ -26,7 +26,7 @@ typedef struct {
 		int __fd = (fd);					\
 		if (__fd >= 0)						\
 			__set->fds[__fd / FD_SETIDXMASK] &=		\
-				~(1U << (__fd & FD_SETBITMASK));	\
+				~(1UL << (__fd & FD_SETBITMASK));	\
 	} while (0)
 
 #define FD_SET(fd, set) do {						\
@@ -34,7 +34,7 @@ typedef struct {
 		int __fd = (fd);					\
 		if (__fd >= 0)						\
 			__set->fds[__fd / FD_SETIDXMASK] |=		\
-				1 << (__fd & FD_SETBITMASK);		\
+				1UL << (__fd & FD_SETBITMASK);		\
 	} while (0)
 
 #define FD_ISSET(fd, set) ({						\
@@ -43,7 +43,7 @@ typedef struct {
 		int __r = 0;						\
 		if (__fd >= 0)						\
 			__r = !!(__set->fds[__fd / FD_SETIDXMASK] &	\
-1U << (__fd & FD_SETBITMASK));						\
+1UL << (__fd & FD_SETBITMASK));						\
 		__r;							\
 	})
 
-- 
2.55.0

