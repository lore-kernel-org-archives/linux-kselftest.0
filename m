Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6B7357CED
	for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 15:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376172; cv=pass; b=IhMSheuXyd+A2ir+vbRepNXUlo7IDCbtlYbLOcd0dO6jqnwr4AqIxg5XFHGACXFPAhPi+gMwn2F5beHvsPqRpkShYZmUPsv/ixZIZtZaZnwK7MCiS6ziKhbBxWOogeaLnSsODgH8H4xheN6lvuZddaZ3BnmE6kIpMYnLDwWaIvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376172; c=relaxed/simple;
	bh=n8olFxv2/B8lZ96dx6n2x6SHUcA86fdHDqLKScaviFM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=KMHn9UcUITg5QEQcsoenJ5E2XR5XGEuMKeoHByO0BAEpVODgwnEquT7v0JL5Vz6djR8q9j6x7fIjK1QySiTIKqFB40tWzWHX53DExIimys8xGeOQ2DdD4hG+QtTp2V6VP04EissqrypO1wBVtogBbbK26ZGB+RMQZDd8NyH6CTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IqzPMldF; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IqzPMldF"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39faa67fab8so12814551fa.2
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 08:36:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786376169; cv=none;
        d=google.com; s=arc-20260327;
        b=NHDO3iB4XdCkrA05suLtw8pLxTJvwH2YSSrUugUTYVBGrdBybCqabVYT7vh6eeuLmW
         hDWUdz74Zy+XJ92r9XHKKx947IW+ZPQqoH9HawL1dNkw4shaL+XPvD1j4LNRPYVE6tgs
         Nzv+t2KIFV+tpZmN9P7d2TENJoiN4O3Y2W8AxZ4n1kRIWNW8M5QfBkgWzsw2k67iWRbQ
         iMUOQQ646MlkK8Lul+seWgltu/sTwSP9oG2xbe8WNsHO7szfIiCXhUfbsBqHrX3OFb61
         SA88BfiReCA8PNGC+X38stKkzqS1ejnzOJ0vLWIt0mrZysJLWOUl7SgcdVghrSkXhK83
         7Vmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=YFVCchQzBB9Xntjm9ZDcdgmlYOmjw3/Zstjs0JA74WM=;
        fh=UrSNbm1LFQ+zU1dv+h9QcMAKqFwLbZZ8ObJy/FMP24Y=;
        b=qL01C6Vn0h0Vk/Z0YSChHIKfVqjT9QJMKeOPFcKPZ0vPh97gKayDIbEJ95wxYB/D2y
         5ZCRy4Di1IN1Qd80MtYRzv024JV6cYC6LbzaIKCJh0RWakDLUsnT1AOq/g5yhirjPLag
         hS2GV4TET3M3Jn6Lqytx9dARp+4ALY8+s9/T5lVmc41FyH7VDQbuCjo4bTC8NkldC+uc
         5j3OoJzVJuFWrnlLfLo3AvEijll/R5RJDOT2jlHhxVhXW/uDNn8Bl0bA2B6Eh9vB4S40
         e4w0SFWhJCnrONIjP0h2oqkDEjpndkQGU7aXi1uNqWsrF5SFTaunEjwTY51siZmZWB6/
         lmPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786376169; x=1786980969; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YFVCchQzBB9Xntjm9ZDcdgmlYOmjw3/Zstjs0JA74WM=;
        b=IqzPMldFTXkjLCIn34KnAkZHuiXX+JARmXq6SujXBpGUMWHcLwY+X/gzsAkjUKxbeT
         7qv5ytrgVb1tQefxKYT/UkeiDBHaPKTjrB30i2NAyigtDTRAjW91SQV4KXiuE/5BemBt
         MGe7Z6O/wetrFZIiK59xfSm37R8T1Qp0EPu6GX+flnanCnLJUhFYcNLQbmLBak18zQip
         kKzKjadUogSxnn3gcLf0VolM877pStwPUmDiln050XnKm5zC4VB97Pbh0wB8CNXuWxxT
         07AYcxvXiUxeSphx/+QNQnm6x91oX1pCKUG2h4+qL8qQwH3yXqtt8y4i3Xh6/tVl4naq
         S+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786376169; x=1786980969;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YFVCchQzBB9Xntjm9ZDcdgmlYOmjw3/Zstjs0JA74WM=;
        b=GXwKtkklC/SAp2AtQZUl4dxapq9xd28Qq8klbuVqNUCsI1OBOCw2tU6IdgAirR41ny
         iuLXg7k8FFlzf5UrARyQs8UXIEZe1eFGy8nC/9DB+otk8zj0EPigfe7/o3t8f0/275NH
         3/BC3M/ahyXR9Cob37I8UamdRv8n5zl6Yi8hWTMKHtVB5Y8FTMcGr3ssmWdK2cbO977j
         qNEEzAHwBtoxn/cw4GiBNpFQ44ivwsEHN9shnGKcITho4EyEaK1ofqzsTzGx2Gi/WnZN
         RzdQSu/Pnrd9pSpOlXB8/QBYIevT9f4X4x40fgJDYO+J/epZvGWeSNR+o6pqafU4cEAg
         IMCg==
X-Forwarded-Encrypted: i=1; AHgh+Rproqn89oNRZmrWYMkXAkoq6R0RPL72atlpR+Abt7K90PW1IfQNXRbkEl71WE9z0KPPoS0H856lSMtd5bbfsis=@vger.kernel.org
X-Gm-Message-State: AOJu0YytaW4OTGGC7e97KHj8nnw61HtIQ2B6euAnN4u8SRWfiz7uuLtX
	n6gx4TpB+fuXfa5fIc5/BNvq3eN822oOnV7OpUOFCH8Vg2fcoCKkY4hYq9BzUxswG34QE8rHUND
	0MaUHWqFS9NsybuvzD15pcJho8jwHaRw=
