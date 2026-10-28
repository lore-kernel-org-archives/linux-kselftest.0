Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793225893;
	b=jjO1j/Zluiz6iMEWABwyENtaOnOGXvHDxcfgb6uFUa1x+havwNVNESITgRP0I05MuBat
	 FPp8t6OJASbYVujnzG4yjjcuRKvUPZTU1GA1TS+Ieclkx5ij90NoYwWRtGyoOKgOAfgUa
	 QZj5kk4+8jSp8nro3xTx4+4hoMwWZaC/G8mfAVmzUjo4beGCA7mVoJPvmWiFnT8g7wt6C
	 8jLKfg0pqXH2Zhk+S6qDtNsCLHAF49VoyxFz9J1BNNv3Gtq6+Sv6HKrFrHQAFtU3USHD/
	 JO/98Ec04WZhiVh2HKnYJGZzzbHX032GDKUUveIR8ChopSleTN3ApG1Mj6OCBlWz++w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793225893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=zdrXXSLELVsSwHMVPbcUtO/5ayyZxJyxQiN0TcFmn/A=;
	b=rmFtS3QZ396XJdV+T4ABDx7gRNlXjZP/Ta9vxurtOdbWRU6bJRm8lSMuwp9m/rCpK4Wt
	 ouGM9ssPZlcCUcwMiipJvr1QvpU0fjf6Ohmh30pXPhdELWPjW3fwxALpL2RGSX4ex7+s4
	 ytqpfR/kaieK1Ay0xUEg9ohI+q0NMNXOeemCQEn19ROdym8VRbXlm7p/ta+z0KCA1SJlN
	 4WVKls81w26KALZXhUsA+udewZa0wVtBwOMtAdFVL/R8lpyplYQT5H6c2d99EPw5AxqiY
	 Lo7gv+uQ6jMuZDiIgoa8P6QEwL0c8U/AnzieOrpXft08zC1UPfF1nmPuKExd0xqW2Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--halg.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=R0rY2M8Z;
	arc=none smtp.remote-ip=209.85.218.72
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A0D606A322
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 22:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0A0D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--halg.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=R0rY2M8Z
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c2e8c76334fso138083066b.1
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 15:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793225891; x=1793830691; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zdrXXSLELVsSwHMVPbcUtO/5ayyZxJyxQiN0TcFmn/A=;
        b=R0rY2M8ZBUpsVK5bvV77N25RxUNl/lUiEIl/l/IxVInBY6WYxjElllaIF5TS+q6dcU
         z0XpP3NNHCu9S89x/gTlWHBVP7dA9wWeYXTc0glEmrZPaKSnw3haEyProTm/RxyhTpeK
         bgJtiEw+QO4eJlE6D3wwySmvlU8Tg8ja0ActR9YXpRuTwOQRSDKukk9jzd1pAT0O/7jf
         GRxAUBTrmV4J3lwkf2Ay5hI5EI/MZtN14zKbwi3wSxtgUnXQSNSy/BenMyQTitov8cer
         jS1iH/9a990RSGgwDGJWTSCO26h5zi3DAFhRsB6P7SX8T1pnUzd5RmcSiJnQAh79zmm+
         naQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793225891; x=1793830691;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zdrXXSLELVsSwHMVPbcUtO/5ayyZxJyxQiN0TcFmn/A=;
        b=KnSc2mZVm2KizHB1kEJMBPANQEQkzcGNN6rcan1YlINvWL6h9a+dWX5drhh2nO6hca
         x7EyslEpFMI51CcMz0u1TyGHP5Q6TWgQ8PIdkBZ4O9gxX1qg51JqckxHpw9anICx9QND
         ZuIYjV3djR96xwhVpmx7uXYSLPVw9YpETSUD0FoYBtsU5+nDN2FqYl4RmC++xGRED9xi
         2q0YbAsD91X4L2xXnmo/smkEFDEyd/8rjlQ2tBrVZVtywmWigpiFhjHbzWAFoCMfWA22
         +GyPgm9WHY8jzd5FjPoAIePuNfEVovXwX+hqXNab++jVE4CQVSzon5ojf5VVNQw/I9Xq
         HmgA==
X-Forwarded-Encrypted: i=1; AKwUvBwKtxXgJLC0mUKdvoEDV0jHlZyd8GMCczDAh0Ks/18HnIOfK9h6N5AqtHREd6Z7AYD00vkUp94LS2r/0n1p2W0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIO5FUtO2CN3ppBHnIrxWWCt62YZi6fJ+dA7jV/SBNzZkhdzba
	lvYdmNjVsComqArJ8jeKjJ7V0Fb7vGSoCuPhGFFMWlP6cUOk3IFxLblGheIvKv2baPMp/svglA=
	=
