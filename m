Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794945283;
	b=ocwDdOTfLiRFeC8UOqIrNRSp+6LcweT/T7zjxUc83WqKFi8qH9Mb+5beYLPwi9gKqTLW
	 DlFoYP8c/VMYJqdqnuIVcx4MvkxoGbi8Y+/4GBrBIUbR5L+SaiquorA/mkgme8bMyGgiu
	 BEaLpLXgbIeF16LlHPUrZpC2dNynKej9aDG7VTIkjbiKaDg6Ew8oGtGDbiWYdq9iazfZE
	 fwru/tI+alZ5bFSIBpYHASHXSFKTv3D9GSJLi12jc08e6zwp1K3alEaHBmRCUcSLOLYje
	 FZcAdkGuan13eBhi+dqoRe8AnCie+0YO48EZDyHnS2EBizt4KhAneXj+5IWETkw+1Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794945283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=UgyoOlhtAXFcRqYIBOM2SsXiIxJADqweX4syv/IHfy8=;
	b=OP/VOAJxiI+YCWG6/OXmuQLllSDuLLHydHHx9WJ6TrWNWIeBPq+W93vihJYj9l2f2OSc
	 V2IFbER+M1ZuUgEf30MVPg1Vr50Oetsohd5QQQ4yD8OwE2aREKqjx2zIVVSZFosFJBffK
	 RuIOu9vDPUTqA/OXcptsd9GhuG/7GN5JWjG5LKWiFvk1D/TDXexhJJEkIMzYNAQ/ysa1k
	 GulsvxAmWLcGpJy0UhFCEazTy7GKKQTl1iZJAExoYdDFUvYEH+TFV9V8X+bYAG1WWA3z/
	 Xyb5R9OF045oSy1xJe07uduXXHiYNX9NqQQOyIWbztQO80dcTcwfJKzPUVq+TV9KzmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=PsPV0FbS;
	arc=none smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25822606A32F
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 19:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25822606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=PsPV0FbS
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93f20c3aaa5so21052985a.2
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 11:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1794945282; x=1795550082; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UgyoOlhtAXFcRqYIBOM2SsXiIxJADqweX4syv/IHfy8=;
        b=PsPV0FbSoH3EBsZAiDqYx4piVy+a+VsdVn6lf6uYuC61CddilVAm/78NvIF1l8cu3j
         S9qkOZL8tbETOSF7/qX+O680lu7hbbfkK5ISAJj9KOsOEchkMxGBFySEip1YZiERAe9v
         fcqt18LHLcmcHL0YV1hR3MMkyQCGl7Pd/1ESR4EguCNCCTrNMbIWmIyoeC8ZnIFhhGJt
         OUUy+0ba4BDG6RslNg6Oupl3qrOMEWAEpFYdS0S2K/xG2sZmjm7CO8YlqvRlsGltba8w
         FHz+pmlsC1HBGfLfpREe5NPXm5AIX+O3Hja89UZocTvp5DX4cWWo4NpnMibrp2qVJwfY
         5ZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794945282; x=1795550082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UgyoOlhtAXFcRqYIBOM2SsXiIxJADqweX4syv/IHfy8=;
        b=k4ocfZXek1fY0XaWvKNXhgvtS8QB4kGzqtMoJuM04XUIB9Rz9UGUXw8lXnZDNA7JhE
         WVesfvJ+k0DgoYg5VUYuiCrb0Wo9ROz+lAPiRg9Bebx9LCulG6HBqC6/5WEJkMMJp/YP
         kyTXUTWyW6ofElBCSQa7v0OFzeN7pFiJDV7+vawikUeHOKX7B0rPZEOfao6BbfH2poAj
         xELLTc6mXieaOOFOVN3ylOPlfkzdqk+wLz9rrdC2t/tYbF77jaqm7SNENts5xn6Nkuet
         V5pA+0F69HyHTEG6f4S5tclKwA93MKFAH0+hEZ1uXgRnBD0keTbVVoCgg+19BNR2a341
         ZuFw==
X-Forwarded-Encrypted: i=1; AL+hErHIr8ZittEeN0mm1lJmENase6pjf2nR/e4jHuuKZFRDSWUPxS/YQvGa1A4KNI3oQYZZdwuvYaTl/jjQ19r4/XE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9s1lrVbWlKE3OElgYgCLus0OJOEgZYr7vg0bB5nZDMehGT59Kh
	s2CHahpHRvFDeV3TokA6rqZV7WKmxvR1o11UbC8c3evgN4qSHfJBLDz/j2hrXuw9DVc=
