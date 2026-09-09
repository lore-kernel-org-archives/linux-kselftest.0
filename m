Received: from mail-yx2-f6.google.com (mail-yx2-f6.google.com [74.125.224.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8372D233722
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 15:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967424; cv=pass; b=iRCO6bhlO4tSZId2nHus0oUqW7bHHfDl4opEsuKFTTwdWrtWwRNqrFKEVnqLGTO2u+2c2/e7eYqNQuQKYe1gWFyMZQKdEBPRX9dqfXbE97w2ArAG88pMMaPyy8sZNo+ZpCw0qPvvis1TsUf+xQHSs4cPkeRWms77PPya0TK/DyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967424; c=relaxed/simple;
	bh=KkLeKWnz40CVRXvuK4QAI4eUopbSKa1rB037g2lRL3w=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=USdbKc5F0tLN9BXfcq1znUSw6a3LUt8ywMmE6e9+Zm2D+wlHMIvRfvUp4N70Uz29Dsy//zuiSbHzxo095e3WM52DXLI8Bf98HaV/00I4j2/C0mw9D1EzSpILFrMojIQrGil7INz1+V0ey0q5whZqOzi6Kuo2U5kUDnlJeWHIouU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=egAdWlfj; arc=pass smtp.client-ip=74.125.224.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egAdWlfj"
Received: by mail-yx2-f6.google.com with SMTP id 956f58d0204a3-66d22ff32abso2329986d50.1
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 08:23:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788967421; cv=none;
        d=google.com; s=arc-20260327;
        b=BF3bvZ57Np/FCPTvJkQYmfCo8QmuTYzla4ubk3QNrc/42fnCulpi+Qbgd5ff295EoE
         XWt0XU5NJqL9Ugto3hYXNVdVjJ2hF9gKZJmf3Pz9HDusc6juc0Cr/oEPhzA10Tn41RDU
         WjPj/bShw+McWVjQqb0TiIBXCthAuLp59NvvjGiUYsgK640TtqP9nC/Dpgda/8zaH/2o
         qP1d5m57q+shsq91+mirm4jy/La6F0DQnsBgAglmFqchoktKGI9HZ7qk0HqDwCa+/71e
         JaKYmG0mqmBUZyc6XPfJduaFzDMZLvaV5bipY61N+UapFugfNCCXnS5NOzhHd0WDE8nW
         /hxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=KkLeKWnz40CVRXvuK4QAI4eUopbSKa1rB037g2lRL3w=;
        fh=SJwvQ4InOLLvfW8nFsIU4l7KIwo832EIN50cMpNuUGg=;
        b=c0+nLPyyCKN1ivURZMl+0LkFRbRBpcbSZ/ce75vpx6oiGsDKE1HmVlM/YhqNIN55uf
         BFhpXQeX/9zCq4Q2lLM+c0gkz9084SVMKLvtFizWR9p34AAF4/5BbdfTPAB6m4x/rxKX
         uHc/2Ni62L8LO0JSc7Y1omp7vtKigwDSp+z0VRmexqIl6BFEm3LlbiXAchZTy2hKfOF/
         q2nLJb6NSll/BD2ss+zdcPsPYHPJeQg3snTE+h+rfeawkt8T9yucZSWC1StQdIghf4i7
         +4pqqI+nSbPemSBREqjFxBZyEWrVj4oGY858XCoeGMaSVf4zY9QMxY5QPRt8ueuQ3Ex0
         S+MQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788967421; x=1789572221; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KkLeKWnz40CVRXvuK4QAI4eUopbSKa1rB037g2lRL3w=;
        b=egAdWlfjwAlIzeGgMAG2QSvvXnv9aK2YgC+DxmYwLlWU1PCBH3lO+glrZtTCc4aevw
         245lzMw58KBfwqL/S6N/NgMsWOakonqwsrlXsEB58UcL2n2Gd+If4UORqj+atruBClsB
         XRj1Cy7f9cicQxSyRMWgBVlIwDXWU8WmZpfaWTfiixFvNtxdaVrkEDu7CRkznVgIY4Cg
         8w2u3KNaWxu+wFaV749NzcfMw9t6F7MlnvLggPOFtY4z4EIOemXBWZLmuVsoKIN25233
         p4bv1C6pmc7q0yAVmgtUKOeVXu0wIdMPmYAjT48ndiixD6Kvhmf/jZA8sW2LoEpytFV+
         ytOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967421; x=1789572221;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KkLeKWnz40CVRXvuK4QAI4eUopbSKa1rB037g2lRL3w=;
        b=K1NRcbMcNsIPPSODZavUnx9I/MT3VtG1HnQ2G2REeZF7vnonp44yM7F48qr6l5oXLD
         GxFAUB6m/X/MjsrkRzUzlfZJnk+Ht5dOzUbkjTjQGdX0Rcy2jqWEuLCQ2Hcmrgvj1iNw
         g/2n6jaslbsZ1yl8yFDJUIeO7YKHas+k2ScYDN45iv7q9SvtMKFCkfzXNil/bShOTer0
         rlv8sZUzG+bN0544hcne3TLsXpe9uqcxH3n6FE4K0gUT6IJwQ4SdBNNVPSkcwP8jXZA0
         pGAlXq4jjxRmjQh/xzeaXCdeStUQ1p4V8q4IpLkySte4SfZwKSQ324bW1bfuicP3Xk3m
         IjFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsFmb6ZhHSyitT1fPXYTHQFQG0SfDdslQKd09b+8x6QEs/Kz8FbhWZkaTthUVvvndWuqzW3oScvP+J5WM3e+o=@vger.kernel.org
X-Gm-Message-State: AFuF++kTOZfCtwgB4PUnbk89oyfjWaCqBBnplVMgW//WA2/MNIJzhnUi
	PmfbANsBO3ByH9A3ROXhbs6/ZdS7RkT/KyOKitGY8QN0Dn65GyzXvwE6VLfw9h1T0pimo+NzguN
	0+SRYiZU+U007fv5DAbVWYBd3bq18pGM=
X-Gm-Gg: AYBFou2IpBAwRCNHKhxKgFAfRBPqChAZsEoT/ltkSMNJV8Yz7sRpQ3ga2SvSDxAfd6U
	CrFveHOI7SFsNnpYjdx3oGDh/RAdWN0bZKPUavdjbW5fOmliKHppCxjU0eyHIqVD5Bqvhzhi1yg
	bwPNxb0BT6Etf1qigB/q6LAfVWAanKVLL1V6Lkamx8Yi1ePiqNHd9GzzJTQUs7/O0rRIQhCw2or
	GJwRHvix/Y7raHQ2cMQcvKMq/FssE8FwZ5yaF1IM7g/fbFLhcJAQXM5vmfFwed1MMkPv7VwtjM9
	Gj1gr3d7Yw//xaMPnab5ho6Y/m4sjmro9mdq3L9G0g835Zs2SUOipw==
X-Received: by 2002:a05:690e:4809:b0:66f:c1be:a641 with SMTP id
 956f58d0204a3-66fc1beb247mr6374583d50.51.1788967421093; Wed, 09 Sep 2026
 08:23:41 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 08:23:39 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 08:23:39 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Tianyi Chen <diannaaav@gmail.com>
In-Reply-To: <CACGbirTvSoSeNSpMCBiifTdRKKDsKbgk7nfvh=09fHw2b0M4Ew@mail.gmail.com>
References: <CACGbirTvSoSeNSpMCBiifTdRKKDsKbgk7nfvh=09fHw2b0M4Ew@mail.gmail.com>
Date: Wed, 9 Sep 2026 08:23:39 -0700
X-Gm-Features: AcwNN1XqW6dUN8Vb7KE_XG5Wlgt0dfTuo8v3RlFz25qPqa16OtVUGQTRkFzBqcc
Message-ID: <CACGbirSjNMD1mijDWRp4gLcw-6dJsErrF_jgjwr3nO-geBb1Sw@mail.gmail.com>
Subject: [PATCH RESEND v3 1/2] selftests/mm: Reject invalid test selections
 before running tests
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Joel Savitz <jsavitz@redhat.com>, 
	Tianyi Chen <diannaaav@gmail.com>
Content-Type: multipart/mixed; boundary="000000000000a66c78065b0e6fc8"

--000000000000a66c78065b0e6fc8
Content-Type: text/plain; charset="UTF-8"

The unchanged patch is attached as text/plain to preserve long lines
and whitespace during mail delivery.

--000000000000a66c78065b0e6fc8
Content-Type: text/plain; charset="us-ascii"; name="mm_patch1.patch"
Content-Disposition: attachment; filename="mm_patch1.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: 62a76dec474c2618_0.1

RnJvbTogVGlhbnlpIENoZW4gPGhpQHR5Y2hlbi5jYz4KRGF0ZTogVHVlLCAwOCBTZXAgMjAyNiAx
MToyMToyMSArMDgwMAoKZ2V0b3B0cyByZXBvcnRzIHVua25vd24gb3B0aW9ucyBhbmQgbWlzc2lu
ZyBhcmd1bWVudHMsIGJ1dCBydW5fdm10ZXN0cy5zaAppZ25vcmVzIGl0cyBlcnJvciByZXN1bHQg
YW5kIGNvbnRpbnVlcyB3aXRoIHRlc3Qgc2V0dXAuIEFuIGVtcHR5IC10CmFyZ3VtZW50IGFsc28g
ZmFsbHMgYmFjayB0byB0aGUgZGVmYXVsdCBzZWxlY3Rpb24sIHdoaWxlIHVua25vd24gY2F0ZWdv
cnkKbmFtZXMgY2FuIHNpbGVudGx5IHNlbGVjdCBubyB0ZXN0cyBhbmQgc3RpbGwgcmVhY2ggc2V0
dXAgY29kZS4KCkV4aXQgb24gZ2V0b3B0cyBlcnJvcnMgYW5kIHZhbGlkYXRlIGNhdGVnb3J5IG5h
bWVzIGFnYWluc3QgdGhlIGV4aXN0aW5nCmxpc3QgaW4gdXNhZ2UoKSBiZWZvcmUgYW55IHRlc3Qg
c2V0dXAuIFJlamVjdCBlbXB0eSBhbmQgd2hpdGVzcGFjZS1vbmx5CnNlbGVjdGlvbnMsIGFuZCBu
b3JtYWxpemUgY2F0ZWdvcnkgc2VwYXJhdG9ycyBzbyB2YWxpZGF0aW9uIGFuZCBleGVjdXRpb24K
YWdyZWUuIEluaXRpYWxpemUgdGhlIGRlZmF1bHQgc2VsZWN0aW9uIGJlZm9yZSBwYXJzaW5nIG9w
dGlvbnMgc28gb25seSAtdApjaGFuZ2VzIHRoZSBzZWxlY3Rpb24uCgpGaXhlczogODU0NjMzMjFl
NzI2ICgic2VsZnRlc3RzL3ZtOiBlbmFibGUgcnVubmluZyBzZWxlY3QgZ3JvdXBzIG9mIHRlc3Rz
IikKQXNzaXN0ZWQtYnk6IExMTQpTaWduZWQtb2ZmLWJ5OiBUaWFueWkgQ2hlbiA8aGlAdHljaGVu
LmNjPgotLS0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL21tL3J1bl92bXRlc3RzLnNoIHwgMjYg
KysrKysrKysrKysrKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL21t
L3J1bl92bXRlc3RzLnNoIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbW0vcnVuX3ZtdGVzdHMu
c2gKaW5kZXggZDA5ZjlmNmEzODRlLi45ZTYyYWI0YzY3NzUgMTAwNzU1Ci0tLSBhL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL21tL3J1bl92bXRlc3RzLnNoCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL21tL3J1bl92bXRlc3RzLnNoCkBAIC05NiwyNiArOTYsNDQgQEAgc2VwYXJhdGVkIGJ5
IHNwYWNlczoKIAogZXhhbXBsZTogLi9ydW5fdm10ZXN0cy5zaCAtdCAiaG1tIG1tYXAga3NtIgog
RU9GCi0JZXhpdCAwCiB9CiAKIFJVTl9BTEw9ZmFsc2UKIFJVTl9ERVNUUlVDVElWRT1mYWxzZQog
VEFQX1BSRUZJWD0iIyAiCiAKK1ZNX1NFTEZURVNUX0lURU1TPSJkZWZhdWx0IgorCiB3aGlsZSBn
ZXRvcHRzICJhaHQ6bmQiIE9QVDsgZG8KIAljYXNlICR7T1BUfSBpbgogCQkiYSIpIFJVTl9BTEw9
dHJ1ZSA7OwotCQkiaCIpIHVzYWdlIDs7CisJCSJoIikgdXNhZ2U7IGV4aXQgMCA7OwogCQkidCIp
IFZNX1NFTEZURVNUX0lURU1TPSR7T1BUQVJHfSA7OwogCQkibiIpIFRBUF9QUkVGSVg9IDs7CiAJ
CSJkIikgUlVOX0RFU1RSVUNUSVZFPXRydWUgOzsKKwkJIj8iKSBleGl0IDEgOzsKIAllc2FjCiBk
b25lCiBzaGlmdCAkKChPUFRJTkQgLTEpKQogCi0jIGRlZmF1bHQgYmVoYXZpb3I6IHJ1biBhbGwg
dGVzdHMKLVZNX1NFTEZURVNUX0lURU1TPSR7Vk1fU0VMRlRFU1RfSVRFTVM6LWRlZmF1bHR9Cisj
IE5vcm1hbGl6ZSB3aGl0ZXNwYWNlIHNvIHZhbGlkYXRpb24gYW5kIHRlc3Rfc2VsZWN0ZWQoKSB1
c2UgdGhlIHNhbWUgbmFtZXMuCityZWFkIC1yIC1hIHNlbGVjdGVkX2NhdGVnb3JpZXMgPDw8ICIk
e1ZNX1NFTEZURVNUX0lURU1TLy8kJ1xuJy8gfSIKK1ZNX1NFTEZURVNUX0lURU1TPSIke3NlbGVj
dGVkX2NhdGVnb3JpZXNbKl19IgoraWYgWyAteiAiJFZNX1NFTEZURVNUX0lURU1TIiBdOyB0aGVu
CisJZWNobyAiTm8gdGVzdCBjYXRlZ29yaWVzIHNwZWNpZmllZCIgPiYyCisJZXhpdCAxCitmaQor
CitpZiBbICIkVk1fU0VMRlRFU1RfSVRFTVMiICE9ICJkZWZhdWx0IiBdOyB0aGVuCisJIyBLZWVw
IHRoZSBkb2N1bWVudGVkIGNhdGVnb3J5IGxpc3QgYXMgdGhlIHNvdXJjZSBvZiB2YWxpZCBuYW1l
cy4KKwl2YWxpZF9jYXRlZ29yaWVzPSQodXNhZ2UgfCBzZWQgLW4gJ3MvXi0gLy9wJykKKwlmb3Ig
Y2F0ZWdvcnkgaW4gIiR7c2VsZWN0ZWRfY2F0ZWdvcmllc1tAXX0iOyBkbworCQlpZiAhIGdyZXAg
LUZ4cSAtLSAiJGNhdGVnb3J5IiA8PDwgIiR2YWxpZF9jYXRlZ29yaWVzIjsgdGhlbgorCQkJZWNo
byAiVW5rbm93biB0ZXN0IGNhdGVnb3J5OiAkY2F0ZWdvcnkiID4mMgorCQkJZXhpdCAxCisJCWZp
CisJZG9uZQorZmkKIAogdGVzdF9zZWxlY3RlZCgpIHsKIAlpZiBbICIkVk1fU0VMRlRFU1RfSVRF
TVMiID09ICJkZWZhdWx0IiBdOyB0aGVuCg==
--000000000000a66c78065b0e6fc8--