X-Received: from educ16.prod.google.com ([2002:a05:6402:1010:b0:6b4:1882:2675])
 (user=halg job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:608e:b0:c46:8b87:c1f4
 with SMTP id a640c23a62f3a-c49bded259fmr314393966b.20.1793225890525; Wed, 28
 Oct 2026 15:18:10 -0700 (PDT)
Date: Wed, 28 Oct 2026 22:16:57 +0000
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261028221705.3915340-1-halg@google.com>
Subject: [PATCH 0/8] userns: per-namespace capability bounding set and opt-in
 netns loopback
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

When an unprivileged process creates a new user namespace, it is granted
a full set of capabilities (CAP_FULL_SET) scoped to that namespace.
While these capabilities are isolated to the namespace, they allow
unprivileged local users to reach deep kernel subsystems (most notably
networking configuration and raw sockets via CAP_NET_ADMIN and
CAP_NET_RAW) that historically assumed a trusted caller and have
accounted for a large share of local privilege escalation
vulnerabilities.

Many workloads and sandboxes use unprivileged user namespaces strictly
for basic UID/GID, mount, PID, or network isolation and never need
high-risk capabilities like CAP_NET_ADMIN or CAP_NET_RAW. Likewise,
system administrators often want a host-wide policy ceiling restricting
which capabilities unprivileged user namespaces may acquire, without
disabling unprivileged user namespaces altogether.

Prior work by Jonathan Calmels [1] proposed addressing this via a sixth
per-thread capability set (cap_userns) alongside a global sysctl mask.
During that discussion [1, 2], feedback (e.g. from Casey Schaufler)
suggested that rather than adding another per-thread capability set and
prctl() interface, capability restrictions could be integrated directly
into struct user_namespace and configured via clone3(). At the same
time, as noted in [1], a clone3() flag alone is not sufficient for
administrators who need to enforce a host-wide ceiling on unprivileged
user namespaces without modifying every userspace callsite.

This series combines both pieces of feedback: it embeds a capability
bounding set (cap_bset) directly into struct user_namespace, reusing
the existing task cap_bset, cap_permitted, and cap_effective sets on
namespace entry, and provides both a system-wide sysctl ceiling for
unprivileged user namespaces and a CLONE_NEWUSER_BSET flag for
voluntary per-namespace restriction via clone3().

In addition, because restricting CAP_NET_ADMIN at user namespace
creation time prevents userspace from bringing up the loopback
interface in new network namespaces, the series first introduces
an opt-in flag to automatically enable loopback on network namespace
creation:

1. Opt-in loopback activation on netns creation (Patch 1)

  New network namespaces start with the loopback interface (lo) DOWN by
  default, requiring CAP_NET_ADMIN over the owning user namespace to
  bring it up. To block external network access while preserving
  localhost networking, sandboxes commonly create an isolated network
  namespace with only the loopback interface enabled.

  However, requiring a sandbox to hold CAP_NET_ADMIN in a new user
  namespace solely to bring loopback up conflicts with reducing the
  CAP_NET_ADMIN attack surface. Today, an unprivileged sandbox must
  start with CAP_NET_ADMIN to bring loopback up, drop it, and then
  block CAP_NET_ADMIN from being regained in nested user namespaces
  (e.g. via seccomp or max_user_namespaces limits). Conversely, when
  CAP_NET_ADMIN is restricted at user namespace creation time (via the
  sysctl ceiling or CLONE_NEWUSER_BSET introduced in Patches 2-3, or
  via LSMs such as Landlock), tasks inside the new namespace never
  acquire CAP_NET_ADMIN and cannot bring loopback up from userspace,
  breaking localhost networking for unprivileged sandboxes.

  Introduce the CLONE_NEWNET_LOOPBACK flag for clone3() and the
  corresponding UNSHARE_NEWNET_LOOPBACK flag for unshare(), which imply
  CLONE_NEWNET and automatically bring the loopback device up in
  copy_net_ns() before returning the new network namespace. Making this
  an explicit opt-in preserves default network namespace semantics
  while allowing unprivileged sandboxes to create an isolated network
  namespace with functional localhost networking without ever holding
  CAP_NET_ADMIN.

2. Per-user-namespace capability bounding set & sysctl ceiling (Patch 2)

  Add cap_bset to struct user_namespace (initialized to CAP_FULL_SET in
  init_user_ns) and introduce a system-wide sysctl ceiling for
  unprivileged users at:
    /proc/sys/kernel/unprivileged_userns_caps_allowed
  (defaulting to CAP_FULL_SET).

  When a new user namespace is created:
  - Privileged creators (holding CAP_SYS_ADMIN in the parent user
    namespace) inherit cap_bset from the parent user namespace.
  - Unprivileged creators (lacking CAP_SYS_ADMIN in the parent user
    namespace) have the child namespace's bounding set constrained by
    the sysctl ceiling combined with any effective capabilities the
    creator already holds in the parent namespace:
        child_bset = parent_bset & (sysctl_ceiling | creator_effective)
    Allowing the creator to retain capabilities it already holds in the
    parent namespace ensures that a process granted a specific
    capability (e.g. CAP_NET_ADMIN) does not lose it when creating a
    nested user namespace.

  When a task enters a user namespace via clone()/unshare() or
  setns(), its cap_bset, cap_permitted, and cap_effective sets are
  clamped to user_ns->cap_bset. In addition, cap_capable_helper() is
  updated so that implicit capabilities granted to the parent-namespace
  owner of a user namespace are likewise bounded by the owned
  namespace's cap_bset.

3. Per-namespace restriction via clone3() (Patch 3)

  Introduce CLONE_NEWUSER_BSET and add cap_bset to struct clone_args.
  When specified alongside CLONE_NEWUSER, the new user namespace's
  bounding set is further intersected with the requested cap_bset mask,
  allowing container runtimes and sandboxes to drop unneeded capabilities
  from a user namespace at creation time even when permitted by the
  global sysctl.

4. Introspection via NS_USER_GET_INFO (Patch 4)

  While tasks inside a user namespace see their initial ceiling in
  /proc/<pid>/status (CapBnd), threads may subsequently drop
  individual capabilities from their per-thread bounding set. Add
  an extensible NS_USER_GET_INFO ioctl on userns file descriptors
  to allow userspace to directly query a user namespace's cap_bset.

5. Selftests (Patches 5-8)

  Add kselftest suites covering CLONE_NEWNET_LOOPBACK, the sysctl
  ceiling, creator capability retention, nested monotonicity,
  parent-owner bounding, CLONE_NEWUSER_BSET and NS_USER_GET_INFO.

[1] https://lore.kernel.org/all/20240609104355.442002-1-jcalmels@3xx0.net/
[2] https://lwn.net/Articles/978846/

Note on tree routing:

While Patch 1 (CLONE_NEWNET_LOOPBACK) touches net/core/net_namespace.c,
most of its changes add clone3()/unshare() flag plumbing in
include/uapi/linux/sched.h, kernel/fork.c, and kernel/nsproxy.c, which
Patch 3 (CLONE_NEWUSER_BSET) builds directly on top of. To avoid
merge conflicts in kernel/fork.c and include/uapi/linux/sched.h, it
may be simplest to route the entire series through a single tree, e.g.
a namespace branch in vfs.git with Acked-by from the netdev and
capabilities/credentials maintainers, or whichever tree the maintainers
prefer.

Hallgrimur H. Gunnarsson (8):
  net: introduce CLONE_NEWNET_LOOPBACK to auto-enable loopback
  userns: introduce capability bounding set for user namespaces
  userns: allow restricting capability bounding set via clone3()
  nsfs: add NS_USER_GET_INFO ioctl to inspect user namespace
    capabilities
  selftests/net: add test suite for CLONE_NEWNET_LOOPBACK
  selftests/capabilities: tests for user namespace capability bounding
    set
  selftests/capabilities: add clone3() tests for CLONE_NEWUSER_BSET
  selftests/nsfs: add tests for NS_USER_GET_INFO ioctl

 Documentation/admin-guide/sysctl/kernel.rst   |  37 ++
 fs/nsfs.c                                     |  29 +
 include/linux/cred.h                          |   3 +-
 include/linux/sched/task.h                    |   1 +
 include/linux/user_namespace.h                |  20 +-
 include/uapi/linux/nsfs.h                     |  17 +
 include/uapi/linux/sched.h                    |   9 +
 kernel/cred.c                                 |  10 +-
 kernel/fork.c                                 |  38 +-
 kernel/nsproxy.c                              |   9 +
 kernel/user.c                                 |   1 +
 kernel/user_namespace.c                       | 100 +++-
 net/core/net_namespace.c                      |  11 +
 security/commoncap.c                          |   8 +-
 .../testing/selftests/capabilities/.gitignore |   1 +
 tools/testing/selftests/capabilities/Makefile |   2 +-
 .../capabilities/userns_bounding_set_test.c   | 566 ++++++++++++++++++
 .../selftests/clone3/clone3_selftests.h       |   1 +
 .../selftests/filesystems/nsfs/.gitignore     |   1 +
 .../selftests/filesystems/nsfs/Makefile       |   4 +-
 .../selftests/filesystems/nsfs/userns.c       | 120 ++++
 tools/testing/selftests/net/.gitignore        |   1 +
 tools/testing/selftests/net/Makefile          |   1 +
 tools/testing/selftests/net/loopback_netns.c  | 103 ++++
 24 files changed, 1069 insertions(+), 24 deletions(-)
 create mode 100644 tools/testing/selftests/capabilities/userns_bounding_set_test.c
 create mode 100644 tools/testing/selftests/filesystems/nsfs/userns.c
 create mode 100644 tools/testing/selftests/net/loopback_netns.c


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.56.0.313.g2479322e68-goog

