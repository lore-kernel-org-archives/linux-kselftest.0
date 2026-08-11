Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73EB42FCD4
	for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 14:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786458958; cv=none; b=Mke3UQY1mmkzdSTYHMDy9Q1klcscUIqLREKZQW8vYWELOKKnI8DbCrzjoWPFZ0hs4WMGFIFH7zT4TQXqNDI2wPM9w9sq0TvkgIkGq5NSM8eyCl/piORJbL3EUFqroXy/kEev6j8wyyhNt5kcjB5QWUiaUD0uitq0uToitxc19PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786458958; c=relaxed/simple;
	bh=DEDUOb+TiRrLK8YeC/7fFq7vsbrZrBwxkC3fk1wCwyU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R7CSJ2Alk93LML27ULYT2dwn9BasSWj+0vvPLyLROkbhYB19YzeJJydeHYhvPEG+OLEMjl6GZW739GnBLbmKxXu+NEKNl0+rYLE7CbitqU3ozpqIIJ0R0TCbUExRQvzfbIiFJSaqDs08e4nZA7ZsVJhtUdHkHl/ZWA7DN8ZcF/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MLSflrFr; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MLSflrFr"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso23846385e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 07:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786458955; x=1787063755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nyOgrpKJkHA8gAiY75lnj2+ioe7jla8qo9VP71q6SwU=;
        b=MLSflrFrvWqtC/DBLzv+U1PZiDOaUAlYRpgJu2J9tYiCGXCdQ+J0TISy54WZ9KGhlu
         9Re6qoOuNuVTUbV6jEtXy4O3pQliZ/xHfc9IM047D5ZD3dTVtWmvJ467ay5cUnVDqgkc
         cIxccfUbf5Rkp+gAlwQfqwvFq0w8R1DgMyixosDkrH0j/rvbEiVwHbKPtyz+TUk1X1Z8
         9ith216bgtshsyjQjdbSI/9KSKJ/8Q0vseJQFTeMVrmLPRACYaVIKKh95Lo5QXvcTs7Z
         KMH+9/gUrWqycoNtedkBXdw8kTPPnN42bGhb4eyCep9nKvM7RQyvpMTXj2RnJrI9O9wl
         O8jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786458955; x=1787063755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nyOgrpKJkHA8gAiY75lnj2+ioe7jla8qo9VP71q6SwU=;
        b=kjHEHdpqVlHJ0HyQ3PScTcWr1B+jPMKftuu/PsfUDU6nHWbzVqBIxsKNF6vYllVpeY
         3opMLlK3M9qH1s4FRKMe+gW5cyH1crkswt+obE0U9kuWiSSw7qKjpE/maFHpL4hS8itS
         EC7d92h1McRdQCvxv6O3cN1v4QWlqDmL1uZml7HzCwmSOaHGhJOuWWyrlEo4cWA2Vnur
         esPkeuX0V56lovUEMXFBT5pifUYExa1iqm8A4DDBb3mqmdhgQxH90CyoACk6DZKu0oC2
         Ez/qMbSHu2aNg8Y4jY7GuhqHLQ5DEmRxeuLtUJQFDyTw6aC30lxEGgsSt3oktH1mQAHb
         biqA==
X-Forwarded-Encrypted: i=1; AHgh+RogFTbMczZfY/q2eeSuLb+Jwax0zvoOEDZDiUiJX7TkjVlEhMLzKWd8WiFJZzxfLwEpcq3v0xNCWvGW6vGzwAo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfuf3BGp+P8NijtJqZ5Sk/uzd4MP2MOYvC2BFfBdRFERxPHleR
	ZjxmCIdORDG5BaATBBrZBHYHNwCeTi9TSX7KpltSQ4oJxVz14tUJnElb
X-Gm-Gg: AR+sD127haTZ9+HSDxZhruyLTT6LwJVAkRwXaxlxiG0H7hsuj+3dkAEtqoWyYKUva1R
	KvA7l0J2QcaSpAg/ZHzTwiRZuHpg3hEjxfYVKC2H1dYWQxURzOVFZTeNe/7KLTsazBAFnmZnVzG
	LdNkgvTHvTFlRiBRXHcy28k9vtwwNaKSNu0qxCiz0y1Id66EjfNuxRVzi9udc1Y5sC6aRz+gHn9
	idZ4e7V4guZskdZlkeeii6Y2nhJ7G72Zuu8RZTJO9rpiq1+6RYpNTCziNK4WehyHIC78gRHzeGv
	7hGDFdGdS1Bu+Cg/WVwKLZHb3998YUnon9M0B6VBG/0RKWiEzNA2bxm1DV1miCco+JfoPcQII4F
	BXEFCgJT45sX50PHkwMGcoHi0/6PlqWqIQXpb8x1ocHgozTHxd7Q2aCYRFT6VJQ7StV5/qb4yEK
	Bcqzdt59TLd0xn7xEU358Nx93myoCYyNwQuRlRyW0qf8Z4/mBOTuHgKK7+fBTSA+igWdD7Xt2U
X-Received: by 2002:a05:600c:3495:b0:495:4811:7998 with SMTP id 5b1f17b1804b1-4997848412bmr75446575e9.17.1786458954997;
        Tue, 11 Aug 2026 07:35:54 -0700 (PDT)
Received: from localhost.localdomain ([45.249.68.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499788a5be9sm74296965e9.4.2026.08.11.07.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 07:35:54 -0700 (PDT)
From: Joyeta Modak <joyetamdk@gmail.com>
To: kees@kernel.org,
	shuah@kernel.org
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joyeta Modak <joyetamdk@gmail.com>
Subject: [PATCH] selftests/exec: add missing SPDX-License-Identifier tag
Date: Tue, 11 Aug 2026 20:05:43 +0530
Message-ID: <20260811143543.45989-1-joyetamdk@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing SPDX-License-Identifier tag to
recursion-depth.c . The file uses the ISC License
 as indicated by the existing license text in the
 file header.

Signed-off-by: Joyeta Modak <joyetamdk@gmail.com>
---
 tools/testing/selftests/exec/recursion-depth.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/exec/recursion-depth.c b/tools/testing/selftests/exec/recursion-depth.c
index 7b5c4f6d1928..a6c42a9b22d7 100644
--- a/tools/testing/selftests/exec/recursion-depth.c
+++ b/tools/testing/selftests/exec/recursion-depth.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: ISC
 /*
  * Copyright (c) 2019 Alexey Dobriyan <adobriyan@gmail.com>
  *
-- 
2.53.0

