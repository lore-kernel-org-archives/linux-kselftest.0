Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D70B4766A8
	for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 12:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045019; cv=none; b=rpgKQ12KVovKwZ8YiO0dCaUKaUwOjgbqscANZ9rd3XZCIYzyvoKlVt8Wf2Uoq8L3NJGwZBGOMSplASIS++ZS3hRuJU08Kq3fnEp4rDt+wj0lq3XykbYTmX21ewp7g5hMPMspFJs41OVoWMpii8GEJbOaAkcNGUVWCBquhfNzLN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045019; c=relaxed/simple;
	bh=oJDx02QBjgsUudphGfqnzaLMDriPreO77tPh8ouH7rQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r9TJKpCHYnZkbm4vPM5CQqINPDw9+hUESdjnhNgj6BHz9Q5mByC5f2nRmGhTeaobluSmA0XofrIKY0XB6/+z7VI+TZahpxjXK/t/GhiuVcABQRZfnFhwroxJW0T4tKiAgLI7G8IDS+ZyDnTGvGx/ofEukW296Lk1yyny+LCDCtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P8azFBTG; arc=none smtp.client-ip=74.125.227.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P8azFBTG"
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-39b2ad83680so2892659a91.1
        for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 05:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045018; x=1789649818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CKchm62sZ86IgrB2SwATbeij5NNcxRfyf4EvG63ewTA=;
        b=P8azFBTGaE+wpjInY2JQnJuaozk6oB67P9/Hv3RKgpw9kqxxj0G5vJESPByqB5rqN4
         +Z/wDFRHoDI/oN9DvD93x3wYLV8x8nn4hnDQ+Y1Gtw7UbvgBtVi//qLj9sbtfhW0mbyh
         P1WjNiNIuWOydg6acrDDUlcA3Yo1xuo+a1FD3iU9acOqDyv6F05VX5tshzTXp2pq20ti
         lqlWqaPc34KqmPUDgGJoSIhdT4GJjW7xyOJU4Z9n6osf2jcIfyhhPQTNVsFcPyKUgo8W
         NVFyWkOOgAJXMFLX0yxibXDS4EwV4dX1KmE7rynBtZb4u5eysWJoKbqcufQI9KBcIo/u
         pA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045018; x=1789649818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKchm62sZ86IgrB2SwATbeij5NNcxRfyf4EvG63ewTA=;
        b=nP3zYL0q8GsyCdky3184euIFBmSLKIxULsIyU1cfK6mwxqnkKMTQfun5PPf1aCy1QA
         vGGC5aUiBJgmdqkjFoVcHXwswNd/cq6soB5S07Gpb8IJQyHa5tgNXrs8AB8X2mH9Flyi
         WE9d2iI6to22JRyvTeYHsn1vI25ir2HDfQehB/+/xTRhf/JNthPnLzXKNlmes/o7NdcO
         Roa3skrZokkuOQeFJh9OECydCr4smJpZ/51nF9ey/ElIJ7JsB2p7/X/9TuHiFnVeyduA
         VS/4yCKC9N0wMYaAMlvNM72sud6QsVLxBjZhSSaTv6OzXjInEB2AHSQ+zmTtqWS47YcY
         DI2w==
X-Forwarded-Encrypted: i=1; AKwUvBw1zSJDiLcmKDiqLd/TD3Dro4YRneHiFpTUDU+Hn9IhVUnk5TTjwUoPFzKNLOtej362MdsMivipAZfHb7HPu7o=@vger.kernel.org
X-Gm-Message-State: AFuF++n8rP755MVmXRn0gsGEXTHWyXIIDwPlkgRYrOZspcgLkfhdVTly
	cdfCe2ouKhw6lIxQbtU8U2YP07C53S2ZwSEYjJwumyt4MW5vHaxfVqN9
X-Gm-Gg: AYBFou3smU6eEyEMrjO91t5hQZwp9umQUM+PlbbAHVSpdLwWzPyH7ktacOUHlRDoKio
	RBNF6GJ3D2bmfT8rC1IVkvXHdtbx/iEs1pefME32U924qRlIjbTMA9zHTZFAjrFOTSTxtRcIO89
	Aw10lAn6AKWYPLRUsvnra00shK53KDXb+LWaIcXPDD6GztpHd4Wh3UHo+TeTF7YfefDGxp02Tx/
	bfUdtuwb8uqIiJhNJVfgfNoUm5WRUfNXRVF7S9uOMAy5FcpOQuzUiDvE7xiWBL6exU4OfKwp/+B
	iBRY5wROMih1wE+YNkGWF3jLavvhhWRPolEFle4TuBb/8rU7sZ7qVyaFmdnmhsUl6SFj7mTECFu
	GXWx4uxk6a37kUhk2cOZIleQ7LK0znIYCl9rbzYQspKiei2kTUFSTV22MeK64QVgYQMhoP7BHJk
	i0yRnDeoRGizTrP0HSeTyQC3ACzlPwHDr/koiW4uNWNIN5bfkSC8jIXdbrjA==
X-Received: by 2002:a17:90a:d44b:b0:398:d93a:b343 with SMTP id 98e67ed59e1d1-39d709e7326mr12383992a91.3.1789045017611;
        Thu, 10 Sep 2026 05:56:57 -0700 (PDT)
Received: from fedora ([69.5.53.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e9014cbsm4800488a91.16.2026.09.10.05.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:56:57 -0700 (PDT)
From: Tianyi Chen <diannaaav@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joel Savitz <jsavitz@redhat.com>
Subject: [PATCH v3 RESEND 0/2] selftests/mm: Validate selections and scope memfd_secret setup
Date: Thu, 10 Sep 2026 20:56:43 +0800
Message-ID: <20260910125645.285866-1-diannaaav@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

run_vmtests.sh can reach test setup after invalid options or category
selections. Its memfd_secret preparation can also change ptrace_scope
when that category was not selected.

Patch 1 rejects invalid selections before setup. Patch 2 gates
memfd_secret preparation on category selection and executable presence.

The patches and commit messages are unchanged from v3. This resend uses
git send-email through Gmail's SMTP server to send the patches inline.
Before resending, I sent them to my SpaceMail mailbox and verified the
received contents and whitespace. Both patches passed git apply --check
and git am, and the resulting trees matched the original commits.

David, this is my first time setting up Gmail SMTP for patch submission.
I'm very sorry for the formatting problems I caused and for taking up
so much of your time. Thank you for your patience.

Changes in v3:
- Initialize VM_SELFTEST_ITEMS to "default" before getopts, as David
  suggested. Only -t changes the selection.
- Use Assisted-by: LLM in both patches.
- Carry David's Acked-by on patch 2, unchanged from v2.

Tianyi Chen (2):
  selftests/mm: Reject invalid test selections before running tests
  selftests/mm: Only prepare ptrace_scope when memfd_secret is selected

 tools/testing/selftests/mm/run_vmtests.sh | 28 +++++++++++++++++++----
 1 file changed, 23 insertions(+), 5 deletions(-)

-- 
2.55.0

