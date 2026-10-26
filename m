Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793048435;
	b=nkPPYC0GccExzQTTlgcfrvuEsWozSvAhlR4dxJYJwZ6+dL1cTzl0CwmYkGJnPRUFyoO9
	 nJXJmjab6BxaNFdnSUzeNek5jNPCNOl8jwQcsSjDthWVXPF7kyH15DMLUAK8BTm3nxQQ9
	 LKZ86WDjZcmK3SJMxgkVk9UmamCG3OSjgkDK7CzTNAoX25gZesbB98/OKCveDFZopbMcJ
	 iCMvIgoHEgFwCBnI02KWpJoURA+4AO27Y1L9EqVtrcs2UOlXdopRF1DyPTWjjrUlWs7P5
	 6yASIK/YkYnXfCRXKSkXllM4Dz3iG0S53jmib0/9pVQFCx/+GasJjGbrD6TIty0/TDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=2HByHUi2YpmsLQonsK5yG9lvFZV5+xRUKZvYtQ5pzKU=;
	b=kJ90lTjDrExTCByDPcBtf7F5EtV9d54O4HySErXy+wxWDDrcnMQMeul3V6DweBVlMd8S
	 bD0cWqzw2XNxguxHRrOatAg1noQKyHo05INXflxy5FTXfuI/jLWCelCvXXeTDp9UafiY7
	 4ySbNzTj8797dty4y3He84pmuAuFAEHJucE/Jbn0aA+ESPIGbVOu6AB4Txx7mJc1rJLNC
	 o9PwG2pyG+exo+Ck1gnzscswK6roJdadz9nKts8MaFXYtCL3aZxhmBw46kKNRFCvkXROA
	 WDpf1jEmX+niQGjCrj+rDrjLDE/0/dNvmSACAVlZ9uaI+r48l6eU9k423vQcMBIachg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b="UED2p/gt";
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552ED606A323
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 21:00:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 552ED606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=UED2p/gt
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-536717a4d83so29704361cf.2
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 14:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793048433; x=1793653233; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2HByHUi2YpmsLQonsK5yG9lvFZV5+xRUKZvYtQ5pzKU=;
        b=UED2p/gtf4O6u9c74cuXetW834czgcnqI6W31nf9lccF/t1KJir6B9tX1s6sDZAib1
         WytXWbBBLvIfNBG0keWS3HOB/q5ImE80yEbTcB9+nBVwUKWxqrrxwW5GCsTdprD2vqu4
         UizDzGbrgogujyZTam0ii/ZuibaE3FAcsubEpzjTLdu82u7Arz0ToS9Vpa7OWBr2uu36
         l0W9FF2DHg5C09YEIWoHBYzhk76Ixbmzsb3MMIhyZAQvDGYU5T/tuD4lfV/nw0uASjLH
         rwDI27s/nU4LYudlV/lUIwMcXUZ+Iz28qm3uQbyElnm3sGcU9QFHn3E2BWq9yeA1pkXD
         SjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793048433; x=1793653233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2HByHUi2YpmsLQonsK5yG9lvFZV5+xRUKZvYtQ5pzKU=;
        b=SgfFccaJ7T3ZExzJWsidBJG/MsYkvsl7CKnK45w0br4PpFDsSzYQe8rwY02VrFe4F1
         UcHo1OwzAWjb1jrYF5fFod42PveB9dVhQVqZnITnqhr7DEsINwk+Lrej2oi6xcYwWA2L
         5N+pH3xCg3TwHqAXg7rxNHx1yWDITwZB3R5QQaZoe2jwQk8Y6rjHp/w9Sx11DDyKeEBr
         6wzuiAHSOMB7H7iM7JZnVGRvSWo+Fr7bBmmPrvMu2k3NImHqtiGbt4hyDHuMzzhK40bn
         SHaakdg3Qcbw2mnbsOgK/zvohnagNKfl5av+fZnDU9ukTK2/U6Udrz2+e08V+exePZSM
         0J3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwtXJx2uDZDbnSC/eZzpBy7FEoP4lqJpA/0Xq/LYWosz+b2/Kalgw9W2Dp9FgsmHIkBV+oi7d2BG96UEvUTI0Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7S1zFkpNaw9qqY5En2lN9H9iNE3VXtfxKYRZl+LYpK9QT8JQN
	pqZI2QSMutE4AijEtVVMmsJvDT8jfrJzX3qSEYHivapXJp43O4QoFrLhDQIAviJOX8o=
