Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793048434;
	b=P/xsMl0akcIFZv47Q2fKAruqZdsv/IKTRn0H4OtBMjvzYT7pOrcfYk3Urd1b6ylqTepE
	 4ljAlx2iKwfL5Zd+OBiOvRGafgdq1X1cGhAh08j0iRjpHvCY9tl7S9txwa4prOl86Srde
	 bK7Mg8mLiWBuHQ8BG6YlbRY0IqLn0b/SkEkfXYL087xCd7d1m995FMxz44zTD10XoKlHn
	 AsNKOllgcs64X1ALDBBTVnfpRLhP+0wz6iuMzJWNCbcCOneRLzQ3Jr2Df2HyMylPf/IDf
	 8pGGVR0RINGSHiJfQM8sf45y+8anyUY43/aC3lphBEhZr5Jf3OlRlFhrDVbZz1LZMtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048434;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+p32Ti26QRWt0NueNYGBYouvJ3r372yUD/MqS9TWTy4=;
	b=T9cT2aT9U6n9AUhCn700qA35F22hnz8xKOmV2IsyKmusRcRwbikQ0V/BsFX9eU/47r7O
	 ydXhdh0BfEmB3z/Om9t/HDZMS4J2JxZomJrS8OmhKipOaIiB1FW44XsKsOn/VjSq/lsG+
	 raV/vE33asCiky+qMH/2W3tieUwEsScDOOdeIsDtrUl7PlwT+MExuT8iP5Z85/OAmBxyE
	 q7yhOmC2/bvikcpS2kEp8ele1Q4tPR0kikYS8RNO4SEvLyBzadKMRklGJYgqREISRwdGB
	 IUrAgUH9K4Z0p9NUgBNU+4tvYTX00lWx2mNK8/6mu2UhwbjbBxk+T1sQmXMiqKJeXOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=cfM5969Z;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7E3606A31D
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 21:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB7E3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=cfM5969Z
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91befbcad6dso59530156d6.3
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 14:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793048433; x=1793653233; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+p32Ti26QRWt0NueNYGBYouvJ3r372yUD/MqS9TWTy4=;
        b=cfM5969ZcUVPxdU/tLUVbvnCTpYoY4DOABEhMpjoF+msPIh20cdPtYUyr1aemFM4wH
         0EXmQ4Y5+I3B7LYbEaSOwetIw0AKrTHezeY6LxuBNXynWjOsF+Lc2bOrKpV/Zz5PmALU
         XqNb6T+qEjY5hAgrHuSHS8ytyFPpRgSr2QLzIc2aBtJhBG+6KtJMR1FspyTdsefsYJMl
         yBcwQrbARbg/dYgayuneSFgC3k2jc6LAhttvXL3ytFOWJ3/eyBVy4xd1e/Z6BcxbdChg
         KPRxsBW3to5jlmiN6aViMUgZljcpGxK9AUrGGjH8FiY+7ok2JUZ+uEiAWFx+0o+C/tHr
         w//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793048433; x=1793653233;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+p32Ti26QRWt0NueNYGBYouvJ3r372yUD/MqS9TWTy4=;
        b=u+9Ru8oXiGJ0SgENjO68ZSSXW3gS5vKVKh4UI+sqcxp28amiuyYiC7Jp1gxPPfip9/
         0OG1KPHihYXIi5B2xVRl+i9/XrlGvwTocI4HYCgLtlcAQIOr8JB3P2+1ArYMPSTvkDU5
         tQEEp43zIJ79a6K7u3UFzpo84LFbFRmS4fnObbJYLdVuMtE/b8Ye7jfaQEQazy3a7PJu
         D7E+7gC6KnNggKgEQjvBTeVqNqH9N3+0okpI3W3TWkqSB97yif9neGOHtguPQrff56cS
         Ez4Q3KPp/+q7oD+yzkooZnxYTJ226+mYwCC6wkxHYmQQ+UaePNrZRczYlf9u8C3XQdLm
         xo0A==
X-Forwarded-Encrypted: i=1; AKwUvBwpDvo1vycu1zzqtiEiuZwQWwKhNxnsIObSNKzRBaYmPUR9NYhYYXYTg/2IbFKgHrjetkLvYSpH3G0IpVd4k3Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJn62iBSp6FRmP2lP7f5G9ZT/8PgcFbgPYvV8GM355xjbl//UkL
	LA4AH8n8iRzKAUUmHHRUCFEQIKthkZeELO01Q52zjpU3qECcukhBN4pGqV0wK99HMjQ=
