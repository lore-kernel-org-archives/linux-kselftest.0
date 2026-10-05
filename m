Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4842C4FECE1
	for <linux-kselftest@vger.kernel.org>; Mon,  5 Oct 2026 17:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220657; cv=none; b=r0yJwHJqQYkphttrsH+HiMj1WWKWNpCIFVurcrDGZ4CKyZnziazu6E6b1Pod7pwy9y4ib4D6bUc6CEHxRozaPl/PQ3J0Dv1sxs0Zd7Dl41Ze4bo2DnE3E/+4YSZQvx7uiACR4LonYqHfTKAR499PixbH7Sutf268CCBvPAkPupI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220657; c=relaxed/simple;
	bh=efWEPmj0Vc93yD7ksoAs6CSfVahXXbn88QWzVR/N9r8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pj0/q1QLYyKTBeK38oWSCY61PxD0CQh+yH6+emZYSEWj4MVdJxIciDMLeWvatDjjA/VmQ/hjUpJGbtfpBWUl31A99bxQqIKp1YDQKdmb5fNdbf5jgbijKH7hn0Vx+fBPPWUDGliIygPI+NUSZxeJXaUJ9iYCMQKmoYzt6GfJzFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a0lBslDP; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a0lBslDP"
Received: by mail-pj2-f38.google.com with SMTP id 98e67ed59e1d1-3a81350dd08so612146a91.3
        for <linux-kselftest@vger.kernel.org>; Mon, 05 Oct 2026 10:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791220655; x=1791825455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3aHGH1btHKyA9bPipQiTAK39EsUtmJmoqAt6kx41g10=;
        b=a0lBslDPZ3dDRoOrfiI5aRABoVV+zGl5c3sgcChOzILoj4MTjYOxcRUIH6V+Bbs+sI
         QVOP2kOWoyPOU1J/Cj9rMILbsMeGDzb3lNJACfU1+YdytR8XITlnq3lE53d5XuldD6qu
         j9u8JTP72DymGLGPT/XiB3aSe7VGpzkJfn7s8a+KoM2Ckk9y+gM/aFc8SZnqjPFLOdIB
         4OelxiULczkDOgCxOGNVoVxKkH/rdX0BJlX5c200FYpABzGWjy//1tNS9cclLK7cTUGo
         SUktYMstu1roIstoIKHrfpP3OyjLjtkHUzRh5TG+PhtX6HurtL2HslSxMjioBfEFu5oS
         evtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220655; x=1791825455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3aHGH1btHKyA9bPipQiTAK39EsUtmJmoqAt6kx41g10=;
        b=ahxPp19hS7nFr8Zju7EJl8ASVCWE6Huv6ChKymChLRk9kL6+0SZojUon4lXK9iINzB
         7cLLWGL4FxWoZIIYvEfmzYhCFVDyNAJymAw+ez7F+6+ZDVETDpBE84rzjcYeCApiiH1D
         w5yV9TGHET1vEkpzkRfs+zDKkbZ5ky85gwueh0jrrJOAIL0i2OrziBS01lcQEqb1fGUE
         wBRQUm8h8y2vgaisT29Raf2W0Eup2CAafrOURCNkBz81vPKX8WXuhjYgKGyL1b+38qDz
         VxDQ17lYwY3vBwIcXzS71puYaLjKAg95EUCY5O/+Mv6Mtnzmfhx7Bnn658gjNMlLQjlf
         6O8g==
X-Forwarded-Encrypted: i=1; AKwUvBxgRCmvpUC/mHIE2yGtRi1mHmY4/EH4yt79fHL5i2T4WSRyOnBBoVwvb2GZCvmCnl0eVA49LV8MJs0lM0bqvGk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLk+CuGS78bLzBoqRAvrIrQ0evWIp79+ayBIU9lSW3Ue0kdO6+D
	qib4o+4rTSWrCZRLMS3M59uvVLdbQTEjZy5SiwpLFNPQ7E1Q2PnH/OtK
X-Gm-Gg: AYBFou08aVaP7mEHdIkw8RdgOr5iFM30jwcLCvsctP4M/7pazYtx3uCwOgwLtGK0+Ed
	iy5vZOKoEB9Br+JEGSPrSX1B48GxkjA7BW7GwWeJIJPWwpYmIngKAPkyYsfpQzm4bA6wGcEVeQI
	+nlbJXDxd8wEyC8DjLau9I3YVQqUcDFjaeypKgrAcy0j6bc1mkf3pBNjCeZdcdJJklZV+DTIVAy
	tgXO1gj3dDuaOtCp6D3e5hfEyTnqCNziTE7JkeYXMC1Qe3VcQ5u7c9ZJvjoFqDXrjDmij7Mhy3r
	MT+sPqfTm6/d5ZLcckarOLZz2YNzMuyxx+Qho91/+IMAkgipbv/JWuGQ+t0SiQ/krO1jZ3qxePz
	CIMwzR7yPM07HEJLmHts5t/1PnspqFS3jgHuilFjVC8DPRHUI4+sZQaocf4Rlx/8gHS37qsJgHy
	sEtWuyiY353TCgB5v5DY5dbip8yAr39hl03+t+TaeTTsCJEXQoC8cWq7Bv+X4KqoHJSlGM1h7IV
	F8CaGJA0y+zyOk5oJv9JeLaB4xh4yiBQxfN8Xx6
X-Received: by 2002:a17:90b:4c52:b0:3a0:5413:49b4 with SMTP id 98e67ed59e1d1-3a6ce7fba39mr9628210a91.39.1791220654194;
        Mon, 05 Oct 2026 10:17:34 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([216.195.201.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cafddesm406910a91.10.2026.10.05.10.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:17:33 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net,
	lianux.mm@gmail.com
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	peterz@infradead.org,
	boqun@kernel.org,
	npiggin@gmail.com,
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
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH RFC v3 08/15] locking/lockdep: use hazptr to wait for dynamic key lookups
Date: Tue,  6 Oct 2026 01:15:22 +0800
Message-ID: <20261005171529.1378809-9-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005171529.1378809-1-kunwu.chan@gmail.com>
References: <20261005171529.1378809-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lockdep_unregister_key() waits for is_dynamic_key() callers with
synchronize_rcu_expedited(), which requires system-wide coordination.
Make is_dynamic_key() protect the hash bucket with a hazard pointer
and use hazptr_synchronize() to wait for traversals of that bucket.

The hash bucket returned by keyhashentry() has a stable address, so
it can be used as the hazptr synchronization target.  Keep the key
hashlist lifetime RCU-based with hlist_del_rcu() and call_rcu().

Protect the traversal with the hazptr scoped_guard() added earlier
in this series.

This adapts the lockdep use case from Boqun Feng's shazptr series
to the current hazptr API.

Link: https://lore.kernel.org/lkml/20250625031101.12555-1-boqun.feng@gmail.com/
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/locking/lockdep.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index c56a7f91d72e..d1ce5ace7fbf 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -58,6 +58,7 @@
 #include <linux/context_tracking.h>
 #include <linux/console.h>
 #include <linux/kasan.h>
+#include <linux/hazptr.h>
 
 #include <asm/sections.h>
 
@@ -1280,14 +1281,19 @@ static bool is_dynamic_key(const struct lock_class_key *key)
 
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
@@ -6683,11 +6689,10 @@ void lockdep_unregister_key(struct lock_class_key *key)
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

