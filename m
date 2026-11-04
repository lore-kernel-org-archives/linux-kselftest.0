Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811505;
	b=orji2K5Edw3ADc9GxLlIAigXcqX41Q0uDYH9oJJoBEQSzqUc03UmpJkfM/hhwpiVzqsj
	 TAZ05RYxbfFY3jXYZwooag0TGU0oMAN+ptrvkAOBB473hI0RpOjWRLEHlPp1QfwDyF545
	 98MyEmvAu33fPebcs7A3m0As0MuNlhb3kpx/9CmTi+FkLjnP9N1EVvpaduZnDikw00zjK
	 cCyeBK9fSmWmcmrjuNWxQEI2a5ENGZxnjxPMQpRIhsVF0FOyUk2WIa8yiix87yjce3nLt
	 msDx51mndKCiddY6LLu6ZwrqZRbCUXK4Mhc1zvQ4sNo4UnT9+BxmXz6rFmVGsZdGBkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811505;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=E3exnuIEn75Mzl8OzBk9yKBvPuDEfR29myhkVg7oSY4=;
	b=OXhzZM89RrsCB75ljtYv+7QuhDYbgqSDpdd+NKXv3WvVnjk/96lV0UiaEu2LNMje7FBT
	 m/fWVFC7IqgXE0Sso6jv9yWVCWKySXbqPfMxztTQ6ZcdfgvEGLsmadAAx55zfiyfttykE
	 BO3zQlLBp4Z0UjGDv5pfUi0oeSLEqtdvOeJo9CuEqvzCRh09yfQcyLHH3w9UM8OG6h0lw
	 97Q2LbTXidC/HaEMvco78NKCf9RBDaTHt9rmHO7QS6/pPJ4TPf1FgsGns409TCWDdG6Pu
	 4ZTypxB1NLYAqpiiwRy/xamlhF1WtA4k/nLqrpEdA/Nbgs5Iz4QwXHeBj2rLvy2oyRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d4EEF2kO;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCFF606A32D
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 16:58:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DCFF606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d4EEF2kO
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2055613eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 08:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811504; x=1794416304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E3exnuIEn75Mzl8OzBk9yKBvPuDEfR29myhkVg7oSY4=;
        b=d4EEF2kOlJ9ZwT7ZAqTk4BEQB6KcUy0uA9+FyL4MbNN7Zu4rDZNZ0rp/SjEM1SHJ4i
         +t/vAUuu9SCQC3AYeOMIngo6oTmzHstQm5PfvbTiZo4E0zTT9V6oh0nnxsdi583LVoP9
         a7tSdg9pv18ePLJgUJJGIePmp4/HtLBlGIL4B4XqWh6wFW0yt6vcN7QL4y2SPKtHKdOU
         bs9e6FLPI+Lm9iDleUFUew9o5bRM5WOk+/D20EOyGWfHt0Q6311/IX/Ow+PfL0FIwOAS
         sJp03RdEH8YojNlrwn4RUuHSxdKSA/A8BAe5x43K6gSXTYuYOLC0EeO1Cb5cyDhrtx52
         4QUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811504; x=1794416304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E3exnuIEn75Mzl8OzBk9yKBvPuDEfR29myhkVg7oSY4=;
        b=yZkh0DAIL5CM6m/pen5SHcfaMAMOGEEl+HP5NC14i2YNYC5nB3W5j7bS7b3fLuCtVp
         8q1uyPj6L2dzk3aAj9fBjLl0W8ZUjRnY0hnUv8V/49aCH4x9NkDv8z8PJLPwoDypsf8L
         99RTScqv+HZ+3NIMg7qCjj9nATy+1/MVXFV1gKqJLcG+ZIPJXjo9Rd4Y7qDJ37Ywdpxx
         0L1rzR8Dmmd2s2Ynfhp2F7DBNIEr3DTd26iISCgQwGY67FOG3/UKJ7GuaHfynn/RJEKJ
         EIahD/DkNUqzTYUdFALYDuql7DaKvikgmtuCnK2JagRs9mqZJpMn8yyweP8CU5DD4wJo
         0Crg==
X-Forwarded-Encrypted: i=1; AKwUvBxXXBPvGdZX9hOSSiQRCvlj7YJWFFXNk3RU9V3KyU1YW3e+tQDXyzqr1ZLJK5jcpCOF2zJ0HIqrMAKCTZzf4Cg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MAarexFF4w5dVvj+l8+eLUdrhhHH3UnL+bRXw3R9MKW2FzqL3
	/PcuqokSPibT9NpuWPXASw0WW60P+3ArNMDEIcEYjTjZfzqietjzzWLo