X-Gm-Gg: AYBFou3j82VEI3j2lCgvWJP98Lf5RFaQbNjdWIyCkIzTyV5D66UER8aoqxNpvuFjXho
	DuSPANC4kHiCEZ7UPqDlRqGiZY5m0tcx7R9VH53vib1nCdeXXkQEHLAYrigp9uKkT3qI3IF3MTl
	Qbqyy8OhLwAUYVwTApMp/09yNX5cmG/s/25Wp3LLHf1eYYToTNfxQz0fdp38NTF62UqGKzxt7oO
	C18BQU8ecu8KLNkn7almnbfH+hg6jqNzORfFPPaapETpTDM8qYZ6VfMiG9TV1/+cClwZQJvuWpr
	F69iM+dq+rYoM0/JaZv8g7PM8PvQL9hQEuTsfud9hpE5Jau+5OXmoqcIboegBjZ7ua7mLIYXQjL
	GSFmZRSoglsw9aNuwpWelD2k6UBiQXU+qH93iwHJiQER2/vnaGHvPNxcfsXF+btbm5S48C5rTbv
	41VBdwP7YXlHnCKT+MF2o4cFTql/t4gEWIatJlHqNmse17sW1Esoh2sNwrgrXQwZwRO5TmiTLzU
	BS5plLhHA5BQ1CnB5bTDSDCAj37QYLTBAqd+FnrTOxsj3yxmFrzg6Gx56i0Eh+Mf0AQg0EL
X-Received: by 2002:a05:6214:4a8f:b0:915:bd52:6dd6 with SMTP id 6a1803df08f44-91c48d1a442mr120919296d6.4.1793048430962;
        Mon, 26 Oct 2026 14:00:30 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47c944casm82680296d6.32.2026.10.26.14.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:00:30 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Subject: [PATCH v7 0/6] capabilities: close the ways around the CAP_SETFCAP
 rule for uid 0
Date: Mon, 26 Oct 2026 21:00:18 +0000
Message-Id: <20261026-b4-setfcap-userns-v7-0-bf8a576f7259@toxicpanda.com>
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
X-B4-Tracking: v=1; b=H4sIAGO/32oC/33QzW7DIAwH8FepOI8VA4Fkp73H1AMfZmHakiikU
 asq7z7ILpmGdrFky/7pLz9IwjliIi+nB5lxjSmOQ27004m43gzvSKPPPeGMK2BMUStpwiU4M9F
 rvh0S9UpA2xgBDgXJd9OMId528+3y06er/UC3FKhsWJOQ2tkMri+jz+ls5Xkf/qbLbh/TMs73P
 eAKxfwvywqU0SA1avRKMc1fl/EW3WQGb57d+EVKoJUfGJA1hhfGOOmh4y14XWXEgeFQY0RmOu1
 yGIlSIFQZeWR4jZGZaVtjWAi5tKHKNEdG1JgmM0zlDS4sdk09jToy1RerzPAmALPaGdn9/c22b
 d/8o6F2WAIAAA==
X-Change-ID: 20261006-b4-setfcap-userns-d63185a31ce3
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793048427; l=10428;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=pc3jiKNWlRNHUIDN7dcdDPvwSkxMRp5mKzlvAkzotxo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGMDMZd9ow8mIXD/2miF4r+388cjzIrpIeWvcN6sCcU1T2f9HtxuAXzRQLuN3oYxWOQ9r3gXerJ
 DqG4dMDezqwE=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

v1: https://lore.kernel.org/all/20261006-b4-setfcap-userns-v1-0-f47e7ed66072@toxicpanda.com/
v2: https://lore.kernel.org/all/20261014-b4-setfcap-userns-v2-0-fac4d19281d7@toxicpanda.com/
v3: https://lore.kernel.org/all/20261021-b4-setfcap-userns-v3-0-97c7ed4e43e1@toxicpanda.com/
v4: https://lore.kernel.org/all/20261022-b4-setfcap-userns-v4-0-88aa0ffaa08f@toxicpanda.com/
v5: https://lore.kernel.org/all/20261023-b4-setfcap-userns-v5-0-0620223be951@toxicpanda.com/
v6: https://lore.kernel.org/all/20261026-b4-setfcap-userns-v6-0-25f10b7ca497@toxicpanda.com/

v6->v7:
- 6/6 only, 1-5 are unchanged.  Every case now reaches the step it is
  named for, and a setup step that fails is an error rather than a
  refusal.  Cases that stopped at setns() are setns() cases now: a task
  that joins has CAP_SETFCAP wherever the creator had it, so nothing
  after setns() checks it.  In the v3 rootid, nesting after dropping
  CAP_SETFCAP and reverse idmapped mount cases a privileged task maps a
  namespace created without CAP_SETFCAP, so the xattr gets written.
  pidfd_getfd() is a ptrace case of its own.  The session keyring case
  joins a keyring of its own first, so it works under su, and skips
  without keyrings (Sashiko).

