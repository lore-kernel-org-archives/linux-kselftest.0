Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793311897;
	b=o0KCKY+J9QcLOpVqQ644RW0HuG4Um3E0RjW+Qwzjub9lCHt96AUKrtio9SSa5IoTY2e/
	 W3kcI2rwaCwpSQ3t+eoVfumxFRo5mGjMnfLyLH92b1zv+PvyM1RMv+N+8xtoydOEog96h
	 v8L7eODuJu2ytVPe2OgvCbp3YJU8IwH702GbjXCw7ZryHLgVy5jQyW91YUNuQHFLbLvpr
	 TWfZQXV39AjRw/dVSDURfsaWak9uaYSfXe5Z2F7JxW8aDmHX23sUUsXczDfpEqHOShFrI
	 H+GQcoOogHq0SMDIrG3mPncO/C3ZqzNgtTkNtBVjmaerIGEaEXRu/zGJVx3KoPyAlMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793311897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3qbCVY70IGSK3kVBC6Qw8VcA8OjZRClUiqwt47D/E8o=;
	b=jX7DjQFxM5EQTQjLRS2mT1dBTPkj/PZ5BX3DetZ+68Xon6Gztxq6ThifZDJWt4IpOB9C
	 WTlzm9W5+FJIz79H+bMrH04BIEObcSdvj/6otFHWLg3q50ynpNXgqjzrZZweFYQpK4kkp
	 beWMUklMu1xFA6QJkoJHGiojbJqZImHyGbBTsc769YzHnIilqxap80dUYJJpitHV9DSFp
	 QyK+KnXP2vKbqZBUKBLZtmzryX29/iDjt/H8OP0uUySVkIag3tJpdMFVZSEVaFENgomKA
	 YUnX9GtUDU7O4kVU0TFsqnhGz40x972I7QL51j/vq7atsu6ouyaF9Nq8YHZ+AMHsorQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wcL38tub;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DDD606A31C
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 22:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83DDD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wcL38tub
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so362775e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 15:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793311895; x=1793916695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3qbCVY70IGSK3kVBC6Qw8VcA8OjZRClUiqwt47D/E8o=;
        b=wcL38tubVKe63pYd70WVrVG1+XwO13GrLIXESOPZeWUNLjwI5GZoWeDooTkzHRnsEj
         cLJfPjUnCIPv+8o877nGkkZmqqqpv9bEZBWvUu6b6uoDKNJNOC1YLWGG3+7kefCHIdw3
         NvbulvR8OFOdXnkUh1m6T/0fwFuD13mTIr8YnPP04Qa54WCNlGaWoIpl6CRBcjuYX9JY
         bZGHY/0y4EPZLAuP2CXFyJb/DvBpKP/h9ri3feN4GpHlrhopyA2t8Kjj4Cum2XfHUVG0
         02cCzQQ+BprU8HGJHDQpLtzA6dReJI+iqlHICbVV/fRmvG47p60OdUg5wVW+d/UWrV8w
         QE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793311895; x=1793916695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3qbCVY70IGSK3kVBC6Qw8VcA8OjZRClUiqwt47D/E8o=;
        b=ygQhhqaf0vIq8xXKt7zA6E2bQaIdoV1bA5IkC7CyN9vHgKlGarYnDjEW7u8sUnMI8R
         dx30VoCV1ivSGadE3C3R312XvsvZepMGVJ/uE/hzS36uvesymHIRfXy8NtOenk8PooYI
         9hkqSAlPf6EwA3eXdBG9jDRImwOc42bDyRvt7QhPSWo6nXV2H4MPS/szFaa/uTkdaMDe
         K+Hh4Ai5rysV+IH6crTpa85zF9f70/7N5ACBMVQsbdjG7DoI10dF1vW+LR2XSQ7ANPlZ
         SyP1Exu8X7Tra18WeUCYc2rgdMYgqSmtIBlvSF3AY6xjXkk6lsIp0E7Dctn7wqHHvLw3
         62ew==
X-Forwarded-Encrypted: i=1; AKwUvBzjz1scN+eRy9kw0RnL+qdZW4rncc8FmJqz/awG7K8aQOw80ZRXMUnKlMys2uS4Jbvk+lmNZwfXvfZXuKtAoBI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLc+t31bYqUe6MRHz46iyDtLRTtAk/9nOB6rVxCbWKqedHi3Vq3
	LL/IzZRW+BE7v86230fpnK542KyRJYZtSyJGDsGYGOkrfbjN4DOzHS2S
