Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871383;
	b=Wj44+WLASTIR+dTEljU2NOO0Wg2Xd+NlLnd0et53keQ6exmJ8DtxWn2C/vwaEPnZuTs0
	 QPHEXeUJsV/T3lia/ZcWEklAWq4rrN2YgB8zRfadxgsp8YArITcOI855O6KCwfpV+DfSP
	 1z1WhpSWJJ9BhkI1YLwprhu5S6LUwSWR9fbzF9BkxXki3/e57CQShiS9M+seKssJM+4nO
	 7sAKXw2pSqp8737Pv9rJWajy2YrVWmnfaQrC/wIL290TiS/mmNoqiGizqiAd2sZj630lJ
	 BKEO3HZ+z6R47u4a+/PFPcmJGCEwnbdCk5lgXj6wqsjdjwCifMbxiQlYZnPyZMVjZFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=bUmMuvID2ld5jATMeQfYWENf+3/lY3puiHjow/VO3i0=;
	b=FYMfatabW/kpZbKidDfxlreNNZQxz5h2ZGJSzzv/VTRYmnq7AoDIO8AcHdM68FCCQE+D
	 9X6qczXiDAtEEO1ahOTY2oRh61zvbYTlVQZ3msyGAw8H9Zld3A3xSNGXSvpzrJBHl4zcy
	 u8UmQgpNlU6QdeKxkVr8BXqNe7ciC7jH+7iy3eOG9qfnFeM9VB75uAbkxjRz5Q9RYX0Oq
	 HP7g0k8IJGSAv4Ya4L2g2o9Pl4WqNnFo8MgVaHRRu/yWujYgJP8XC0QMG64IyIg7fMoai
	 x48vybZ6crHLCUmhpGWB3SozV/pumLOj0AzWM/9SFV5cDQKwCLZ3w0sdDnHfuQZ1dsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GQ5ti9YB;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C954B606A333
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 09:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C954B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GQ5ti9YB
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2832239eec.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 01:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793871382; x=1794476182; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bUmMuvID2ld5jATMeQfYWENf+3/lY3puiHjow/VO3i0=;
        b=GQ5ti9YBhBLI8rca5O7j3/fF5QvsVbW6Z4RDVHVtwtvTmFEQlkMueeEQuY6zWQMgds
         R+Y8kJ7Y8f+ocmBcJaxc+drcuvEy7wg2sfmsXWgYdkGRWEhEbWlUIPKLZWwpKM/yCsJU
         tMOriLanhxNqfrNHNy6yW9IwrFam8I5vrmBgk5zp3uQwrk3nxkqyilWJK5HdfhZZJq/u
         rZBvmIlYo4DtB3ViM5Yi0RnmqA9ygHJR8S7h6ymb6H3T8Yt7nor0yN0BXZFSBXulNzMX
         AxKBl3axpEDLlqyz0BbFDyL4jaU49iiXtuw3c4+x1uaeDrUzB3oskEgAOlaV1Q3Lo8CK
         g/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793871382; x=1794476182;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bUmMuvID2ld5jATMeQfYWENf+3/lY3puiHjow/VO3i0=;
        b=2UkKXzilcUztLX7l5jpL61GwQIKdSglVS3XR47Jcxk4Twg4nzmaQUSz+Aqtw+JM8+9
         RZ9RdGAxhDwUml75c5PSmMIJ26mYRCBULA2VkgZhpyAsYLjJtEapz61TnvoY/w6NJ/eg
         yUhGDIJAAqKyOdlLeTii+vVUe6FiFookxcZrzrXzQt2PuVZRcmlCw4nCW1nkh/GJ6ST7
         +SNbq01/sEcLAAlJdoAZos5kPiKV09LsDerJYZWdNSsmiuH4cPN6bYyR4+2lYjN0v8BR
         pveko7L9YTNLLQ1917wFRzcuf2TV7w8YHTyMLZdo1+pVZbhya1mhyybgWiIyW3nWiplC
         rgSA==
X-Forwarded-Encrypted: i=1; AKwUvByqnjsRfPHqLQu5jtqSU9eOLyOIDAc4tQJtuvBir42MBvty792kWco3ruXtsNXHtbea1CXlwjcV12krtA1Wi84=@vger.kernel.org
X-Gm-Message-State: APuU4Z96RtGJWFq2f1XWHlFAPcRF+LVBbo4g8POM/nWqQ20/IAsKXL3Q
	/tfn6j4VaH4+O2M8O2QUdpdG4opTAe5xx7BWhR7jwpBfWMlZ2N2QWWsc