v5->v6:
- New 6/6: a kselftest with every case the series has been through,
  48 of them.  Without the series 22 fail, with v5 the 4 below fail.
- 3/5: a task inside the namespace that is being mapped also has to
  hold CAP_SETFCAP there to open or write a uid_map that maps an
  ancestor's root user.  Before, a task that gave up CAP_SETFCAP could
  write "0 0 1" and get it back from execve() (Sashiko).
- 4/5: a v2 xattr on a filesystem whose namespace has no uid 0 is
  refused with -EINVAL instead of stored unconverted, where it was
  honoured nowhere.  Falling through to the conversion would not do:
  for a writer outside that namespace it names the writer's root user
  instead (Sashiko).

v4->v5:
- 3/5: the uid_map check only looked for an extent at the parent's uid
  0.  The root user of an ancestor can sit at any uid in the parent, so
  a task without CAP_SETFCAP could map "0 1000 1" under a "1000 0 1"
  and get host uid 0 as its uid 0 unchecked.  It now finds every
  ancestor root user the map contains.  4/5 already refused the file
  capabilities after such a map, so this is the map rule itself
  (Sashiko).  Dropped Bradley's Reviewed-by on 3/5, which changed.

v3->v4:
- 4/5: a v2 security.capability xattr skipped the new checks, it was
  written as is whenever the writer had CAP_SETFCAP over the
  filesystem's namespace.  It now only does that when the filesystem's
  root user is within reach, and goes through the v3 conversion and its
  checks otherwise (Sashiko).

v2->v3:
- The setns() check in 2/5 and the ptrace check in 5/5 only apply to
  namespaces that map the root user of an ancestor within the creator's
  CAP_SETFCAP, or that have no uid_map yet.  Root users stored through
  an idmapped mount are left to whoever sets up the mount, so a root
  task without CAP_SETFCAP can join an ordinary "0 100000" container
  again (Serge, Christian).
- 2/5 adds cred_may_setfcap_userns() for those two checks and
  cred_setfcap_reaches() for the uid_map check; nothing outside
  create_user_ns() calls cap_setfcap_level() directly (Serge).
- Fixed the cap_setfcap_level() kernel-doc, @ns doesn't have to be the
  cred's namespace or below; cap_capable() is compared with != 0
  (Serge).
- Picked up Bradley's Reviewed-by on 1/5 and 3/5, not on 2/5, which
  changed.
- Rebased onto current vfs.all.

v1->v2:
- The state lives on the user namespace now: ns->setfcap_level replaces
  ns->parent_could_setfcap, and cred->setfcap_level is gone (Serge,
  Christian).
- New 2/5: setns() refuses a task whose CAP_SETFCAP doesn't reach as far
  up as the namespace's setfcap_level.  It applies to every user
  namespace, not only to those that map the parent's uid 0, because of
  idmapped mounts (Serge, Christian).
- 5/5 asks a tracer for what setns() asks for, also when the namespace
  doesn't map an ancestor's root user, again because of idmapped mounts.
- Dropped "userns: don't let setns() lend the right to map uid 0", the
  setns() check covers it.  Its nested case moved into 3/5, which checks
  the opener and the writer.
- set_cred_user_ns() isn't touched anymore, so the put-before-use in
  userns_install() is gone (Sashiko).
- Rebased onto current vfs.all.

What it does now:

Every user namespace gets a setfcap_level when it's created, which is
how far up the creator's CAP_SETFCAP counted.  If its tasks can write
file capabilities for the root user of an ancestor, because the
namespace maps that root user or can still map it, setns() only lets in
tasks whose own CAP_SETFCAP reaches that far, and PTRACE_ATTACH asks the
tracer for the same.  The checks on the way to file capabilities then go
by the namespace instead of the cred: a uid_map write that maps the
parent's uid 0 (opener and writer), and setting security.capability.

The visible difference from v1 is the setns() restriction.  A task
without CAP_SETFCAP can't join, or attach to tasks in, a namespace that
maps the root user of an ancestor, such as host uid 0, and was created
by a task that had it.  A task that joins takes on the namespace's
reach.  Containers that don't map host uid 0, unprivileged users and
anything with CAP_SETFCAP aren't affected.

Testing: 6/6 runs every case on its own, 48 in all, as root in private
mount namespaces.  On vfs.all without the series 22 of them fail: the
ways around the rule, and the two v2 xattrs without a root user that are
now refused; with the series all pass, including the idmapped mount
ones.  The pidfd, namespaces, mount_setattr and ptrace selftests give
identical results with and without.  The TLA+ model, which has no
idmapped mounts, no v2 xattrs and maps only uid 0 of the parent, finds
no violation with the narrower setns() and ptrace checks, and still
finds the setns() bypass when the check is taken out.

