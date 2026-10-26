Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793029321;
	b=NXY9B0vy3iwbjm8Vepyuvhai8byBg5vbdsvVx7LCQC3540i8pv5QXkMOBW47qCmdL2zr
	 hAqc6XnX6w23l3f/OJZgIOl9VtrgLlbemWnlOzwsHnLfGzByirdWV8E4goPBlAjFgzVEB
	 fa9I+P4hV67n1+rVfaXD8RHUU+9OeoNrz1B1GztCu5duGKvBn3UUfqGhUAJ1UR7RVhqV6
	 L5WD+6rJrjVYZ90/Cgv7V2dxt31sURrpEoUKMWawQ0zzkGLdyLA27kcl4QCvwBmhJIKFi
	 EWWLJjtrXqwxJIx3I5Uye2Y3utHu4hUQGTuKROHajbE7fZ2aclkkrNhd+xc2YpDa5dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793029321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=/QAf07cAiyxBwSWgq7Tjim9fLXjZh7SPBHX/IjDGa5I=;
	b=KkAJpRakv/EEz8738STVXFgVrC/9NaLf+MPSsVDaX+E1aEE3TdXInvc2iO5HTp1N64hi
	 tmJWzLTR7ebif6TvXtufaP4aFxKyp9eCBaJJRJGL40T0EEFtEMFfbx+TJH757QKqUKrg2
	 hs1+iTi6FpHZ8zfCpFTWJwYPKff+jI3+gSBWyf+TTwHtL0kYWDk5P3XRmiWELrdWvidRp
	 SptvuFQYRigXVXZNKrvKNK+ZxjNwg58KwqIMuo9v4+AjLLrO390+U1R4Q45yf7quc5XTl
	 5UVxELi5XvGpPnvtfTYYQ8VR/p6niIJgjyj5IuziFPC2k2fGu9eOQbAG5E7q7y880cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=IzJzvYGk;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F296606A335
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 15:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F296606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=IzJzvYGk
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93c5b7f5bfaso967885a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 08:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793029320; x=1793634120; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/QAf07cAiyxBwSWgq7Tjim9fLXjZh7SPBHX/IjDGa5I=;
        b=IzJzvYGkjyoeTWzdhNsQL7Kh6cf5EsU9kiMAkkA4bcHRr9Q9rnZfe2g7Rhf7q7tAPG
         Rm0wQPWq5BSlZ5ToEOWwKo1c38ZN7eUfmQ/bvu/0zB0Mhc2Rka/Ann5mXan+DtJK+hPx
         ubDbLgljcgMxR1NAB9U6r1mje3Wmv9bbwD5ja6CqAo53oCMWQ811eXfWiI4XQoBascv2
         RoWJv0g6EdczHrF8llCcsUQkjpzwElbNoXLq5OBRlYFiYyOqHevGnse7z6Xv606xW6GK
         i8bwVv/0S18OVCFFB5VPM7kZZl1QRryJKKe1bLPXFJ3oG6ZcJ92bnan16FNAz6oz0yY3
         zMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793029320; x=1793634120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/QAf07cAiyxBwSWgq7Tjim9fLXjZh7SPBHX/IjDGa5I=;
        b=oYTnjaBU9dIGclyV4Zj6/G8UDOtQT04/S7tbZduxjmomzVpaCj5a8JfzOGe43Z8hNc
         vF4HCAmIuAJ+TZwnUn4VQ24au6lHDZRkP/4DSI+devoVLqP8+/iBNJMnZiamYcPjNu01
         Nl8h/unwdnv5QqbInt4F0cS/eaUDx9QFrxcAbnXP9DoUxff21BI7kYpwB3sTBR6wHGB5
         znHtmY6Lo1RUcnh7DnoiQPGn7TT2fnPoSsSQkfJKeugntDxZDEfKCJc2/9YZ2X+ZoBVe
         13zghhHME37TxUagj3f/fAtXC6p5y2sxvWX8wlfiyjOx49zAryH8bsYAoqgowr9M1NAP
         sFOw==
X-Forwarded-Encrypted: i=1; AKwUvBwdbXtuUxdEQgpsiEFW1zgoh2MHlXyyZn7J1cFOI0PeN9w8rbydCCLLR2ZOns909EKw5htP8qveYk7NxZ5Etq8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaAE7SB+SAUxaDrRnk6rW1rptpC23WXAJtI9x+oGT9Dcpjq1Yj
	scvP6ws2UPia/toYHy06tNlcgd1618fb+y+CGE88w+Oyl4d9L/4NisGoxOCwvn10ttM=
