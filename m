Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501981A58D
	for <linux-kselftest@vger.kernel.org>; Sun,  1 Feb 2026 12:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769949026; cv=none; b=gjDHwXzp2NFdnXmjJLJNF0Z+eqo8GVdj87rjLKD9MHXQ615NowUWXPxkqXIVe+o6vvVGrqBaY1dcl2iOkGaHEKuvc5NYb+6zphF1IZriROn90wVNi8ZMI5EhPERg/SNxm2twctl6cBgv8C123h7RNXy0KSur3LKEeyOiIwXXz7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769949026; c=relaxed/simple;
	bh=iyfrwHRbgLfVNbjGtSgGIqHMLQzpwYuZBCbqHHPCFWY=;
	h=Content-Type:Message-ID:Date:MIME-Version:From:Subject:To:Cc; b=LhiQXv7jzopg+9iz5/lMGsz0rq7GlLWuCP9qMXyKX8Fh8QLGAbxbV2nNCjgc45Nm/z75Vv6tD+oupvARh4MSebRcrznKaMdFk41oeqLY489thh5Anfv/QHSoeJZfPYWikxm7viGT8XbOZ10Oh99gGVwTYfqTnhaiOKXn2+CEuI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=B1eAlDl8; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="B1eAlDl8"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3541fd9dacdso1599027a91.1
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Feb 2026 04:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1769949023; x=1770553823; darn=vger.kernel.org;
        h=cc:to:subject:from:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DlQQGj+Ini4Skxuk6ismU566+RiKUB52pRxfkkl7gZ0=;
        b=B1eAlDl8OivC4d6B6Z8eV4fB5wi+eWn5x1Dgzzc35EgjECLKKVEBrvWcOlprnQydE2
         Tks1lJ0nHxFhOytJn7zMRQhZAn5lU8Ux6UVy/Ryr+iW2Jjl2qCh4n8aI6rtNBbkXn8dH
         D/qfCCgAdNtG3A0pfLmthyfEGaOgr1WQeRzSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769949023; x=1770553823;
        h=cc:to:subject:from:content-language:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DlQQGj+Ini4Skxuk6ismU566+RiKUB52pRxfkkl7gZ0=;
        b=ITPZS5rRbdznPQmw/08nvnWWmCEl59mMgBU6Mhf82UMUd7gmuTCl3fQLZaNHomgtwD
         /SBmE9WnainSZZx18X/hhmHUyxQoLtx3ub31kbZWnbaVnGkejymPQW4QrcW/5Q2jZ6ZZ
         Nb6AxG4le1bLSDZsMin5J75V7J3n03yodG5rR2enuDs3uQdu/Awr7LrUdOUG4hYxRE11
         aZ0c9CNDCtiAyMBwwfxPEa8I+vXYTGHZe0qyiOl7aNLPVRdIDlPZWWvKZZxDc3vvi4YY
         OlQ3bprCsRmx9KajqY9Eno34udacQU8AL7IOjr7Td7+Wt43W1WaHTiwgduB+8e0H7Ag8
         bo5w==
X-Forwarded-Encrypted: i=1; AJvYcCWIYwwqt/bUI7qc32N/IKO9BhZ1S2cnmzdP0cWq5GVLycHOfRD6QB5o0rQA1uyzc9vhuTebm2dv2nfOhiD58kg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFACfGthEMv6+13CNz9H0k0rvtTWkNFF6/gy8KwGZJIAfYTV0C
	kyc0tj6WTdyzLw2Yc3gtIN+4KifLP+14RJ6p59duazuXOiE3i3rfWqL3kgDeu/T0iuM=
X-Gm-Gg: AZuq6aKoSVvBunSL5uM3pT7cYLnRWAW4t+2BHx9aKcDRqIuQRYHdZENg2LKTMpGWCni
	jfZykLJsUJ+jqVoSuDecDYFhnk8snrbjS3c5cLz2h8dAhriygF8aEH5xuNGyIwSmIFQvnSk/Fnt
	mI4O77k0C9qH7inBMIV1p0Qbz7389LcqEl1ByubyydyJlf3LLvGsQa3xkkz/Kwg88CMcmyOgNXb
	2wlI19lzJKrYPG4F3cfQL7+/0wFcEbaseR1BF+kLTWeb17ahPwm6pgvbgmMv94B74SNpcVp9TIr
	T/oqFtRFybhX+JcVa/9sz3AAe8mVyYz9wjAkaJoKVo5BCtK894Jfitp8ovz3OBeYnz09d9a0IFd
	x4FCazgKSh+6OH8HyzJOD7qSBR5NTIZYB2wkSpqDN/hf35V+qJFHNsSL0lmGgLX463GN1AkS58E
	s0a2eiAANJLKbGbnHVRnRc
