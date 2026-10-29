Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793255083;
	b=pQTt8JylPG5uIJAaUy1RGaxnxxO3HgYOqBQuGDPk101+dF/Px2+Su+dCO545zM5Wp8oJ
	 A56b7+UyRY7S7FOk66xvR6lSk/M6T6TdZXGuUN+PLfbKxgXRhGCub40MYL4g5ayOh1U/u
	 Jsgh7XzwZksYKCpOuqq30ZpvWQQ4HhtW61AUbqz6J9xJQBhAQ1Mzc63nuT8ZKBjioXciq
	 puk5pCHH/KXxL6MYcLDAtIu3j1VE9B4C9gV5UkSdaPnAKZBYgGtC6Yy7sKyVUjyXQcI8O
	 Dha5uSED6m6rfNfvmqKTDqRdYZdGQnrUbDfDHCnw6XUcjvPVR/Ompbh1goimqVMyxCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793255083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=3bbEEd0YswyM9gjR9hkxZR+uYtqrPZWlSsQUrKIRuMc=;
	b=J/BP7bx7M9HGBCLiStzHPWQfMAGByspZ9rOG8OquuAMLqn/UgGL8DlFsmQq2nsdal1/o
	 EqLEfnVuL5LWWFzp1SxXgmS4DtXZWsgUnKgI6T2NRvgFD7WvxmHgqCld1JQQIgoLYe7uY
	 Kxgcxf8uEl2NFvQi/1s5WQ1OiAq6BDKw97TX1IKWjZJwdQi0DBAT1y0Z42aTBLSslzT81
	 D5Yq+Vq6fSLf6EzdbI7ftf/o/ZFPzr5ePwUO267fxwLb2NMnM1m0i+M+Y627d8PSo/AKl
	 RNfMZ318Wo5nSG0x5CDNCvG2oRhhFVLZV3dXGc9oegIirNZlY2GvTtDwcQF6nsnjXIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gu0BWhT2;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574AF606A31C
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 06:24:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 574AF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gu0BWhT2
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-369f33df08eso3328251eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 23:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793255082; x=1793859882; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3bbEEd0YswyM9gjR9hkxZR+uYtqrPZWlSsQUrKIRuMc=;
        b=gu0BWhT2qDZdxQOZMvdBUbACbsY+Lom94YHjJWzAbU1Zvzm2eGC4qYA4viRyB1Eyuu
         7ibtAHkLAFLMTWCSf8xgbCLPxc1xjp4DfJSWbzoZudaQdmd8qZ3EJoCmeElSUKl2fFGQ
         v+S2rAfDgtvoqFOSyCXt7rA4aF4fKpr896fns5RDccbh368Ik44S6h867znX7oefJq9F
         xiJhkzZMQD5wWdL5G1lKPd6q7LxgW0ENocomlSsV89QyZ+X8p83aRE/+DEiwxtXyhPKX
         SjJSZs/5zL7hHOvf1zkNjuxFYkZVrkcqPHwrWzqBb1oTg1HJok+JwyiWa60EeLsh/Gkc
         DzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793255082; x=1793859882;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3bbEEd0YswyM9gjR9hkxZR+uYtqrPZWlSsQUrKIRuMc=;
        b=SMlhAp1bynKI7x58S6ldM8bVHjud0Oro3XeNs1zn/agC7SXAl21bS5hIMZ/GLoizS3
         cFiNxaZFBAVdUQyKXxxnXRlLrT4plQk34j5fGH0+c96nSZGOJqxAiQPHt1mq7U0p6E+L
         wPXVOQBk4wsYsLWqW5mHjF4VEQl1R5VZW2sski4/gA0EANRalIg8xbLPZX5DwKfEG9jw
         yvSQ8nc390PcnnCxWwER0O2nm+oOK9G/ZuTxv+/jZ+t4L41+/fWL/XdArzyT+0blYGxr
         bJ8BS5ma2GNObywMw55EJjSfVq1zv6cfVVgCD4F8PQ43a6BKsQOUh20NhKyRwxWy1uu1
         C0Jw==
X-Forwarded-Encrypted: i=1; AKwUvBxZPdxlemAucR5BpIatVQ3+hH9OuApCm5ekSqkOrz/GSEzkiiMb5RishoL9IRRghFXH9KF3pTNDFZthSvN6aYE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkrKej00coZhmpf1H3SbvgQnTFFzTkqEkQh4jiOes1oiLeDCqk
	DLFBGF1NMSkDlSpBwpdYY2oh3Ch7zrO3vRCcS8ooPidlqKYwPCoP21R+