X-Gm-Gg: AYBFou2E61/V/0/jQ4PQFdyd8YAGFM6YNK9RWVchOJfJUqjYH8o6Wm1UTpSHjrXe32q
	HDLhV0xqp3jse+XfIpRtEMsaXVDvdcGYQ6lO6xuIJN1N78B0bD2PTbc4cR/3H0oTtuMMPAGdC/P
	BEbOb896k24YPF5BFLwwy8ggOfqrVYT6fqTnRc6DABAXd7rGFAtD/8S2qmXI6zqd8zxgmuTmxJE
	Gu4JrTm/C5FilYhFVSyszoAtr8ZEQ/eZPg5ZZ0LkRi9Yak6xpRHtafb1ky+5QrFvqzpEmFhkgYU
	4FGQ4JYYszgWhSIH8M1BRUrvFyXoNJw5Anh71YTaCYdRSKiXIqUA5+SwTK7m09Jp2nOSBYxsQoh
	OO6iO9Y9OIDBWej47OuoAo7YUmG4/cxc000Fyp5D8MJbUeVjbN2XNpY5ofjCD0irIYyu2qWvD8t
	1O2DL9kM6JTDU57u3aBe58WiBS8JEUWKgo+koKJuZ644NOxjY0xTMUlisAoKxZwia2B09z13tR3
	8WAqPN7W6SkkChBOftvkOCynFlrQZtlju4Osb6fD9VKvti/9fkiiNNnfLmUOCwPWQ6JfMbWm/zg
	to6AQckZGXAWvyFdWNrDeAQpnQjHMx+HZFzKDjwnbzuYKt4=
X-Received: by 2002:a05:620a:aa1a:b0:93e:7944:b869 with SMTP id af79cd13be357-9499a2e5dfamr57612185a.42.1794945281909;
        Tue, 17 Nov 2026 11:54:41 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.242])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b2892a2sm11834385a.0.2026.11.17.11.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:54:41 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 17 Nov 2026 19:54:24 +0000
Subject: [PATCH v11 1/3] userns: don't let setns() lend CAP_SETFCAP
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
Message-Id: <20261117-b4-setfcap-userns-v11-1-2be11a2c32f4@toxicpanda.com>
References: <20261117-b4-setfcap-userns-v11-0-2be11a2c32f4@toxicpanda.com>
In-Reply-To: <20261117-b4-setfcap-userns-v11-0-2be11a2c32f4@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1794945277; l=6359;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=32+LoADG6QT10HmGwykW7egT/CwzPpWpVKUua9+0wRk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGHyA+cL3OHHNMTJIX4UjUCtWID8KWQNCgUe9H/GKWCwJN5/vCEuCpeOxaF9ET3I/VTjk6W6sRU
 BS5KoVSvyuA0=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

A uid 0 task that gave up CAP_SETFCAP can get it back by joining a user
namespace that another root task created.  Commit db2e718a4798
("capabilities: require CAP_SETFCAP to map uid 0") keeps such a task
from mapping uid 0 into a namespace it creates itself, because tasks in
that namespace could then write file capabilities for its root user.
setns() gives a joiner a full capability set in the namespace too, so
it can do the same there:

  task A: uid 0, full caps          task B: uid 0, no CAP_SETFCAP
  unshare(CLONE_NEWUSER)
                                    setns(A's user ns)
                                      allowed, euid == ns->owner
                                    write "0 0 1" to /proc/self/uid_map
                                      A had CAP_SETFCAP -> allowed

If A's namespace already maps host uid 0, at any uid, B can set
security.capability on a file right away.  Either way uid 1000 can then
run that file with CAP_SYS_ADMIN, which the selftest at the end of this
series shows on an unmodified kernel.

The check doesn't look at the joiner's uids, which it can change while
keeping its other capabilities, and CAP_SYS_PTRACE doesn't stand in for
CAP_SETFCAP.  What gets refused is a task without CAP_SETFCAP that has
CAP_SYS_ADMIN over a namespace that maps the joiner's root user, or that
has no uid_map yet while its parent maps that root user, so that it can
still be mapped.  If that is uid 0 of the parent and the creator of the
namespace didn't have CAP_SETFCAP, the join is let through: only a
writer with CAP_SETFCAP in the parent could map it then.  Containers
that don't map the joiner's root user, tasks with CAP_SETFCAP and
unprivileged users are not affected.

Like verify_root_map(), the check is about uid 0 of the joiner's own
namespace.  The root user of an ancestor that it maps at another uid,
and a root user stored through an idmapped mount, are left to whoever
set up that map or mount.

Fix by refusing setns() when the joiner doesn't have CAP_SETFCAP and
tasks in the namespace can write file capabilities for the root user of
the joiner's namespace.

Suggested-by: Serge Hallyn <serge@hallyn.com>
Link: https://lore.kernel.org/all/fd159e68-c613-4c7d-bfba-8af0a3f3a96e@hallyn.com/
Fixes: db2e718a4798 ("capabilities: require CAP_SETFCAP to map uid 0")
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/capability.h |  3 +++
 kernel/user_namespace.c    |  4 ++++
 security/commoncap.c       | 49 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+)