--- Original email (v1) ---

Hello,

Commit db2e718a4798 ("capabilities: require CAP_SETFCAP to map uid 0")
stops a root task that has given up CAP_SETFCAP from creating a user
namespace that maps uid 0 and then writing file capabilities in it that
the initial namespace honours.  The check only looks at the task that
creates the namespace, so if somebody who did have CAP_SETFCAP created
one, there are still several ways around it:

- setns() into their namespace and write uid_map from inside (patch 2)
- write "0 0 1" through a uid_map fd that they opened (patch 3)
- setns() into a namespace of theirs that already maps uid 0 and set
  security.capability there, no map write needed (patch 4)
- ptrace one of their tasks and have it do any of the above (patch 5)

On an unmodified kernel we took a uid 0 task with CAP_SETFCAP dropped
from its permitted, effective and bounding sets and, through each of
these, ended up with a file that a uid 1000 user execs with
CAP_SYS_ADMIN in its effective set.

Patch 1 adds cred->setfcap_level, which records how far up the
namespace tree a task's CAP_SETFCAP reached when it entered its
namespace, and patches 2-5 check it.  Patch 4 is the check that closes
the class, the map patches make the uid 0 map rule mean what
db2e718a4798 meant it to, and patch 5 keeps ptrace from borrowing what
the target is entitled to.

This does change behaviour.  Everything new is -EPERM:

- a task that entered a namespace without CAP_SETFCAP outside can't map
  uid 0 of the outside or write fscaps for that root user anymore
- a uid_map fd opened by a task with CAP_SETFCAP can't be used by a
  task without it to map uid 0
- if a privileged task maps "0 0 1" from the parent for a namespace
  created by a task without CAP_SETFCAP, that namespace can no longer
  write fscaps honoured outside
- PTRACE_ATTACH and PTRACE_TRACEME fail when the tracer gave up
  CAP_SETFCAP and CAP_SYS_PTRACE, the target didn't, and they share a
  root user

Rootless containers, privileged runtimes writing the map from the
parent, nested unprivileged namespaces and containers that don't map
host uid 0 aren't affected.  The ptrace check is one compare for
targets in the initial namespace and in namespaces entered without
the capability.

Testing: a set of flows run on the base and patched kernels, every
bypass route above gets -EPERM with the series and the 16 legitimate
flows behave the same.  The capabilities, namespaces, ptrace, pidfd and
proc selftests give the same results before and after. Thanks,

Josef

---
Changes in v7:
- Link to v6: https://patch.msgid.link/20261026-b4-setfcap-userns-v6-0-25f10b7ca497@toxicpanda.com

Changes in v6:
- Link to v5: https://patch.msgid.link/20261023-b4-setfcap-userns-v5-0-0620223be951@toxicpanda.com

Changes in v5:
- Link to v4: https://patch.msgid.link/20261022-b4-setfcap-userns-v4-0-88aa0ffaa08f@toxicpanda.com

Changes in v4:
- Link to v3: https://patch.msgid.link/20261021-b4-setfcap-userns-v3-0-97c7ed4e43e1@toxicpanda.com

Changes in v3:
- Link to v2: https://patch.msgid.link/20261014-b4-setfcap-userns-v2-0-fac4d19281d7@toxicpanda.com

Changes in v2:
- Link to v1: https://patch.msgid.link/20261006-b4-setfcap-userns-v1-0-f47e7ed66072@toxicpanda.com

---
Josef Bacik (6):
      userns: record how far up CAP_SETFCAP reaches
      userns: don't let setns() lend CAP_SETFCAP
      userns: check the opener and the writer before mapping uid 0
      capabilities: limit fscaps to where CAP_SETFCAP reaches
      capabilities: don't let ptrace borrow CAP_SETFCAP
      selftests/namespaces: test the CAP_SETFCAP rule for user namespaces

 include/linux/capability.h                        |    6 +
 include/linux/user_namespace.h                    |    7 +-
 kernel/user_namespace.c                           |   95 +-
 security/commoncap.c                              |  184 ++-
 tools/testing/selftests/namespaces/Makefile       |    3 +-
 tools/testing/selftests/namespaces/config         |    3 +
 tools/testing/selftests/namespaces/setfcap_test.c | 1369 +++++++++++++++++++++
 7 files changed, 1633 insertions(+), 34 deletions(-)
---
base-commit: 2c3ba1f1cb416b81d617b92a24a4bcaa48d574e3
change-id: 20261006-b4-setfcap-userns-d63185a31ce3

