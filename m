Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30144409279
	for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 16:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786466959; cv=pass; b=AU8pitjeUBUfqcOcF4uYxde/4lTtYFeJblUlkpt4pSBPWFa/5+lOAcJxB1JG9jYNWqnzizNbLv+G795YuiSY1/scGxedJk3fUGfCi8AzHu4QwXPT/y+0yYQESbJpxxg5IC4Kx4c+LMKiI5rbSu9liqk4d4Qg03tHmcKIJJN0Cns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786466959; c=relaxed/simple;
	bh=m/7J770cldN0523WwrnaaO+ITaNtf/hGFf1kGkuVS0Y=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=bL5n7uNDXPx2Pspv0NeRRQGSWA++WGitr0D+lQsnlXUT3G2MEQbCZ0O7ENsb62zWr870T91xLHcBgtOC+Ob9C67MBaU+u+18o0A/AFcJKfIXqj0OTahlXjEQouQBKnV3DeWBV5ZaKZd8j4KkGJjWK24h+IpwyWqkdJ4noEa/WD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rciqde0I; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rciqde0I"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b0f19bea2fso23510e87.1
        for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 09:49:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786466956; cv=none;
        d=google.com; s=arc-20260327;
        b=fQqRmkIEwSI3sLLskAwTqD0MNzwQGbq2VLDI14KGEkAozt1LXin60jfYBiae/HSoy+
         dFzaeJsU67AdlXQcGlgmjXCAmSxFRp5Wpd3WDLidk2G16dRMwSi6GVhc3EHPvxO8Z2QJ
         Y77z8QEOW+5qkcKvbM+qAsKVybzJ8M7VEW4jTOPzk5hVft3hRozIAfjrxy9ALmDQjLrK
         2Pzaob/Ip1RPkc3TQHc0RfCPx4PyOqyN9ak8x3DpRKTs1u8z9hbk25t8hKbJyGp3wVuZ
         bfQy7NDmLuMeJ9tqvnwGySwh+TTzKIf3c6ADtIMgTwdtQXM0N0JlilvgaaCSjy7KblTg
         eCSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=FNL9wS13wpBLSk5IXIQsMQt/7pY53PnqP7s4P+/cQIU=;
        fh=Ixsry4dljq8o+6A7DO0vBiEj8SbMjAMx0RreXUkJdls=;
        b=EKtu1o5zMHYVgIc7BqGynF/8wWja5FuYop4qD8jQchattRRyM7SX6vSlnWw2bvkHE7
         x1VCgvFchdoZEIDZnNQZ7HkqD2CIoBXwBIPzcWuK92vd8YnQeUhAJolUiLm73D7WvfrO
         eJeGbnCvxCziywZFYXq+fb7q4yJN/z2xRfRuJi3QicxWzLfq9lI6gCwafRH90rPVgO5p
         IbqBWO4gtbeKVs2bBRiDB0/2dX6Alw41dLRUlabMcNUCqqcEjHVBzNzZ3P8FIzNMBwn9
         yo8rDhJtTwCDuup9rbmKMOC0t4VxDjuMAifrIDnQEiuDA/u9o1iqQ49/5ORzkQLBYIgW
         M1lQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786466956; x=1787071756; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FNL9wS13wpBLSk5IXIQsMQt/7pY53PnqP7s4P+/cQIU=;
        b=Rciqde0IIJz39jf1P9MtAPRplEpTnn/y4TLKCUk7yIa1g1MAD42kZgAbzrrOa2wNok
         Pq5bDXBdJPs+9TVURa3H1afIbURBtSJ7h+ijFfI4XvX6+Kr5jwt/gzR4XBCU4rpFDHbA
         Q2n7f/SZegItGEEWSs0foL6d+Tl/e6wRuLmxUBoVe0ZzrxQtM8fXKnDBgZuPoYexVNhK
         irVgnfrDqr4yyInzMIUEraOIyY22QnV1Q9P47bSn4+cSR0DEAh4jyPvXIX/BwBNK7u+8
         mg2mE7G5yzflcxj0AYLVIacvsXJh/VcCl5lokynVm+Kg1SEHPy4WvPx9r/iEKaw6B50k
         6N/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786466956; x=1787071756;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FNL9wS13wpBLSk5IXIQsMQt/7pY53PnqP7s4P+/cQIU=;
        b=LZcxdD4uztGniuqo9+peT7w2LkMzSSb8wxC4g2SI/9LbytFGZBsdlcaXePXvvfccqX
         guW53dyRW7qE0+yTOIW8LT4iuuSw+W/McRpEnpnqqig7kvA15jCBXG/M8bQ3Pe/06/GW
         M3+6gn2/IC/ZEI7bgxx190oTc1v5FME5xcXvOQtVw2bBRYb8Qi5R0ubQfDEMBYvpc7sN
         iaZ1VTL7jh8cCey3RoC6hEOgG5ryMav3s5rItFkfNQf9RsTAFPKI8zn4LXb2WC3RdIR0
         35fjJ27dG4/pAf7L4iP/9w9C4t0XrjINK8YRwfCe1xiDZnSlCZ8Cvh+XJhwTYQT0Ol7w
         GekQ==