diff --git a/include/linux/capability.h b/include/linux/capability.h
index 622137f66f09..9ebcdab56937 100644
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
 
+bool cred_borrows_setfcap(const struct cred *cred, struct user_namespace *ns);
+
 #endif /* !_LINUX_CAPABILITY_H */
diff --git a/kernel/user_namespace.c b/kernel/user_namespace.c
index 50c374ed4687..34becacaccd6 100644
--- a/kernel/user_namespace.c
+++ b/kernel/user_namespace.c
@@ -1390,6 +1390,10 @@ static int userns_install(struct nsset *nsset, struct ns_common *ns)
 	if (!ns_capable(user_ns, CAP_SYS_ADMIN))
 		return -EPERM;
 
+	/* Don't hand back CAP_SETFCAP to a root task that gave it up. */
+	if (cred_borrows_setfcap(current_cred(), user_ns))
+		return -EPERM;
+
 	cred = nsset_cred(nsset);
 	if (!cred)
 		return -EINVAL;
diff --git a/security/commoncap.c b/security/commoncap.c
index d47ab3022343..96ac039fddad 100644
--- a/security/commoncap.c
+++ b/security/commoncap.c
@@ -131,6 +131,55 @@ int cap_capable(const struct cred *cred, struct user_namespace *target_ns,
 	return ret;
 }
 
+/*
+ * @ns has no uid_map yet.  Could @caller_root_kuid still be mapped into it,
+ * so that tasks in @ns get CAP_SETFCAP over it?  A writer in the parent can
+ * map any uid that the parent maps.  If that is uid 0 of the parent, a task
+ * in @ns can only map it if the creator of @ns had CAP_SETFCAP, a writer in
+ * the parent only if it has CAP_SETFCAP there, see verify_root_map().
+ */
+static inline bool userns_may_map_root(struct user_namespace *ns,
+				       kuid_t caller_root_kuid)
+{
+	uid_t caller_root_in_parent = from_kuid(ns->parent, caller_root_kuid);
+
+	if (caller_root_in_parent == (uid_t)-1)
+		return false;
+	return caller_root_in_parent != 0 || ns->parent_could_setfcap;
+}
+
+/**
+ * cred_borrows_setfcap - Check whether a userns gives back CAP_SETFCAP
+ * @cred: The credentials of a task that joins @ns or traces a task in it
+ * @ns: The user namespace
+ *
+ * A task without CAP_SETFCAP can't map uid 0 of its namespace into a user
+ * namespace it creates, see verify_root_map(), as tasks there could then
+ * write file capabilities that are honoured for that root user.  Tasks in
+ * @ns can do that if @ns maps it, at any uid, or if it can still be mapped
+ * into @ns, see userns_may_map_root().
+ *
+ * Like verify_root_map(), this only looks at uid 0 of @cred's namespace, not
+ * at the root users of ancestors that it maps at another uid, and a root
+ * user stored through an idmapped mount is up to whoever sets up the mount.
+ *
+ * Return: true if @cred doesn't have CAP_SETFCAP and tasks in @ns can write
+ * file capabilities for the root user of @cred's namespace.
+ */
+bool cred_borrows_setfcap(const struct cred *cred, struct user_namespace *ns)
+{
+	kuid_t caller_root_kuid = make_kuid(cred->user_ns, 0);
+
+	if (!uid_valid(caller_root_kuid) ||
+	    cap_raised(cred->cap_permitted, CAP_SETFCAP))
+		return false;
+
+	if (READ_ONCE(ns->uid_map.nr_extents))
+		return kuid_has_mapping(ns, caller_root_kuid);
+
+	return userns_may_map_root(ns, caller_root_kuid);
+}
+
 /**
  * cap_settime - Determine whether the current process may set the system clock
  * @ts: The time to set

-- 
2.55.0

