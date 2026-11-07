Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794070631;
	b=CXdLXbg2w3CWqDbWTcvp1PwcqfOmTFhbWOoWghOvQqD/8kX41ssQPhNcfZ5cv+r0YUE1
	 PZAmzEcxsBt6ETcvCuRka2dUcz7ehsE27d6dvQqu415Nr5SFAA0LXRuny0pb3lTiWKcug
	 P04ljbjkdkSFOH+C/JfVPmkWOCULnU2A2560NcdWRoeqlvO8bObOh2lVK6omGXBevL1xv
	 fjVVFN/MGBXPtfZRFdom0bbEy9aSEEfn2rs8Fq3jrUPaHdwipvXoCq3dpR02rs2oYBbpJ
	 7gD8ELkdP0Xx1uyctrzwge77wgD9w26zkxzQvgV28B2pV7t8WouNM7R8qwjRbLJPeaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794070631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=1IdYFHcguOld1djjobDM98S66C+vPqesPppAzQD9DKs=;
	b=IaSN7kNZGCW40k91tbSp+7MGZvUj8JTKJUCSwF+JlnWgItaqUC+38O7RNbhe0f6/38IG
	 Lu1DdfqZHVi/THOZlaRx5Eno4h8+6PowIBeCJmbyqXhjgBwKXFbLTVA1M6diA2Yiu9rYW
	 OkvLkEXhyInkojd5HaH1GmnchMbfGKOLiayzTIusAsecIe8LwS3b09HLb38Sfl2j+YmXH
	 uwRaV/n3FMqSjWL4rZZn0Hy9q5FK+P+i825D/whAPzI8VvwqJ5K66UuWSHAvwfsYZjH7S
	 p3Xxw73C4O38JIhbw+hqoB5HVMQozjOmdCiUqdlmjKjhxZLMCkypn240jDqhZtqIRRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=guMlP7cD;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1D5606A32C
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 16:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF1D5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=guMlP7cD
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a3c08d6928so2896440c88.0
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Nov 2026 08:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794070630; x=1794675430; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1IdYFHcguOld1djjobDM98S66C+vPqesPppAzQD9DKs=;
        b=guMlP7cD0wMcrX3IIeZXBLsOONiyXQDFzBRaZPKxgmQqZYs4SQ8hgoRMx/6hYWlU8W
         Fy6lMRahnRumImA1QmpmM1Z5IoiJmLdjzY2yWSzVoOPmTdP3VTPoW0D+gY1BdiWROg6J
         IEG4fwyBVUx3OztWk9PlrTVG5WZDphw4FS3zYLq7piiZKbhBIPHJeVFTW/PZ1DhHbnGL
         3BeACS2eXp71lIbytgiAyPuP9r2gSRaeT58C6N7adf02R+qDA6y1Xxm2Xz2P7U/utT1g
         /Zd8PmtecDQJs5rSum0E9m9AnuyIeyy3DJTcTWYFoJjgICZ0CnkmJC0ugjqNp19JpbVm
         qHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070630; x=1794675430;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1IdYFHcguOld1djjobDM98S66C+vPqesPppAzQD9DKs=;
        b=YaM9449/shlxYQmkZzjY3WjEa7LWtOl1UTqIn4PGlgekHTo2LdnfIto2cYrbVg5p65
         MCH8y+vG5h+A2OkZTUFnd9Qf85vzLuWFDLnGF1WU9A4oupNkiMBW8CMysqIsZXaFp0Gk
         F4hKaqtlKmKPQzxgQ2M0HSD9OPZJmvSJ8SPG+mJ1THHNarsx8FPvpUG+eC5dV5lrwEqx
         tdpyDkCvM36ijXRCpCZtDBiLJFLNMWOUWY3GLKA42fgRvmbwbXG7wvvfZIUNUDRtuavM
         6+8Cb16ipapPBqKJW9BiI9B0RdR7DDl8mTFnW51xjhRrsgGJ+KwY/jmUbHm3Ix/NTG+5
         oNvg==
X-Forwarded-Encrypted: i=1; AKwUvBw4SevbLQs4nzkiCieGYfpXeDAR/b9ALSXeGNIiqFdQPAaZ+/Uj3AXBYXLb4WY84z5IHYM+2jweK4YS3kpaBog=@vger.kernel.org
X-Gm-Message-State: APuU4Z9e03QCX61KTHaRKNA2ybQrXV+URBlxyKu96Se11nWnrvrCDkDf
	OAh2LgzQrpL2Cg5vq7+aBOPfiuBZH3LTv4fcEyGH2Cqihs+OuGFZjPut
