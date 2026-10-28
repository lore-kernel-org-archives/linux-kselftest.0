Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793225893;
	b=Ev+HcHqODqhJo/A8aIYXi2hITPqYUsKUZPlq3zde2knmF0x/gyv871aJpqi+I4oxeS6G
	 G0Ia0SuaGcS9aD5dawVbPqp4fTo1TxJOtGcHcYbJDjA9OUUKw4M9ymi3tW6fUSAnd+LeS
	 mN+r+Nq+dLDjL8sNyULfSOX9kDQaz0uFQh+OfBztK/yhM/fkqWRH3mHAY1+Ff7INaRVYA
	 H22twMMOpb1VGTN+apoYkvC5zIuQ+aoMYVmb3s1pRHF36wn3mSlxL1Hzmtr8AmYUWBngP
	 qPvpUXZ9rg8cpTxjcT/Mhg0t1PQDvz5d0Bu4x/FSkZwmwMIyqhmT/HTxoyW8w9HnDLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793225893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=9FCa9rxR0w5Su0OT2TXTOp3Qrhv4gyecy+qhdi4ZgS0=;
	b=roXdjVrTZUrO58+AxcdMjeG6UmBPMpoq5242eqvhKlmaD5gbyYVoqFrQgSHpOHvEWWkH
	 lQmJ0sz4BhylTU4pt7h8q2Khcr2VpoYVJDIlammzVtXljBYBTYOYa5iYuYF66ftoIUoqP
	 I2rM5+kCp0swl+UpEnM9gUtNyBh1wqgcEF12GtosYDIVfjcBmZaDx6O8uduxo/KL2Ozh9
	 GIbjk91ZP7uMpeUpsu4FJJKmYkk2ClS/9TY9OLSd/0vKmYBkPIiDC07LVIP4TBo8itRKS
	 knKmKGoVsWfxLC8xwJGmydKcWTol2FvQfzs7iX7c2Ne7GcLvohz93B7R0p00VIxD1vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--halg.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qDCHVDvA;
	arc=none smtp.remote-ip=209.85.208.72
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6EC606A326
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 22:18:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B6EC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--halg.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qDCHVDvA
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6acb986a43bso1693008a12.3
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 15:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793225892; x=1793830692; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9FCa9rxR0w5Su0OT2TXTOp3Qrhv4gyecy+qhdi4ZgS0=;
        b=qDCHVDvAeZE6nbJqwRWR2O44xWY+Cp4tlC8bvUrtxDRAWy7MMFL83SYTkz8TNqKsYX
         gw1vBYGaeYTemXnD8a0lBWoYo28oKE7vPnRudgDUssXwZw1ea/Deh1fJc0mhuqa8rur+
         ialRmLMoxbR0y1BZDysn0LDoBy0CGo8zQvFvT4e+PLyKzs9aD36pn6eDh3rQ5dmnKbJM
         /03mF44Ezy6bO32TeK9dJcml4xAYiygRoQDgF2vsi/FTxTi6cOf9+5ACwfOv4IK5MYct
         0+WvSEOHYhr41BaVAZcR7Z7Juw1D6xHfuNadDPF4b0QOkXCrApVxpNLQWAFKUms3aWjd
         4goQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793225892; x=1793830692;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9FCa9rxR0w5Su0OT2TXTOp3Qrhv4gyecy+qhdi4ZgS0=;
        b=CdEv8Y3aNNlP7BIsBBTqqR1zQj9izALrkwlsOvdsLPQAL9nPJsJIWGinsBvdmcg98C
         Ioh1bYOEc0onzs5Dec6WMYoJq/87ay6ZCJp/hprzBHEogZ+cYjHd7A7J5RPmLa2rerXV
         WVDjxI2QwSYgRc56u4MAVoh3fqVxAk/Cn0/kUF+SwlWLnChjz27Hn2m5qmY3ZMHo6KDl
         b87gCC+QtotU1ybsv44J7k6g2LOw5kvj4N4A4qYlGzgqwwcSouvcmamnSnLyuTt1iMny
         3wfUbBXP9Uh3O/CvWdKlUPfmWpJ6VLrhvZkYgmkHNcLR7QS1qogsZ6+u5QJidRGOI0Em
         0acg==
X-Forwarded-Encrypted: i=1; AKwUvBzjEDSiNqvBKBF2XnV2bMHdrsc4tA1Bs6PpZUBEQhmn62w+vObUgDNYvhhtXrUBKWA6cPWJB7CUX0IWWetU/5o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrDtraKnGNynrjN7maANa+D5uEVu2LFd7OYDKZYvv+yQeg/rD/
	3LyyTmVHTrCswle7isoPqVE0zzFnEgwxK5X7/n5BOkccb3xS1rMFNc+A1mKftVaQ0+YWJCO4aA=
	=
