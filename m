Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBF113DDAE
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Apr 2026 15:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776698226; cv=none; b=Rm4B+/8rS6gyjH2OnKbv/9qyPiqCaThM0IilxyFtKlEnJisbtuRTt1/+BW11Y13/Nul9wYHfRl6EPQ3hc6s4NBqa8Ow6cQ73nURouUR2o0RKxrg0ts2cxE7SveiCig0++ddUtN1a+P+o9E/gKZY2TQLjxxzmN0Hkimjb3UoKdQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776698226; c=relaxed/simple;
	bh=SNxNjucwVErK32/FfRGnPCoXC463QI1B2BKV++txdaM=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:Cc:From:Subject; b=uRG7QOTQl6KVNPtfrBEB35NBFb388n0jJe4NQhwXe7rd+Oej8caSXmPF+UuLWFDskBy3t4BGW5hORNEr9OgBrP6gdLBoK/VhhKtvls1z3RIstrYCNsYTsRQSQz4BKj0/n0GnImxXVQLeA7VC+5xtrVd3hSHZiEOov8vZFWdLz0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=J1Csdny9; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="J1Csdny9"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-40946982a78so1008066fac.2
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Apr 2026 08:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776698224; x=1777303024; darn=vger.kernel.org;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CzN/eJ6Uame5dO4Dz5w5Cgx8wfAem4FPLJbhkV0Xch0=;
        b=J1Csdny9N2Zdf7Q94S1EozguU9fdr0Cn27+lkELgkSM2uQ22u9wR0kqNIhAEF+09Et
         OShcfPzp+sYt5cjpT3nHbvqJHqTGGz/B6xJIXY7pfgGs5AukORKeMpFX/LcxIWXiPlcq
         TZHsXeHhNHCnFvgcR5+5i2gVMxO/RrsgTUjV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776698224; x=1777303024;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CzN/eJ6Uame5dO4Dz5w5Cgx8wfAem4FPLJbhkV0Xch0=;
        b=ZnlPKV5aoNVM5kL20AJbSeK1ETswhaF8WgBaONCt27cX1t3TjSy9sQ/gLa7g7c17P1
         o4DcXTboAdSchCHMjZiDCamCC/UB8zpiyW7AdoYusVXjVdolNPzbl2/rQ1L+MY8JBiJX
         c0MgLi9wn1L8w/fzxc+xUVs9jvkYcvIhGfOU1W0uvVmw5Md5bw6LVS1Gf9qWr9RXPboi
         vwDgjJ1vqqCoCA5oTBZTXdqUrSSSox9ENq1nKGIHsdPlIGJdgQ+AnA0Ooc23kEowb92e
         a/mog7uWuTm/8Skww0SaC2sl86TN+kHLjGSaghgxIxK6bDKpIWy9S/1l6iEZnfQw/fAu
         8msg==
X-Forwarded-Encrypted: i=1; AFNElJ+x7ubIZmeoAaibV5TvTxSj3Bj7cwqeQXn4iQwnWeBpEAZ7x/fesnwXolO1ghVsRkW0iyeEyceHxZGdeoMpUoE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8aK63nVKuZRFyRukMd3l3iOxKIWXHTvDPx45h94EHS1KYeJZX
	t6wi24saHk+FbyqptAZv1fQU8BdWtb+9nRhnxcK+9rBer1QJRU+AuzK1CQNfP9tXZ54=
