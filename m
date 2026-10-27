Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793111000;
	b=M4HZyoeW3LXgk7bBA7uk5oPM3g6aT89LMCax3tGgMgynJEoVs/Xfe/MwYfPV1qNh/Kyg
	 vLG0xnkpkfN36swG25VAVetqItHZEONMB6u5CnzgtklvuP5Pm1AyKyufCbbBinZEGTeU0
	 DYYF+6uPRGphrjXcwt37ra+54M+PXD/FovgCLejWgF6BNKGxk/xyj2rrWMLjplpKK/2U/
	 xsSPVWYUl0f5/W2BjfPSDUSVqkm8KAf19/RMird8wHQ+IutALnxuYmNIn+sZYPLqXLaq8
	 BrftOoFsQjChYHhBTPI4uFAXNzxjdUAezh8S9y0MQQcgwjwMR3xzXO7p3igKTciCTcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793111000;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=SlE+GD6loY7SaEz5ltXlb5NxzrPftLvvYozFrshERGY=;
	b=Sd0IfyzRWRW7moEz9gOVWzkwb/LHeXMrOVYV4frTqhgg6dlmx5B0hQ8lu+Wd+E3GLVce
	 cSC9jx/49EKAP3DTT5BZz2TXbgBh4jfMH4xiORqBRY2AaHdSK7u0gL7nr4W7z4d/aVtUL
	 VAxKJe3qNMzBNn2x0Wxd3L8b560wY+7IKvGoSuuYVJJAD4yCeA393TJvH1e5edo9faInF
	 v//qIL+8YbE21fnGGrjLkHGkHMymMancyPMfBXDcetMiKaOC1AqqEk2rrJdF77FM82GfZ
	 khYW7BDkstJREfNT43Y/mzYKdQXBgrYtFDBEteuXhbNvQY99cZX8rtGfxU0AY0H6fmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=ajAHsCeM;
	arc=none smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFCA60A2603
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 14:23:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAFCA60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=ajAHsCeM
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7cc013095d4so1304949137.2
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 07:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793110998; x=1793715798; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SlE+GD6loY7SaEz5ltXlb5NxzrPftLvvYozFrshERGY=;
        b=ajAHsCeMpoO+DKVcxLXQC8wDqbWwViJwlSHhbuPluq72t6Sn+/4MJLN3J29wXQegTp
         yVN9jhbEPAMpIlobXF+k1SPrT6PDEKBjVBIn1gbFBp3/0mpUGABUzFpgnEm76VvP8vm0
         1Lgq5a2dexD+B6qpOH2uAlHrqFdkBOYRt3FpTsFIu/dKkWNrWkB3BLtzznEi29F4pILy
         vl5n6dfEgtt5B3P/xahWtvCfnuzUn/l40SCaAw+VWzeStaLSeYcVGm9WaIlwuZZvYrZP
         EVW5x2U5BwIQ75AXN0DSw4npeV2sKrz+15EC4x4OEc6n6iKgAoSzdBujhdpTT2785Bqr
         Oahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793110998; x=1793715798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SlE+GD6loY7SaEz5ltXlb5NxzrPftLvvYozFrshERGY=;
        b=0ugzAroyqpp5sb+hLKCCc0MCNSvb/SRgcvJmnskPRk3Ye3G/RrJWW+eKyaY+TKN8QI
         8ie70GunibacCTJUOnKN65ObFm6ZLHk5Eu5JSYpt/NVAmJJulnRtKWTXY1mcvI2YBRos
         3Fc/dFiWiopXlesj3W9eFA94GswaJcbitA2aGBY7BECZZb3ksifX9i1geKIPi/EU83zX
         bp6chwpQ5O19gmCgLt2LJV/5BOAvQvtF3OivJ8EIRsIXyZTL5pVBt2KqfN7hftfCZHgy
         wVyNNQm3jhKTZcrAcxe3fjCTlR60WDQZxpUceOoKeJID/WTJrabjcH4HEFQs2JaoHi2Y
         5sUg==
X-Forwarded-Encrypted: i=1; AKwUvBwN0G8fAssoUpASYP4++PnHMHOgUvslxdBXvA4vN5vc7QXlnzaE/3wrVXK4wWEl7iv9CnCjOLd0RkgAuwnv4XM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQJZP07Jjt1KY2UOIH/blEv0JNnzFqsbFwzxL80/GoenjbxUIs
	gpY0MX13AAmJwfxdOtGvD03MkA64KEEXMT9H8LWSF6tAAkPPGsMDnqxaeebMVasWcMo=
