Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794945283;
	b=cIKJHnxcC5/5JAPuA/g2Bop+SUNC537ZgHT4UAwvtX/Uybh5h9G9EZ4wrkIpNHx0vLs+
	 jWBBgW/E8l45bPiljsFgLpHy4EGu6RHqKc8BQZyBQGotTiczUL+GoFM0EplLtUG7Ou0Fs
	 FW6t0iMPPYReIAyWiwgfD8I4kyk6x7qvkm3KuKW3aBG1QoU09bjR49Mu7d0pnsROoNHqp
	 i+0kqE1eVfZMxkGdVpTwzi5Ro0eCLeyphGoS44SkjSAI6OMXKoC+lcd7wwgHatjkcQJgE
	 7fUfcZGABYS+kC3gOx9ReBiPqy9bLx4OzhC2sIsqqzghIUOspjRIjNxIfQsTL+6WYdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794945283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=dasiy9jZCIRFl0UFRsOu4Cf4hy2TGdEpzRiCfDH1aQU=;
	b=WXVlxdRrf4YoULgCl3MiVCTI1+MbaD+Ky9ShnbuxmuDkB55k4IojaQZz762QblivwigG
	 Smvh62woRjE55jMEHTTFKQduUCi39M8INhs4sbBJbyt1qMOYGIX1jjmPAi+WyZGnulFmL
	 hZdxqdKz1vUPYBZYekNaobNMLqG0tsfgPiaWB81hoILejs6eUHC/gQuDq+rqgO1+vlZrg
	 e26OEnbNXohQUSKaeXPfpxYDCuHkPVCGxpXi1biwaCyL/YNUTldaQ2wKORLOYUNeEK3Ma
	 jUX6nOnUayLfgLuPHCJE5vJ8q2Tkzs10yAH0fsBeQ0FaSqfI6+kV87edIMiC7VTY9UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=PANLY+yf;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E45A606A31C
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 19:54:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E45A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=PANLY+yf
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-55b8cd4e2abso1994541cf.1
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 11:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1794945281; x=1795550081; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dasiy9jZCIRFl0UFRsOu4Cf4hy2TGdEpzRiCfDH1aQU=;
        b=PANLY+yfmO9pzRM2VvmyqOQREUtkbuz0bAZn4eCAl27+xQiSA1nLAdtYXgVKX4v5YG
         ZDawClxjuLuBOpyayJeO1jdAJlNRi456YfxrbTcuMoNxrGzvWn+9Gs5gWhMdRe4CnwGY
         8pN2WI6Hr/8LrRfQl5qi6c/fTQXR4RQAG1+RDsdL0Fv2DlyIGkjnBhkXdvFLd1UklOSp
         7hq8piBekXnpbA8L7z1anH5j2kp+LyDY6+pKiRIzD70o/zdpI6gA63CfrCISV8aNxBlt
         Xss+cxExlbvgRtKQLurD5UeTn9pPQr3WuH4GyHPz/EZ3r/rPn+TK/e8b+bJ4K10Cd7q+
         a17Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794945281; x=1795550081;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dasiy9jZCIRFl0UFRsOu4Cf4hy2TGdEpzRiCfDH1aQU=;
        b=IKw4O58cU7kaz+zWmBer/e4sZklG6tuxIF5Y/+dVyk/eKKWnaN3fdXuNRxniGd9d/g
         OIRuy6vB1lMfNp4/613Ci2AamSOegY8WLDPgOTv5KJqv/7Nf3M+m3JDzZ/QINwRaDPfo
         h5Nm8fsk6ZW8gr7gfD4KZ7FKeZhuaSPY6w2Bmcnmsr1LdwjQDKUHKPi7R1ImYxDp+AUu
         S1XiaFBLZ1+F8BGFzZQLw2AEXJAzvXZspjExuzjP4T/dW3RujU9BzVWtHX6ZLBGjzNar
         qA8dbDcs9fUnPPq6tz4sX3D7lX8LQ0uxn1juZcqKQR/iFn+ncOS/bx+s5BoY+8USmyAL
         gi0Q==
X-Forwarded-Encrypted: i=1; AL+hErHFDggUndfViYRWz9Bej82o5catbFNMlNwrOAmfWDG+7KeuvTQpeGhlfe48Z6PYy5hatwRkW5GbHs6A6YT6yqk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uWeGs10+Fyx3OXH+RU9ugzMX+mrft41EdhU04ZaEDewcV9NOp
	2OPwLm+5yy/nLfwLVzDK9J+mMAkI3X+B1I2kl9zkRkYJLuS9wwJH+3WYWRBT8FHdTrk=
