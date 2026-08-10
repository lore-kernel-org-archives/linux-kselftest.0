Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363EA41168B
	for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 15:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375615; cv=pass; b=nvB7an4PW7s5lwGwXW+Qz+w6YKkDsmHr25XUDQEbbwDDpvMMiR7ebzOEvbBNLRrKVW/gQgriVMgpr81nuYNUJWMpBF0mr2ZPNPu1mLxNeNbq51fixKVvKhpFTjzzCt9OdRAyvzzLn39utj0ke2SpeVLK3xe6XiaR083s4BVE9tc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375615; c=relaxed/simple;
	bh=+K3xQwVsU4I25WsS9rN34aMOudq9HpZIatSbAmd00XA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=J2HgZRMdfl10QLzR7HLXRmlZvm/QtBdM1o8bfGwpxXSllJ4BMw+1Ay96NigJIDMQHqJYRmmZ6UcAc2xj0KygXHwg/000arIzblSEwIanxNUz/0eE8pTRehtQYIXCCgQcmOUceEXYX+KPD4ng7UHnpetjbK146th+bQ4s1JETmp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m+DTLIdm; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+DTLIdm"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39faa67fab8so12734091fa.2
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 08:26:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786375612; cv=none;
        d=google.com; s=arc-20260327;
        b=i2sWwPKfGMUMkGK/MRMpoi1ftbEOMfbUxCwSqEfULS8S1Uv27mv2qdcP2Bc2lRzpCF
         QZabHwSVHx6itAw4ZZtvT+87pyKCYV220pAQfuj4CjOb6xxA0uVh1vsD/kK+/IR24OCC
         KXinyl06HW5Xd5JFy/JT/p3V+l+zPYOIpxC/eMQsNKPfTSDm1tvB9qMNFhcmaWK+n0tp
         SFzS3tTtfT+h/H4/vt2n8Vw7h/KrC3IluQXIAcX2JPoUOULUYel84/iSXVXKaWRBQRHO
         kCsb12Ds33yYp4YxitcF9gAZpwn21UTaXlTREzAqpU5gE7pIoomU3/WRbc2M2Wjnms00
         oiBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=v7Xq9mPRy28VF7pzeQHOI5qX2E+YKQ91Mag0+Ocdsy8=;
        fh=OniKdqaw8DvoL58m5rvmHokGebNKSjkyXIlf5v4UDYI=;
        b=A1GH32QvjY61zUYNdguV6mVcMfiZ+Y4Ay4BwnfECS7GKOB34gBNP/fwLmYrNXia/xt
         v8NOd8GX4FmK63AXTBs3+Jr5TDrs5N9dSggYgum9nRmDfIpiQCPW0KdQxqKUYhZjQXHV
         IRBL6ph/u9uj6d1ZJI6sLH94sSg/NWAR6T10TVbL3rXVpP4JaHO3bwJmiDF3zozKjtI0
         ZRoLNESnq4+SI//cyhyPg9yqz58KGIN4DINUJ3bzCaAowTG/3UWTeDLvaKPHrUz+8yfa
         wh4dSPYBG1fgz5kJvUSXBFpm6lVGIFSSZ0DkeXX95+k6MMcGEXeJiHxkoDMbNunXQWC6
         SJxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786375612; x=1786980412; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v7Xq9mPRy28VF7pzeQHOI5qX2E+YKQ91Mag0+Ocdsy8=;
        b=m+DTLIdmyltAbTgSK6Oh8LgH83QVfn7pNusbOrUWZaFd9rBJQP04bQIPejp2IX9k7S
         2BP2vy+LhHMiEQokWF+pnyAbNKFbqdJ4KlkAhyntKmZX9K2UumIEN3oI13ZeyRoy650L
         B8dbeSTpmUpj20yWC/t6Vs6obHcC/VhzG9263wfLri3Q+ZFLtqh0YRqoyLPHU6o7uCGY
         3kUpobk+k9/tesO92oGjUnIr72vvzUvTtMAmW2jXlTjWCY4roL8JVSLjmXuOkSHK4fpE
         suwUnb7S2/QJe5pqDa7yDzXv1szOjQhH+Dc/zyDGFsuuDqB4cx2i2QkfB1iImpy+OxNl
         +2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375612; x=1786980412;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v7Xq9mPRy28VF7pzeQHOI5qX2E+YKQ91Mag0+Ocdsy8=;
        b=m0g2RG+rnyCYahN9sQR2QsGndyCwq9EUKYk9RwHBqTNcZR7sxD9ngq7iCi7pPfsfRT
         fKUA0ecOZ261yP/fBEDWtql1FwqlnIyDjABJcQlFTFw1DoV0p/lpgih3DpUTwkk+08f9
         2uabsmR6UGjc1DBKw2LyAHI8es4s7R1J3fWuBGiB8PYUTPDWWqld5tE7aMrodTrsA60U
         knoIWKnuvzHlN0VNdoiibgHRSdwkwZq+dWePqEx2OdzW6Jle8SSi24WCw64zXDoF0GgS
         5JZRWsJoHhEBN2b2OZG0+SXZ92UOqvpG1Vo1kLoL8s64+eKPdXkFt64zgjs8NviTMJ3i
         Tt6Q==
