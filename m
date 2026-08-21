Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E329238AC7D
	for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 12:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787314916; cv=none; b=A8n0/dgVoKA1BbT/ytUVu8pyhyXWb89070MHaJnDu/JmJBt95IFwZRDW48GF72E2niCORDN3GNoq3yU9xq/j1wnOX8/KHp4akX8JP/z17gWFpJcM8jEuJwN4cwczNnJML9mCyp4Wm4eH0V9/oX2Hy42QQ8mkL1jGciO/E8aIzPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787314916; c=relaxed/simple;
	bh=vDG6VgGLB1ibhVtC5i7RLaGRct1dwqYniHcqmrujC5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=claf9U0/S86NpneoNHE5W+eE04Nb+rzURsQa9pq2AMtSd2M7elPEl1s8OcP1TfL/VH10/YLbSuS6FHVMQCnHFiJLz8lH+iczpyRsl2bnIH2fWejDT9en3/CBXYOTsz+wBN7WI01UsWbDAbiMHGUlnwikTE2WDL7uiLP3WzomjEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STcQjtVn; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STcQjtVn"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a3819e8be8so1973360a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 05:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787314907; x=1787919707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U+VklefX138oVd49VIDXjzUaX4u45OfIRfPWaoTXpLM=;
        b=STcQjtVnhubjh6QKj0fJ3DoJXoGFqP58Oyz+IBpjarDCY90bWXYvALd2HP6wyqkew5
         2VDBk/No1O8etONMCzYA5xQ1PQ6terYp/ALM0MlQgoYr5TMYAvHrtz5Cfb4bVriyre6f
         CzHO3X4SteeSg2IbBKmZHNumLWDBiKOIOFZlNa5KqG68fDEE7pwnrHzk8eRJevbQU2qi
         +IuOdG8cIzf3Vrl0cfEMP8FZOpb4B6fZvTLVzipuG6lXCRRC4zkKbW8Z+51Qb/UxKJDq
         GWlu3fxxsWs80/a8k3UyrKF2uNaSote1eg4xJZtJ/W+a8FyhGN6Zt8DmNpNANJkpzS1Z
         EyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787314907; x=1787919707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U+VklefX138oVd49VIDXjzUaX4u45OfIRfPWaoTXpLM=;
        b=qkLpa5fgMADDjYY+VRTJsifxq+nmq5UJwJWpV2KFuZVy0WYSzDM5THMCPF7cIqNcO3
         Jx8YpZcruovpfwkgJjSmMcG0GEMp3+oII7dAzgE5xg9wP6ILehpZ9bcQnHh1ob8igPD7
         KCRzpF4gzBTYIOhCMNWHzHYIYRPCfpgDwbjE+wJYnLKCfsxZDhjzcsND+jqkajDEVXtH
         Wf8TULuEPXBFL4/lw7xd3k403e8I8JYyvx+wnBm73p4UO+llj8K5D1eHcuScQ/qSvtYu
         yWB/dkOfjmHSp5CzRz5i1PhTYESa7RDuXU1zEXa9Uoh2R8dRiilPtj2cg2CUwUTaEJJ7
         slMA==
X-Forwarded-Encrypted: i=1; AHgh+RrsQZX4q0KKLxeZPyNS4QoTxaXWTc9hY0jKEdTVr8lXfYEAHgI2jr6y+Dg3gfB5LpjU4l0G04vjSVdv9Igo9Bw=@vger.kernel.org
X-Gm-Message-State: AFuF++mudPjnQmjPZeaUDSZ/Spg0lP4gJqkTLhbaayfWqHa9IfbqJ65x
	u1wTzNSZIsL0e4zoRmV+hGUuR2bkdVEC/id9CVmlDmGUlaPltMH/ESEoSK85zlMiAyXuoQ==
X-Gm-Gg: AR+sD10x7v3Y9BhGRk3Qv0dc1YTUszjUhEHUV+e9YDBderqMEzgbzqbinBdG1XNg6nF
	wneDqZfFNfKva1QG8f8eyvYZKI5d5puj4p3hAtmqtCz8Qcmbja6OGFI5wAK6dXhYW7ogRGqt2sk
	/ve0DdxFyq45QWmXDQPhUr+3hEh8eZA4KmU9JWWXybJbEY4dm+GJVdqYYNKPUQi5+t5PYn8g8mk
	bZ8NvOtcdSS16TyZvKzqYP4d/m9WAK6jH049wrAXIoH4Krdf6REQPIBOyEHWFaGCKI3QEsIu967
	bQQJT9bv1CV8uyMCHw46yqSdXIynB5VZjC/rPOeYOWV9uSPtGYVaWJ9WJvdHv6qBy/BU8r83hPD
	OlwTUVNP81XadwCq+2vjC9GFThi/mOuGvcqPbGh+ejlnpEourhPd2j2PpJQ6eSZEvXg2hEXDquv
	whlIWrQGOLIYVdpWrBEc6+s0yDyL70xQhn9d/gxJxo4WhLkSaz/h7krNLqM/BIeVCbzZaARLyrp
	9M/NsVx7uQjC8VcZLmdjBA=
X-Received: by 2002:a05:6402:23c1:b0:6a3:ec9f:7e3d with SMTP id 4fb4d7f45d1cf-6a4112fafdcmr9645391a12.6.1787314907216;
        Fri, 21 Aug 2026 05:21:47 -0700 (PDT)
Received: from hisam ([2407:d000:508:2027:f309:cd0f:ed5a:5b9])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff177b1esm6473776a12.29.2026.08.21.05.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:21:46 -0700 (PDT)
From: Hisam Mehboob <hisamshar@gmail.com>
To: kvm@vger.kernel.org
Cc: dmatlack@google.com,
	alex@shazbot.org,
	shuah@kernel.org,
	seanjc@google.com,
	jrhilke@google.com,
	rananta@google.com,
	vipinsh@google.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hisam Mehboob <hisamshar@gmail.com>
Subject: [PATCH] selftests/vfio: Include <libgen.h> for basename() on non-glibc builds
Date: Fri, 21 Aug 2026 17:21:11 +0500
Message-ID: <20260821122110.902382-2-hisamshar@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sysfs.c calls basename() but does not include its declaration.
Glibc exposes basename() through <string.h> with _GNU_SOURCE, while
musl declares it in <libgen.h>.

With musl, this results in an implicit-function-declaration error and
subsequent type-mismatch errors at the callers.

Include <libgen.h> so the declaration is available on both glibc and
musl. This is safe at both call sites: the arguments are local writable
char[PATH_MAX] buffers filled by readlink_safe().

Link: https://lore.kernel.org/kvm/CALzav=fs4bqMM7BXNPXqhtbqGzA+LW5fgx2-1Q5=sTN5+krYhw@mail.gmail.com/
Fixes: a262fc49e0aa ("KVM: selftests: Build and link selftests/vfio/lib into KVM selftests")
Signed-off-by: Hisam Mehboob <hisamshar@gmail.com>
---
 tools/testing/selftests/vfio/lib/sysfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/vfio/lib/sysfs.c b/tools/testing/selftests/vfio/lib/sysfs.c
index 11415448b2e2..daf117a299a6 100644
--- a/tools/testing/selftests/vfio/lib/sysfs.c
+++ b/tools/testing/selftests/vfio/lib/sysfs.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include <fcntl.h>
+#include <libgen.h>
 #include <unistd.h>
 #include <stdlib.h>
 #include <string.h>
-- 
2.51.0