X-Gm-Gg: AYBFou2FM2mDK+rfaQYO65jnQ6BZ9M206ULEvNRY/7690TLmnXFE9W0B4rEkffgAOlD
	xil5qwPlMyCVS+B2+e+1MZAP1wLaGVFZsmBXPKXoqbKMBa1M0x5j2YJTm8wk8ubooDVnuCa1HBM
	mC28FHfJnTE/8W+nfwEieycrx9GQxDKlv67lZt6M9pAy4qzsg4wstckyLLUFwS3DXYYBnUmRD4t
	wpZlW04eZ0d6zxeSU+byzutrzVC0wFnItq1Nl1qZi2ni9GgLWcantCHWJBrKtS5OvNAw275b1yM
	6GaMVQOu9SbrRW2BvWrbCT1jyS5KqeDPTmqjU37stJ4j/x0bWanRIF1LgMkU2sz3i1vQu38kfsH
	J+DbgzFY2xy65dE2pZEMXs9Jhh5n9XiUCmGoUNxJlZXUxas50Z9P6fjWL18SRaEn9e2ohpLLR3l
	/s4QRnsl7nhjOP04J1ru3mTc86DpyjG6g4G7toAeFB696HuNFM/Z+qRsI808wPTm8M6J7yFU1p9
	sb2xleCli5ShkRMuOP9/6btoRLKZmf3OEYgbwjY+DrEdJ2RzovQuGLYH1TLFj8g4z+x4/TDooW5
	O4lvewDeq4ewC7RqFYKf/K23ZDZDiwXiUjCTcg9Oqci8pVCaUyklX19nJHI2q3z2ods=
X-Received: by 2002:a05:622a:4084:b0:55b:f621:e7d2 with SMTP id d75a77b69052e-55d5a553982mr6173311cf.15.1794945280764;
        Tue, 17 Nov 2026 11:54:40 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d590360fasm4709981cf.14.2026.11.17.11.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:54:39 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Subject: [PATCH v11 0/3] capabilities: close the ways around the
 CAP_SETFCAP rule for uid 0
Date: Tue, 17 Nov 2026 19:54:23 +0000
Message-Id: <20261117-b4-setfcap-userns-v11-0-2be11a2c32f4@toxicpanda.com>
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
X-B4-Tracking: v=1; b=H4sIAO+w/GoC/4XSS07DMBAG4KtUWWPqsR0/WHEPxMKPMQ2CJIrTq
 qjq3bHLgiBGsInk0fjT75lcuoLLgKV72F26BU9DGaaxHgDudl08+PEF2ZBqoRNcaOBcs6BYwTV
 HP7NjvTwWlrQE23sJEWVX780L5uF8Q5+ev87lGF4xrg1qHcEXZGHxYzy00tu8D2p/K/6kW+9hK
 Ou0fNwSnqCZf2U5AeMsK4MGk9bciMd1Og9x9mPy93F671qgk9gwoChGNMZHlcAJC8mQjNwwAih
 GVsaZWMMoVBKBZNSWERSjKmOt9zzn+rGZZPotIymmrwzXtUPIgK6n0+gtQ45YV0b0GXgw0StHz
 8b8y5jKhGx9b3Q2onckY7eMoRjb0mijfIpaZhlJxn0zwB3FuDabJDPnzuiI9H8DfOMAuSrgbVc
 q1zfVXTkuf0HX6/UT9uhXj3cDAAA=
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1794945277; l=13703;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=ZQCf2hYxdpb7My2Rl42a57sI5qXecMNXQi0UUXmzXb0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNTMY/cObzuXJgmu32TBaDgUmwAtZohF0qMwzKQtcHtQOeigZk52i/0LBPz1FnPptYQuCYuhA78
 ZwwurrvOedw4=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

v1: https://lore.kernel.org/all/20261006-b4-setfcap-userns-v1-0-f47e7ed66072@toxicpanda.com/
v2: https://lore.kernel.org/all/20261014-b4-setfcap-userns-v2-0-fac4d19281d7@toxicpanda.com/
v3: https://lore.kernel.org/all/20261021-b4-setfcap-userns-v3-0-97c7ed4e43e1@toxicpanda.com/
v4: https://lore.kernel.org/all/20261022-b4-setfcap-userns-v4-0-88aa0ffaa08f@toxicpanda.com/
v5: https://lore.kernel.org/all/20261023-b4-setfcap-userns-v5-0-0620223be951@toxicpanda.com/
v6: https://lore.kernel.org/all/20261026-b4-setfcap-userns-v6-0-25f10b7ca497@toxicpanda.com/
v7: https://lore.kernel.org/all/20261026-b4-setfcap-userns-v7-0-bf8a576f7259@toxicpanda.com/
v8: https://lore.kernel.org/all/20261027-b4-setfcap-userns-v8-0-2674adc63f3c@toxicpanda.com/
v9: https://lore.kernel.org/all/20261109-b4-setfcap-userns-v9-0-0d3f00976ce2@toxicpanda.com/
v10: https://lore.kernel.org/all/20261112-b4-setfcap-userns-v10-0-84f6f7faa903@toxicpanda.com/

v10->v11:
- 1/3: a namespace without a uid_map counts whenever its parent maps the
  joiner's root user, not only when that root user owns it: a writer in
  the parent can still map it.  That check is a helper of its own, the
  joiner's root user is checked with uid_valid(), and the variables have
  names that say what they hold (Serge).
- 3/3: the case for a namespace created by another user now expects
  setns() to be refused.

