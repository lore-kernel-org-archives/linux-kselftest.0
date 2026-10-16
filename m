Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246B1459AD9
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 14:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161308; cv=none; b=IgkBMSiXQeXfWPD93xJvyGohALRC6fEfcm6kYUoGndZCFgTe+JNUz6xf/5+Q4alzYP3HFnomwnM00xZWI9+3ExxAdM9AMfUPCmbF4T621pEV7cNPl9LQyJa5xGk0qSnid0RYcvQNPk9UlWdF8dDt/wOVn1NreqhM8ZplL12+Tiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161308; c=relaxed/simple;
	bh=gz1raXdRDuMYeoxzMbWlo3kUM6kY7kLVnye9ACNibKw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m5CX4RpZT3Qfhl59TQBrkarqH62k4vSIZ0Ja37I/WmZ3+2FS9IFU54dd4KeKIogIN44bTqnmdAnYnzJ7anAJx35kPOV9vcmAS5NjsK++whsJTzYptOiV9VMcEIuOuV+chWPg51FVJg7VoMkRw3GcXwsJy1nOtJNxXLH8y5Th1uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KERwriiA; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KERwriiA"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35f1f76ea84so3745692eec.1
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 07:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792161306; x=1792766106; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yc3ap3MWdlDha/MVHspUrtH+yCZz2kVrPVlYau2goN0=;
        b=KERwriiACVOpvM73DhTZJjDpjg9FlWH7VCI3eK9c0Rsu7BsVMFg5m5eTVvxQGdSqe/
         3tF0ePCiaLiq6Q3mmjM2vCB2kTMTwR7ZFVQFZOYSHJx3yTj9fmOTFfIVb99BtEVet0pE
         sOTVA5k2VuZgSDxVuIfAbQ8Av51AAghF2op6h7V2frKdbNBU0brBkHgg6CceU+l4b513
         NlHNQ6bO9aTATuDWbsdsgMXsW3uoXrnAS0StDsAB8ipLZFCJmKnuHslvkW1wvtPWnDIS
         2y7EpD16ZqauSt+bdDz8DkDiBFH+YNaye/KDn0z81Ge78gEncCpAvaXBwawCnTAMGt97
         4oTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161306; x=1792766106;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yc3ap3MWdlDha/MVHspUrtH+yCZz2kVrPVlYau2goN0=;
        b=IpqoVFpx67kDHWnNLB2tMAcRFEuH8MAvdy4WT9ooFnF4hYwcvVrIxFBzVWq//fY/O5
         0t9DeO3Jb0CBw3qOwn1PbeCoGwcjeiACpAJ6eS5AAcaHdG2ujWNvoj0E+qk4iscjnpZ3
         JzPswK1WqudEeg6xSNzszNFk3GswI/+3rJ+e71UCTOeHGeZ+apEIBh+CHZ70qIsiub8E
         KTawaU9uI1C1r0QJBZXY98wyEt6eWfRPBb6YJJMgO1O//aP6LG4oVima2jSPl85D80zQ
         TNZoufFw2Q96mTB43nFhJNSOMxzoyaRWIcsul36mcph9ewtjgc207AhC3G63Zc4L/dSe
         IOdQ==
X-Forwarded-Encrypted: i=1; AKwUvBzltRTvy34TaQyx00CtkA9WunUFCBKAqvAVvPnoWyCD7lFFhIS2DcSJsuQmIwFTKgRTaF4pobZQfCOv0HDb8Xs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLstSvfUYRFgNRoaz28U1ghHSFr7GCF1f9tmNt8QRjGLjv8iTb4
	B5THd9l3lo7gYTkdMfL+ZTAML65TNgMHU+zqWWvQTg3sgTpvOOBhEj/s
X-Gm-Gg: AYBFou0L5t8LgBwYYTBsAMfeOJj++2L5XfaZnRKKSM/8PhYmK68H5YrCAOqPh0ImfCy
	ftH+w/N05GVv+LJcDJUc4unRvRaktyxHWFbZTpmxPqpQ4jRUOWYXez1pOfYO0ISn1dgSnO7I/yt
	MHWe31yNpMYRoik5uPIsfS6T7gvE4iQjg8DkZH/VlTBvtjya4ebxlGoABc5UrQ4IkHGEh2eN1Y+
	0QUJ2Bh5XRcrzujIzCevlgNAlquQnUwMKD5zRJk78XuUjz812LzH5O4uuuXf+kjPwhRocGmwdOJ
	dLHl0gzlB5elEx+p5+2EjAZW+WbOr0mQdL6vot6dpM3kVqP57Ip8/Ar+RTK5z6O34IyYIOOym7q
	liXJw8UYG2YyZpTfecoy6QmS3TfwS3S0NglZVL4J3mZ3+g5dmfDL1JcJGnaX526WgA6GON6VS87
	2AmVk3Cgw9wUAXSd9cqICzxPSGtRRBVVQEbNI0GiPH7CYg4i2nRLMxsmg3od62zVkD9CS7b1+R3
	4Ax1g==
X-Received: by 2002:a05:7301:424a:b0:35b:9bd:1435 with SMTP id 5a478bee46e88-3619ea236e5mr34190eec.2.1792161302290;
        Fri, 16 Oct 2026 07:35:02 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608297f4f7sm7611812eec.23.2026.10.16.07.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:35:01 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH 0/2] mm/ksm: keep smart scan from losing duplicate pages
Date: Fri, 16 Oct 2026 22:34:55 +0800
Message-Id: <20261016-bug-mm-ksm-smart-scan-align-skips-v1-0-2f91d76416be@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA820moC/x3NQQqDMBBG4avIrP0hESraqxQX0zhNB5tUMm0pi
 Hc3uPw2721kUlSMrs1GRX5q+s4Vvm0oPDlHgc7V1Lmu9873uH8jUsJiCZa4fGCBM/ilMcMWXQ1
 hdl4uPA7DyFQ7a5GH/s/Hbdr3A9Hmhv9zAAAA
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
unstable tree requires. This showed up as intermittent failures of
ksm_tests "KSM NUMA merging" in run_vmtests.sh.

Patch 1 picks the skipped scans by the global scan number, so all old
pages are looked at together every eighth scan. Over 420 pairs made
mergeable 0 to 20 scans apart, 317 merged before and all of them after,
at the cost of about 7% more ksmd time on memory that never merges.

Patch 2 adds a ksm_functional_tests case that fails 20/20 without patch
1 and 0/20 with it.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
Qiliang Yuan (2):
      mm/ksm: align smart scan skips with the scan number
      selftests/mm: cover merging KSM pages aged by smart scan

 mm/ksm.c                                          |  24 ++---
 tools/testing/selftests/mm/ksm_functional_tests.c | 108 +++++++++++++++++++++-
 2 files changed, 117 insertions(+), 15 deletions(-)
---
base-commit: 437a7e839def0f505277022622fc59a8b071d6cf
change-id: 20261016-bug-mm-ksm-smart-scan-align-skips-cd01e5a9889a

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