X-Received: by 2002:a17:90b:1a81:b0:32e:2fa7:fe6b with SMTP id 98e67ed59e1d1-3543c4df9ccmr8230851a91.14.1769949023596;
        Sun, 01 Feb 2026 04:30:23 -0800 (PST)
Received: from [172.20.0.43] ([136.233.83.18])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642846888fsm12178165a12.16.2026.02.01.04.30.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Feb 2026 04:30:22 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------c74sjm9xT4f9WZvSNE5D36B6"
Message-ID: <8991cb8d-4532-43b3-ab2e-352c46020934@linuxfoundation.org>
Date: Sun, 1 Feb 2026 05:30:18 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
Subject: [GIT PULL] kselftest next update for Linux 6.20-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: shuah <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org

This is a multi-part message in MIME format.
--------------c74sjm9xT4f9WZvSNE5D36B6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull the kselftest next update for Linux 6.20-rc1.

resctrl test:
- fixes a devision by zero error on Hygon
- fixes non-contiguous CBM check for Hygon
- defines CPU vendor IDs as bits to match usage
- adds CPU vendor detection for Hygon

- coredeump test: changes to use __builtin_trap() instead of a null pointer
- anon_inode: replaces null pointers with empty arrays
- kublk: includes message in _Static_assert for C11 compatibility
- run_kselftest.sh: adds `--skip` argument option
- pidfd: fixes typo in comment

Note:

There is a conflict between the following commits found during linux-next
merge and Mark fixed it up

   tools/testing/selftests/ublk/kublk.h

between commit:

   584709ad5ce35 ("selftests: ublk: replace assert() with ublk_assert()")

from the block tree and commit:

   3e6ad272bb8b3 ("kselftest/kublk: include message in _Static_assert for C11 compatibility")

from the kselftest tree.

diff is attached.

thanks,
-- Shuah

----------------------------------------------------------------
The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-next-6.20-rc1

for you to fetch changes up to 6d6ad32e22f028c525d5df471c5522616e645a6b:

   selftests/pidfd: fix typo in comment (2026-01-21 10:56:25 -0700)

----------------------------------------------------------------
linux_kselftest-next-6.20-rc1

resctrl test:
- fixes a devision by zero error on Hygon
- fixes non-contiguous CBM check for Hygon
- defines CPU vendor IDs as bits to match usage
- adds CPU vendor detection for Hygon

- coredeump test: changes to use __builtin_trap() instead of a null pointer
- anon_inode: replaces null pointers with empty arrays
- kublk: includes message in _Static_assert for C11 compatibility
- run_kselftest.sh: adds `--skip` argument option
- pidfd: fixes typo in comment

----------------------------------------------------------------
Clint George (3):
       kselftest/coredump: use __builtin_trap() instead of null pointer
       kselftest/anon_inode: replace null pointers with empty arrays
       kselftest/kublk: include message in _Static_assert for C11 compatibility

Ricardo B. Marlière (1):
       selftests/run_kselftest.sh: Add `--skip` argument option

Xiaochen Shen (4):
       selftests/resctrl: Fix a division by zero error on Hygon
       selftests/resctrl: Define CPU vendor IDs as bits to match usage
       selftests/resctrl: Add CPU vendor detection for Hygon
       selftests/resctrl: Fix non-contiguous CBM check for Hygon

Ziyu Chen (1):
       selftests/pidfd: fix typo in comment

  .../selftests/coredump/coredump_test_helpers.c     |  2 +-
  .../selftests/filesystems/anon_inode_test.c        |  5 +++-
  tools/testing/selftests/pidfd/pidfd_info_test.c    |  2 +-
  tools/testing/selftests/resctrl/cat_test.c         |  6 +++--
  tools/testing/selftests/resctrl/resctrl.h          |  8 ++++---
  tools/testing/selftests/resctrl/resctrl_tests.c    | 28 +++++++++++++++-------
  tools/testing/selftests/resctrl/resctrlfs.c        | 10 ++++++++
  tools/testing/selftests/run_kselftest.sh           | 11 +++++++++
  tools/testing/selftests/ublk/kublk.h               |  2 +-
  9 files changed, 57 insertions(+), 17 deletions(-)