X-Gm-Gg: AeBDievj61boNZ6RN/TvZlmtvR/vEj4+8OgW328FSO8hgQ1uKP9//dEDGKEs+XUYGhJ
	4NKIbM+XG4T06ZJCY3Kj3Dc/jflA6xfhB9rtvwJ7o9bEwnGPsSky17Xwg/hVZLRumyxFAlAYMs+
	jrc1RZdZDPesjQdhrq0mSSY8rJSqS0jhQ3L5WS/+BTa6Lh1JE6IEYOnGj7Uicmp/leR/nGvR9ZR
	uEDNl7Da2CyKaYujNk6xedyN4znPp7TFWVF9XREJ+H6hLJh+oOODt8BU4++yEDL7CC2OSy4fBP6
	SYdbPQ2b2SSNOUzEjEtk/x+8NrsorEZGcHTTxwF4damhHDypmN5KYIotWhVA53JOM6Za5vtW8AQ
	yOKmzMvD0i84G3gtPC1Tkg6Lc6DYe9oPVyrkDrMXusvMdEEcNylOAcOyz79E5GkOZFwLysw1lCa
	mZmUOvmOJGRz9a9cVRFZ5pP76ztYNqD67qzrlt3xfV8Q==
X-Received: by 2002:a05:6870:8dce:b0:41c:4423:5f0 with SMTP id 586e51a60fabf-42abf2f88acmr8516894fac.14.1776698223869;
        Mon, 20 Apr 2026 08:17:03 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42b930b66d9sm8283164fac.6.2026.04.20.08.17.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 08:17:02 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------5b2IYk3OChsE9K1N77PdKQb7"
Message-ID: <599c06d8-d33d-47ac-aeed-9e6caa35bb9c@linuxfoundation.org>
Date: Mon, 20 Apr 2026 09:17:00 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, shuah <shuah@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: Shuah Khan <skhan@linuxfoundation.org>
Subject: [GIT PULL] kselftest next update regression fixes for Linux 7.1-rc1

This is a multi-part message in MIME format.
--------------5b2IYk3OChsE9K1N77PdKQb7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Linus,

Please pull these fixes to regressions introduced in the next update
that are breaking CI runs.

Fixes regressions in non-bash shells and busybox support, and reverts
a commit that regression in build and installation when one or more
tests fail to build. Fixes duplicated test number reporting introduced
in ktap support patch.

- selftests: Fix duplicated test number reporting
- selftests: Fix runner.sh for non-bash shells
- selftests: Fix runner.sh busybox support
- selftests: Deescalate error reporting

diff is attached.

thanks,
-- Shuah

----------------------------------------------------------------
The following changes since commit f8e0a5a174d7d3bc3547c15bc1647c35427f5c34:

   selftests/ftrace: Quote check_requires comparisons (2026-04-13 11:05:39 -0600)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-next-7.1-next-fixes

for you to fetch changes up to 83ef26f911432d9c98b6d8b6ed0709a8b79cd834:

   selftests: Fix duplicated test number reporting (2026-04-17 11:29:03 -0600)

----------------------------------------------------------------
linux_kselftest-next-7.1-next-fixes

Fixes regressions in non-bash shells and busybox support, and reverts
a commit that regression in build and installation when one or more
tests fail to build. Fixes duplicated test number reporting introduced
in ktap support patch.

- selftests: Fix duplicated test number reporting
- selftests: Fix runner.sh for non-bash shells
- selftests: Fix runner.sh busybox support
- selftests: Deescalate error reporting

----------------------------------------------------------------
Mark Brown (4):
       selftests: Deescalate error reporting
       selftests: Fix runner.sh busybox support
       selftests: Fix runner.sh for non-bash shells
       selftests: Fix duplicated test number reporting

  tools/testing/selftests/Makefile            |  8 ++---
  tools/testing/selftests/kselftest/runner.sh | 49 ++++++++++++++---------------
  2 files changed, 28 insertions(+), 29 deletions(-)
----------------------------------------------------------------
--------------5b2IYk3OChsE9K1N77PdKQb7
Content-Type: text/x-patch; charset=UTF-8;
 name="linux_kselftest-next-7.1-next-fixes.diff"
Content-Disposition: attachment;
 filename="linux_kselftest-next-7.1-next-fixes.diff"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL01ha2VmaWxlIGIvdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMvTWFrZWZpbGUKaW5kZXggMDk0OWYzNzBhZDc4Li40NTBmMTNi
