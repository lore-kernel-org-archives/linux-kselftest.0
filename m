Received: from mail-qv2-f10.google.com (mail-qv2-f10.google.com [74.125.230.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75FC572688
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 14:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965660; cv=pass; b=vFYPirn/qG1hKhQBbP5EUOyxfOxLzQempgzJxyB6N8dvtcC0k7ysec8mzEQLaFD7rzFxLMmtEmpSmt8VC0wl8sEwUTDdxAEUKn8FfqWBrOYnkkILXBCSBgbfNZxCH/FlRoXWoMoAY40eytx0qiKfV7TNKrFcacgF6qGm/rEXF/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965660; c=relaxed/simple;
	bh=iL9jj2A0VAi5aGgSoWgSKBQWgH2gjLGt27huhWDb/Vg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=RH/VRTXxygLyxjAbFniZWs7mqz9Z4NkWUFoQuvOAvjbN/FUmt8KQvhoBTXWsxd+wyeDhiPCk0R1nhECzMAlNCLbqC8SZ0EEK7iaIptLKS8xbvJidW+DXeaeio0dthnafTIAga9YZimaUYriwk0ELufFFmQpmL6jQOfKzmU5soRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WPMgOLxs; arc=pass smtp.client-ip=74.125.230.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WPMgOLxs"
Received: by mail-qv2-f10.google.com with SMTP id 6a1803df08f44-90e9876052dso36537136d6.0
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 07:54:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788965657; cv=none;
        d=google.com; s=arc-20260327;
        b=nebyPGsjthp4RWr75RILM+hsxcT7/iYNp9WDMBwda80CUIuEbikI/ULLqeDbxkU/xx
         DCaDt7xC0zMScQJGZhfIICMh/kZpWJ0VVDyf4DM9ypWr0fDA28z3sdP0BqbpgFbrmi94
         W45e/moH8T+8bZ2NSv0BJhobEN3Bo2Ej0NKsoPnRH8D2H9GwPzfBKyWVrUTVCJ6eQcJz
         MHA2YcS1Xx/x3wzQwILYV5Gj2ajekqbh9ap6cnGHIhcDWUg4gJeWkfjeScV9CtyKench
         vrKy3lIzwxQIHWzxRAduqgleI0TbHIYBR5zeZWXt3lA5NPDYZsAqaTpz64e4OGGaBKDM
         0mjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=GywF7kZkjmE+6xLyiW8/vaQsBEHTERgtyMuo556AVsc=;
        fh=RpK0be/8XB4bylCj0wlBpkgHhv0iiKu664hVByflB0I=;
        b=FUNr0AVXvrAzW+rFbNQOoZYQUFG7dyJmjipyixNFiy+m9QrpjKdesACj/WloaGdtVO
         SkikpGC+l0cOa8S7IDix/Y9P137yeNsxducsCpwS3jO42fy5mFq2r5bVbpBURl3WslpR
         aiepPjQ2C38CU8qYp3av8/eOdFByQ7wf5uxXxqL9BOXgsKPOfHhdc6okimcty4Cqh4xX
         9w0HMED72GqF6jNi/kLU3ER4AQQpNf0BKlADnhCiO2jwbRRR9M465Thqw/1sPruQJ4m9
         tXnI2m39DXytQOq+OcCpITBViCsusAvSWvhKeMZc3GO28T9qdq8ncXRhwkqmZdRz5PV0
         U0iQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788965657; x=1789570457; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GywF7kZkjmE+6xLyiW8/vaQsBEHTERgtyMuo556AVsc=;
        b=WPMgOLxsTxcBaB5YdlhDsYo9S49tdQAbHSd4VZLSOnqwEPO2r9jVdv+gOObNZsKN5e
         PMYkPDbsUcNnwcT5JAW74j+Cle2XSbO7wY9f3Qze0z8BImBrVw46hPQJ3haiyFqxkhWE
         zOGaw/Hzp/WZ+jKU1b6iUzybh+RzVvL8wMSlbR63P6XFXG9aQeGHw6BnQm/wEsobP9gD
         uazmqLbqWdE8e9ue0rd4RxPGTmBC/oA0Lb9iQTQJctfkgXdmwh2/sSF74pBhkDJIxbab
         eDYZ9l7NKOEekWkvDEpYb/D3BjGBqG9hjd4niY+AQhKKvxxYy4wsCWf31gZCb3WVMJde
         Xq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965657; x=1789570457;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GywF7kZkjmE+6xLyiW8/vaQsBEHTERgtyMuo556AVsc=;
        b=XDuyAdnjpMKk0EpqdqjiJrVnXFZYN3202r08JyirE7+6tmEIPHMoknFA7Wq6sPaTAM
         jIh8RsvuAdiSwoVo8EnvIUPKWFdNwRcjAD7AmKLwYZS6+8hQ+G2yUOzLZhpoTtFC+uR3
         QcdrVciyGOvFsI4LOHAz+W3wXpcH1c7K+67eahHqdZdjUcS5nTGWEX+J9+DGZ35Y0Auj
         YHSs2x9r8sRfkZJ0Hw/ZkPMYP6xBk9qWYMdnbb9Kg/52J76UTvpMEFPuoi3AkID+ScvW
         xhOZLCj8JfrAibn2BCl0fwhTBQ1cvxR181oVYMcAXsc349G5YU9nHNOvYdyAGV6ydzui
         mepg==
X-Forwarded-Encrypted: i=1; AKwUvBzHrayKRxLsWA9bJ0ly+GNW3GPqDJV3+d5e6zwDwMnLdAxBeqbudUMFC4nSQlXFkvIOuoe/YLzPeDe43QBDI7s=@vger.kernel.org
X-Gm-Message-State: AFuF++kvJxTvmzFVQvkjHtXTTVQ/nUKpngqni92TzIEyRRGvZKfTxM7+
	37xgc0WXKnXLQ9TPtxlv0OE0d5Yl5pzc5bYYb1gFrxEqGjmVhDyt8wj/aPKjt2FW+2j4imfmBIA
	HlQeN4UPwS/DmO6ieJx+vBxZpzgmtznc=
X-Gm-Gg: AYBFou2zzApTy9ZH5KT/B6QKFSxp4YvO91kzEr1mctEShTkYxfhmBQMI5VK+tSdP5st
	cxpAsnvKBhpJ9CHTCbA5aM7dXxrjIUmdOsW5WF4UrQUlcRKzcVJPd3S+LdVllI7Bi34PHK90YMl
	s10VowtqjuBwq+FVgwDScwL3c7J5zPZFE8jpPxYsnnzjfio9UuCT9Hl111DCYw+KKvVT7gXJVyx
	WImYpvA2Za6gFlLG9ui+g8+bUkbw+cwkdfqcERjM2derbhSfydF6XSU24rBafnS6toaPcT/A9gT
	zWajLJkJcn2MarTnpwlDDhgpmUMWQg0vpL7Fn6vzPj+LlwCVNMuVvw==
X-Received: by 2002:a05:6214:d89:b0:910:4b85:a298 with SMTP id
 6a1803df08f44-9104b85a587mr317423766d6.26.1788965657409; Wed, 09 Sep 2026
 07:54:17 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 07:54:16 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 07:54:16 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Tianyi Chen <diannaaav@gmail.com>
Date: Wed, 9 Sep 2026 07:54:16 -0700
X-Gm-Features: AcwNN1Vce22cCGvMoF0rVdpvGrE34HTDoYBSso_WyrA4nxslSygww_YsIT4lk9k
Message-ID: <CACGbirSdR30=YTPQGN-=202jZqiF8gBSewhq+K_fTSNpq=DMhQ@mail.gmail.com>
Subject: [PATCH v3 RESEND 0/2] selftests/mm: Validate selections and scope
 memfd_secret setup
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Joel Savitz <jsavitz@redhat.com>, 
	Tianyi Chen <diannaaav@gmail.com>
Content-Type: text/plain; charset="UTF-8"

run_vmtests.sh can reach test setup after invalid options or category
selections. Its memfd_secret preparation can also change ptrace_scope
when that category was not selected.

Patch 1 rejects invalid selections before setup, using the category list
in usage(). Patch 2 gates memfd_secret preparation on category selection
and executable presence.

I am resending from my Gmail address after delivery problems with my
previous address. I could not confirm delivery of the earlier v3 posting.
This series is rebased onto current mm-unstable; both patches are unchanged
from v3 according to range-diff. Neither fix is present in current
mm-unstable, mm-stable or mainline.

Changes in v3:
- Initialize VM_SELFTEST_ITEMS to "default" before getopts, as David
  suggested. Only -t changes the selection.
- Use Assisted-by: LLM in both patches.
- Add David's Acked-by to patch 2, whose code is unchanged from v2.

Validation after rebasing:
- Bash syntax, whitespace and checkpatch checks passed.
- Ten invalid option/category invocations and help passed before setup.
- Rebuilt the four focused test binaries and ran the rebased script in an
  x86-64 KVM guest. mmap, memfd_secret, combined selections, tab/newline
  separators and repeated -t with the final selection taking effect all
  passed.
- The guest lacks Yama. The ptrace_scope write condition was checked with
  a disposable file at the expected path, not Yama policy enforcement.

This is focused validation, not a run of the complete MM selftest suite.

v2: https://lore.kernel.org/r/178886112560.138404.1278745290043112298.mm-cli-v2-0@tychen.cc

Tianyi Chen (2):
  selftests/mm: Reject invalid test selections before running tests
  selftests/mm: Only prepare ptrace_scope when memfd_secret is selected
