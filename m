Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B106C4A8A00
	for <linux-kselftest@vger.kernel.org>; Wed,  2 Sep 2026 16:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366405; cv=none; b=lxZMM6q6W6Id6Xhj9UqU0bP353o/jGTcbPVwr7UaZzTSHGAkbvC/T8LgzXpVIuPrFnDxeCTnuLu7QMB2Xg3rvPVIIj03iSGBjvzMpO3mYcY9IqYhUqe45PYUtHM+eCRuV5zBaWt90ySJZHrofaa4M+UH3Aer1ew07volU7kY+DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366405; c=relaxed/simple;
	bh=Viu3wNV3BMSr6b/InJgVRJi9CeKezTYBdRaQ1gQPW8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pw8Y/1R+6SLL4LraQv2oXeMU5VnjGRoJvSx2tq2diY4xzqi0bBsUTUpd5ZmVOmyijptAEcrTNW2VFs9VI0v5s/G2DVPLjpR8l9wDBIuauz0A/74/NX5zy/EtQl/nULj3mg2D87hrTcLwwv3OTXbv3QyEKw2EgtNN8b6RI/ZDIoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mjvLvuOu; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mjvLvuOu"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-482e61a34e5so529725f8f.3
        for <linux-kselftest@vger.kernel.org>; Wed, 02 Sep 2026 09:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788366402; x=1788971202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t06qVtjri1fJJ7rLlIaY/3pLLtxGChskI72GfqIm8sI=;
        b=mjvLvuOuwBMhhRFmsoTodwHQUq3Cc8JZJ94h+xKdrKYIPP/b/j4FEl11xX1iltQjGG
         6lvcMuYbP4beq4YJBRwOandxT7Ld0fafERkEHWhFZbb+NxEzcW1eRz0rQQbHpdky3bgM
         yhuyFZY+OAxputzn7d1tmfXlB64/YerzHhao/GOxb1xMjTSZs7cT55Wtgmy16diPIBjQ
         Zbq48Aa7HvguMiduOd1UmMB1gTWfhLf/m7QLyNswsbtnfxpDZYX3erNqLGw9rVGIoTMI
         pxIBjdhZ+OEfTn4xbKxz6UsCYF0bjn0BxNT8SJG47y/sq/6hjG84Z8cRHbEXMmBmC4sS
         5s1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788366402; x=1788971202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t06qVtjri1fJJ7rLlIaY/3pLLtxGChskI72GfqIm8sI=;
        b=f50f5WVe7FGpD7pjIIua7fQYztkeUicD6hcli6MYHxgk92SZnvlFUGER+x6HqG39C5
         97Q/JaTCwtT6eR+AyekHOMAh+gXD5C4C/XQbs54nWhA97smF/iuUK57LO9VDSbuVEXj6
         OY8c9dDsH55WBu5Njdv9sA2rdnLzRIos7fMqK5GLFnp9oRQzRnjuUftRPKIlHyQA/avE
         tRsUekl2JIZqWPeEwRkzKqLY7yH1Nb389+7k0DzBlqaY+t29Hi/WLtPal0FCzHtZIfEK
         V6ioXklQPGDMjY7fN7DhZebgMnMExCm7VIB93sFqbnUK/RQKwSVG+vkSgJEZScmsfI7v
         83Hg==
X-Forwarded-Encrypted: i=1; AKwUvBwefuuKuMDqQz5EgPqME5ZNboSevYwGnqUAA96nx8qdgewRXIrajZcVhR3OnUmeQrJPiMsckNwbpO+P2wxWyNY=@vger.kernel.org
X-Gm-Message-State: AFuF++n4VGx6HN1YF+FeX0O6fP4ljhXdhQQMM9GSCpeiJQW1RDbSAf73
	UYC6/hVrPFIph8NCeFkchaJIu4KdNUdutHxLRlvfJKeax9f2UzwEGZ43
X-Gm-Gg: AYBFou3zkQvqnlR6/Kc72ho57DMLnq7xTpxnMz+KwHB/vmVKf0iatapnt5vqwg9P0od
	G8/rjQuDAwSv0/6HI+rAUd1ZOv57oW8CfA0EzoU/rmg7jogYAFWaNohHScvJhhFxAXPj+5g7quy
	XknFDpTjElsZR2FcLmK79LLQdgrWjG3bplBKNWHXjxapfzgj2oKiv6D/OvneFkJFHa1qGDLo5+m
	yuw/A7+dOvf1qBXbBL7cO5Q8Ix2cmca4LExsxPEEQ6HnH1zjf2iBWI00vOhY2t9bmO5pfwgN1eO
	2fTbbMOfM53gmi/XIHDRhbC95ZIFiv56Hi9bezny3j06qt88grZh1urT6daCIwDhURY8kDENWPk
	/SOYEfFyDFv99d+/uXz2xvCMPQQLpu9d+tH3jrR8y/979c1I5leP/2p5NNJL/mhzuNXkpAIO0kT
	uMxeoYqbQF9oemBR0FTVY19qbhvDrcqNBppmnUTcAVzaUr1roOf5srQogLN5bUvq9PN9fJh+IdL
	Sj+yaervQ==
X-Received: by 2002:a05:6000:2212:b0:482:e2f2:19c9 with SMTP id ffacd0b85a97d-48488decc80mr12007278f8f.2.1788366401674;
        Wed, 02 Sep 2026 09:26:41 -0700 (PDT)
Received: from fedora ([93.107.91.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e80798sm6996004f8f.13.2026.09.02.09.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:26:41 -0700 (PDT)
From: Paul Dolan <paul.dolan.dev@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Luca Boccassi <luca.boccassi@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests/pidfd: fix PPID values in error message
Date: Wed,  2 Sep 2026 17:26:15 +0100
Message-ID: <20260902162615.11531-1-paul.dolan.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PIDFD_GET_INFO PPID check compares info.ppid against getppid(), but
its failure message prints pid and info.pid from the preceding PID
check.

Print the PPID values being compared so that a failure reports the
correct information.

Fixes: cdda1f26e74b ("pidfd: add ioctl to retrieve pid info")
Signed-off-by: Paul Dolan <paul.dolan.dev@gmail.com>
---
 tools/testing/selftests/pidfd/pidfd_open_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/pidfd/pidfd_open_test.c b/tools/testing/selftests/pidfd/pidfd_open_test.c
index 318e6f09c8e0..c6698b7cdb47 100644
--- a/tools/testing/selftests/pidfd/pidfd_open_test.c
+++ b/tools/testing/selftests/pidfd/pidfd_open_test.c
@@ -168,7 +168,7 @@ int main(int argc, char **argv)
 	}
 	if (info.ppid != getppid()) {
 		ksft_print_msg("ppid %d does not match ppid from ioctl %d\n",
-			       pid, info.pid);
+			       getppid(), info.ppid);
 		goto on_error;
 	}
 	if (info.ruid != getuid()) {
-- 
2.55.0

