Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795772737E3
	for <linux-kselftest@vger.kernel.org>; Sun, 31 May 2026 00:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780188508; cv=none; b=hVt7XYiIvzBoVIFPaD9vI08T3j7tKCwQvkNg7s1fvMRvXgoNnJzhUdy9rv8NtmDANQKuwAJ+3JNAUVr8nFrsqOQjdycXUidGLvdnPN9hhf+UBN6Odwv3jh/UGZWYSyrdawQRhOZIFoafcGUsl06qhRplyJTd9V6F34hs+uWkybU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780188508; c=relaxed/simple;
	bh=rZKT3WfpcAM0Di6SKFP/V+72/2OaBqpDTNVwYt9MKvI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=g6NMpTZHo55sOLgJb6w1s2mfgVO7YFYWRek3fYE0Ex0Hwm9T6o2c3LjA43TCDaXP+cFmOqRlrNKOlnOfCZtHuUIaB4leEfCD1+P7XBS/9qId2Xhn+1hxn3bkpF+nROWjd3hKcK4H3DhxEYQHt4q/DqYAxCZVLcuUdUX9t9RYKEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yuyanghuang.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r0QAk2mx; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yuyanghuang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r0QAk2mx"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-36d97955983so113435a91.0
        for <linux-kselftest@vger.kernel.org>; Sat, 30 May 2026 17:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780188507; x=1780793307; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SVPwV2ysloi40QFLeoMaNeuGhaFgrYtYqToJPyLkcEI=;
        b=r0QAk2mx9/Sxq+H6IGtRcEuNP+OVGwdB7/KXJboVtSOSpzxvlRnBB54zxc4CoHwEkA
         PmrRelVBPO45yBiWgZmcf08u15xDkVwtyZ5yxWzsmG7BkwwzGIbf0pb7mefGhRdQIJcN
         5ityawrBnzkeHVBE67InH9d3oEswj0UEniDYlgLt7Vnoafdt9f96sDh6k69G+PUPxx4A
         Be70SxLs7V7Jx3Pzf6klX4CE9m98XLtl/2VcLBXMULo+kBg9xcSy72dhbhUDLrehuM0a
         PeAguxBkDlxqlIk2N8vms1N33WzpSiDFO8eLUPs/hZSr2qCdfcC8bZjbEqGa5un5q6jD
         4SuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780188507; x=1780793307;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SVPwV2ysloi40QFLeoMaNeuGhaFgrYtYqToJPyLkcEI=;
        b=Bhb/c1z6pzLwrvzLioQKrxgvF1DiewAxMeqv0NOCqTq++DG9xP3TihU+SrPte73dHo
         QRLoxWbDph5s6zaOlB2Zc6R6dom3UvA6MYW8udW5grxLJZzyyOvf/opL94e7ltxnUwkI
         fJf4QgPPXpxXIOzyqSWy0rqmoi/yaEiw/cpAmc8mzR+jBuDDOqdoESJOgI27/Cc2z8jB
         s2nnC6dcgE+u4GUwiebmPT3tK1mZZp1MO4CWMNdI6DSyFAm/w3r1tER/drdxQbEQqYFR
         mWSYI4VgZCH11VcowOa/eCWuRwYKl8XM69b7kfY+Y4pqzOEcnH5GLNGGJL+WqrqbnkJZ
         lk9w==
X-Forwarded-Encrypted: i=1; AFNElJ8OtygaIkHP6GQwun0y3n5T2BbdGWNwou3i7vUW7PTEQAVOLnfjeB7pBYCHodmBtdULUqPOzOnrNYRbvrxbtzc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyekKwcjVTkYSkZXBl//A+DdKCETDfKAqy1xY03lP/lUVTQo9q3
	R/WYh5Xgw7vnk8BVlQVPkvr9J20dNrO3nbdjyn12V3Ih1xrNH6cs5JcCLloAs/ojfTZFKIx+otA
	dJjDFWLnINT/EyEWmzSuTmZsXKQ==
X-Received: from pgvc19.prod.google.com ([2002:a65:6193:0:b0:c85:9c9a:ab5c])
 (user=yuyanghuang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3e8a:b0:36d:64c1:8b5f with SMTP id 98e67ed59e1d1-36d64c18c3bmr3679839a91.27.1780188506522;
 Sat, 30 May 2026 17:48:26 -0700 (PDT)
Date: Sun, 31 May 2026 08:47:47 +0800
In-Reply-To: <20260531004748.3567875-1-yuyanghuang@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260531004748.3567875-1-yuyanghuang@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260531004748.3567875-2-yuyanghuang@google.com>
Subject: [PATCH bpf-next v2 1/2] bpf: reject BPF_PROG_QUERY with short uattr size
From: Yuyang Huang <yuyanghuang@google.com>
To: Yuyang Huang <yuyanghuang@google.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Eduard Zingerman <eddyz87@gmail.com>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Shuah Khan <shuah@kernel.org>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Leon Hwang <leon.hwang@linux.dev>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	"=?UTF-8?q?Maciej=20=C5=BBenczykowski?=" <maze@google.com>, Lorenzo Colitti <lorenzo@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

BPF_PROG_QUERY writes back the 'query.revision' field unconditionally to
userspace. If userspace passes a smaller 'bpf_attr' structure (e.g. 40
bytes, which was the layout before the addition of 'query.revision'),
the kernel performs an out-of-bounds write.

Fix this by returning -EFAULT in bpf_prog_query() if the user-provided
attribute size is smaller than the offset of the 'query.revision' field.

Fixes: 120933984460 ("bpf: Implement mprog API on top of existing cgroup pr=
ogs")
Cc: Maciej =C5=BBenczykowski <maze@google.com>
Cc: Lorenzo Colitti <lorenzo@google.com>
Signed-off-by: Yuyang Huang <yuyanghuang@google.com>
---
 kernel/bpf/syscall.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index a3c0214ca934..c9a5415ad437 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -4654,8 +4654,10 @@ static int bpf_prog_detach(const union bpf_attr *att=
r)
 #define BPF_PROG_QUERY_LAST_FIELD query.revision
=20
 static int bpf_prog_query(const union bpf_attr *attr,
-			  union bpf_attr __user *uattr)
+			  union bpf_attr __user *uattr, u32 uattr_size)
 {
+	if (uattr_size < offsetofend(union bpf_attr, query.revision))
+		return -EFAULT;
 	if (!bpf_net_capable())
 		return -EPERM;
 	if (CHECK_ATTR(BPF_PROG_QUERY))
@@ -6260,7 +6262,7 @@ static int __sys_bpf(enum bpf_cmd cmd, bpfptr_t uattr=
, unsigned int size)
 		err =3D bpf_prog_detach(&attr);
 		break;
 	case BPF_PROG_QUERY:
-		err =3D bpf_prog_query(&attr, uattr.user);
+		err =3D bpf_prog_query(&attr, uattr.user, size);
 		break;
 	case BPF_PROG_TEST_RUN:
 		err =3D bpf_prog_test_run(&attr, uattr.user);
--=20
2.54.0.823.g6e5bcc1fc9-goog