X-Gm-Gg: AYBFou0zXARtEIS6FRQyq39rcI4SiWnrA4Ar7LIvVVXbMxabtt8b4SB5S6BoGEBjF3Z
	lASuO3J9XwKwToebvTXZTSMh7TFJLEGHcr5Q6qOgImQhh7rOVEEYzqy49/RNIA8ekLa0/KN+41S
	MO7SMeiVicf71XhYSc+Se/MW12HTY9zuV2Wz2Bu5kpR6cmhs0Bmtidk0tyVY8yYgB+9gecVcivH
	3OsuWil8ffDJRDPRRMDEY2qqaJ7OdItSsJnxQcylZSODSGIFgZHk4otYsB9FSRelYJ9op44SYuK
	r7fGua00h5MHE2McxDaJ2tpTc564ytG0syXZJP7w3YkMmI765goUcVmWFzwyS9Fksm3dA9Q+0QG
	8SMAOCSEykKdihzDkNHHLnhXEocGp8BcKEOoCvyRAkZV1gALEYlJMaF+XyTFH4zyb/Og7l7dK5+
	LCmVI/Mm0B5ZwypmQlDf0L9qai1IV5GGRb5ygH1RRA7ahq3t2VnO/Cg9t72Nv8wY2TO/ob4rRyO
	XkkDWJnEQDJxFcCFTNIJzsDN+VB4okkq+wfBjUEQ+R30wC69wZCyq/f5aG0V19+WpqjFoPiNh9H
	S9IrdpY20XBk9vGn4FaCLvcl
X-Received: by 2002:a05:7022:ed0a:b0:144:eb46:be0 with SMTP id a92af1059eb24-1a6ced912f1mr6332516c88.13.1793255082423;
        Wed, 28 Oct 2026 23:24:42 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aa2f100684sm2152004c88.3.2026.10.28.23.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 23:24:42 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH v3 0/2] selftests/mm: run the XFS-backed THP tests when xfs
 is a module
Date: Thu, 29 Oct 2026 02:24:34 -0400
Message-Id: <20261029-bug-selftests-mm-run-vmtests-xfs-modprobe-v3-0-16ad772850ee@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAKLm4moC/52NsQ6DIBQAf8Uw9zWABmKn/kfTQeCpJCINKLEx/
 nvRLq7teDfcrSRisBjJrVhJwGSj9WOG8lIQ3Tdjh2BNZsIpF4wyAWruIOLQThinCM5BmEdI7ot
 Lm5U3r+AVgkEqamkqXWFNcu8VsLXL8Xo8M/c2Tj68j3Viu/3nkhgwUPnTalljLZt75xo7XLV3Z
 L8kfi7LX8ocKGilSqEoq0rOz+Vt2z6plHFZPAEAAA==
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
 Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>, 
 "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
X-Mailer: b4 0.13.0

run_vmtests.sh only creates the XFS that "khugepaged all:file" and the
pagecache folio split cases of split_huge_page_test need when xfs is
already registered, so with xfs built as a module and not loaded yet
those tests are all skipped.

Patch 1 adds load_module(), which records the modules the script loads
and unloads them again before it exits, and moves hwpoison_inject over
to it. Patch 2 loads xfs through it.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
V2 -> V3:
- Match xfs as a whole word so that selinuxfs and vxfs do not count
  (Jose A. Perez de Azpillaga)
- Rebase onto 6593a15af108 ("selftests/mm: skip khugepaged file tests
  if mkfs.xfs is unavailable")

V1 -> V2:
- Add load_module() and unload what the script loaded on exit (Zi Yan)
- Unload xfs again after the run (Zi Yan)
- Rebase onto mainline

v2: https://lore.kernel.org/r/20261017-bug-selftests-mm-run-vmtests-xfs-modprobe-v2-0-cbb36b014322@gmail.com
v1: https://lore.kernel.org/r/20261016-bug-selftests-mm-run-vmtests-xfs-modprobe-v1-1-b97dfc79e97a@gmail.com

---
Qiliang Yuan (2):
      selftests/mm: track the modules run_vmtests.sh loads
      selftests/mm: load xfs before checking for it in run_vmtests.sh

 tools/testing/selftests/mm/run_vmtests.sh | 33 ++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)
---
base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
change-id: 20261016-bug-selftests-mm-run-vmtests-xfs-modprobe-de0697d4c4e9

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