X-Gm-Gg: AYBFou177CWhowK7+CZuQF7V6XtfRbYUApTV0uBw7naVLN7Zp3BGPwaiLUoIAQYyrEy
	vGaMHfia2Si6PuPSoneG4R9yvXMiSVEZSNFRP1CMmv65elbpCM6Z2gMhZHHp+ixUrPlViocsNUp
	kG2j2GqON2L3Qqt8g5BLvlVb23BrHU7fuscDRKHu5WnAHZheIzhbxUFsECXJ9TMODZ/a+XdIAMv
	jSsDmvqdcsT+pkMgZhP5DIN6+Nu3sSK+BIpqmeXra+eogNBLduSoazx+3yYtQTJR7Ta9uh8Ggvo
	+pSqD71pXiLAZS1cQlPM+V4Boy2smiCELrWevbI2dHu+Nsjv7gh9y155GTgFQWDrb/oLwPUaiID
	ZPJI252b0UoIOelmCmUcF1tVyhj3ZZP4fmpPC0b9MXe/l8clroYSwxDPQQaynPmXsMrzU06ltX5
	SStU6z4agXilfcj8Zs04uOSNVlQsZTaGrhURdHMHImpijkuN29A/tDYOjwxwsEvNsNZSVR6ztfr
	hluJKnV0S57DSVCGBGjclcavqy0XatD75x9MJoFzJCnAkv+4DUWZyJ4EzAlWTsGDjDhvPar
X-Received: by 2002:a05:622a:1814:b0:536:780e:8f48 with SMTP id d75a77b69052e-5383b63dad5mr126696121cf.30.1793048433101;
        Mon, 26 Oct 2026 14:00:33 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-538397405edsm63971551cf.27.2026.10.26.14.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:00:32 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Mon, 26 Oct 2026 21:00:19 +0000
Subject: [PATCH v7 1/6] userns: record how far up CAP_SETFCAP reaches
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
Message-Id: <20261026-b4-setfcap-userns-v7-1-bf8a576f7259@toxicpanda.com>
References: <20261026-b4-setfcap-userns-v7-0-bf8a576f7259@toxicpanda.com>
In-Reply-To: <20261026-b4-setfcap-userns-v7-0-bf8a576f7259@toxicpanda.com>
To: Serge Hallyn <serge@hallyn.com>, Paul Moore <paul@paul-moore.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: James Morris <jmorris@namei.org>, David Howells <dhowells@redhat.com>, 
 Jarkko Sakkinen <jarkko@kernel.org>, "Andrew G. Morgan" <morgan@kernel.org>, 
 Serge Hallyn <sergeh@kernel.org>, linux-security-module@vger.kernel.org, 
 linux-kernel@vger.kernel.org, keyrings@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
 linux-kselftest@vger.kernel.org, Bradley Morgan <brads@mainlining.org>, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793048427; l=5250;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=8IuY/d3QkcyzNsZWg+ftGcwOPwv9NKh0B+T0u35iHR4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPMvQGkrsC6jLRBSPJ4NeGqgaTkWqQmTJWM9t1AFKSWcIYYvJ5q2j3SesTDxmd/CyhkUezPSSmc
 ++YiTsjN1cAo=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

create_user_ns() records in ns->parent_could_setfcap whether the creator
had CAP_SETFCAP in its effective set, and verify_root_map() trusts that
when a task in the new namespace maps the parent's uid 0.  A bool only
describes the parent, though.  File capabilities belong to the kuid of a
root user, and a namespace that maps the parent's uid 0 shares that kuid
with the parent and possibly with ancestors further up, so what matters
is how far up the creator's CAP_SETFCAP counted.

Replace the bool with ns->setfcap_level: CAP_SETFCAP held in the
namespace counts there and in its ancestors up to the one at that
->level.  cap_setfcap_level() computes it from the creator's cred.  A
creator that holds CAP_SETFCAP passes on the setfcap_level of its own
namespace, one that doesn't gets the new namespace's own level, and the
initial namespace has 0.

verify_root_map() keeps checking the same condition: the bool was false
exactly when the level is the namespace's own.

No functional change.

Reviewed-by: Bradley Morgan <brads@mainlining.org>
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/capability.h     |  3 +++
 include/linux/user_namespace.h |  7 ++++---
 kernel/user_namespace.c        |  4 ++--
 security/commoncap.c           | 27 +++++++++++++++++++++++++++
 4 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/include/linux/capability.h b/include/linux/capability.h
