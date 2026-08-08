Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C5E39B971
	for <linux-kselftest@vger.kernel.org>; Sat,  8 Aug 2026 20:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786219478; cv=none; b=j27H7ihmS4E4VtPPmxhFHcP/ukc7SiciaCuHbIOAkKRCJuJGD28IpyC5U/b8mjok3peqXfI9RguNtlUdY5PCnljXNl+A42l5rBwcZ/3CDgFJGbGbvNMzZ98CKg0ZTb657Dfso9rCDkYd6jIMkcVMWAZflj9x0Icw3PNTGALWVyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786219478; c=relaxed/simple;
	bh=LlH0TC1nAkRMBmXknw3v23nVN/4enwHto4egCDkbd4Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=t0EybhfAOfKYk6mzHNbQ8rZmR3wHayk0fHQirEQVYDfBcgQTHTzXQseBexjWMYU+kSgqLC6O+psQ4JEpU4CdV3gBFIrhPGn9iu/XP6lOKHe+f3BZibEoCKYMFWgV5kkQeZT6kQLE8C+sVhZMjjGWYYXWXAZZdBA8P1XfHg2X8SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oEP2dTJi; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oEP2dTJi"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4957eefd361so3994615e9.1
        for <linux-kselftest@vger.kernel.org>; Sat, 08 Aug 2026 13:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786219475; x=1786824275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FTWOCf3x+WMKSnT7DYKaYqLrpreFxQU4MBSEOLxHycI=;
        b=oEP2dTJiXcPnbYHB1ufP5ggp8uuXRFzA+xQkSfKl3UGFPZ3sFsV49brI82CY0ziwF5
         l0RxQKzCfSxAJ8BhZNYjbH9VfQRO5+4WZEHbeEdMiIMvCDwoMnQh+v0eq2ElZViwhQW5
         wAjArZmBgUbn/rso0rgXLdcmudE48QsdDUI2Az875bqcPDIGbDOKOK754C0ODMCTHiL+
         pYn0uUF99PkhaXZQu3RG9Nix/2Hd9ZrrLnsbxOuLTT7E/qpECcHz22arJQfUvIm3jlT2
         0hGHRyeS7UAJQkgTtjCJfhsWejOc6Se4EpWPsT1ycVCTlg9rjSnM1txCK9KgDnZ6GnDB
         +aDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786219475; x=1786824275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTWOCf3x+WMKSnT7DYKaYqLrpreFxQU4MBSEOLxHycI=;
        b=VxgrGqMW4VSF64LKpHTUlgCsjr4UuD7NwXYkbdY8Sk6wQES8Ht+1VlACQPNqn888MX
         OF8wFNLEnLD/ARxHJOL3SntwzoWCXqVRvQ09DfFQ8ILKiLxaJFc8722Q2oVclLyPx38i
         +cGfjA8X33I0EAsM/S039isOGS9peMCJ/hFXIAxbGdcR//b4jOTU5XVoFNvP7tw3Rvvd
         o6qxOTGC4O5/3I/K09RhlK6JzkCBZbRzpIC84r7gZntWn5Sh7FlxUQoKcbkKkdU1nYWT
         2jOV12XV0VrCtcS6NHyr+s9VYFA/3IUsv14ttqm4+5Mr2pyX7vd/boiTPMZcAwVdFRAP
         548g==
X-Forwarded-Encrypted: i=1; AHgh+Ror/yNjBresVmnuH6zDosp9qQyIGhhnnSBofSsjZPz0fmtq9E5THKA1bEQxKCL4U5Wv1igTS6tBSUAGCkpTRTI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuHydfRaHbJS+20Y91uttqnGPznTFyMHjRUGqM8c8tPBOaBUF4
	j9OqxM29N21iglwvr/aSbtm7llGIUbREL30yqwwsW/NjzEPUh8d4dJjn