X-Gm-Gg: AYBFou3+tjIWqTAhQOwn8GfjtfL7nBE5WtlxNB9gZe3ynIwrtXsLDNqBvEqa4vpeHJg
	+x6cynrg/LLzjb8czVVzc9xcfVOcYv9qa/GzKdGjW9wriTvDvNwrlwaEZwStFlYE+iR7ntrywh4
	ak6YTG3hAvCHBtWcikDlRD5kRqHomGRubxfe4/J5PeDqpg5+1J2sL11P9HtTNirONXAxJcSOjuf
	8wi4Dqs8YeSiKcb6pVJDsr3BYaxj7BcWNZ8nLkegZ+YCTQ+IlkRHYq0WhN9A+3GO7WjpFf+91dw
	SphTQeysZwEhTBHrX4ThiEeTxmoLSPyMA5qwj/1H+1PLErb/IP3LmWFYdpM2hKzT3y1w1AFsyoa
	v054MjTvf7BAeH0pbz7/+n9HuNtcAjplo7K7B8Wr8PZFiXuPgoJOcStFR6O/bnLnSjZIHYvj0ZD
	Tuxmv8fHb/+mOmNcV5jyZpkMOq71CSkRWbkYbFuSXQGHM04/9ln2fMDHzKiQjpGQe11z6WG0tOD
	zGDheB2DOE2GxvIzsB4TOJcOhDLWCdJwK/cZNIitSW/LGxuamlA6mJiDr6qZuJQr1xpKeOuLMGs
	vE/9Mq4XbjNGvtgFiWWZ1wAD1WutFAE/CMlE8DU=
X-Received: by 2002:a05:693c:87c2:20b0:36a:6ae5:23e2 with SMTP id 5a478bee46e88-36a6ae52e67mr14054524eec.17.1793811503835;
        Wed, 04 Nov 2026 08:58:23 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:58:23 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	boqun@kernel.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 20/28] locking/lockdep: Use hazptr to wait for dynamic key lookups
Date: Thu,  5 Nov 2026 00:54:38 +0800
Message-ID: <20261104165504.2430480-21-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104165504.2430480-1-kunwu.chan@gmail.com>
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
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

Replace the system-wide synchronize_rcu_expedited() in
lockdep_unregister_key() with a hazptr_synchronize() scoped to
the per-key hash bucket.

Suggested-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/locking/lockdep.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index c3dc84a7cef2..256f23a9041d 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -58,6 +58,7 @@
 #include <linux/context_tracking.h>
 #include <linux/console.h>
 #include <linux/kasan.h>
+#include <linux/hazptr.h>
 
 #include <asm/sections.h>
 
@@ -1308,14 +1309,19 @@ static bool is_dynamic_key(const struct lock_class_key *key)
 
 	hash_head = keyhashentry(key);
 
-	rcu_read_lock();
-	hlist_for_each_entry_rcu(k, hash_head, hash_entry) {
-		if (k == key) {
-			found = true;
-			break;
+	{
+		struct hazptr_ctx ctx;
+		void *bucket = hash_head;
+
+		scoped_guard(hazptr, &ctx, &bucket) {
+			hlist_for_each_entry_rcu(k, hash_head, hash_entry, 1) {
+				if (k == key) {
+					found = true;
+					break;
+				}
+			}
 		}
 	}
-	rcu_read_unlock();
 
 	return found;
 }
@@ -6717,11 +6723,10 @@ void lockdep_unregister_key(struct lock_class_key *key)
 	 *
 	 * Some operations like __qdisc_destroy() will call this in a debug
 	 * kernel, and the network traffic is disabled while waiting, hence
-	 * the delay of the wait matters in debugging cases. Currently use a
-	 * synchronize_rcu_expedited() to speed up the wait at the cost of
-	 * system IPIs. TODO: Replace RCU with hazptr for this.
+	 * the delay of the wait matters in debugging cases. Replace the
+	 * expedited RCU wait with hazptr_synchronize().
 	 */
-	synchronize_rcu_expedited();
+	hazptr_synchronize(keyhashentry(key));
 }
 EXPORT_SYMBOL_GPL(lockdep_unregister_key);
 
-- 
2.43.0