X-Gm-Gg: AYBFou2LDWn2tUAw6VT401hYYMLo6GY4DxtFx2FP4EhyKHjB55XGf0+94+9o04eeJHb
	w3YapgS2DJiNKJ7HLoX9Bol+EkKgvvCaRBEKCMwmJDrr5GK9j5WtjFQ4hRj3Yjc0gileYICkbln
	RUj6aCIBv4KacuJES3jpHM49+9+E53tGnJvVg2yvg5B5T/bxC8J2JWJuj/4jYY1PRgIUGxN5mzi
	xkIVLWR2Q1YpYqByvMxrQECSwl8+y0575IcDAmRoupa1melnkQvdfBt3qds+okH+4amn2FR39TU
	VQpidSru+ZtwRIuCy3eobjp6kuN4TdZntM2E+Uyp0E0/hiDqaZ7WgBDMY+9dg/GiUMbJOWtIDlx
	1nAFFxTaPv/nZjEbv9frcsSnnmxOW5uaEp3JfJyp21fYMP4+8AOiClnedE5SDu0ZNhEyiXtNYzB
	IofZu3PIy/c//JXVx0gGDemUYIpHwoDfWhGnaPl5/VNlFcsV6d7/mRq0fKOeBwzb8qJhxA+P9ac
	Y4o/Pq62CvSH9mK513pwwc1cweyUMM8YqqCsx8HUTY7ay1+u4DdgBD1KhiO6xVvZ8xw/nrP5CUu
	ZPoro56h9o9YYkirU/Roxnb3
X-Received: by 2002:a05:7300:fa0d:b0:36d:7feb:8bd3 with SMTP id 5a478bee46e88-36d7feb8e1amr4402969eec.11.1793871381617;
        Thu, 05 Nov 2026 01:36:21 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38fa273sm17363207eec.16.2026.11.05.01.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 01:36:21 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH v2 0/2] mm/ksm: keep smart scan from losing duplicate pages
Date: Thu, 05 Nov 2026 04:36:13 -0500
Message-Id: <20261105-bug-mm-ksm-smart-scan-align-skips-v2-0-8a9780b6844e@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA1O7GoC/5WNQQ6CMBAAv0J6dk3baAVP/sNwKGUpG2ghXSQaw
 t+t/MDjzGFmE4yJkMW92ETClZimmEGfCuF6Gz0CtZmFltooqQw0Lw8hwMABONi0ADsbwY7kI/B
 AM4NrpcKrrcqysiJ35oQdvY/Hs87cEy9T+hzLVf3sP/VVgQTdVaq9mYsyDT58sDSe3RREve/7F
 /QtIFfSAAAA
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Xu Xin <xu.xin@linux.dev>, 
 Chengming Zhou <chengming.zhou@linux.dev>, Stefan Roesch <shr@devkernel.io>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

With smart scan, which is on by default, two identical pages that become
mergeable some scans apart can stay unmerged for as long as they live:
each page times its skipped scans on its own, and once both are old they
may never be looked at in the same scan, which merging through the
unstable tree requires. This was first noticed as intermittent failures
of ksm_tests "KSM NUMA merging" in run_vmtests.sh.

Patch 1 picks the skipped scans by the global scan number, so all old
pages are looked at together every eighth scan. Over 420 pairs made
mergeable 0 to 20 scans apart, 329 and 317 merged before on two boots
and all of them after, at the cost of 10-12% more ksmd time on memory
that never merges.

Patch 2 adds a ksm_functional_tests case that fails 20/20 without patch
1 and 0/20 with it, on both boots.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
V1 -> V2:
- Rebase onto v7.4-rc1-132-g05441d697f7f and retest there
- Drop the ksm_tests -N -m 1 numbers, as it no longer fails on this base
  without the fix
- Update the ksmd cost to 10-12%, measured on this base

v1: https://lore.kernel.org/r/20261016-bug-mm-ksm-smart-scan-align-skips-v1-0-2f91d76416be@gmail.com

---
Qiliang Yuan (2):
      mm/ksm: align smart scan skips with the scan number
      selftests/mm: cover merging KSM pages aged by smart scan

 mm/ksm.c                                          |  24 ++---
 tools/testing/selftests/mm/ksm_functional_tests.c | 108 +++++++++++++++++++++-
 2 files changed, 117 insertions(+), 15 deletions(-)
---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261016-bug-mm-ksm-smart-scan-align-skips-cd01e5a9889a

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