X-Gm-Gg: AYBFou3dbNLCpjZ97hFttRs8gdGetSIwd7zb74W1yLoWuWueKcYvkWCjpIz6ae0gHbK
	NjKmMUUdFSnpPX7tPt2bVIW8C4xej0rivu7YSeTW/K6L0p8PQ7shkm/uIBub8EFsDx3P/AtqkUT
	45S08jShfbhEBbOv5cAbK4JJTXxFKwQlY6NciC+Gz+mJ55rDuHHGAGfI5zSut+5p+zRNwouu1Gh
	rcuaHAb7j/t91jjkhNZVxuL7a8rE+WhZNMu8EmpBXbIbjGLvgyEw01B0bdT4TKCaVMn8a/CYOum
	2PkqdH+z0TYFydw0fyLhRHUEhvip+5ABmY0jEfq6j+IAc/PAGmOTe1M6BXZ/EoS4Al+6gOkj6OE
	MYBR9VeYzAvtdwJWh7fWoY8LY0m9EyFjcQUwfk1ydVed2wFB8vAviOSOjMvsRXmiJX/2m+0qWrT
	4i0yNDqcc0NNpYqjBLqFCdugd5BI/hV5FQkaoKAQJ1+Sum+hr35765/2rVdSBHbgmmEjjjul+pq
	0ADrvx3/9R8+y0gPj4p2Z0JBnqwEtNORN3wnIzaJq7kuiVqqtgSU/JplWlD/W2lFAROwyA7Dfl0
	WbgwMqGRX/4ACQ==
X-Received: by 2002:a05:600c:4f55:b0:4a3:d327:6ed with SMTP id 5b1f17b1804b1-4ac182dcba3mr6955425e9.17.1793311894768;
        Thu, 29 Oct 2026 15:11:34 -0700 (PDT)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896fesm104011305e9.10.2026.10.29.15.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:11:34 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Peter Xu <peterx@redhat.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: [PATCH 0/2] mm/userfaultfd: recheck WP registration in the hugetlb UFFDIO_COPY retry
Date: Thu, 29 Oct 2026 23:11:00 +0100
Message-ID: <20261029221129.89068-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The urgent fixes made hugetlb_fault() tolerate uffd bits left in VMAs
that are no longer registered for them, and asked for follow-ups that
remove the sources [1]. This is one: a hugetlb UFFDIO_COPY_MODE_WP copy
that has to fault in its source page doesn't recheck the WP registration
before retrying, so re-registering the range without WP in that window
leaves a uffd-wp PTE behind.

Patch 1 adds the check the non-hugetlb retry already gets from
mfill_get_vma(). Patch 2 adds a uffd-unit-tests case for it, which fails
on hugetlb without patch 1.

Question:

- The non-hugetlb retry compares the whole mfill_retry_state. hugetlb
  copies into a freshly allocated folio, so only WP seemed to matter
  there. Mike, would you rather have the full comparison on both paths?

The other source 6/10 of [1] mentions, UFFDIO_COPY in MODE_WP racing
with UFFDIO_UNREGISTER [2], is closed by "mm/userfaultfd: write-lock the
VMA before waking waiters when unregistering" [3].

Based on mm-unstable.

Tested on x86_64 in QEMU.

[1] https://lore.kernel.org/20261015-urgent_fixes-v1-0-42796911043b@kernel.org
[2] https://lore.kernel.org/20261015-urgent_fixes-v1-6-42796911043b@kernel.org
[3] https://lore.kernel.org/20261027-fixes_core-v1-23-6f74bec9a5bb@kernel.org (v1, now 23/47 in v2)

Jose A. Perez de Azpillaga (2):
  mm/userfaultfd: recheck WP registration in the hugetlb UFFDIO_COPY
    retry
  selftests/mm: add a uffd test for re-registering during UFFDIO_COPY

 mm/userfaultfd.c                             |   4 +
 tools/testing/selftests/mm/uffd-unit-tests.c | 105 +++++++++++++++++++
 2 files changed, 109 insertions(+)


base-commit: 24d45a1475dd4c671feb1df705f67ef2fc293969
-- 
2.55.0