X-Received: from edt14.prod.google.com ([2002:a05:6402:454e:b0:6b1:c2b6:cf0a])
 (user=halg job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:cfd3:0:b0:6b4:2aa6:2c07
 with SMTP id 4fb4d7f45d1cf-6b49cbd8fa6mr2184624a12.14.1793225891454; Wed, 28
 Oct 2026 15:18:11 -0700 (PDT)
Date: Wed, 28 Oct 2026 22:16:58 +0000
In-Reply-To: <20261028221705.3915340-1-halg@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261028221705.3915340-1-halg@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261028221705.3915340-2-halg@google.com>
Subject: [PATCH 1/8] net: introduce CLONE_NEWNET_LOOPBACK to auto-enable loopback
From: "Hallgrimur H. Gunnarsson" <halg@google.com>
To: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, Kees Cook <kees@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Jan Kara <jack@suse.cz>, James Morris <jmorris@namei.org>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jann Horn <jannh@google.com>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, KP Singh <kpsingh@kernel.org>, 
	Jonathan Calmels <jcalmels@3xx0.net>, Casey Schaufler <casey@schaufler-ca.com>, 
	linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-api@vger.kernel.org, containers@lists.linux.dev, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "Hallgrimur H. Gunnarsson" <halg@google.com>
Content-Type: text/plain; charset="UTF-8"

New network namespaces start with the loopback interface DOWN by
default, requiring CAP_NET_ADMIN over the owning user namespace to
bring it up.

To block external network access while preserving the localhost
networking that many applications expect, sandboxes (such as bwrap,
nsjail and minijail) commonly create an isolated network namespace
with only the loopback interface enabled.

However, requiring a sandbox to hold CAP_NET_ADMIN in a new user
namespace solely to bring loopback up conflicts with reducing the
CAP_NET_ADMIN attack surface.

Today, an unprivileged sandbox or sandbox manager must start with
CAP_NET_ADMIN in its user namespace to be able to bring up loopback,
drop it, and then take precautions to block CAP_NET_ADMIN from being
regained in nested user namespaces (e.g. via seccomp or
max_user_namespaces limits). This adds considerable complexity just
to bring up loopback.

Conversely, if CAP_NET_ADMIN is restricted at user namespace creation
time, tasks inside the new namespace never acquire CAP_NET_ADMIN.
While this removes the CAP_NET_ADMIN attack surface down the
namespace hierarchy, it also prevents userspace from bringing loopback
up, breaking localhost networking for unprivileged sandboxes.

Introduce the CLONE_NEWNET_LOOPBACK flag for clone3() and the
corresponding UNSHARE_NEWNET_LOOPBACK flag for unshare(). When
specified, each flag implies CLONE_NEWNET and automatically brings the
loopback device up in copy_net_ns() before returning the new network
namespace.

Making this an explicit opt-in preserves default network namespace
semantics while allowing unprivileged sandboxes to create an isolated
network namespace with functional localhost networking without ever
holding CAP_NET_ADMIN.

Signed-off-by: Hallgrimur H. Gunnarsson <halg@google.com>
---
 include/uapi/linux/sched.h |  2 ++
 kernel/fork.c              | 22 ++++++++++++++++++----
 kernel/nsproxy.c           |  9 +++++++++
 net/core/net_namespace.c   | 11 +++++++++++
 4 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/include/uapi/linux/sched.h b/include/uapi/linux/sched.h
index 33a4624285cd..efd00d9f8bd3 100644
--- a/include/uapi/linux/sched.h
+++ b/include/uapi/linux/sched.h
@@ -40,6 +40,7 @@
 #define CLONE_NNP		(1ULL << 35) /* Set no_new_privs on child. */
 #define CLONE_PIDFD_AUTOKILL	(1ULL << 36) /* Kill child when clone pidfd closes. */
 #define CLONE_EMPTY_MNTNS	(1ULL << 37) /* Create an empty mount namespace. */
+#define CLONE_NEWNET_LOOPBACK	(1ULL << 38) /* Create network namespace with loopback UP. */
 
 /*
  * cloning flags intersect with CSIGNAL so can be used with unshare and clone3
@@ -52,6 +53,7 @@
  * unshare syscall:
  */
 #define UNSHARE_EMPTY_MNTNS 0x00100000 /* Unshare an empty mount namespace. */
+#define UNSHARE_NEWNET_LOOPBACK 0x00200000 /* Unshare network namespace with loopback UP. */
 
 #ifndef __ASSEMBLY__
 /**
diff --git a/kernel/fork.c b/kernel/fork.c
index 416758c8a3d4..c0f7520e754a 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2728,6 +2728,15 @@ pid_t kernel_clone(struct kernel_clone_args *args)
 		args->flags = clone_flags;
 	}
 
+	/*
+	 * Set implied CLONE_NEWNET before copy_process() so that
+	 * security_task_alloc() and other clone_flags checks see it.
+	 */
+	if (clone_flags & CLONE_NEWNET_LOOPBACK) {
+		clone_flags |= CLONE_NEWNET;
+		args->flags = clone_flags;
+	}
+
 	/*
 	 * For legacy clone() calls, CLONE_PIDFD uses the parent_tid argument
 	 * to return the pidfd. Hence, CLONE_PIDFD and CLONE_PARENT_SETTID are
@@ -3010,7 +3019,8 @@ static bool clone3_args_valid(struct kernel_clone_args *kargs)
 	if (kargs->flags &
 	    ~(CLONE_LEGACY_FLAGS | CLONE_CLEAR_SIGHAND |
 	      CLONE_INTO_CGROUP | CLONE_AUTOREAP | CLONE_NNP |
-	      CLONE_PIDFD_AUTOKILL | CLONE_EMPTY_MNTNS))
+	      CLONE_PIDFD_AUTOKILL | CLONE_EMPTY_MNTNS |
+	      CLONE_NEWNET_LOOPBACK))
 		return false;
 
 	/*
@@ -3160,9 +3170,10 @@ void __init proc_caches_init(void)
  */
 static int check_unshare_flags(unsigned long unshare_flags)
 {
-	if (unshare_flags & ~(CLONE_THREAD|CLONE_FS|CLONE_SIGHAND|
-				CLONE_VM|CLONE_FILES|CLONE_SYSVSEM|
-				CLONE_NS_ALL | UNSHARE_EMPTY_MNTNS))
+	if (unshare_flags & ~(CLONE_THREAD | CLONE_FS | CLONE_SIGHAND |
+				CLONE_VM | CLONE_FILES | CLONE_SYSVSEM |
+				CLONE_NS_ALL | UNSHARE_EMPTY_MNTNS |
+				UNSHARE_NEWNET_LOOPBACK))
 		return -EINVAL;
 	/*
 	 * Not implemented, but pretend it works if there is nothing
@@ -3266,6 +3277,9 @@ int ksys_unshare(unsigned long unshare_flags)
 	if (unshare_flags & CLONE_NEWNS)
 		unshare_flags |= CLONE_FS;
 
+	if (unshare_flags & UNSHARE_NEWNET_LOOPBACK)
+		unshare_flags |= CLONE_NEWNET;
+
 	/* No unsharing with overriden fs state */
 	VFS_WARN_ON_ONCE(unshare_flags & (CLONE_NEWNS | CLONE_FS) &&
 			 current->fs != current->real_fs);
diff --git a/kernel/nsproxy.c b/kernel/nsproxy.c
index d9d3d5973bf5..4e30c6a9f8ed 100644
--- a/kernel/nsproxy.c
+++ b/kernel/nsproxy.c
@@ -231,6 +231,15 @@ int unshare_nsproxy_namespaces(unsigned long unshare_flags,
 		flags |= CLONE_EMPTY_MNTNS;
 	}
 
+	/*
+	 * Convert the 32-bit UNSHARE_NEWNET_LOOPBACK (which aliases
+	 * CLONE_CHILD_CLEARTID) to the unique 64-bit CLONE_NEWNET_LOOPBACK.
+	 */
+	if (flags & UNSHARE_NEWNET_LOOPBACK) {
+		flags &= ~(u64)UNSHARE_NEWNET_LOOPBACK;
+		flags |= CLONE_NEWNET_LOOPBACK;
+	}
+
 	*new_nsp = create_new_namespaces(flags, current, user_ns,
 					 new_fs ? new_fs : current->fs);
 	if (IS_ERR(*new_nsp)) {
diff --git a/net/core/net_namespace.c b/net/core/net_namespace.c
index da5f881fbd3b..70972639932a 100644
--- a/net/core/net_namespace.c
+++ b/net/core/net_namespace.c
@@ -596,6 +596,17 @@ struct net *copy_net_ns(u64 flags,
 		dec_net_namespaces(ucounts);
 		return ERR_PTR(rv);
 	}
+
+	if (flags & CLONE_NEWNET_LOOPBACK) {
+		rtnl_net_lock(net);
+		rv = dev_open(net->loopback_dev, NULL);
+		rtnl_net_unlock(net);
+		if (rv < 0) {
+			put_net(net);
+			return ERR_PTR(rv);
+		}
+	}
+
 	return net;
 }
 
-- 
2.56.0.313.g2479322e68-goog