X-Forwarded-Encrypted: i=1; AHgh+RoQlEZcqBaVXMVOE9fW4Jof7vyU7dUwJnP980dzm8DNlvgsrDhW21UTTQKLULhqNJ1baTc2B+YS/lxLVV9/6Ow=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDLKbpaENNDOGgvv+hAZxCD3id1B0Z9ZJ3EFA8ivEjoaPkt/Bd
	4W0xCNXPm83+eKGs0FfLWdavJ8iUgJeieBtOAJ3ghV12FSM4fc9P+vEmkw3g6u8iFvozQpx4Fwa
	fVvfJ75fqDEP6nF85Oa0lkVH9LQ2Zqpc=
X-Gm-Gg: AR+sD114nBC/VsGIoaoOZx5VLjwE1WxnUUtBozimc/Y1JBevfuEYfoyxuJIDKyq9jhE
	N/04MKQfQaMWvi9iD4NA4D1nVYIZqIwfM+GmBtA8BHHTvcDErivqSzo8Dxl/hkxc0DW0jysqJEW
	Jsy18qE3DsJJwIEk9qduaOSfEt6w2hM+mo+7UhIU/pwjSbMf/F2lGuG3evbK4z4DGEz2w1VWeaW
	S0O9nBCNyGt37jvNZyM/R5YTl5Ec7KD91Acob4vl3LTolPtHcGx9JgMu9j6aoZnde+cnqw6llgh
	fodvFKmbrXSEwKoUhhEwcyT4eVMBr1hefOOG5moaDwp7Z4SmFmHai24O7oJimVfhaN1Ah/vi/CG
	7WDqmRdZAzUjksxhwbU46T9ILtHG3QJdx4C8/ufZWJLGOUv/VBWodhs1656k=
X-Received: by 2002:a2e:a99f:0:b0:39a:ea4e:736a with SMTP id
 38308e7fff4ca-39fbb2399e6mr51122981fa.28.1786375612023; Mon, 10 Aug 2026
 08:26:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Darren Carreras <carrerasdarren@gmail.com>
Date: Mon, 10 Aug 2026 11:26:40 -0400
X-Gm-Features: AUfX_mxx0jT2wYKaLW1ScYYLzHltfU6a9p2yToSyhWc3aGXo6p15FIZz6P6iQFg
Message-ID: <CAOZ_KyvHTkE8Fc6Ah+Z=-U3MoyXGQT0Zxy4L368hO0GRzbX+wg@mail.gmail.com>
Subject: [PATCH bpf-next] libbpf: avoid overflow in BTF.ext bounds check
To: bpf@vger.kernel.org
Cc: andrii@kernel.org, eddyz87@gmail.com, ihor.solodrai@linux.dev, 
	ast@kernel.org, daniel@iogearbox.net, memxor@gmail.com, martin.lau@linux.dev, 
	song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From 0ee0da46079d4e9453afe2b28acdaadc0f011042 Mon Sep 17 00:00:00 2001
From: Darren Carreras <carrerasdarren@gmail.com>
Date: Mon, 10 Aug 2026 11:20:13 -0400
Subject: [PATCH] libbpf: avoid overflow in BTF.ext bounds check

An invalid BTF.ext subsection length can wrap the pointer addition used by
btf_ext_parse_sec_info() on 32-bit builds. The wrapped pointer passes the
bounds check and parsing then reads beyond the copied BTF.ext data.

Validate the offset and length with subtraction before forming the section
pointer. Add a selftest using an overflowing func_info_len.

Fixes: cf579164e9ea ("libbpf: Support BTF.ext loading and output in
either endianness")
Closes: https://issues.oss-fuzz.com/issues/477315119
Signed-off-by: Darren Carreras <carrerasdarren@gmail.com>
---
 tools/lib/bpf/btf.c.                          | 13 +++++-----
 .../selftests/bpf/prog_tests/test_btf_ext.c.  | 24 +++++++++++++++++++
 2 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/tools/lib/bpf/btf.c b/tools/lib/bpf/btf.c
index 8417de92d..744f33e2a 100644
--- a/tools/lib/bpf/btf.c
+++ b/tools/lib/bpf/btf.c
@@ -3364,7 +3364,7 @@ static