X-Gm-Gg: AR+sD113JYfxkNzmmshjZkSnW37f1j+toxE6GMjarDSf9X5TdUkaUpDyRN92ghCnxYN
	1dWD6eX+VljluyJqlPEkM37c+ixbYbe1aMMWEAynlJDprl30Jybo4khMaEGjUHy1cX8MnjFMU25
	EL0iFw2/q7Xq+UHvKLguoCk9llrSwaIfSUGBdLR97Mm8pHApgvJ/NKLfCsqqDC70zbSl0MJixLh
	HadW0rGLekO4hWj0NgguUAloiHcOBhL6spiis9i3wcip9zi/FQAJONJ6zfpOYkq/vmvrDmFRt97
	VPXtzipVFq4H4T6RVY2vRY+Y+6oZh0ZsSJLbyn6q7EEiFIXSFzpRDGM1YqLIx13tJBleG+Jaz4Q
	jIaZHaSgPfSQcJSr7uQ0DZ06dMWfYRCMu1fHCBHisIQjvqLSRLueSc3NM+YykkGmLI46EG4DB4b
	qrHnPSc8jdmHJkSBLxdRQoVfGvm9uYW+AjAbcsLMEMUBcQ6sH6L8r7qPIG69MwOyhQJhqhxZ83X
	QpLoWs56F/eIHnaW30pH1i8vkB1NgFxXUWxnRoCZxzBkB/FYZIXRoO+abGi4FvuCPkS/R+/Mo20
	dMe7boYAwXP7OxY8Osgb
X-Received: by 2002:a05:600c:6612:b0:495:4811:7998 with SMTP id 5b1f17b1804b1-4995e0ebf84mr186829685e9.17.1786219474873;
        Sat, 08 Aug 2026 13:04:34 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-004-134.77.7.pool.telefonica.de. [77.7.4.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995919df87sm196278975e9.6.2026.08.08.13.04.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 08 Aug 2026 13:04:34 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] selftests/proc: make proc-maps-race work with READ_IMPLIES_EXEC
Date: Sat,  8 Aug 2026 22:03:12 +0200
Message-Id: <20260808200312.6326-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

test_maps_tearing_from_split times out when READ_IMPLIES_EXEC is set.
This happens by default on pre-ARMv6 CPUs, which lack no-execute support.

split_vma() re-maps the first page with mod_info->prot | PROT_EXEC to
make it differ from its neighbours.  With READ_IMPLIES_EXEC the original
mapping is already executable, so no split occurs and the test hangs
waiting for the modifier child.

Use PROT_NONE for the split mapping, which always differs from its
readable neighbours.

Fixes: beb69e817246 ("selftests/proc: add /proc/pid/maps tearing from vma split test")
Assisted-by: Codex:gpt-5.6-terra
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Tested on:
- QEMU versatilepb/ARM926EJ-S: maps and smaps fail before, pass after
- QEMU realview-eb-mpcore/ARM11MPCore: maps and smaps pass before and after

Changes since v1:
- v1 went out without any recipients in To: and received no reply in 19 days.
- No functional change. reworked the commit message.

v1: https://lore.kernel.org/all/20260720061835.6290-1-kmehltretter@gmail.com/

 tools/testing/selftests/proc/proc-maps-race.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/proc/proc-maps-race.c b/tools/testing/selftests/proc/proc-maps-race.c
index 1026d8c400e1..415eccb70468 100644
--- a/tools/testing/selftests/proc/proc-maps-race.c
+++ b/tools/testing/selftests/proc/proc-maps-race.c
@@ -490,7 +490,8 @@ static bool query_addr_at(int maps_fd, void *addr,
 
 static inline bool split_vma(FIXTURE_DATA(proc_maps_race) *self)
 {
-	return mmap(self->mod_info->addr, self->page_size, self->mod_info->prot | PROT_EXEC,
+	/* PROT_NONE differs from both readable neighbors. */
+	return mmap(self->mod_info->addr, self->page_size, PROT_NONE,
 		    MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED, -1, 0) != MAP_FAILED;
 }
 
-- 
2.53.0