X-Forwarded-Encrypted: i=1; AHgh+RpdHncaEAE5DYfP4dMrED0eEfgFGc4biakE3lUXWHGIpwsY5jjFMuJUR0PniPBeejCJAR5v/anjpVQ6H4k1+SY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9DUyuNZBl62M/zP8wzxBzsab5VhEmTkamP0T1DQRQTaPKkBUX
	Y4P9ZHpafw0kwUbK9fzrxb4xrX9hWgmtP6eDEBAu3EjrvC5eEKgzANNqCFLWy6CDFib6Ux5iWm0
	Sj2b84FUBOaLk7o2kVcHb6MqxrcibsX0=
X-Gm-Gg: AR+sD13NGqxZmPj1tHEyAdD/EYajX/KLp/1VWybWLwOYwptXVyKdNWi8EZ3CjVZTFC9
	USGZKba5fTXPV+H2ImySMgNBrfVGiKMoegi+4ut4cAdHRXgYDz/fqt46RjPIhG6feEV9riF/pk+
	OxKQU3MAInE0dkM6p6XvcJJ3875i+2i3o+dXnLBD2wnKNetNfmZABDb2RHUvozSYPIJd6+r+9xa
	kKXfSTJ+bDPpzYspxLW6ebQxsHbVwD0E69NDuC9tc4bFuZO9Txzs5Er/U79C8qptxVtWoDc+jlY
	lY1M3A5NzzGbiyK8/8sRZ6/ygYnUcbgX/bsvlk+CpGT4a9uKCGiXcznGzvatndwdzIxIDH21uT5
	ZP0N/wDZ6bPlXvCVb6b3XQ9R3tdHgr16DDp11s7fkeONFPptdwApA7fO0Dpg=
X-Received: by 2002:a05:6512:33c8:b0:5ae:ba28:a56e with SMTP id
 2adb3069b0e04-5b448632adbmr665709e87.35.1786466955942; Tue, 11 Aug 2026
 09:49:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Darren Carreras <carrerasdarren@gmail.com>
Date: Tue, 11 Aug 2026 12:49:03 -0400
X-Gm-Features: AUfX_mzCKc1zRSji_u9GVMpSrOhDkao-wBGUQUti5D0XeAXmADuTuUuIASj8k8w
Message-ID: <CAOZ_KysLYww+5TT8LQO-xNnubktwfyKYtxgAsBt44S-XmZHMVg@mail.gmail.com>
Subject: [PATCH bpf-next v5] libbpf: avoid overflow in BTF.ext bounds check
To: bpf@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	shuah@kernel.org, jolsa@kernel.org, yonghong.song@linux.dev, song@kernel.org, 
	martin.lau@linux.dev, memxor@gmail.com, daniel@iogearbox.net, ast@kernel.org, 
	ihor.solodrai@linux.dev, eddyz87@gmail.com, andrii@kernel.org
Content-Type: multipart/mixed; boundary="0000000000004ffedc0658c84076"

--0000000000004ffedc0658c84076
Content-Type: text/plain; charset="UTF-8"

An invalid BTF.ext subsection length can wrap the pointer addition used by
btf_ext_parse_sec_info() on 32-bit builds. The wrapped pointer passes the
bounds check and parsing then reads beyond the copied BTF.ext data.

Validate the offset and length with subtraction before forming the section
pointer.

Fixes: ae4ab4b4117d ("btf: expose API to work with raw btf_ext data")
Closes: https://issues.oss-fuzz.com/issues/477315119
Signed-off-by: Darren Carreras <carrerasdarren@gmail.com>
---
Changes in v5:
- Rebase onto bpf-next commit d114bb989367.
- Attach one diff-only patch; the v4 MIME body contained a duplicated diff and
  could not be applied by CI.

Changes in v4:
- Drop the selftest because the malformed length is already rejected by the
  old check on 64-bit CI; the behavioral divergence is specific to 32-bit.
- Correct the Fixes tag to the commit that introduced the pointer-based check.

Changes in v3:
- Remove the nested mbox envelope and mail headers from the Gmail attachment
  so Patchwork's generated mbox applies with git am.

Changes in v2:
- Resend as plain text because Gmail mangled the v1 diff and Patchwork
  reported "Patch is empty."