----------------------------------------------------------------
--------------c74sjm9xT4f9WZvSNE5D36B6
Content-Type: text/x-patch; charset=UTF-8;
 name="linux_kselftest-next-6.20-rc1.diff"
Content-Disposition: attachment; filename="linux_kselftest-next-6.20-rc1.diff"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2NvcmVkdW1wL2NvcmVkdW1w
X3Rlc3RfaGVscGVycy5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvY29yZWR1bXAvY29y
ZWR1bXBfdGVzdF9oZWxwZXJzLmMKaW5kZXggYTZmNmQ1ZjJhZTA3Li41YzhhZGVlNjM2NDEg
MTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2NvcmVkdW1wL2NvcmVkdW1w
X3Rlc3RfaGVscGVycy5jCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2NvcmVkdW1w
L2NvcmVkdW1wX3Rlc3RfaGVscGVycy5jCkBAIC01Niw3ICs1Niw3IEBAIHZvaWQgY3Jhc2hp
bmdfY2hpbGQodm9pZCkKIAkJcHRocmVhZF9jcmVhdGUoJnRocmVhZCwgTlVMTCwgZG9fbm90
aGluZywgTlVMTCk7CiAKIAkvKiBjcmFzaCBvbiBwdXJwb3NlICovCi0JaSA9ICooaW50ICop
TlVMTDsKKwlfX2J1aWx0aW5fdHJhcCgpOwogfQogCiBpbnQgY3JlYXRlX2RldGFjaGVkX3Rt
cGZzKHZvaWQpCmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9maWxlc3lz
dGVtcy9hbm9uX2lub2RlX3Rlc3QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2ZpbGVz
eXN0ZW1zL2Fub25faW5vZGVfdGVzdC5jCmluZGV4IDk0YzZjODFjMjMwMS4uMmM0YzUwNTAw
MTE2IDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9maWxlc3lzdGVtcy9h
bm9uX2lub2RlX3Rlc3QuYworKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9maWxlc3lz
dGVtcy9hbm9uX2lub2RlX3Rlc3QuYwpAQCAtNDIsNyArNDIsMTAgQEAgVEVTVChhbm9uX2lu
b2RlX25vX2V4ZWMpCiAJZmRfY29udGV4dCA9IHN5c19mc29wZW4oInRtcGZzIiwgMCk7CiAJ
QVNTRVJUX0dFKGZkX2NvbnRleHQsIDApOwogCi0JQVNTRVJUX0xUKGV4ZWN2ZWF0KGZkX2Nv
bnRleHQsICIiLCBOVUxMLCBOVUxMLCBBVF9FTVBUWV9QQVRIKSwgMCk7CisJY2hhciAqY29u
c3QgZW1wdHlfYXJndltdID0ge05VTEx9OworCWNoYXIgKmNvbnN0IGVtcHR5X2VudnBbXSA9
IHtOVUxMfTsKKworCUFTU0VSVF9MVChleGVjdmVhdChmZF9jb250ZXh0LCAiIiwgZW1wdHlf
YXJndiwgZW1wdHlfZW52cCwgQVRfRU1QVFlfUEFUSCksIDApOwogCUFTU0VSVF9FUShlcnJu
bywgRUFDQ0VTKTsKIAogCUVYUEVDVF9FUShjbG9zZShmZF9jb250ZXh0KSwgMCk7CmRpZmYg
LS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9waWRmZC9waWRmZF9pbmZvX3Rlc3Qu
YyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3BpZGZkL3BpZGZkX2luZm9fdGVzdC5jCmlu
ZGV4IDY1NzFlMDRhY2Q4OC4uOGJlZDk1MWUwNmEwIDEwMDY0NAotLS0gYS90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9waWRmZC9waWRmZF9pbmZvX3Rlc3QuYworKysgYi90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9waWRmZC9waWRmZF9pbmZvX3Rlc3QuYwpAQCAtMjI5LDcgKzIyOSw3
IEBAIHN0YXRpYyB2b2lkICpwaWRmZF9pbmZvX3BhdXNlX3RocmVhZCh2b2lkICphcmcpCiAK
IAljbG9zZShpcGNfc29ja2V0KTsKIAotCS8qIFNsZWVwIHVudGlsbCB3ZSdyZSBraWxsZWQu
ICovCisJLyogU2xlZXAgdW50aWwgd2UncmUga2lsbGVkLiAqLwogCXBhdXNlKCk7CiAJcmV0
dXJuIE5VTEw7CiB9CmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yZXNj
dHJsL2NhdF90ZXN0LmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yZXNjdHJsL2NhdF90
ZXN0LmMKaW5kZXggOTRjZmRiYTUzMDhkLi5mMDBiNjIyYzE0NjAgMTAwNjQ0Ci0tLSBhL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jlc2N0cmwvY2F0X3Rlc3QuYworKysgYi90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9yZXNjdHJsL2NhdF90ZXN0LmMKQEAgLTI5MCw4ICsyOTAsMTAg
QEAgc3RhdGljIGludCBjYXRfcnVuX3Rlc3QoY29uc3Qgc3RydWN0IHJlc2N0cmxfdGVzdCAq
dGVzdCwgY29uc3Qgc3RydWN0IHVzZXJfcGFyYW0KIAogc3RhdGljIGJvb2wgYXJjaF9zdXBw
b3J0c19ub25jb250X2NhdChjb25zdCBzdHJ1Y3QgcmVzY3RybF90ZXN0ICp0ZXN0KQogewot
CS8qIEFNRCBhbHdheXMgc3VwcG9ydHMgbm9uLWNvbnRpZ3VvdXMgQ0JNLiAqLwotCWlmIChn
ZXRfdmVuZG9yKCkgPT0gQVJDSF9BTUQpCisJdW5zaWduZWQgaW50IHZlbmRvcl9pZCA9IGdl
dF92ZW5kb3IoKTsKKworCS8qIEFNRCBhbmQgSHlnb24gYWx3YXlzIHN1cHBvcnQgbm9uLWNv
bnRpZ3VvdXMgQ0JNLiAqLworCWlmICh2ZW5kb3JfaWQgPT0gQVJDSF9BTUQgfHwgdmVuZG9y
X2lkID09IEFSQ0hfSFlHT04pCiAJCXJldHVybiB0cnVlOwogCiAjaWYgZGVmaW5lZChfX2kz
ODZfXykgfHwgZGVmaW5lZChfX3g4Nl82NF9fKSAvKiBhcmNoICovCmRpZmYgLS1naXQgYS90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yZXNjdHJsL3Jlc2N0cmwuaCBiL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL3Jlc2N0cmwvcmVzY3RybC5oCmluZGV4IDNjNTFiZGFjMmRmYS4uYWZl
NjM1YjZlNDhkIDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yZXNjdHJs
L3Jlc2N0cmwuaAorKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yZXNjdHJsL3Jlc2N0
cmwuaApAQCAtMjMsNiArMjMsNyBAQAogI2luY2x1ZGUgPGFzbS91bmlzdGQuaD4KICNpbmNs
dWRlIDxsaW51eC9wZXJmX2V2ZW50Lmg+CiAjaW5jbHVkZSA8bGludXgvY29tcGlsZXIuaD4K
KyNpbmNsdWRlIDxsaW51eC9iaXRzLmg+CiAjaW5jbHVkZSAia3NlbGZ0ZXN0LmgiCiAKICNk
ZWZpbmUgTUIJCQkoMTAyNCAqIDEwMjQpCkBAIC0zNiw4ICszNyw5IEBACiAgKiBEZWZpbmUg
YXMgYml0cyBiZWNhdXNlIHRoZXkncmUgdXNlZCBmb3IgdmVuZG9yX3NwZWNpZmljIGJpdG1h
c2sgaW4KICAqIHRoZSBzdHJ1Y3QgcmVzY3RybF90ZXN0LgogICovCi0jZGVmaW5lIEFSQ0hf
SU5URUwgICAgIDEKLSNkZWZpbmUgQVJDSF9BTUQgICAgICAgMgorI2RlZmluZSBBUkNIX0lO
VEVMCUJJVCgwKQorI2RlZmluZSBBUkNIX0FNRAlCSVQoMSkKKyNkZWZpbmUgQVJDSF9IWUdP
TglCSVQoMikKIAogI2RlZmluZSBFTkRfT0ZfVEVTVFMJMQogCkBAIC0xNjMsNyArMTY1LDcg
QEAgZXh0ZXJuIGludCBzbmNfdW5yZWxpYWJsZTsKIGV4dGVybiBjaGFyIGxsY19vY2N1cF9w
YXRoWzEwMjRdOwogCiBpbnQgc25jX25vZGVzX3Blcl9sM19jYWNoZSh2b2lkKTsKLWludCBn
ZXRfdmVuZG9yKHZvaWQpOwordW5zaWduZWQgaW50IGdldF92ZW5kb3Iodm9pZCk7CiBib29s
IGNoZWNrX3Jlc2N0cmxmc19zdXBwb3J0KHZvaWQpOwogaW50IGZpbHRlcl9kbWVzZyh2b2lk
KTsKIGludCBnZXRfZG9tYWluX2lkKGNvbnN0IGNoYXIgKnJlc291cmNlLCBpbnQgY3B1X25v
LCBpbnQgKmRvbWFpbl9pZCk7CmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9yZXNjdHJsL3Jlc2N0cmxfdGVzdHMuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jl
c2N0cmwvcmVzY3RybF90ZXN0cy5jCmluZGV4IDUxNTRmZmQ4MjFjNC4uZGJjZDVlZWE5ZmJj
IDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yZXNjdHJsL3Jlc2N0cmxf
dGVzdHMuYworKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yZXNjdHJsL3Jlc2N0cmxf
dGVzdHMuYwpAQCAtMjMsMTYgKzIzLDI0IEBAIHN0YXRpYyBzdHJ1Y3QgcmVzY3RybF90ZXN0
ICpyZXNjdHJsX3Rlc3RzW10gPSB7CiAJJmwyX25vbmNvbnRfY2F0X3Rlc3QsCiB9OwogCi1z
dGF0aWMgaW50IGRldGVjdF92ZW5kb3Iodm9pZCkKK3N0YXRpYyB1bnNpZ25lZCBpbnQgZGV0
ZWN0X3ZlbmRvcih2b2lkKQogewotCUZJTEUgKmluZiA9IGZvcGVuKCIvcHJvYy9jcHVpbmZv
IiwgInIiKTsKLQlpbnQgdmVuZG9yX2lkID0gMDsKKwlzdGF0aWMgdW5zaWduZWQgaW50IHZl
bmRvcl9pZDsKKwlzdGF0aWMgYm9vbCBpbml0aWFsaXplZDsKIAljaGFyICpzID0gTlVMTDsK
KwlGSUxFICppbmY7CiAJY2hhciAqcmVzOwogCi0JaWYgKCFpbmYpCisJaWYgKGluaXRpYWxp
emVkKQogCQlyZXR1cm4gdmVuZG9yX2lkOwogCisJaW5mID0gZm9wZW4oIi9wcm9jL2NwdWlu
Zm8iLCAiciIpOworCWlmICghaW5mKSB7CisJCXZlbmRvcl9pZCA9IDA7CisJCWluaXRpYWxp
emVkID0gdHJ1ZTsKKwkJcmV0dXJuIHZlbmRvcl9pZDsKKwl9CisKIAlyZXMgPSBmZ3JlcChp
bmYsICJ2ZW5kb3JfaWQiKTsKIAogCWlmIChyZXMpCkBAIC00MiwxOCArNTAsMjIgQEAgc3Rh
dGljIGludCBkZXRlY3RfdmVuZG9yKHZvaWQpCiAJCXZlbmRvcl9pZCA9IEFSQ0hfSU5URUw7
CiAJZWxzZSBpZiAocyAmJiAhc3RyY21wKHMsICI6IEF1dGhlbnRpY0FNRFxuIikpCiAJCXZl
bmRvcl9pZCA9IEFSQ0hfQU1EOworCWVsc2UgaWYgKHMgJiYgIXN0cmNtcChzLCAiOiBIeWdv
bkdlbnVpbmVcbiIpKQorCQl2ZW5kb3JfaWQgPSBBUkNIX0hZR09OOwogCiAJZmNsb3NlKGlu
Zik7CiAJZnJlZShyZXMpOworCisJaW5pdGlhbGl6ZWQgPSB0cnVlOwogCXJldHVybiB2ZW5k
b3JfaWQ7CiB9CiAKLWludCBnZXRfdmVuZG9yKHZvaWQpCit1bnNpZ25lZCBpbnQgZ2V0X3Zl
bmRvcih2b2lkKQogewotCXN0YXRpYyBpbnQgdmVuZG9yID0gLTE7CisJdW5zaWduZWQgaW50
IHZlbmRvcjsKKworCXZlbmRvciA9IGRldGVjdF92ZW5kb3IoKTsKIAotCWlmICh2ZW5kb3Ig
PT0gLTEpCi0JCXZlbmRvciA9IGRldGVjdF92ZW5kb3IoKTsKIAlpZiAodmVuZG9yID09IDAp
CiAJCWtzZnRfcHJpbnRfbXNnKCJDYW4gbm90IGdldCB2ZW5kb3IgaW5mby4uLlxuIik7CiAK
ZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jlc2N0cmwvcmVzY3RybGZz
LmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yZXNjdHJsL3Jlc2N0cmxmcy5jCmluZGV4
IDE5NWYwNGM0ZDE1OC4uYjljMWJmYjZjYzAyIDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9yZXNjdHJsL3Jlc2N0cmxmcy5jCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL3Jlc2N0cmwvcmVzY3RybGZzLmMKQEAgLTI0Myw2ICsyNDMsMTYgQEAgaW50IHNu
Y19ub2Rlc19wZXJfbDNfY2FjaGUodm9pZCkKIAkJfQogCQlzbmNfbW9kZSA9IGNhY2hlX2Nw
dXMgLyBub2RlX2NwdXM7CiAKKwkJLyoKKwkJICogT24gc29tZSBwbGF0Zm9ybXMgKGUuZy4g
SHlnb24pLAorCQkgKiBjYWNoZV9jcHVzIDwgbm9kZV9jcHVzLCB0aGUgY2FsY3VsYXRlZCBz
bmNfbW9kZSBpcyAwLgorCQkgKgorCQkgKiBTZXQgc25jX21vZGUgPSAxIHRvIGluZGljYXRl
IHRoYXQgU05DIG1vZGUgaXMgbm90CisJCSAqIHN1cHBvcnRlZCBvbiB0aGUgcGxhdGZvcm0u
CisJCSAqLworCQlpZiAoIXNuY19tb2RlKQorCQkJc25jX21vZGUgPSAxOworCiAJCWlmIChz
bmNfbW9kZSA+IDEpCiAJCQlrc2Z0X3ByaW50X21zZygiU05DLSVkIG1vZGUgZGlzY292ZXJl
ZC5cbiIsIHNuY19tb2RlKTsKIAl9CmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9ydW5fa3NlbGZ0ZXN0LnNoIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcnVuX2tz
ZWxmdGVzdC5zaAppbmRleCBkNGJlOTc0OThiMzIuLjg0ZDQ1MjU0Njc1YyAxMDA3NTUKLS0t
IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcnVuX2tzZWxmdGVzdC5zaAorKysgYi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9ydW5fa3NlbGZ0ZXN0LnNoCkBAIC0zMCw2ICszMCw3IEBA
IFVzYWdlOiAkMCBbT1BUSU9OU10KICAgLXMgfCAtLXN1bW1hcnkJCVByaW50IHN1bW1hcnkg
d2l0aCBkZXRhaWxlZCBsb2cgaW4gb3V0cHV0LmxvZyAoY29uZmxpY3Qgd2l0aCAtcCkKICAg
LXAgfCAtLXBlci10ZXN0LWxvZwkJUHJpbnQgdGVzdCBsb2cgaW4gL3RtcCB3aXRoIGVhY2gg
dGVzdCBuYW1lIChjb25mbGljdCB3aXRoIC1zKQogICAtdCB8IC0tdGVzdCBDT0xMRUNUSU9O
OlRFU1QJUnVuIFRFU1QgZnJvbSBDT0xMRUNUSU9OCisgIC1TIHwgLS1za2lwIENPTExFQ1RJ
T046VEVTVAlTa2lwIFRFU1QgZnJvbSBDT0xMRUNUSU9OCiAgIC1jIHwgLS1jb2xsZWN0aW9u
IENPTExFQ1RJT04JUnVuIGFsbCB0ZXN0cyBmcm9tIENPTExFQ1RJT04KICAgLWwgfCAtLWxp
c3QJCQlMaXN0IHRoZSBhdmFpbGFibGUgY29sbGVjdGlvbjp0ZXN0IGVudHJpZXMKICAgLWQg
fCAtLWRyeS1ydW4JCURvbid0IGFjdHVhbGx5IHJ1biBhbnkgdGVzdHMKQEAgLTQzLDYgKzQ0
LDcgQEAgRU9GCiAKIENPTExFQ1RJT05TPSIiCiBURVNUUz0iIgorU0tJUD0iIgogZHJ5cnVu
PSIiCiBrc2VsZnRlc3Rfb3ZlcnJpZGVfdGltZW91dD0iIgogRVJST1JfT05fRkFJTD10cnVl
CkBAIC01OCw2ICs2MCw5IEBAIHdoaWxlIHRydWU7IGRvCiAJCS10IHwgLS10ZXN0KQogCQkJ
VEVTVFM9IiRURVNUUyAkMiIKIAkJCXNoaWZ0IDIgOzsKKwkJLVMgfCAtLXNraXApCisJCQlT
S0lQPSIkU0tJUCAkMiIKKwkJCXNoaWZ0IDIgOzsKIAkJLWMgfCAtLWNvbGxlY3Rpb24pCiAJ
CQlDT0xMRUNUSU9OUz0iJENPTExFQ1RJT05TICQyIgogCQkJc2hpZnQgMiA7OwpAQCAtMTA5
LDYgKzExNCwxMiBAQCBpZiBbIC1uICIkVEVTVFMiIF07IHRoZW4KIAlkb25lCiAJYXZhaWxh
YmxlPSIkKGVjaG8gIiR2YWxpZCIgfCBzZWQgLWUgJ3MvIC9cbi9nJykiCiBmaQorIyBSZW1v
dmUgdGVzdHMgdG8gYmUgc2tpcHBlZCBmcm9tIGF2YWlsYWJsZSBsaXN0CitpZiBbIC1uICIk
U0tJUCIgXTsgdGhlbgorCWZvciBza2lwcGVkIGluICRTS0lQIDsgZG8KKwkJYXZhaWxhYmxl
PSIkKGVjaG8gIiRhdmFpbGFibGUiIHwgZ3JlcCAtdiAiXiR7c2tpcHBlZH0kIikiCisJZG9u
ZQorZmkKIAoga3NlbGZ0ZXN0X2ZhaWx1cmVzX2ZpbGU9IiQobWt0ZW1wIC0tdG1wZGlyIGtz
ZWxmdGVzdC1mYWlsdXJlcy1YWFhYWFgpIgogZXhwb3J0IGtzZWxmdGVzdF9mYWlsdXJlc19m
aWxlCmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy91YmxrL2t1YmxrLmgg
Yi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy91YmxrL2t1YmxrLmgKaW5kZXggZmU0MjcwNWM2
ZDQyLi5lNWViNWY3NjJjMWMgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L3VibGsva3VibGsuaAorKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy91YmxrL2t1Ymxr
LmgKQEAgLTIxNyw3ICsyMTcsNyBAQCBzdGF0aWMgaW5saW5lIF9fdTY0IGJ1aWxkX3VzZXJf
ZGF0YSh1bnNpZ25lZCB0YWcsIHVuc2lnbmVkIG9wLAogCQl1bnNpZ25lZCB0Z3RfZGF0YSwg
dW5zaWduZWQgcV9pZCwgdW5zaWduZWQgaXNfdGFyZ2V0X2lvKQogewogCS8qIHdlIG9ubHkg
aGF2ZSA3IGJpdHMgdG8gZW5jb2RlIHFfaWQgKi8KLQlfU3RhdGljX2Fzc2VydChVQkxLX01B
WF9RVUVVRVNfU0hJRlQgPD0gNyk7CisJX1N0YXRpY19hc3NlcnQoVUJMS19NQVhfUVVFVUVT
X1NISUZUIDw9IDcsICJVQkxLX01BWF9RVUVVRVNfU0hJRlQgbXVzdCBiZSA8PSA3Iik7CiAJ
YXNzZXJ0KCEodGFnID4+IDE2KSAmJiAhKG9wID4+IDgpICYmICEodGd0X2RhdGEgPj4gMTYp
ICYmICEocV9pZCA+PiA3KSk7CiAKIAlyZXR1cm4gdGFnIHwgKG9wIDw8IDE2KSB8ICh0Z3Rf
ZGF0YSA8PCAyNCkgfAo=

--------------c74sjm9xT4f9WZvSNE5D36B6--