X-Gm-Gg: AYBFou0T9kDunLsdWb0E/iaujd3SUP8x9N24eCqqWjh7JyGmY/8hq2xYAw7uiLOz64h
	9Zfa0K4Dn0dv9f3raKbw5UPC9wo/LlEaGUD0Sp/Y+7QcTdjI7An+Km2O4bn+7pJjl/b/U6i7Htl
	tv5Sg+25bPgvsNt8W7uG2W5FCWEXpZJCDss4pL93ur37qL4LH1gqXVp/NMuWuZEPlCx1RKBmGFC
	W8B3PKCebZphb0scm5MrRJxcPvslTj09ONEmCZf7HHdvBB7uKsxrABXLtcEwTlOYg+gXppTm/Ki
	7828h6kEqqA4HFYrgLMRPoZxqkNBT1clZRYQcWfAV9WUyLb6keFvJnvhwZVRvXOKhXzmUXguaOu
	MNNQukKSuiyUHRhZb7dAoih/xe7tpRmDZEYgBqa2Be6FhV6mbz8G5MleILPqAfsmy2NPwDveVxQ
	fdCvvtkXyXa/0NoKmut+gpT+XX0ANNcIf9S3qt1E9X5iOaNMyKE7TozoW7anWds7hqe6BbPrlsm
	ltlAl9rm/x5d73j7b3zYA+svO0qIXJBX6WwQWX5n8kzJX5RMuVUS6BIOEfEWPFT7GeYn89+
X-Received: by 2002:a05:620a:d8c:b0:93f:2571:c317 with SMTP id af79cd13be357-943f4bc5d77mr2682685a.28.1793029317058;
        Mon, 26 Oct 2026 08:41:57 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47cb85f3sm75112816d6.36.2026.10.26.08.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 08:41:55 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Mon, 26 Oct 2026 15:41:41 +0000
Subject: [PATCH v6 5/6] capabilities: don't let ptrace borrow CAP_SETFCAP
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
Message-Id: <20261026-b4-setfcap-userns-v6-5-25f10b7ca497@toxicpanda.com>
References: <20261026-b4-setfcap-userns-v6-0-25f10b7ca497@toxicpanda.com>
In-Reply-To: <20261026-b4-setfcap-userns-v6-0-25f10b7ca497@toxicpanda.com>
To: Serge Hallyn <serge@hallyn.com>, Paul Moore <paul@paul-moore.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: James Morris <jmorris@namei.org>, David Howells <dhowells@redhat.com>, 
 Jarkko Sakkinen <jarkko@kernel.org>, "Andrew G. Morgan" <morgan@kernel.org>, 
 Serge Hallyn <sergeh@kernel.org>, linux-security-module@vger.kernel.org, 
 linux-kernel@vger.kernel.org, keyrings@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
 linux-kselftest@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793029305; l=5986;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=sZPBiHwnYa3YycPMYlN3oxrwhjCY5GQuMbx5FDiasfw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAOy2GGiePgKQcYEt41jyZFpxZWhl5CSTt7eOc7pi3b7QRX9tPSazsl0Fhaupv0QLEf91zBxu/s
 vJ+EZOkrSEgU=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

Tasks in a user namespace created by a task with CAP_SETFCAP may map uid
0 of the parent and write file capabilities that are honoured there.
That is the one privilege they keep outside of their namespace.  setns()
no longer lets anybody in who doesn't have it, but the ptrace checks
don't know about it: for a target in another user namespace
cap_ptrace_access_check() is satisfied with CAP_SYS_PTRACE over the
target's namespace, which the owner rule hands to any task with the
right euid.

  task A: uid 0, full caps          task B: uid 0, no CAP_SETFCAP
  unshare(CLONE_NEWUSER)
                                    ptrace(PTRACE_ATTACH, A)
                                      uids match, euid == ns->owner
                                    make A write "0 0 1" to its uid_map,
                                    or set file capabilities
                                      A is entitled -> allowed

The same goes for /proc/<pid>/mem, process_vm_writev() and pidfd_getfd().

Require for PTRACE_MODE_ATTACH and PTRACE_TRACEME what setns() requires
to get into the target's namespace: CAP_SETFCAP of the tracer has to
reach the root users of ancestors that tasks in the namespace can write
file capabilities for, or the tracer has CAP_SYS_PTRACE over the topmost
of those ancestors, which gives control of tasks there that have
CAP_SETFCAP anyway.  As in setns(), root users stored through an
idmapped mount are not considered.  A tracer in the target's namespace
got in with as much and always passes.

Targets in the initial namespace, in namespaces created without
CAP_SETFCAP (what unprivileged users create) and in namespaces that
don't map the root user of an ancestor (the usual container) are not
affected.  What remains is a tracer that gave up CAP_SETFCAP and
CAP_SYS_PTRACE and a target in a namespace that maps the root user of
an ancestor and was created by a task that didn't give it up, which the
tracer can't setns() into either.  PTRACE_MODE_READ is unchanged.