- Include the authorized DCO Signed-off-by line.

--0000000000004ffedc0658c84076
Content-Type: application/octet-stream; name="libbpf-btf-ext-v5.diff"
Content-Disposition: attachment; filename="libbpf-btf-ext-v5.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_msowa4wj0>
X-Attachment-Id: f_msowa4wj0

ZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYi9icGYvYnRmLmMgYi90b29scy9saWIvYnBmL2J0Zi5jCmlu
ZGV4IDg0MTdkZTkyLi43NDRmMzNlMiAxMDA2NDQKLS0tIGEvdG9vbHMvbGliL2JwZi9idGYuYwor
KysgYi90b29scy9saWIvYnBmL2J0Zi5jCkBAIC0zMzY0LDcgKzMzNjQsNyBAQCBzdGF0aWMgaW50
IGJ0Zl9leHRfcGFyc2Vfc2VjX2luZm8oc3RydWN0IGJ0Zl9leHQgKmJ0Zl9leHQsCiB7CiAJY29u
c3Qgc3RydWN0IGJ0Zl9leHRfaW5mb19zZWMgKnNpbmZvOwogCXN0cnVjdCBidGZfZXh0X2luZm8g
KmV4dF9pbmZvOwotCV9fdTMyIGluZm9fbGVmdCwgcmVjb3JkX3NpemU7CisJX191MzIgZGF0YV9s
ZWZ0LCBpbmZvX2xlZnQsIHJlY29yZF9zaXplOwogCXNpemVfdCBzZWNfY250ID0gMDsKIAl2b2lk
ICppbmZvOwogCkBAIC0zMzc3LDE2ICszMzc3LDE3IEBAIHN0YXRpYyBpbnQgYnRmX2V4dF9wYXJz
ZV9zZWNfaW5mbyhzdHJ1Y3QgYnRmX2V4dCAqYnRmX2V4dCwKIAkJcmV0dXJuIC1FSU5WQUw7CiAJ
fQogCi0JLyogVGhlIHN0YXJ0IG9mIHRoZSBpbmZvIHNlYyAoaW5jbHVkaW5nIHRoZSBfX3UzMiBy
ZWNvcmRfc2l6ZSkuICovCi0JaW5mbyA9IGJ0Zl9leHQtPmRhdGEgKyBidGZfZXh0LT5oZHItPmhk
cl9sZW4gKyBleHRfc2VjLT5vZmY7Ci0JaW5mb19sZWZ0ID0gZXh0X3NlYy0+bGVuOwotCi0JaWYg
KGJ0Zl9leHQtPmRhdGEgKyBidGZfZXh0LT5kYXRhX3NpemUgPCBpbmZvICsgZXh0X3NlYy0+bGVu
KSB7CisJZGF0YV9sZWZ0ID0gYnRmX2V4dC0+ZGF0YV9zaXplIC0gYnRmX2V4dC0+aGRyLT5oZHJf
bGVuOworCWlmIChleHRfc2VjLT5vZmYgPiBkYXRhX2xlZnQgfHwgZXh0X3NlYy0+bGVuID4gZGF0
YV9sZWZ0IC0gZXh0X3NlYy0+b2ZmKSB7CiAJCXByX2RlYnVnKCIlcyBzZWN0aW9uIChvZmY6JXUg
bGVuOiV1KSBpcyBiZXlvbmQgdGhlIGVuZCBvZiB0aGUgRUxGIHNlY3Rpb24gLkJURi5leHRcbiIs
CiAJCQkgZXh0X3NlYy0+ZGVzYywgZXh0X3NlYy0+b2ZmLCBleHRfc2VjLT5sZW4pOwogCQlyZXR1
cm4gLUVJTlZBTDsKIAl9CiAKKwkvKiBUaGUgc3RhcnQgb2YgdGhlIGluZm8gc2VjIChpbmNsdWRp
bmcgdGhlIF9fdTMyIHJlY29yZF9zaXplKS4gKi8KKwlpbmZvID0gYnRmX2V4dC0+ZGF0YSArIGJ0
Zl9leHQtPmhkci0+aGRyX2xlbiArIGV4dF9zZWMtPm9mZjsKKwlpbmZvX2xlZnQgPSBleHRfc2Vj
LT5sZW47CisKIAkvKiBBdCBsZWFzdCBhIHJlY29yZCBzaXplICovCiAJaWYgKGluZm9fbGVmdCA8
IHNpemVvZihfX3UzMikpIHsKIAkJcHJfZGVidWcoIi5CVEYuZXh0ICVzIHJlY29yZCBzaXplIG5v
dCBmb3VuZFxuIiwgZXh0X3NlYy0+ZGVzYyk7Cg==
--0000000000004ffedc0658c84076--
