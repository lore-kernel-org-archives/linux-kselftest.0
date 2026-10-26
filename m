Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793048447;
	b=qVeNF8t5o0CP/F1PLYCQ2mgj5JqrHQZgNVoZHj47hwzAzN9oN6oagFTJ+EwM9J+rtYhf
	 mX0OXVlKBXuMYw3Gtbbqa73qksm51S8YSiHIy56Ajf2NKKb1pwSLkBSbOuIyiOHx9ti7o
	 KUs1HxMdv5HFFWkEHmN8/6WfuTYB3FNMNmhwyvbgC4lI3HVfZdm4vz7xcw+6gozJ3sfj3
	 +qe5tRXEw+hs4LDH/cEqMUrNqLCLGjtW8E9jrAF/Tl/XGCKwZ8Hfl9AeKj/ruTyFln9uN
	 FEmNeaS+6ht99THRDY45GA5zEvgtb8ou4tvuKcoYAMJxOtsRR8z1/w5qUdOCtMPaAzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=SlE+GD6loY7SaEz5ltXlb5NxzrPftLvvYozFrshERGY=;
	b=RsOp660HrOG7h2ryM+rohYf8ymkIQM/fpnrNtp6MrE3Cscud38Ay42ZS73Els+nH9S/C
	 CxzP14I1vrEBehEr5LPkpT2YLKvI8VEQyyaDXXqA9vKk13MEGWcHT4Eqbt7QSLK+DyLb4
	 IBVw6BgjaTkE8II8tKVyee284D4XV9ycuTbhTLkX7C69hrJtFDj8hPPYmUQww2fUXydGz
	 eq1d2D7V2HzZis8Muwxr0eyDNLVyJcWu86UpofusnLqfDxZ3zaUhDQd2DkK3y2woiMBgs
	 pI1XwAvjmENdRvnWixMtUBE/ke9q78AwCYWIqU4j9zu0BWQjtKOM86iy/P6Sneq0mPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=jHYdzlhf;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766B860A2615
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 21:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 766B860A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=jHYdzlhf
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-53664b4860bso37303451cf.1
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 14:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793048440; x=1793653240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SlE+GD6loY7SaEz5ltXlb5NxzrPftLvvYozFrshERGY=;
        b=jHYdzlhfYYPEdR4vNyE+g9h3wo0O54pAOuVmlJZlckU3IL5ETxNoipPxDppOopxm3U
         Mh/UJVF0tJ2/zTZD5sHcGGOLRGYl2EZD8hspDVbg+vYGoPA5KIDvtNiNBS13CCQ658f8
         CWKUo+/b1iiV6UceUjNkhSSiOzPMO3nVm2C8PmwTibBb2AuMPDQsuF/Jn4ZYlYe1scXw
         HKngrfvViR2/p6FihmAbImV5Cwx2dqLvm3LDSmNc9z88bHVh8ANN+88FvdKeWHbFdhzY
         xGnzO/1EB1S/yEenC4uhWYxxQiJgJQt5uDHnqJl1y6b9c3rH6P11RdUTN+utcfwq6po3
         Nb3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793048440; x=1793653240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SlE+GD6loY7SaEz5ltXlb5NxzrPftLvvYozFrshERGY=;
        b=vpoYshCfSsgIzJFzuOPdEo0oLZh/7wczaoPUqlSgIW4DZYc83+l3fBin+ROpNFlGc2
         KQc3sayEOFoM/FTMBXwOkoMVUTvh4u3AZLG682rzXxR4edyNi/4Fw7XEKj3QG08BV23h
         W2WJC3doym7Zv7Mj1SfyqPFyBzWasfiHdZJvVmZEwYnidYmgCnRiWARoFyi9fHcJj2rW
         N2JA9iMEDJVidodhoQndpbpjXsI4yAkLwGFTRyfHHKNY8DSXFyDaB926YnPlh9pUs/N/
         8mxaMJLhDPXhyWOqSdkbQyum3+r4uuVom5bH+hmhgBQNTrxmY7oXZrA7ieKAu+BfogrH
         8NkQ==