X-Gm-Gg: AR+sD11xFEvRPshepGryq140GKdYcYcWx3HOs//wDdc/cnq/3RLJgrbV1Lm0l/wFuSG
	d2pEvWzDmqzRHklow1b4o+OHqfjwZPO4jzU8s+WkLOViOeMr4r2msDTolEOzsCGmBq22cEV8hX/
	IMc69kK2hjwqVAsnaZmWFVJeySHlL8JALNIBkz9WGyg5v0Y7cS9AgoGRPnaMj2B21nHiNelpV8z
	zxXeq74/RFuO/YKoEggefR0YT/qOxyek5J18yL+YQpXCQfGp3bVgYqlpSUzfgHUCLQksj8mMoMu
	aTZi8ZsD2ZCFYNYrtrFNOo5zTFdDHUyuIgBeA4uIodFw1T+bCfzFHEGeMgbmzheZyTfpkHcDpAe
	ASt+ok1nK0KEkjo1R+j3XGMc8ytvLIFtC6haTvCQ5bPJ0GRMAONRcsxux5vylvqpezpcoUQ==
X-Received: by 2002:a2e:be28:0:b0:39e:eb8c:351a with SMTP id
 38308e7fff4ca-39fbb22cd47mr48291721fa.27.1786376168628; Mon, 10 Aug 2026
 08:36:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Darren Carreras <carrerasdarren@gmail.com>
Date: Mon, 10 Aug 2026 11:35:57 -0400
X-Gm-Features: AUfX_mx21hSlWZJQWB17rjBHQJCz4dKq83gmqxnzz7aX-nPkDhDh0mpCrqF0ZKw
Message-ID: <CAOZ_KyvV-Ha7XDZHCUcyYKPMSUvMSrZ0NhmtMVy_KqWD0Ar4kg@mail.gmail.com>
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
tools/lib/bpf/btf.c | 13 +++++-----
.../selftests/bpf/prog_tests/test_btf_ext.c | 24 +++++++++++++++++++
2 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/tools/lib/bpf/btf.c b/tools/lib/bpf/btf.c
index 8417de92d..744f33e2a 100644
--- a/tools/lib/bpf/btf.c
+++ b/tools/lib/bpf/btf.c
@@ -3364,7 +3364,7 @@ static int btf_ext_parse_sec_info(struct btf_ext *btf_ext,
{
const struct btf_ext_info_sec *sinfo;
struct btf_ext_info *ext_info;
- __u32 info_left, record_size;
+ __u32 data_left, info_left, record_size;
size_t sec_cnt = 0;
void *info;

@@ -3377,16 +3377,17 @@ static int btf_ext_parse_sec_info(struct
btf_ext *btf_ext,
return -EINVAL;
}

- /* The start of the info sec (including the __u32 record_size). */
- info = btf_ext->data + btf_ext->hdr->hdr_len + ext_sec->off;
- info_left = ext_sec->len;
-
- if (btf_ext->data + btf_ext->data_size < info + ext_sec->len) {
+ data_left = btf_ext->data_size - btf_ext->hdr->hdr_len;
+ if (ext_sec->off > data_left || ext_sec->len > data_left - ext_sec->off) {
pr_debug("%s section (off:%u len:%u) is beyond the end of the ELF
section .BTF.ext\n",
ext_sec->desc, ext_sec->off, ext_sec->len);
return -EINVAL;
}

+ /* The start of the info sec (including the __u32 record_size). */
+ info = btf_ext->data + btf_ext->hdr->hdr_len + ext_sec->off;
+ info_left = ext_sec->len;
+
/* At least a record size */
if (info_left < sizeof(__u32)) {
pr_debug(".BTF.ext %s record size not found\n", ext_sec->desc);
diff --git a/tools/testing/selftests/bpf/prog_tests/test_btf_ext.c
b/tools/testing/selftests/bpf/prog_tests/test_btf_ext.c
index 7d1b478c9..77db87dab 100644
--- a/tools/testing/selftests/bpf/prog_tests/test_btf_ext.c
+++ b/tools/testing/selftests/bpf/prog_tests/test_btf_ext.c
@@ -1,9 +1,31 @@
// SPDX-License-Identifier: GPL-2.0
/* Copyright (c) 2025 Meta Platforms Inc. */
#include <test_progs.h>
+#include "bpf/libbpf_internal.h"
#include "test_btf_ext.skel.h"
#include "btf_helpers.h"

+static void subtest_invalid_info_len(void)
+{
+ struct {
+ struct btf_ext_header hdr;
+ __u32 record_size;
+ } raw = {
+ .hdr = {
+ .magic = BTF_MAGIC,
+ .version = BTF_VERSION,
+ .hdr_len = sizeof(raw.hdr),
+ .func_info_len = UINT32_MAX - 7,
+ },
+ .record_size = sizeof(struct bpf_func_info_min),
+ };
+ struct btf_ext *btf_ext;
+
+ btf_ext = btf_ext__new((void *)&raw, sizeof(raw));
+ if (!ASSERT_ERR_PTR(btf_ext, "invalid_info_len"))
+ btf_ext__free(btf_ext);
+}
+
static void subtest_line_func_info(void)
{
struct test_btf_ext *skel;
@@ -59,6 +81,8 @@ static void subtest_line_func_info(void)

void test_btf_ext(void)
{
+ if (test__start_subtest("invalid_info_len"))
+ subtest_invalid_info_len();
if (test__start_subtest("line_func_info"))
subtest_line_func_info();
}
-- 
2.50.1 (Apple Git-155)