YTRjY2EgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL01ha2VmaWxlCisr
KyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL01ha2VmaWxlCkBAIC0yMDksMTQgKzIwOSwx
NCBAQCBleHBvcnQgS0hEUl9JTkNMVURFUwogLkRFRkFVTFRfR09BTCA6PSBhbGwKIAogYWxs
OgotCUByZXQ9MDsJCQkJCQkJXAorCUByZXQ9MTsJCQkJCQkJXAogCWZvciBUQVJHRVQgaW4g
JChUQVJHRVRTKSAkKElOU1RBTExfREVQX1RBUkdFVFMpOyBkbwlcCiAJCUJVSUxEX1RBUkdF
VD0kJEJVSUxELyQkVEFSR0VUOwkJCVwKIAkJbWtkaXIgJCRCVUlMRF9UQVJHRVQgIC1wOwkJ
CVwKIAkJJChNQUtFKSBPVVRQVVQ9JCRCVUlMRF9UQVJHRVQgLUMgJCRUQVJHRVQJXAogCQkJ
CU89JChhYnNfb2JqdHJlZSkJCVwKIAkJCQkkKGlmICQoRk9SQ0VfVEFSR0VUUyksfHwgZXhp
dCk7CVwKLQkJWyAkJD8gLWVxIDAgXSB8fCByZXQ9MTsJCQlcCisJCXJldD0kJCgocmV0ICog
JCQ/KSk7CQkJCVwKIAlkb25lOyBleGl0ICQkcmV0OwogCiBydW5fdGVzdHM6IGFsbApAQCAt
Mjc0LDcgKzI3NCw3IEBAIGlmZGVmIElOU1RBTExfUEFUSAogCWluc3RhbGwgLW0gNzQ0IGtz
ZWxmdGVzdC9rc2Z0LnB5ICQoSU5TVEFMTF9QQVRIKS9rc2VsZnRlc3QvCiAJaW5zdGFsbCAt
bSA3NDQgcnVuX2tzZWxmdGVzdC5zaCAkKElOU1RBTExfUEFUSCkvCiAJcm0gLWYgJChURVNU
X0xJU1QpCi0JQHJldD0wOwlcCisJQHJldD0xOwlcCiAJZm9yIFRBUkdFVCBpbiAkKFRBUkdF
VFMpICQoSU5TVEFMTF9ERVBfVEFSR0VUUyk7IGRvIFwKIAkJQlVJTERfVEFSR0VUPSQkQlVJ
TEQvJCRUQVJHRVQ7CVwKIAkJJChNQUtFKSBPVVRQVVQ9JCRCVUlMRF9UQVJHRVQgLUMgJCRU
QVJHRVQgaW5zdGFsbCBcCkBAIC0yODMsNyArMjgzLDcgQEAgaWZkZWYgSU5TVEFMTF9QQVRI
CiAJCQkJT0JKX1BBVEg9JChJTlNUQUxMX1BBVEgpIFwKIAkJCQlPPSQoYWJzX29ianRyZWUp
CQlcCiAJCQkJJChpZiAkKEZPUkNFX1RBUkdFVFMpLHx8IGV4aXQpOwlcCi0JCVsgJCQ/IC1l
cSAwIF0gfHwgcmV0PTE7CQlcCisJCXJldD0kJCgocmV0ICogJCQ/KSk7CQlcCiAJZG9uZTsg
ZXhpdCAkJHJldDsKIAogCmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9r
c2VsZnRlc3QvcnVubmVyLnNoIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3NlbGZ0ZXN0
L3J1bm5lci5zaAppbmRleCA2ZGEzMzkwODI1ZmUuLjMxMTgxMWRjNTVhMCAxMDA2NDQKLS0t
IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3NlbGZ0ZXN0L3J1bm5lci5zaAorKysgYi90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rc2VsZnRlc3QvcnVubmVyLnNoCkBAIC0xLDggKzEs
MTcgQEAKLSMhL2Jpbi9iYXNoCisjIS9iaW4vc2gKICMgU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAKICMKICMgUnVucyBhIHNldCBvZiB0ZXN0cyBpbiBhIGdpdmVuIHN1YmRp
cmVjdG9yeS4KLS4gJChkaXJuYW1lICIkKHJlYWRsaW5rIC1lICIke0JBU0hfU09VUkNFWzBd
fSIpIikva3RhcF9oZWxwZXJzLnNoCisKKyMgVGhlcmUgaXNuJ3QgYSBzaGVsbC1hZ25vc3Rp
YyB3YXkgdG8gZmluZCB0aGUgcGF0aCBvZiBhIHNvdXJjZWQgZmlsZSwKKyMgc28gd2UgbXVz
dCByZWx5IG9uIEJBU0VfRElSIGJlaW5nIHNldCB0byBmaW5kIG90aGVyIHRvb2xzLgoraWYg
WyAteiAiJEJBU0VfRElSIiBdOyB0aGVuCisJZWNobyAiRXJyb3I6IEJBU0VfRElSIG11c3Qg
YmUgc2V0IGJlZm9yZSBzb3VyY2luZy4iID4mMgorCWV4aXQgMQorZmkKKworLiAke0JBU0Vf
RElSfS9rc2VsZnRlc3Qva3RhcF9oZWxwZXJzLnNoCisKIGV4cG9ydCB0aW1lb3V0X3JjPTEy
NAogZXhwb3J0IGxvZ2ZpbGU9L2Rldi9zdGRvdXQKIGV4cG9ydCBwZXJfdGVzdF9sb2dnaW5n
PQpAQCAtMTQsMTMgKzIzLDYgQEAgZXhwb3J0IFJVTl9JTl9ORVROUz0KICMgb3ZlciBvdXIg
c29mdCB0aW1lb3V0IGxpbWl0LgogZXhwb3J0IGtzZWxmdGVzdF9kZWZhdWx0X3RpbWVvdXQ9
NDUKIAotIyBUaGVyZSBpc24ndCBhIHNoZWxsLWFnbm9zdGljIHdheSB0byBmaW5kIHRoZSBw
YXRoIG9mIGEgc291cmNlZCBmaWxlLAotIyBzbyB3ZSBtdXN0IHJlbHkgb24gQkFTRV9ESVIg
YmVpbmcgc2V0IHRvIGZpbmQgb3RoZXIgdG9vbHMuCi1pZiBbIC16ICIkQkFTRV9ESVIiIF07
IHRoZW4KLQllY2hvICJFcnJvcjogQkFTRV9ESVIgbXVzdCBiZSBzZXQgYmVmb3JlIHNvdXJj
aW5nLiIgPiYyCi0JZXhpdCAxCi1maQotCiBUUl9DTUQ9JChjb21tYW5kIC12IHRyKQogCiAj
IElmIFBlcmwgaXMgdW5hdmFpbGFibGUsIHdlIG11c3QgZmFsbCBiYWNrIHRvIGxpbmUtYXQt
YS10aW1lIHByZWZpeGluZwpAQCAtNDksNyArNTEsNiBAQCBydW5fb25lKCkKIHsKIAlESVI9
IiQxIgogCVRFU1Q9IiQyIgotCWxvY2FsIHJjIHRlc3RfbnVtPSIkMyIKIAogCUJBU0VOQU1F
X1RFU1Q9JChiYXNlbmFtZSAkVEVTVCkKIApAQCAtMTA2LDcgKzEwNyw3IEBAIHJ1bl9vbmUo
KQogCWVjaG8gIiMgJFRFU1RfSERSX01TRyIKIAlpZiBbICEgLWUgIiRURVNUIiBdOyB0aGVu
CiAJCWt0YXBfcHJpbnRfbXNnICJXYXJuaW5nOiBmaWxlICRURVNUIGlzIG1pc3NpbmchIgot
CQlrdGFwX3Rlc3RfZmFpbCAiJHRlc3RfbnVtICRURVNUX0hEUl9NU0ciCisJCWt0YXBfdGVz
dF9mYWlsICIkVEVTVF9IRFJfTVNHIgogCQlyYz0kS1NGVF9GQUlMCiAJZWxzZQogCQlpZiBb
IC14IC91c3IvYmluL3N0ZGJ1ZiBdOyB0aGVuCkBAIC0xMjUsNyArMTI2LDcgQEAgcnVuX29u
ZSgpCiAJCQkJaW50ZXJwcmV0ZXI9JChoZWFkIC1uIDEgIiRURVNUIiB8IGN1dCAtYyAzLSkK
IAkJCQljbWQ9IiRzdGRidWYgJGludGVycHJldGVyIC4vJEJBU0VOQU1FX1RFU1QiCiAJCQll
bHNlCi0JCQkJa3RhcF90ZXN0X2ZhaWwgIiR0ZXN0X251bSAkVEVTVF9IRFJfTVNHIgorCQkJ
CWt0YXBfdGVzdF9mYWlsICIkVEVTVF9IRFJfTVNHIgogCQkJCXJldHVybiAkS1NGVF9GQUlM
CiAJCQlmaQogCQlmaQpAQCAtMTM2LDE1ICsxMzcsMTUgQEAgcnVuX29uZSgpCiAJCXJjPSQ/
CiAJCWNhc2UgIiRyYyIgaW4KIAkJIiRLU0ZUX1BBU1MiKQotCQkJa3RhcF90ZXN0X3Bhc3Mg
IiR0ZXN0X251bSAkVEVTVF9IRFJfTVNHIjs7CisJCQlrdGFwX3Rlc3RfcGFzcyAiJFRFU1Rf
SERSX01TRyI7OwogCQkiJEtTRlRfU0tJUCIpCi0JCQlrdGFwX3Rlc3Rfc2tpcCAiJHRlc3Rf
bnVtICRURVNUX0hEUl9NU0ciOzsKKwkJCWt0YXBfdGVzdF9za2lwICIkVEVTVF9IRFJfTVNH
Ijs7CiAJCSIkS1NGVF9YRkFJTCIpCi0JCQlrdGFwX3Rlc3RfeGZhaWwgIiR0ZXN0X251bSAk
VEVTVF9IRFJfTVNHIjs7CisJCQlrdGFwX3Rlc3RfeGZhaWwgIiRURVNUX0hEUl9NU0ciOzsK
IAkJIiR0aW1lb3V0X3JjIikKLQkJCWt0YXBfdGVzdF9mYWlsICIkdGVzdF9udW0gJFRFU1Rf
SERSX01TRyAjIFRJTUVPVVQgJGtzZWxmdGVzdF90aW1lb3V0IHNlY29uZHMiOzsKKwkJCWt0
YXBfdGVzdF9mYWlsICIkVEVTVF9IRFJfTVNHICMgVElNRU9VVCAka3NlbGZ0ZXN0X3RpbWVv
dXQgc2Vjb25kcyI7OwogCQkqKQotCQkJa3RhcF90ZXN0X2ZhaWwgIiR0ZXN0X251bSAkVEVT
VF9IRFJfTVNHICMgZXhpdD0kcmMiOzsKKwkJCWt0YXBfdGVzdF9mYWlsICIkVEVTVF9IRFJf
TVNHICMgZXhpdD0kcmMiOzsKIAkJZXNhYwogCQljZCAtID4vZGV2L251bGwKIAlmaQpAQCAt
MTU5LDcgKzE2MCw3IEBAIGluX25ldG5zKCkKIAkJQkFTRV9ESVI9JEJBU0VfRElSCiAJCXNv
dXJjZSAkQkFTRV9ESVIva3NlbGZ0ZXN0L3J1bm5lci5zaAogCQlsb2dmaWxlPSRsb2dmaWxl
Ci0JCXJ1bl9vbmUgJERJUiAkVEVTVCAkdGVzdF9udW0KKwkJcnVuX29uZSAkRElSICRURVNU
CiAJRU9GCiB9CiAKQEAgLTE3Miw3ICsxNzMsNyBAQCBydW5faW5fbmV0bnMoKQogCWlwIG5l
dG5zIGFkZCAkbmV0bnMKIAlpZiBbICQ/IC1uZSAwIF07IHRoZW4KIAkJa3RhcF9wcmludF9t
c2cgIldhcm5pbmc6IENyZWF0ZSBuYW1lc3BhY2UgZmFpbGVkIGZvciAkQkFTRU5BTUVfVEVT
VCIKLQkJa3RhcF90ZXN0X2ZhaWwgIiR0ZXN0X251bSBzZWxmdGVzdHM6ICRESVI6ICRCQVNF
TkFNRV9URVNUICMgQ3JlYXRlIE5TIGZhaWxlZCIKKwkJa3RhcF90ZXN0X2ZhaWwgInNlbGZ0
ZXN0czogJERJUjogJEJBU0VOQU1FX1RFU1QgIyBDcmVhdGUgTlMgZmFpbGVkIgogCWZpCiAJ
aXAgLW4gJG5ldG5zIGxpbmsgc2V0IGxvIHVwCiAKQEAgLTE4OSwyOCArMTkwLDI2IEBAIHJ1
bl9pbl9uZXRucygpCiBydW5fbWFueSgpCiB7CiAJRElSPSIke1BXRCMke0JBU0VfRElSfS99
IgotCXRlc3RfbnVtPTAKIAlsb2NhbCByYwotCXBpZHM9KCkKKwlwaWRzPQogCiAJZm9yIFRF
U1QgaW4gIiRAIjsgZG8KIAkJQkFTRU5BTUVfVEVTVD0kKGJhc2VuYW1lICRURVNUKQotCQl0
ZXN0X251bT0kKCggdGVzdF9udW0gKyAxICkpCiAJCWlmIFsgLW4gIiRwZXJfdGVzdF9sb2dn
aW5nIiBdOyB0aGVuCiAJCQlsb2dmaWxlPSIkcGVyX3Rlc3RfbG9nX2Rpci8kQkFTRU5BTUVf
VEVTVCIKIAkJCWNhdCAvZGV2L251bGwgPiAiJGxvZ2ZpbGUiCiAJCWZpCiAJCWlmIFsgLW4g
IiRSVU5fSU5fTkVUTlMiIF07IHRoZW4KIAkJCXJ1bl9pbl9uZXRucyAmCi0JCQlwaWRzKz0o
JCEpCisJCQlwaWRzPSIkcGlkcyAkISIKIAkJZWxzZQotCQkJcnVuX29uZSAiJERJUiIgIiRU
RVNUIiAiJHRlc3RfbnVtIgorCQkJcnVuX29uZSAiJERJUiIgIiRURVNUIgogCQlmaQogCWRv
bmUKIAogCSMgVGhlc2UgdmFyaWFibGVzIGFyZSBvdXRwdXRzIG9mIGt0YXBfaGVscGVycy5z
aCBidXQgc2luY2Ugd2UndmUKIAkjIHJ1biB0aGUgdGVzdCBpbiBhIHN1YnByb2Nlc3Mgd2Ug
bmVlZCB0byB1cGRhdGUgdGhlbSBtYW51YWxseQotCWZvciBwaWQgaW4gIiR7cGlkc1tAXX0i
OyBkbworCWZvciBwaWQgaW4gJHBpZHM7IGRvCiAJCXdhaXQgIiRwaWQiCiAJCXJjPSQ/CiAJ
CWNhc2UgIiRyYyIgaW4K

--------------5b2IYk3OChsE9K1N77PdKQb7--
