Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B933E4C98;
	Fri, 31 Jul 2026 10:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785492845; cv=none; b=tXJwyKh6eCk6c4r+QLBYT8n0VCQ1a13m867qA3ajSqLKRwwKrnA/6Ae0e64auRYIny5h8FJ+WQMhNK9vA5iLLtO74ptXIjyvLDC91P2lJX5ZhJf5jDVov14/BmCVv8+b3SQie2aXw6TxmBVhEv4smhthg55MEBsBzIrYF+FHpNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785492845; c=relaxed/simple;
	bh=Oj4udiEjmpiOjfHea+V/PwK9ca6Z32nug57dxTay9Ho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g7JLSzaKBQR1hC/pdEq3OFrfgq68zOQD7WFer06o/b5fPL6JAk+0+FO4JvWM1AYrLFgZm/fV3Wv/0MxWnb3AiWwRQ5LcUed11rVe1+dpKyb/5oc1/rhqhKEnta6l1HUiOSp0SqdhSEJ6I+1DSAO84NzPeiMVrW+E3US5KqPtZqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=v/AfJXjO; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="v/AfJXjO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=ubcjTD4WMXtsiq8p2FJU6LDktp9obYXwMtyJ483ghMU=; b=v/AfJXjOnFdaw8rUFIUcYMWkI4
	qQN7iICNQcgMvwpO7u92p4W+7U0OoO+jXPOymbTRLEutPeAYZkqNhghiRJmbEkVzOGL1gFhcKpgei
	+wsd+HGExLTqCGMKNZVuHivIcLKDmycv2G9cd+TVaZMSvaLhR+0vJ64XHkxIkwxgKBFFjlupn4cF/
	KGqGWjMp+DCVvyWrZKu0rWAxaMV3/tK8/SvZ5z9jH3mXuatdCfzdhB8QGadIv3AONMPX7lp+LARFp
	Yj2ong1kVQqxYNU3wAxiLPV4JoXrt2meAu21/h+ZiNrin0gRCAZuEPMEABK/X/OAHYr7i8jYmg8pD
	qlHfDU4w==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wpkFJ-009wBK-1J;
	Fri, 31 Jul 2026 10:13:41 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 31 Jul 2026 03:13:06 -0700
Subject: [PATCH v2 3/3] selftests/mm: kmemleak: drop stale min_unref_scans
 default from comments
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-kmemleak_hardened-v2-3-7b9689ac77cb@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2281; i=leitao@debian.org;
 h=from:subject:message-id; bh=Oj4udiEjmpiOjfHea+V/PwK9ca6Z32nug57dxTay9Ho=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqbHVAWQRNUMdRa9PHEBXY7Nf8tp4hOStjJKxld
 uKVu49wgSWJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCamx1QAAKCRA1o5Of/Hh3
 bXlrD/94O2e9I6iW9tkOQ8YBD5tmLc8N681vxPuVSgqZnf4F0a28eyrsM4SHdjXBOYfkDxqakwT
 alJi3+n+fVADlOmxOsH3DxPtRzJ9Ips5yCM+oYMqmN5CzknQpLupbeTqAa90hH2D2qGpzlomVR/
 UJReyIkTFNHj1+OeymYac0D/PQjOokkvuSb8qQPIle+jA2o/kZS58GV+0Vc/VEqX/M1h7K++s+P
 Zn/3eYAsYavPJpCw6GE+ZN/mNj28KmDWGMOg2LfULmIvqtTqjeAHnqB0Yf77nCKg4oHQjjioh8b
 zxQ+ZLujJ3CtUixw704ZM/O/qICJSHIBp12aCTgRZ/ilCWL3CEQ17jSFkGXzOSa6y0TrZgVFwSK
 YkUsAjKJlXGmrk+o/6vAKvz0c+1t/S7lfqpKJYzMRlc0UmVBLXNnNnBohVhPARVK9bHsvI5mNC1
 IXzaml6bk3bQxE/KNM3lv0G+TfZkA0iKMX+DROuDRl+9JwIO7Pwc5YAquuOA9WaAczOACiIdclx
 QGIoztu9sCIy8MeK+cA+EQJEWH4rhMVO3etUWzy9kg+jMBKTgOfnpfJrsxnZdv1GJ3cWtC+1lsX
 hF39qVjOljB08s6XxAVj0gcXIt0fFKbSbOR57nxyDlQtGQ66R4Vo7vM3CZ/n2NpAw3g5xhT8ht5
 UMv7S0LQJtBOL3w==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

The test writes min_unref_scans explicitly for every case, so its comments
describing 1 as the default are both unnecessary and, since the default is
now conditional, wrong. Refer to the threshold values directly.

No functional change.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 tools/testing/selftests/mm/ksft_kmemleak_confirm.sh | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/mm/ksft_kmemleak_confirm.sh b/tools/testing/selftests/mm/ksft_kmemleak_confirm.sh
index 3a8576e835c8d..72ded5e6794c9 100755
--- a/tools/testing/selftests/mm/ksft_kmemleak_confirm.sh
+++ b/tools/testing/selftests/mm/ksft_kmemleak_confirm.sh
@@ -5,7 +5,7 @@
 # (the min_unref_scans module parameter).
 #
 # kmemleak only reports an object once it has stayed unreferenced for
-# min_unref_scans consecutive scans. The default of 1 reports on the first
+# min_unref_scans consecutive scans. A threshold of 1 reports on the first
 # scan (historical behaviour); higher values filter transient false
 # positives where a live object's only reference is briefly invisible to a
 # single scan (e.g. an RCU tree update in flight while the scan runs). The
@@ -16,8 +16,7 @@
 #   - a freshly allocated object is greyed on its first scan (its checksum
 #     settles then), so nothing can be reported before that priming scan;
 #     each case below primes once first,
-#   - with the default threshold (min_unref_scans=1) one scan after priming
-#     reports the orphans,
+#   - at min_unref_scans=1 one scan after priming reports the orphans,
 #   - raising the threshold to 2 needs two scans after priming: one is not
 #     enough, the second reports,
 #   - the parameter reads back what was written.
@@ -105,9 +104,8 @@ echo 3 > "$PARAM"
 # scan. Every case below runs this priming scan before counting.
 prime() { scan; }
 
-# 1) min_unref_scans=1 (default): one scan after priming reports the
-#    orphans. This also establishes that the helper produces detectable
-#    orphans here.
+# 1) min_unref_scans=1: one scan after priming reports the orphans. This
+#    also establishes that the helper produces detectable orphans here.
 echo 1 > "$PARAM"
 gen_orphans
 prime

-- 
2.53.0-Meta

