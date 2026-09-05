Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E82361667
	for <linux-kselftest@vger.kernel.org>; Sat,  5 Sep 2026 02:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788576306; cv=none; b=qFyevdhL4d38On3NjhColkW4O61/HBGawInnCAe99ELeh6NcFJFumAjDmR8a9tN9ZcHjv0Yl163LWVh2XDYv3LpuobIlyVLKa+yguk6D337oZxQJtKkhkj6toR/IrES9nvQqORFgQKOAhOMmyejEfS9g9dYrDa1VOCugjeIo+gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788576306; c=relaxed/simple;
	bh=6V+wcAi6aIjzEQtsFtZ35bhks7J+sTDymPNLuPNKj2o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aWnvyoo60L5slaJglCtI3AD54eH4DMi0gKBpVKwUbTzCkJTRD7oIgVY2UQAWs2wClWLRoWcfInCdsgk95dVag8XWeOi68Ye/TUxy+u5pOAqOM6eW1GLkRMWAjfR5W/27SWUAev1JdhiwHQghpC5jvJIUl0T5+Md/tntXDDsoeFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jSmaAG4c; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jSmaAG4c"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4956869750eso13089915e9.2
        for <linux-kselftest@vger.kernel.org>; Fri, 04 Sep 2026 19:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788576303; x=1789181103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r3yyxISqKrXTZ8z7qHYkJWu3PYgeGWsbzCukGt/ffek=;
        b=jSmaAG4c2+u0n1L5uvpBWThtbjgkAcLjUe/zP1HSXq1vE3ktLb3oyRO33JIPS35Z4H
         hH8agVs4bdwkk/oLcRukGxNrxepnTd4a2XI47ZP1GN8fVS3z5mVD1ouWKihgA0CE27O4
         yRbE1EVFCbNOtB2IdihJ2PT8env5l0qRv9iRccEJmmZ2I0WFc2HLw6hynQv1jdV3mx7l
         O8o5nKpa7Odij6l32ZMAeOl7nK49wLWZw2ooW7TIQddB+djv2IXj1q/ZwvolbBKGT9Si
         5GbD5xa6NfySvnSSoGEyH5Ra5BKchMhCcRAWOKM3U6IaZAv3mj1gm0Y+IzIzHjbrO1Z+
         zdcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788576303; x=1789181103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r3yyxISqKrXTZ8z7qHYkJWu3PYgeGWsbzCukGt/ffek=;
        b=PQt730MzgdY0kxkZJvVriIMF2Gr2IqTozso5egAJKM8f5W5XzWvuun9xWL6WexgsXN
         3ujlvE7qqb1oMSLRuI4Aoi6MvvdgLsj1mpmcr5+vEMbnU1T47T7znxlHq+dC32hD7MWq
         z2rK1wMmqLax1od5sYneXAtIlC/NjB1M3CM1Q6GlSBrz4NnRckX7M0kaAoU6Kw4kkzJM
         bHT3sP7jtidBWJTQ5tRStTOzmrQodXsHGmmsBC3vvlIE3A0Io5T1Xqr7CYAVUCU97Ix1
         r/yJAROile4X5HvqboxTJronzO0G143ieLWBpdNDihsLwW8wEwT86LVW4gK0f0JrIpn1
         NfBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEqhlBpCTn3juY46gifOMGOjGrqeYMRlgwSyb71xuZ9jd7Z9LzJAGxNFLUhO0JjdrsTpMDQDN3HG2vRK7Rbdo=@vger.kernel.org
X-Gm-Message-State: AFuF++kN23Zyi/pC8enQo0JpgIm09uZqwH6t08vRM3b7JNjGwUY0sL3+
	CG4h6EPo2bDr8UoIblJrfW+5rjdueG7FGwhSEXT8yBbTDTmT4Ij91xx5OlZ98mHC
X-Gm-Gg: AYBFou0dgwaOrjte0KPeXCiVOtzeXFR44IffnwSbsk/U4R8gU1tNYFOnW4k6WlHWlwz
	ai4nlzB4wmCn3rCXLXFldjQUjDI5fHkJIZNqzNIa+fSL/yDmd34k0BHhkQPOUQOO2f931WVawW2
	Eup/Xm2JuqUHN6nlaOw2aH0TIoWmRn6D4ND6vvSwADVdGR5gIe5feY9wUGNJrz5cx+qxy0501wI
	8motQwqIn0zJMlVAEO86AgdiKSz4L33EoYOV1nXp3Mg+Hw/tOq6oTD0D6oZ92wml3AvqALHFQGp
	DydAD8YXCPyX5U6PigjydTMmJmuurKwDi0s2ZuK3ib93PBp0ZuciPor9dlXTiKyeZUw5fyxtGlB
	AFWOe/1u3Iy7bt2aRI1IYRnzC10L0VjZFbkOWal8CYJ2NCrjP7AgJ12KIX6SUnNbpuc1QbhGuKO
	C6zyyafoISKmcURSHh1lf7fnLqNqT01IM/HIlt36dtg3DBTzFVHQsF3+/co7m2X9PfngcueyTT6
	TBdJzMiDDS/YZaSrJLcC6kgUi+coesM0UYRd/lP4knW1qxe1VwEYwRAJDuDGwxN5q7nza98fNBs
	7H5pq2vYj++cnoIOZnTBz3ddL0vyVrjjnOrjfQOFOm118/9PyimrichY/Fu5FNUaOrA=
X-Received: by 2002:a05:600c:1986:b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-49cf825cef5mr83527625e9.14.1788576302692;
        Fri, 04 Sep 2026 19:45:02 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885be1c1sm10052560f8f.32.2026.09.04.19.45.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Sep 2026 19:45:01 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Brendan Higgins <brendan.higgins@linux.dev>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sadiya Kazi <sadiyakazi@google.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: KUnit: Fix qemu_configs path
Date: Sat,  5 Sep 2026 04:44:55 +0200
Message-Id: <20260905024455.83413-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The example path is written "qemu configs"; the directory is
tools/testing/kunit/qemu_configs. While at it, make the verb on the
same line agree with its plural subject.

Fixes: f13ecba04bab ("Documentation: Kunit: Update architecture.rst for minor fixes")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/dev-tools/kunit/architecture.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/kunit/architecture.rst b/Documentation/dev-tools/kunit/architecture.rst
index f335f883f8f6..dc291c6187a7 100644
--- a/Documentation/dev-tools/kunit/architecture.rst
+++ b/Documentation/dev-tools/kunit/architecture.rst
@@ -167,7 +167,7 @@ Documentation/dev-tools/kunit/run_manual.rst) or use ``kunit_tool``
 - ``configure`` command generates the kernel ``.config`` from a
   ``.kunitconfig`` file (and any architecture-specific options).
   The Python scripts available in ``qemu_configs`` folder
-  (for example, ``tools/testing/kunit/qemu configs/powerpc.py``) contains
+  (for example, ``tools/testing/kunit/qemu_configs/powerpc.py``) contain
   additional configuration options for specific architectures.
   It parses both the existing ``.config`` and the ``.kunitconfig`` files
   to ensure that ``.config`` is a superset of ``.kunitconfig``.
-- 
2.53.0