v9->v10:
- 1/3: a namespace with no uid_map yet only counts if its owner is the
  joiner's root user, the only one who could map it from inside, so
  tasks that can't map it aren't refused.  The changelog says who gets refused now and
  what the check leaves to whoever sets up a map or an idmapped mount.
- 2/3: the ptrace check no longer looks at the target's capabilities.
  A target that gave up CAP_SETFCAP can still get it back from its
  inheritable set on execve(), take it from another task of its
  namespace if it kept CAP_SYS_PTRACE, or write "0 0 1" to its
  namespace's uid_map while there is none yet.  A tracer without
  CAP_SETFCAP and CAP_SYS_PTRACE can't attach to a task in a namespace
  that setns() keeps it out of (Sashiko).  CAP_SYS_PTRACE no longer
  stands in for CAP_SETFCAP, here or in 1/3: whether it lets a task take
  CAP_SETFCAP from a neighbour depends on LSMs such as Yama.  The
  changelog names the read-only users of PTRACE_MODE_ATTACH that are
  refused too.
- 3/3: cases for those three, the idmapped mount goes under /tmp
  instead of creating /mnt on the host, a failure to set it up is an
  error rather than a skip, and the binary is in .gitignore (Sashiko).
  Also cases for ptrace at a non-zero uid and one level down, and one
  that writes the file capabilities and runs them; the test skips when
  it can't run rather than failing, and setup errors are caught
  everywhere.

v8->v9:
- Dropped the setfcap_level patch and the checks on the uid_map opener
  and writer and on file capabilities (old 1/6, 3/6 and 4/6).  They only
  stopped a task that gave up CAP_SETFCAP from using a namespace, a map
  fd or a map that a task with CAP_SETFCAP set up for it, and that task
  could have done it all on its own (Serge).
- setns() and ptrace compare kuids instead of levels: a task without
  CAP_SETFCAP can't join a namespace whose tasks can write file
  capabilities for the root user of its own namespace, and can't attach
  to a task with CAP_SETFCAP in one unless it has CAP_SYS_PTRACE
  (Serge).  The check doesn't go by the task's uids, which it can move
  away from 0 while keeping its other capabilities.
- The selftest drops the cases of the dropped patches and adds
  PTRACE_TRACEME, a joiner that moved its euid, a target with
  CAP_SETFCAP only in its bounding set, and a namespace without a
  uid_map under one that maps host uid 0 at uid 5, 39 cases now.

v7->v8:
- 6/6 only, 1-5 are unchanged.  A case whose setup failed in a child
  waited for the harness timeout, because the parent kept its own copy
  of the pipe end it read from.  The cases where a privileged task maps
  for one that gave up CAP_SETFCAP now share one helper that talks to
  it over a socket pair, and the others close the ends they don't use,
  so a failed step ends the case with a setup error at once (Sashiko).

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

Since db2e718a4798 a root task that gave up CAP_SETFCAP can't map its
root user into a user namespace it creates.  It can still join a
namespace that another root task created, or attach to a task in one,
and get CAP_SETFCAP over its root user that way.  Patch 1 refuses
setns() when the namespace maps that root user, at any uid, or has no
uid_map yet and it can still be mapped.  Patch 2 refuses ptrace
attach to a task in such a namespace.  Containers that don't map host
uid 0, unprivileged users and anything with CAP_SETFCAP aren't
affected.

Testing: 3/3 runs 46 cases on their own as root in private mount
namespaces.  On vfs.all without the series the 20 setns() and ptrace
cases that must be refused fail; with the series all pass.  The pidfd,
namespaces, mount_setattr and ptrace selftests give identical results
with and without.

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
Changes in v11:
- Link to v10: https://patch.msgid.link/20261112-b4-setfcap-userns-v10-0-84f6f7faa903@toxicpanda.com

Changes in v10:
- Link to v9: https://patch.msgid.link/20261109-b4-setfcap-userns-v9-0-0d3f00976ce2@toxicpanda.com

Changes in v9:
- Link to v8: https://patch.msgid.link/20261027-b4-setfcap-userns-v8-0-2674adc63f3c@toxicpanda.com

Changes in v8:
- Link to v7: https://patch.msgid.link/20261026-b4-setfcap-userns-v7-0-bf8a576f7259@toxicpanda.com

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
Josef Bacik (3):
      userns: don't let setns() lend CAP_SETFCAP
      capabilities: don't let ptrace borrow CAP_SETFCAP
      selftests/namespaces: test the CAP_SETFCAP rule for user namespaces

 include/linux/capability.h                        |    3 +
 kernel/user_namespace.c                           |    4 +
 security/commoncap.c                              |   83 +-
 tools/testing/selftests/namespaces/.gitignore     |    1 +
 tools/testing/selftests/namespaces/Makefile       |    3 +-
 tools/testing/selftests/namespaces/config         |    2 +
 tools/testing/selftests/namespaces/setfcap_test.c | 1509 +++++++++++++++++++++
 7 files changed, 1600 insertions(+), 5 deletions(-)
---
base-commit: 2c3ba1f1cb416b81d617b92a24a4bcaa48d574e3
change-id: 20261006-b4-setfcap-userns-d63185a31ce3