Fixes: db2e718a4798 ("capabilities: require CAP_SETFCAP to map uid 0")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 security/commoncap.c | 45 +++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 41 insertions(+), 4 deletions(-)

diff --git a/security/commoncap.c b/security/commoncap.c
index 4e0b00b7b1a3..91ed4a5f4b25 100644
--- a/security/commoncap.c
+++ b/security/commoncap.c
@@ -254,14 +254,41 @@ int cap_settime(const struct timespec64 *ts, const struct timezone *tz)
 	return 0;
 }
 
+/*
+ * Tasks in a user namespace have CAP_SETFCAP that can count in ancestors of
+ * the namespace, see cap_setfcap_level().  That is a privilege outside of the
+ * namespace, so capabilities over the namespace are not enough to take
+ * control of such a task.
+ */
+static bool cap_covers_setfcap(const struct cred *cred,
+			       const struct cred *child_cred)
+{
+	struct user_namespace *ns = child_cred->user_ns, *top;
+
+	/* setns() only lets in tasks whose CAP_SETFCAP reaches as far. */
+	if (cred->user_ns == ns)
+		return true;
+
+	top = setfcap_top(ns);
+	if (!top)
+		return true;
+
+	/* CAP_SYS_PTRACE up there gives control of tasks with CAP_SETFCAP. */
+	return cred_setfcap_reaches(cred, ns->parent, top->level) ||
+	       !cap_capable(cred, top, CAP_SYS_PTRACE, CAP_OPT_NOAUDIT);
+}
+
 /**
  * cap_ptrace_access_check - Determine whether the current process may access
  *			   another
  * @child: The process to be accessed
  * @mode: The mode of attachment.
  *
- * If we are in the same or an ancestor user_ns and have all the target
- * task's capabilities, then ptrace access is allowed.
+ * For PTRACE_MODE_ATTACH, if the target task may make use of CAP_SETFCAP in
+ * an ancestor of its user_ns that our CAP_SETFCAP or CAP_SYS_PTRACE doesn't
+ * reach, then ptrace access is denied.
+ * Otherwise, if we are in the same or an ancestor user_ns and have all the
+ * target task's capabilities, then ptrace access is allowed.
  * If we have the ptrace capability to the target user_ns, then ptrace
  * access is allowed.
  * Else denied.
@@ -282,11 +309,15 @@ int cap_ptrace_access_check(struct task_struct *child, unsigned int mode)
 		caller_caps = &cred->cap_effective;
 	else
 		caller_caps = &cred->cap_permitted;
+	if ((mode & PTRACE_MODE_ATTACH) &&
+	    !cap_covers_setfcap(cred, child_cred))
+		goto deny;
 	if (cred->user_ns == child_cred->user_ns &&
 	    cap_issubset(child_cred->cap_permitted, *caller_caps))
 		goto out;
 	if (ns_capable(child_cred->user_ns, CAP_SYS_PTRACE))
 		goto out;
+deny:
 	ret = -EPERM;
 out:
 	rcu_read_unlock();
@@ -297,8 +328,11 @@ int cap_ptrace_access_check(struct task_struct *child, unsigned int mode)
  * cap_ptrace_traceme - Determine whether another process may trace the current
  * @parent: The task proposed to be the tracer
  *
- * If parent is in the same or an ancestor user_ns and has all current's
- * capabilities, then ptrace access is allowed.
+ * If current may make use of CAP_SETFCAP in an ancestor of its user_ns that
+ * parent's CAP_SETFCAP or CAP_SYS_PTRACE doesn't reach, then ptrace access
+ * is denied.
+ * Otherwise, if parent is in the same or an ancestor user_ns and has all
+ * current's capabilities, then ptrace access is allowed.
  * If parent has the ptrace capability to current's user_ns, then ptrace
  * access is allowed.
  * Else denied.
@@ -314,11 +348,14 @@ int cap_ptrace_traceme(struct task_struct *parent)
 	rcu_read_lock();
 	cred = __task_cred(parent);
 	child_cred = current_cred();
+	if (!cap_covers_setfcap(cred, child_cred))
+		goto deny;
 	if (cred->user_ns == child_cred->user_ns &&
 	    cap_issubset(child_cred->cap_permitted, cred->cap_permitted))
 		goto out;
 	if (has_ns_capability(parent, child_cred->user_ns, CAP_SYS_PTRACE))
 		goto out;
+deny:
 	ret = -EPERM;
 out:
 	rcu_read_unlock();

-- 
2.55.0