index 622137f66f09..026974a5111b 100644
--- a/include/linux/capability.h
+++ b/include/linux/capability.h
@@ -34,6 +34,7 @@ struct cpu_vfs_cap_data {
 #define _USER_CAP_HEADER_SIZE  (sizeof(struct __user_cap_header_struct))
 #define _KERNEL_CAP_T_SIZE     (sizeof(kernel_cap_t))
 
+struct cred;
 struct file;
 struct inode;
 struct dentry;
@@ -222,4 +223,6 @@ int get_vfs_caps_from_disk(const struct mnt_idmap *idmap,
 int cap_convert_nscap(const struct mnt_idmap *idmap, struct dentry *dentry,
 		      const void **ivalue, size_t size);
 
+int cap_setfcap_level(const struct cred *cred, struct user_namespace *ns);
+
 #endif /* !_LINUX_CAPABILITY_H */
diff --git a/include/linux/user_namespace.h b/include/linux/user_namespace.h
index 91232053775d..f3753b6b6d29 100644
--- a/include/linux/user_namespace.h
+++ b/include/linux/user_namespace.h
@@ -86,9 +86,10 @@ struct user_namespace {
 	kgid_t			group;
 	struct ns_common	ns;
 	unsigned long		flags;
-	/* parent_could_setfcap: true if the creator if this ns had CAP_SETFCAP
-	 * in its effective capability set at the child ns creation time. */
-	bool			parent_could_setfcap;
+	/* setfcap_level: CAP_SETFCAP held in this ns counts here and in the
+	 * ancestors up to the one at this ->level, see cap_setfcap_level().
+	 */
+	int			setfcap_level;
 
 #ifdef CONFIG_KEYS
 	/* List of joinable keyrings in this namespace.  Modification access of
diff --git a/kernel/user_namespace.c b/kernel/user_namespace.c
index 50c374ed4687..a5a94367600d 100644
--- a/kernel/user_namespace.c
+++ b/kernel/user_namespace.c
@@ -125,7 +125,7 @@ int create_user_ns(struct cred *new)
 	if (!ns)
 		goto fail_dec;
 
-	ns->parent_could_setfcap = cap_raised(new->cap_effective, CAP_SETFCAP);
+	ns->setfcap_level = cap_setfcap_level(new, parent_ns);
 
 	ret = ns_common_init(ns);
 	if (ret)
@@ -921,7 +921,7 @@ static bool verify_root_map(const struct file *file,
 		 * the new namespace.  Verify that the parent had CAP_SETFCAP
 		 * when it unshared.
 		 * */
-		if (!file_ns->parent_could_setfcap)
+		if (file_ns->setfcap_level >= file_ns->level)
 			return false;
 	} else {
 		/* Process p1 is writing to uid_map of p2, who is in a child
diff --git a/security/commoncap.c b/security/commoncap.c
index d47ab3022343..4f49dba65426 100644
--- a/security/commoncap.c
+++ b/security/commoncap.c
@@ -131,6 +131,33 @@ int cap_capable(const struct cred *cred, struct user_namespace *target_ns,
 	return ret;
 }
 
+/**
+ * cap_setfcap_level - Determine how far up CAP_SETFCAP of a cred reaches
+ * @cred: The credentials to use
+ * @ns: The user namespace to look from
+ *
+ * File capabilities belong to the kuid of a namespace's root user, and the
+ * same kuid can be the root user of ancestors of that namespace.  Every task
+ * gets CAP_SETFCAP when it enters a user namespace, so having it there says
+ * nothing about those ancestors.  user_ns->setfcap_level does: it is taken
+ * from the creator when the namespace is created.
+ *
+ * Return: the ->level of the topmost namespace, from @ns upwards, for which
+ * CAP_SETFCAP of @cred counts; @ns->level + 1 if it doesn't even count over
+ * @ns, which includes an @ns that isn't @cred's namespace or a descendant.
+ */
+int cap_setfcap_level(const struct cred *cred, struct user_namespace *ns)
+{
+	if (cap_capable(cred, ns, CAP_SETFCAP, CAP_OPT_NOAUDIT) != 0)
+		return ns->level + 1;
+
+	if (cap_raised(cred->cap_effective, CAP_SETFCAP))
+		return cred->user_ns->setfcap_level;
+
+	/* All we have is that we own a child of our namespace. */
+	return cred->user_ns->level + 1;
+}
+
 /**
  * cap_settime - Determine whether the current process may set the system clock
  * @ts: The time to set

-- 
2.55.0

