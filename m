Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E189B3CAA3F;
	Fri, 31 Jul 2026 10:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785492836; cv=none; b=tTCrDvgPPkBoJI5hbrazzlqTpVpuAzjyRp++cMvZKU1bZ46ewef8Cb8NgySOL/Cp4alhH1W0DN8YDv4wyC/04LaT5liFhopk6LLlsvYbWPl9pJoY7LXTMBps2xgNF1Sv6yL7P56Xrq0V7UIj4IKv8XqipPS9eVg89s07kuqusag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785492836; c=relaxed/simple;
	bh=yushGXHZHDaSIkXcWCwIaU2p131csUNRGVUynS0/D8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O6IaciFaul3lDYOEtx9RqsMgIcbIWPpKYi+NqEY/E9Ogc3yVuoNhbBVIH/DFcuZA0Y+NLsmBUcpi2MNOe/+FgtNqRilWZpaEqM5anU0tVmO+BCY8wshiwyAXtUlCRMG6BkpvTc2QeCFK2LtOXe24xqOpGLQ/00fv0l8izgQ2Y7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=EFFE+9nM; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="EFFE+9nM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=xV4fEJeXNzRRTz9eyzhHqxzd2ssVnPioX8g4LZc5jns=; b=EFFE+9nM6xVpiuj8tLWcGSG3QK
	So+ZKmIWLcq7SzyIVr+PhfO/kMpiQSIoyVCxtUZTR/VFza+ivXNDfsif+3EUOfD4IJE4mGjRbXkMA
	8uPN8FkhXMPRFjpRDzSvXJbMUhxzcTBIoOCXX3FBP1/jYDf86MsGEg2E9Q1Jbxp2uzguwNqEdjV44
	cGzxb0f+CW94YTxCin6JLhxY3zLCXiH5kyGqW3Y0tT9EfUKUCZFF/r0a+it7OW049t9dmiAeWCv0g
	9E7w1ZS+f9GfzQk5n6nZpfVxK1a1qRurXXajriUCiwXW12ql/CiLFd8irJRnf2O9ZNCE/qJtOKJFr
	jchBGW1g==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wpkFE-009wB6-1X;
	Fri, 31 Jul 2026 10:13:36 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 31 Jul 2026 03:13:05 -0700
Subject: [PATCH v2 2/3] Documentation: kmemleak: document the conditional
 min_unref_scans default
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-kmemleak_hardened-v2-2-7b9689ac77cb@debian.org>
References: <20260731-kmemleak_hardened-v2-0-7b9689ac77cb@debian.org>
In-Reply-To: <20260731-kmemleak_hardened-v2-0-7b9689ac77cb@debian.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Breno Leitao <leitao@debian.org>, workflows@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kernel-team@meta.com
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=1829; i=leitao@debian.org;
 h=from:subject:message-id; bh=yushGXHZHDaSIkXcWCwIaU2p131csUNRGVUynS0/D8Q=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqbHVAkbMzz1VnyGwGOef4ZiEzj2NbeGxr5mJpq
 Mv6SE71RKuJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCamx1QAAKCRA1o5Of/Hh3
 bSlmEACfchMqlXsVkdT9/a+9nVdaRgU7yjDLJWJnQzY/f1pqyxIZVO8LKdjRhDQcjuquiFPAyK0
 iih8KXXYxdT+qjkc2o+h5QXPRA1Y/F5F/Wc8jeLib+XxAbON9LEeFWQbHDkh8crWUQd8Rrm2Fph
 kr95DQSmCJmtyrJrE1KgH978QJv6mnUfM00iwGsuF0rs4wTym01lhT6H2LWtR8g20s1dQuhXcml
 9Mt8Xj1N+y9k8Qs/6m0hdkkIE1/CT9AxXovfdTUaUzvIzJZIwv4ESXYEKaKEmbUIlvPg/6l8NuN
 sFtUpJ1KvVlFIIgZTt8VpDtYZi/eCg6fbHSqehBmU/mKhCouRBp1OUfaIcKMPiSNgR14gWkI6nX
 5/PYU1tI8QiUoVceE6xRvwBAkWYiZNXptJWZ1N/PsqLmW7x8LKzH/a9ZDBDXGHmBXiLWdhwkKrk
 BfoTjefFk4NZDwebFcgo2stmynjLgVrcyXy8koRUm04NM/2wiFNFhGcPdeGsRRiB0FTifOAI0bk
 nq9dtNdBqImemco0ADvxNLWXE2wbf3G/N289iVUqEFhfOUmjhH8WiqaRA/VPUtOGeb9OFt9n6/T
 tFn/LLSrFf7bQCFFlccBFv6ivAa+lih2Whj477mmmLtT3N7F92E3xKYp6nPistjW0+BCvuHXAZz
 8JCoNWOcFKaqFPw==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

min_unref_scans now defaults to 2 when CONFIG_DEBUG_KMEMLEAK_AUTO_SCAN and
CONFIG_DEBUG_KMEMLEAK_VERBOSE are both enabled, but the documentation still
states that the default is unconditionally 1.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 Documentation/dev-tools/kmemleak.rst | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/dev-tools/kmemleak.rst b/Documentation/dev-tools/kmemleak.rst
index a8a83bc69ceb8..d1b690b171696 100644
--- a/Documentation/dev-tools/kmemleak.rst
+++ b/Documentation/dev-tools/kmemleak.rst
@@ -198,11 +198,13 @@ systems, because of pointers temporarily stored in CPU registers or
 stacks. Kmemleak defines MSECS_MIN_AGE (defaulting to 1000) representing
 the minimum age of an object to be reported as a memory leak.
 
-The ``min_unref_scans`` module parameter (default 1) requires an object to
-be seen unreferenced in that many consecutive scans before it is reported.
-Keeping it at 1 preserves the historical behaviour; higher values filter
-the transient false positives described above, at the cost of delaying
-genuine reports by up to that many scans. It can be set at boot with
+The ``min_unref_scans`` module parameter requires an object to be seen
+unreferenced in that many consecutive scans before it is reported. It
+defaults to 2 when CONFIG_DEBUG_KMEMLEAK_VERBOSE is enabled, where the
+periodic scan thread confirms a leak on its own, and to 1 otherwise. A
+value of 1 preserves the historical behaviour; higher values filter the
+transient false positives described above, at the cost of delaying genuine
+reports by up to that many scans. It can be set at boot with
 ``kmemleak.min_unref_scans=<n>`` or at run-time via
 ``/sys/module/kmemleak/parameters/min_unref_scans``.
 

-- 
2.53.0-Meta

