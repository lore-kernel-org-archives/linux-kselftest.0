Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D49F3A8FF6
	for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 02:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788143977; cv=none; b=PBXIwuur+G8baGFJL1BTL05NgxOuHHpMQcn4GlB0blLr+Wz1iPdLeSmfoO4ktbaktWfIjwz/knm5UspNUdQXxTOnqWCqnfTj7i9mBQ6sCieAbkBVTJ/jsWQ2vBhBQxr/yM94MRE4wIE7Rkaw/0ZMC8DptS5SINf6VSBOU7jVj1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788143977; c=relaxed/simple;
	bh=0Da7/dbbEMpfnvBKbdJE+zwY+N6bZ1hZScpHd8G4GYA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ECrFNoQxK6s8HqOFG3EZNHEOKFHPNTwB/JA48AXPBfsa5shZI1cGWOOKpWoKlRo7uunKvvYFJ0cXc4kEfsdOE/QPJervFjP44+rRhlxjJblUdfQzlnbXtJx7YFAz7wiHbsD5r9SY4pZcAvayjhokvGfHQV1y87WAMkpKnFRkxn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qLm3xdrH; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qLm3xdrH"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8535a9be75eso2158422b3a.2
        for <linux-kselftest@vger.kernel.org>; Sun, 30 Aug 2026 19:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788143973; x=1788748773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8+jOHR5naC1tM4DFH+e8Pqt5XoUo3rCHA1hAgrfQ3VA=;
        b=qLm3xdrHCIVoNrPhtMtW+3bNfbpQoyVK6WxW2VanyxjHexApHLtO8XO0OF+ukFSGcz
         K9+hDx9SzB3sHshpPG126lYgh2vDG8TfiPPNXiHQLpxw5kEo/SC/jJXsZ1Ms+8A9JBHJ
         TgoEb1H7u0iZg6R38eoLD5UGkPsuUZhMAAzQu7VF8TKFThIYE6ZSpHM1Rc4iPcQ2+JTt
         ffOThZLzKUyiq0f9QUwThyqEogmKRv4LcXmrQBotMdmEUTIvqBvkMirkXzSHN1CvO5EZ
         hdMNVEvtIKn2lKELECYNm8978nieuKhNzCqCLjygIc09an59GQOs0pzoyGgBP/WYyO49
         i60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788143973; x=1788748773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8+jOHR5naC1tM4DFH+e8Pqt5XoUo3rCHA1hAgrfQ3VA=;
        b=hl9xnVhonyLtU+NzX12u3v7/CpTD4HXjzwBIDJPuERiA15FsjCyYXbbFZVIlsGS+ft
         pxfAuFBxBrNXnNByh9UZ0mjEobFxIqjCVazEaFnmb8ZYpBn15FcE2AKlzpICIIN/XP0Z
         KcenjsaYKT5chQE+eeitipwnkX8V2xwiu3hWOs8A/m12r6mJl/GzK71VXF9srK5SArR5
         CnqSppR+7MwIiZxGMD52LOhsmfMODsk9fTV03LFt0kCjVk3pzrWlekZnKyFm2HFEeHZY
         /fUY3oQNR/jIRU5KKYS7nz5Iat6gTQRSKI728Q3PgK+YgFfc5w8yZGcUNvlgZNcH6Ffg
         v5zQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq3hR4ctl8gBCukKLpZXzADDt+Cr+xsD8c0akXxlejXQZOF6/0azHSJLdwinsVnbPqXbpUTLq0b0X39TAow6Ao=@vger.kernel.org
X-Gm-Message-State: AFuF++me9XzwdNjsiJ0Squp/EH2EldXkEHxN9CiQfRO1Maa2C1iVIEdq
	4gPi327DPB5IHApMvPnb+/9oW93paJO3C7x9UvBt+0gSR4BgDGSTBtdS
X-Gm-Gg: AR+sD106rXQJXVje5yj5QNZU0noR3gURKY8Y+Sliu/EWJaq9TwSyqsKnRubkYKrbSLE
	q6c6WJ+mouSoOA3HUQJ8bzDkWl63EVoldbiJYiNGyvoP/MOUZWWDQQl/4JvNS39/L9N8HBtjMic
	cQrknMryf2YslxNtFa3sLR9zLO6BlCDFIf7J20J2qYuvp4HNoENaRJY4eN/jHs3xg20p8xxV2HU
	KXhtKOpElwhOjJnh8lq35mK5xVu86WF2sixMGPmOxjdi8iKSINHruK4PaxmKH0YoSpjzqDNYdL1
	i1j83juc/Lj/R9V2GW7uSAcmrmUrWd/6ZtvQ+nCFTlGq23sxotmHYjYp5FVa8CMWsaSgjXATAfk
	D/aq+K6QZ5PV9N5NWlEtO1lIpboFrZXfv7tj0AP1X+NyUiXMTPOeJGNdG6uNW6h3AJr/2NC6zJT
	bauL6E0Dq9+0yd5iCXuZQnX755qX9L+UvB9T1S62ncn522CplB0sQQ+9JR7otd4Sejajrr0c/zG
	UsXCZnfOq4qVVEPoQc3pGAOz5J6S512oWeI8aibXasCK+07w0yUulEKBGUWTg==
X-Received: by 2002:a05:6a00:1144:b0:84a:60a4:2651 with SMTP id d2e1a72fcca58-85628f66f2dmr32908239b3a.6.1788143973123;
        Sun, 30 Aug 2026 19:39:33 -0700 (PDT)