X-Forwarded-Encrypted: i=1; AKwUvByTJ8AaRBp+1VOY3wRzyAUABuSJVB0AYnUtwp/OsuUxQlOrtfNGCRIBY90F1iPPIOcAQGOVNNVHkEjKH2loJOM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIeJr5rAd30LvP2rmux/tMn4akhonaPbgJdqkaMCu4ZsVAaEcJ
	Y3S6q625Q5nFW1VNVGms56anJrrXPbxsNOLpPm7EkcjcR6dqESa/CjPH2D/xmWQoRCA=
X-Gm-Gg: AYBFou2FrAw5lYfm2sZnaxb42YFnENn1tnkMc89hRTmlAlzWruwVMr9TdV3iOf3A/QV
	42MNHnI/nRjprIbJ3C4Q8HDx6n8E77C9hbe33DrlzgdnBh06DcHm2HDvlr4/whsaoZRpjbSoLPq
	d++zOP4l+1zs+Lc1XH2k9YawsZFJ/53vCgg4jwddUGn16PyL+I+l+AfOjSFWc1g46SHBTCkmnoN
	62MAhkj6zuDRDPX8Itz+ZGUm8aw1FlVct2fZxUJPi3oNQm5JKBs064AY36oJiGIo2wtk0FNJLNF
	vs96VY9w5Oj8qZQ+wDadm8GMAdyL2kWnJBDI5d8c1fjACf5E78VPO4cK0J2nJqUZ0uxHwB2iry/
	bDyBKN1/eOrdV99rqCAOKvQDB4WNLm8LM4OFgTtmSW3uP2L2XqfQdCzAQ8WQvRB0LRACu66vgZF
	+X5bnZrqb+CJriFy5wqqQTVR2jCMUFpPMPNYg79UeNemXn0LqdXadXKP9n0/St7viHRA6aOvCmv
	UtjCbpJKkx1t/DR7DOAbSh8KyApjMRKTzOoJkWhubCTilEEWUgu2eFDZeDNm3L/HI/JwWIY1Y/O
	cUC2dzlhm6zBKq6NZA==
X-Received: by 2002:a05:622a:44a:b0:533:8900:4eab with SMTP id d75a77b69052e-5383b4a973emr130240711cf.16.1793048440239;
        Mon, 26 Oct 2026 14:00:40 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47c4399fsm83319636d6.22.2026.10.26.14.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:00:39 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Mon, 26 Oct 2026 21:00:22 +0000
Subject: [PATCH v7 4/6] capabilities: limit fscaps to where CAP_SETFCAP
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
Message-Id: <20261026-b4-setfcap-userns-v7-4-bf8a576f7259@toxicpanda.com>
References: <20261026-b4-setfcap-userns-v7-0-bf8a576f7259@toxicpanda.com>
In-Reply-To: <20261026-b4-setfcap-userns-v7-0-bf8a576f7259@toxicpanda.com>
To: Serge Hallyn <serge@hallyn.com>, Paul Moore <paul@paul-moore.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: James Morris <jmorris@namei.org>, David Howells <dhowells@redhat.com>, 
 Jarkko Sakkinen <jarkko@kernel.org>, "Andrew G. Morgan" <morgan@kernel.org>, 
 Serge Hallyn <sergeh@kernel.org>, linux-security-module@vger.kernel.org, 
 linux-kernel@vger.kernel.org, keyrings@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
 linux-kselftest@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793048427; l=5703;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=FDChG0bx+cXxkkBT6UYSsvtNifUZi0Mew1bpibNMRUo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCb0Jl+OxscNq+G5hjgGZclIM+7B63jlR0/vz8V+m/BDMIKKC5bAz9yM3XgwcSvpCZ+i1rmVoKI
 0HJmLTF//9Qs=
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