X-Gm-Gg: AYBFou25KMDGzKCObWW0czriv80Mg32O/fPgV6ghDAO2eMncMyJ6vS0DVZqQTBm8vOo
	3RQOxhgieU/ZUeLeltEuaGvSpF9pNiMqEVg/CreMK+eQH9fsyfjm1IEKygQj1k5NHJNUqiOjrSR
	fq2sIQYuxudWC14v2EI2ZcnNhvbsYqFG58SGq572sOsllgFjNhBlKpdi/IpBZomxLy6yBkw4Yh9
	SeDWOv6JSYQz+T3J7ebLvX3BFYujJqXewEwTFLvQwrNBuqGxaozU5uOjRM705B0bV28c/BQPHuZ
	Gp5Y7XDh2VLj2WCL0+/+mp//ZYX13Grr/GP4iwcjU7pOckXBqitvFZZBuZx+At2lFirQV/lXGbm
	Cqk9hkftbgRO9WLGJ/1MGB3yQCeoLtpcpyXC0M8xMAwVZH4UYvwwWz0fa91ZymQsXiXYiNmyxVO
	EKVYiYgEC8gHl05E1mQwnU1TD0716nv40aS7RnJmr1CvP+I0zpey19GzViQ6Mo5ifzGbdYK/rYI
	/+ET36KU7wvEd9XL88SD69V4crRdJgSk0HddYxrizdl4mZ/s2rWSfD0CO6UaL4Wq0Rex937
X-Received: by 2002:a05:6102:f0c:b0:7cc:ccb:ce68 with SMTP id ada2fe7eead31-7ce5cdb99d3mr3440043137.29.1793110997332;
        Tue, 27 Oct 2026 07:23:17 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.250])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-991259c4dd0sm2656996241.3.2026.10.27.07.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:23:16 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 27 Oct 2026 14:22:52 +0000
Subject: [PATCH v8 4/6] capabilities: limit fscaps to where CAP_SETFCAP
 reaches
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
Message-Id: <20261027-b4-setfcap-userns-v8-4-2674adc63f3c@toxicpanda.com>
References: <20261027-b4-setfcap-userns-v8-0-2674adc63f3c@toxicpanda.com>
In-Reply-To: <20261027-b4-setfcap-userns-v8-0-2674adc63f3c@toxicpanda.com>
To: Serge Hallyn <serge@hallyn.com>, Paul Moore <paul@paul-moore.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: James Morris <jmorris@namei.org>, David Howells <dhowells@redhat.com>, 
 Jarkko Sakkinen <jarkko@kernel.org>, "Andrew G. Morgan" <morgan@kernel.org>, 
 Serge Hallyn <sergeh@kernel.org>, linux-security-module@vger.kernel.org, 
 linux-kernel@vger.kernel.org, keyrings@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
 linux-kselftest@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793110987; l=5703;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=FDChG0bx+cXxkkBT6UYSsvtNifUZi0Mew1bpibNMRUo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMS5Rg0zCAwaN8H2tVVMS9zaIA4lR8dV4Fj/RxENhWUDLa5G/oNyQXNZ53UWE4a9aACffelpcZw
 mG0Bvr0C4kgY=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

Commit db2e718a4798 ("capabilities: require CAP_SETFCAP to map uid 0")
keeps a root process without CAP_SETFCAP from creating a user namespace
that maps uid 0, in which it could attach capabilities to a file that
are then honoured outside.  But the map doesn't have to be written by
that process.  A privileged task can write it from the parent, and the
file capabilities are not checked against the outside at all:

  task A: uid 0, full caps          task B: uid 0, no CAP_SETFCAP
                                    unshare(CLONE_NEWUSER)
                                      ns->setfcap_level = 1
  write "0 0 1" to B's uid_map, gid_map
    A has CAP_SETFCAP -> allowed
                                    setxattr(file, "security.capability")
                                      rootid = kuid 0
  uid 1000 in the initial namespace:
  execve(file)
    file capabilities apply

The map doesn't even have to show uid 0 of the parent as uid 0, since a
v3 xattr can name any mapped uid as the root user.

Check at the place where it matters, in cap_convert_nscap().  On an
idmapped mount the root user named in the xattr has two identities: the
kuid seen through this mount, and the kuid that is stored and seen
through every other mount of the filesystem.  If either of them is the
root user of an ancestor of the caller's namespace too, CAP_SETFCAP has
to reach up to there, which ns->setfcap_level tells.

