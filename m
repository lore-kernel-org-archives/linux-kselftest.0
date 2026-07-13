Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A323F076E;
	Mon, 13 Jul 2026 11:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783943332; cv=none; b=c9n+dK3LXooV4GPjp+KfzVL/ZGcKnVKskddXDjVX5KUc884fylNbLUYA9WrN8a1GgxbBbwa8qq4+b5Lw/NfsM2BMwoAIFDAy3VH25C55OK+GF+590TgsShqHBgH06xXFl0NHYrltIaDgSjlSZsGvyQlMYiHyGya0jcYb/rcs8uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783943332; c=relaxed/simple;
	bh=k5syoIA9ysnV4wrEyuCwDG5+YSh/+ARvdAvSvQ1nHGE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lab/YRGi1TVRRQPt4rF3mTjMmQHwlZJ0cFD6qYNSresgiTRydASR6Px1VIeG9dFwDX/2GfobwKKI1c0t3AqRwbvfVAxB7s1GCv6tOhg09utvlG4eUliNZ2v5kBZYLyfedwmb17ts8ABaI/+3+/Rr2GQAGuzC8WPSHglu/OUNIzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=b8FGLVCJ; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="b8FGLVCJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=XFSQUx8TCZyAA/EWJdMDpeVC+kFXZt9qXST9blJikws=; b=b8FGLVCJ2eKvCoKVZHHQKvWQHF
	MVLYqoWxGVp02+HcmJfS3idd/2A0b3yUUxp0ooxKtpVaQRe4nCXBBBFeQHuWUVqRaMYEvOizMDxG9
	2J+USEj/5SZNlDUZAfYY44XDdPOHEV/U38/WfYN9xVCpRJgl8BQP2RmdNqt3YohAS/hBSy5YwSMl2
	zKzQtn2VLd+RWtzTDKl1ITOqUUPmEL87SuUwMhrB0XKcixNSp6Bc7OBDDnEyt5YAXcy8DCimL9NlB
	VnCxT8dNVkenBHebr5dLp7nvTNFJxt8NO/qAdVVp3oP8bUknz7ACwL7jmIJc+VN1rI2vquQJ93ihb
	Y6QC6xaw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wjF9M-001TjD-0n;
	Mon, 13 Jul 2026 11:48:40 +0000
From: Breno Leitao <leitao@debian.org>
Date: Mon, 13 Jul 2026 04:48:06 -0700
Subject: [PATCH 3/4] mm: kmemleak: factor leak confirmation into a helper
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-catalin_pto-v1-3-5b93b1131089@debian.org>
References: <20260713-catalin_pto-v1-0-5b93b1131089@debian.org>
In-Reply-To: <20260713-catalin_pto-v1-0-5b93b1131089@debian.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Breno Leitao <leitao@debian.org>, 
 kernel-team@meta.com
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=2095; i=leitao@debian.org;
 h=from:subject:message-id; bh=k5syoIA9ysnV4wrEyuCwDG5+YSh/+ARvdAvSvQ1nHGE=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqVNCDS3n2w9ikiBluKn3vjF/Zn4wkchKX7fc89
 7Nrft+gaBSJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCalTQgwAKCRA1o5Of/Hh3
 bbCID/wKUKccUQxdsMVZO1R4Q7HhjfNs9AH2FcscwKsWjIPGbXxfqVrrLXVMlYkLmFnxT5C8wLp
 EvwBeNeklecRZlmsQEAG4SvVFaTUIYFbpOpW0rRrFfhCU5K6w3FWOsb6TGBKAxA6FFyLf+7LbGe
 gBjdJZlYQt14eBFnTWqofAttBeVdQvUzOkbJ4wqSlvRgUWnL1zpSFdNHSImQF/zaMbNwmYwG8Vb
 Lvi3FcYhlwkjH0lI+Y/z31xmqQmNd2R/Ci8ddMtfu/kxgseY8cLbeM6WzAo2pQ4Ga5T0gr3bJo3
 o4BieTxQdMSHE6YYDnGpns5aNHshdebQyRatmVq9WTz62xsvEVrQ5oxUPTGcIIgNpn61ijsyH8d
 n78QcKFX/elGtBxP0bYjQxiynlpb8pwXI6i4IlU5B69Y3PKQi27na84Su57z/BSnOqCQgRi0zsF
 YRzOWBQCrvNG6NoQjHZ3LFoeDZgE6Dfz/O2K1kqDJMBmvvuggpULbNjjSwb+79+2V3u+YOIb3Oh
 fUcW7n3ULWCZL7NWyg8YoxQ5ewc95SfJjI8neE17OsSBB9Tq59FXfEFk4Z43+QYF8+rWqk90OiQ
 tiuXyJ95Chv+1WhyyT246ylon36UWQy+w6/wI33/53rpYpnnkrKoVtuAp8od2HKQcF7kPjFO1rK
 XKTq4QzgpdQCq7Q==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

The reporting loop in kmemleak_scan() decided whether to tag an object as
a reported leak with a four-term compound condition whose last operand
also had a side effect (++object->unref_scans). Mixing the candidate
tests with the counter update made the check hard to read.

Move the state transition into confirm_leak(): it returns true when a
still-unreferenced suspect crosses min_unref_scans consecutive scans and
is newly flagged OBJECT_REPORTED, leaving only the reporting bookkeeping
in the caller. No functional change.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 mm/kmemleak.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index 2fff11637e490..85f18b17e79c4 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -2014,6 +2014,26 @@ static int __kmemleak_scan(bool full)
 	return nr_suspects;
 }
 
+/*
+ * Promote a suspected object to a reported leak once it has stayed
+ * unreferenced for min_unref_scans consecutive scans. Called with
+ * object->lock held; returns true when the object is newly reported.
+ */
+static bool confirm_leak(struct kmemleak_object *object)
+{
+	if (!unreferenced_object(object) ||
+	    !(object->flags & OBJECT_SUSPECT) ||
+	    (object->flags & OBJECT_REPORTED))
+		return false;
+
+	object->unref_scans += 1;
+	if (object->unref_scans < min_unref_scans)
+		return false;
+
+	object->flags |= OBJECT_REPORTED;
+	return true;
+}
+
 /*
  * Scan the memory and report the unreferenced objects as leaks. Must be
  * called with the scan_mutex held.
@@ -2074,11 +2094,7 @@ static void kmemleak_scan(void)
 		trace_handle = 0;
 		dedup_print = false;
 
-		if (unreferenced_object(object) &&
-		    (object->flags & OBJECT_SUSPECT) &&
-		    !(object->flags & OBJECT_REPORTED) &&
-		    ++object->unref_scans >= min_unref_scans) {
-			object->flags |= OBJECT_REPORTED;
+		if (confirm_leak(object)) {
 			if (kmemleak_verbose) {
 				trace_handle = object->trace_handle;
 				dedup_print = true;

-- 
2.53.0-Meta