X-Gm-Gg: AYBFou2unu1x5mTTrZgjKV3f3W+grzdCDXPfWyx9OAtcaIoBN0hVlh7/tZq1XPl0of6
	FBXv9J/vgp8rtH5Y5kNURQZp6mOiWdXN75qvBbpUzzQc9bQUo3I7bPvHtdMlzQwZoYwsEJk7971
	uX1/3Y+GyoimMPsf+u0mbk2HKNOciplI1M9gWb4PFLhV2FQx7yJUry8+5K8ODQFtqEMhTNI5d6G
	U5EXhZtX8lhNElysFdsQdmmw9Xn0yoW0fYMcNNiIQ8Hbri1BSx8HtDWS9GeqBjQI82vHHlLrCC1
	1DZ0RaPSM1H0PP7SY1ofpu4w8rZ76IMe6fryaiLrG1e5Zg1vDBXK+kkiyvXnOIFth3ejrNSLwhS
	b/ZwYcjPtb8tolB1Bk+1xv6dgrQSWWKR0+Kc5xkwsI5PTDfsCRU/JELWev7jj3H9W574e4oJY1k
	S3Q6XzFFMVW3RvtcPr7kQvN5CNhWrsY7fYfFxtCiDgNIvdmZ1b7vlV4Mtwf7nQhWXecWPDOjLBd
	M6GVmwAf4cFx36AXJhZ/vdLQwyNavjw22IApUp44c6if2IE31Fi1MjLLBbgcsidVJ/HeG0yrgH0
	C4CYyyMZq3z8PaF3HWdktkCa
X-Received: by 2002:a05:7022:c43:b0:1ac:d029:70cb with SMTP id a92af1059eb24-1b25d36f29amr7174636c88.30.1794070628979;
        Sat, 07 Nov 2026 08:57:08 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4b4aa7sm15456126c88.13.2026.11.07.08.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:57:08 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH v3 0/4] mm/ksm: keep smart scan from losing duplicate pages
Date: Sat, 07 Nov 2026 11:56:59 -0500
Message-Id: <20261107-bug-mm-ksm-smart-scan-align-skips-v3-0-16d5ce8b5fd6@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAFtY72oC/5XNsQ6CMBSF4Vchnb2mrVCKk+9hHAoUuMEW0otEQ
 3h3C4tx0/E/w3cWRjagJXZOFhbsjISDj3E6JKzqjG8tYB2bSS6V4EJB+WjBOejJATkTJqDKeDB
 3bD1QjyNBVXNhM1NoXRgWnTHYBp/7x/UWu0OahvDaL2exrf/oswAOsilEnatUqNJeWmfwfqwGx
 zZ9lh9R8OwXUUZRmyLXvFQ6Tb/EdV3f/tmrZyQBAAA=
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Xu Xin <xu.xin@linux.dev>, 
 Chengming Zhou <chengming.zhou@linux.dev>, Stefan Roesch <shr@devkernel.io>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

With smart scan, which is on by default, two identical pages that become
mergeable some scans apart can stay unmerged for as long as they live:
each page times its skipped scans on its own, and once both are old they
may never be looked at in the same scan, which merging through the
unstable tree requires. This was first noticed as intermittent failures
of ksm_tests "KSM NUMA merging" in run_vmtests.sh.

Patch 1 picks the skipped scans by the global scan number, so all old
pages are looked at together every eighth scan. Over 420 pairs made
mergeable 0 to 20 scans apart, 361 and 334 merged before on two boots
and all of them after, at the cost of about 10% more ksmd time on memory
that never merges.

Patch 2 documents how smart scan picks the scans to skip.

Patch 3 moves waiting for KSM full scans into a vm_util helper, and
patch 4 adds a ksm_functional_tests case that fails 20/20 without patch
1 and 0/20 with it, on both boots.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
V2 -> V3:
- Document smart scan in Documentation/mm/ksm.rst, as Xu Xin suggested
- Wait for full scans and switch smart scan through vm_util helpers, as
  David suggested
- Rebase onto v7.4-rc1-345-geedaa7d61f1e and retest there
- Measure ksmd CPU time with schedstat, which puts the cost at about 10%

V1 -> V2:
- Rebase onto v7.4-rc1-132-g05441d697f7f and retest there
- Drop the ksm_tests -N -m 1 numbers, as it no longer fails on this base
  without the fix
- Update the ksmd cost to 10-12%, measured on this base

v2: https://lore.kernel.org/r/20261105-bug-mm-ksm-smart-scan-align-skips-v2-0-8a9780b6844e@gmail.com
v1: https://lore.kernel.org/r/20261016-bug-mm-ksm-smart-scan-align-skips-v1-0-2f91d76416be@gmail.com

---
Qiliang Yuan (4):
      mm/ksm: align smart scan skips with the scan number
      docs/mm: ksm: describe how smart scan picks the scans to skip
      selftests/mm: move waiting for KSM full scans into a helper
      selftests/mm: cover merging KSM pages aged by smart scan

 Documentation/mm/ksm.rst                          | 16 ++++
 mm/ksm.c                                          | 24 +++---
 tools/testing/selftests/mm/ksm_functional_tests.c | 89 ++++++++++++++++++++++-
 tools/testing/selftests/mm/vm_util.c              | 63 ++++++++++++----
 tools/testing/selftests/mm/vm_util.h              |  3 +
 5 files changed, 167 insertions(+), 28 deletions(-)
---
base-commit: eedaa7d61f1ec8ae053a9ece0d553785350ac486
change-id: 20261016-bug-mm-ksm-smart-scan-align-skips-cd01e5a9889a

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