A v2 xattr skips the conversion when the writer has CAP_SETFCAP over the
filesystem's namespace, and belongs to that namespace's root user.  It
gets the same check: if that root user is out of reach, the xattr goes
through the conversion instead, which names the root user of the
writer's namespace and refuses it when that one is out of reach too.
Otherwise a task that unshared without CAP_SETFCAP could mount a tmpfs
in its namespace, write a v2 xattr on it, and have it honoured through
an overlay mounted from the initial namespace.  If the filesystem's
namespace doesn't map uid 0 at all, the v2 xattr has no root user and
nobody could run the file with it, so it is refused with -EINVAL instead
of stored.

Tasks in the initial namespace, tasks in namespaces created by a task
with CAP_SETFCAP, and file capabilities for a root user that only exists
in namespaces within reach are not affected.  That includes everything
an unprivileged user does in its own namespaces.  The rest gets -EPERM.

Fixes: 8db6c34f1dbc ("Introduce v3 namespaced file capabilities")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 security/commoncap.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 52 insertions(+), 2 deletions(-)

diff --git a/security/commoncap.c b/security/commoncap.c
index 8a9d998b1897..4e0b00b7b1a3 100644
--- a/security/commoncap.c
+++ b/security/commoncap.c
@@ -216,6 +216,29 @@ bool cred_may_setfcap_userns(const struct cred *cred, struct user_namespace *ns)
 	return !top || cred_setfcap_reaches(cred, ns->parent, top->level);
 }
 
+/**
+ * cap_root_level - Find the topmost namespace in which a kuid is the root user
+ * @kuid: The kuid to look for
+ * @ns: The user namespace to start from
+ *
+ * Return: the lowest ->level among @ns and its ancestors in which @kuid is
+ * uid 0, which is how far up file capabilities with that root user are
+ * honoured; INT_MAX if there is no such namespace.
+ */
+static int cap_root_level(kuid_t kuid, struct user_namespace *ns)
+{
+	int level = INT_MAX;
+
+	for (;; ns = ns->parent) {
+		if (from_kuid(ns, kuid) == 0)
+			level = ns->level;
+		if (ns == &init_user_ns)
+			break;
+	}
+
+	return level;
+}
+
 /**
  * cap_settime - Determine whether the current process may set the system clock
  * @ts: The time to set
@@ -671,19 +694,46 @@ int cap_convert_nscap(const struct mnt_idmap *idmap, struct dentry *dentry,
 		return -EINVAL;
 	if (!capable_wrt_inode_uidgid(idmap, inode, CAP_SETFCAP))
 		return -EPERM;
-	if (size == XATTR_CAPS_SZ_2 && (idmap == &nop_mnt_idmap))
-		if (ns_capable(inode->i_sb->s_user_ns, CAP_SETFCAP))
+	/*
+	 * A v2 xattr belongs to the root user of the filesystem's namespace,
+	 * which may be the root user of ancestors of our namespace as well.
+	 * There may be none, then nobody could ever run the file with these
+	 * capabilities.  Only write it unconverted if that root user is
+	 * within reach, the checks below handle everything else.
+	 */
+	if (size == XATTR_CAPS_SZ_2 && idmap == &nop_mnt_idmap &&
+	    ns_capable(fs_ns, CAP_SETFCAP)) {
+		kuid_t fsroot = make_kuid(fs_ns, 0);
+
+		if (!uid_valid(fsroot))
+			return -EINVAL;
+		if (cap_root_level(fsroot, task_ns) >= task_ns->setfcap_level)
 			/* user is privileged, just write the v2 */
 			return size;
+	}
 
 	vfsrootid = rootid_from_xattr(*ivalue, size, task_ns);
 	if (!vfsuid_valid(vfsrootid))
 		return -EINVAL;
 
+	/*
+	 * The root user may be the root user of ancestors of our namespace as
+	 * well.  CAP_SETFCAP that we got for entering it doesn't cover those.
+	 * On an idmapped mount the root user is vfsrootid as seen through
+	 * this mount and rootid as seen through every other mount of the
+	 * filesystem, so both have to stay within reach.
+	 */
+	if (cap_root_level(vfsuid_into_kuid(vfsrootid), task_ns) <
+	    task_ns->setfcap_level)
+		return -EPERM;
+
 	rootid = from_vfsuid(idmap, fs_ns, vfsrootid);
 	if (!uid_valid(rootid))
 		return -EINVAL;
 
+	if (cap_root_level(rootid, task_ns) < task_ns->setfcap_level)
+		return -EPERM;
+
 	nsrootid = from_kuid(fs_ns, rootid);
 	if (nsrootid == -1)
 		return -EINVAL;

-- 
2.55.0