Received: from secrnd-cstp.tailb7f510.ts.net ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-856a397deb5sm2881106b3a.52.2026.08.30.19.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 19:39:32 -0700 (PDT)
From: Sanghyun Park <sanghyun.park.cnu@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	bpf@vger.kernel.org
Cc: Sanghyun Park <sanghyun.park.cnu@gmail.com>,
	Leon Hwang <leon.hwang@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Pu Lehui <pulehui@huawei.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next v4 1/2] bpf: Validate program attach type during link update
Date: Mon, 31 Aug 2026 11:39:11 +0900
Message-ID: <20260831023918.1857658-1-sanghyun.park.cnu@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cgroup link updates compare only the program type. Programs verified
for different hooks can share a type, so a UDP6 sock_addr program can
replace a UDP4 program and write beyond the four-byte ipc.addr field in
the stack-local struct ipcm_cookie. The same gap permits incompatible
LSM_MAC and LSM_CGROUP replacements.

Validate every replacement program against the link attach type before
dispatching to the link-specific update operation. Keep the CGROUP_SKB
CAP_NET_ADMIN check at initial attach so pinned or delegated link FDs can
still be updated after a capability drop.

Fixes: 0c991ebc8c69 ("bpf: Implement bpf_prog replacement for an active bpf_cgroup_link")
Signed-off-by: Sanghyun Park <sanghyun.park.cnu@gmail.com>
---
v4:
  - Validate every program link update through the shared attach-type helper.
  - Fold the LSM attach-flavor check into that helper.
  - Keep the CGROUP_SKB permission check in the attach-only wrapper and rename
    the wrapper to describe that role.
  - Follow the preferred BPF multi-line comment style.
  - Add focused regression selftests as patch 2/2.
v3: https://lore.kernel.org/r/20260821084726.3769957-2-sanghyun.park.cnu@gmail.com
  - Factor the CGROUP_SKB CAP_NET_ADMIN check into an attach-only helper.
v2: https://lore.kernel.org/r/20260818061021.2551771-2-sanghyun.park.cnu@gmail.com
  - Extend validation from cgroup sock_addr programs to all cgroup program
    types, including exact LSM attach flavors.
  - Preserve legacy CGROUP_SKB ingress/egress replacement compatibility.
  - Keep the CGROUP_SKB CAP_NET_ADMIN check on attach, not link update.
v1: https://lore.kernel.org/r/20260805052858.2390918-3-sanghyun.park.cnu@gmail.com
---
 kernel/bpf/syscall.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index 6874ba1424af..84823149dffa 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -4481,14 +4481,9 @@ static int bpf_prog_attach_check_attach_type(const struct bpf_prog *prog,
 	case BPF_PROG_TYPE_CGROUP_SOCK_ADDR:
 	case BPF_PROG_TYPE_CGROUP_SOCKOPT:
 	case BPF_PROG_TYPE_SK_LOOKUP:
+	case BPF_PROG_TYPE_LSM:
 		return attach_type == prog->expected_attach_type ? 0 : -EINVAL;
 	case BPF_PROG_TYPE_CGROUP_SKB:
-		if (!bpf_token_capable(prog->aux->token, CAP_NET_ADMIN))
-			/* cg-skb progs can be loaded by unpriv user.
-			 * check permissions at attach time.
-			 */
-			return -EPERM;
-
 		ptype = attach_type_to_prog_type(attach_type);
 		if (prog->type != ptype)
 			return -EINVAL;
@@ -4542,6 +4537,20 @@ static int bpf_prog_attach_check_attach_type(const struct bpf_prog *prog,
 	}
 }
 
+static int bpf_prog_attach_check_perm(const struct bpf_prog *prog,
+				      enum bpf_attach_type attach_type)
+{
+	/*
+	 * CGROUP_SKB programs can be loaded by unprivileged users, so check
+	 * permissions at attach time.
+	 */
+	if (prog->type == BPF_PROG_TYPE_CGROUP_SKB &&
+	    !bpf_token_capable(prog->aux->token, CAP_NET_ADMIN))
+		return -EPERM;
+
+	return bpf_prog_attach_check_attach_type(prog, attach_type);
+}
+
 static bool is_cgroup_prog_type(enum bpf_prog_type ptype, enum bpf_attach_type atype,
 				bool check_atype)
 {
@@ -4606,7 +4615,7 @@ static int bpf_prog_attach(const union bpf_attr *attr)
 	if (IS_ERR(prog))
 		return PTR_ERR(prog);
 
-	if (bpf_prog_attach_check_attach_type(prog, attr->attach_type)) {
+	if (bpf_prog_attach_check_perm(prog, attr->attach_type)) {
 		bpf_prog_put(prog);
 		return -EINVAL;
 	}
@@ -5805,8 +5814,8 @@ static int link_create(union bpf_attr *attr, bpfptr_t uattr)
 	if (IS_ERR(prog))
 		return PTR_ERR(prog);
 
-	ret = bpf_prog_attach_check_attach_type(prog,
-						attr->link_create.attach_type);
+	ret = bpf_prog_attach_check_perm(prog,
+					 attr->link_create.attach_type);
 	if (ret)
 		goto out;
 
@@ -5968,6 +5977,10 @@ static int link_update(union bpf_attr *attr)
 		goto out_put_progs;
 	}
 
+	ret = bpf_prog_attach_check_attach_type(new_prog, link->attach_type);
+	if (ret)
+		goto out_put_progs;
+
 	if (link->ops->update_prog)
 		ret = link->ops->update_prog(link, new_prog, old_prog);
 	else
-- 
2.48.1
