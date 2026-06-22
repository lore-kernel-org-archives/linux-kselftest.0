Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99368391836
	for <linux-kselftest@vger.kernel.org>; Mon, 22 Jun 2026 15:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782142237; cv=none; b=NqOR0WvsNKxyPDfVNi0atk3Bz/Rp312EuvdnYhssl6bVhpKpxasfXPhrifcZMne+y74Hmz0xmvjdnOqFuW7O4A6HIahtC6CTN2GZW9cRlhcGTeZcE/sKmiUiX9vGsFiiiflDSIct6i2qp9gGbcwz/F91lpoA1otG91ZiRCRDPnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782142237; c=relaxed/simple;
	bh=lKSvMSG20JxwQb8V5dUc9Lc5yshPNXnZejNLE2gPfQw=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:Cc:From:Subject; b=SvedkKFYTFyYg/50bmuC05ynv8pb8jWL9FLErVBdFruZ3prkjEzI7JL8QkTQdTtIzN4xFum3pGe0v1i3N11FXjL337BfwDc3+SkAUhfSL3dj87hL4zM2m12M+FBQJoQ8XU5tTt4j7dqxSaTdd2upPbrw2AEmHaJk6+vj9MZMB1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gnVmJqPI; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gnVmJqPI"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7e936c2473dso1575950a34.1
        for <linux-kselftest@vger.kernel.org>; Mon, 22 Jun 2026 08:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1782142234; x=1782747034; darn=vger.kernel.org;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lR7HPVVTpSIWQ20Ulo074RUWwT5SZUxN/PbnQxjrasc=;
        b=gnVmJqPIeezZvQGf949lSERzPoao1G2zmFxhADrH3g1lF3QIyi+pzXIJbyovaTG/NM
         itO34nTXLLCCfVCw5qbK7Qy/eoZDmb4JVLzAk8mryKIQHwzFGOL0P3Fihe7EkC8fWf6Y
         ZckEc6nXcdJSZrYRQx1sh4yOrwgv3cUpk4pZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782142234; x=1782747034;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lR7HPVVTpSIWQ20Ulo074RUWwT5SZUxN/PbnQxjrasc=;
        b=oZtKh5U3lB7R1lPVhd1UMv85oqy8ZtFd7GHSc7WprFEGJNHkD2eDdXCz4dl6wl6lNu
         YRdjY975VDa68b1soHHMtkw0az3iVz+I5ny+ZdQjJSpugQWEZBvsX5bx5xF0QWkQ2sKx
         4MDgiu8CJRYBL4EIR4v2HjIRsjQbnpblYPc/p+iN7vSYB/lHetoxQuaRL3Z6U4IdUNVN
         zzwB0u1Z80vZLNzB3nTDj/5lYluNky7FzNZVuMC1A0gGSXeW4GcZoeYBuZuta88jePR5
         +nA0tJs6iFeWjvv06SSrpMLCjkxtwuIAypHs6j7xkj8cE1HhunkU5GMMhXAVJBqHzRRG
         iOlA==
X-Forwarded-Encrypted: i=1; AFNElJ/MeQRzCHlLI1xOJbKKQKye7bahZiAFYRgE/6ktWPwMGb6Zk56JhvszsIjEBd8DqRdcxgRPDGwxZaprpc5zgr4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3VcGT5labzr473HckoyOIq6hZBbF/4fcas7wqYmOKE7FchH6B
	1GZu6PKMV6KDQ9Kmq9hz9b6JCIfOp1sCeL/kvgKse6svPMwEHLbq0MbqpVj0++1EzQE=
X-Gm-Gg: AfdE7clrps7qwyXwc3psWFdrsHJkCA0OdJZgYJ/6mvsi7ARowC+wQCbHhDTo37XqKtT
	jovEWV3FIZ6sCPldICicoVGUlomw0kibyc5EX2w1v3VONJKd3aFCEkLZ0M7PIXz+hgypaMLu+Lr
	kd5fbkXLONTYUYxVBywZxMcceHF/kBIjaG36Cf12NWgYRn3n0fTWok53j+2d88+KybZqJCTZCh9
	wbxFv3CtPOHT3O9fLdz8ZdoQ7C1BetlXfLDHvRw2OTtulahIQh+6nefpO1PT8RAzM3oA0PZnmt7
	SDUnBMX9PnzU6m4cB2qjy3wF3j/IdByzP8I3FwDhV/S3tUZl+7iJ9uSqyF33CXnfTPQadtZzgeq
	TvqYkxSixuKaskxKx8CRVIjebWayZ1ca0lPkwp0w1SWoOj3CFtAllNiAcjctrIdkkOGOdliBrQ9
	v6zvmikctGrU9kj4LXA7j4ZDB0zHrw13A=
X-Received: by 2002:a05:6808:10c8:b0:487:4f7b:53ca with SMTP id 5614622812f47-4896c8fe72cmr8203210b6e.26.1782142234485;
        Mon, 22 Jun 2026 08:30:34 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e944069d22sm6608732a34.10.2026.06.22.08.30.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 08:30:33 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------WQyNfOiuyPkbiKBZbKErIDD4"
Message-ID: <e8e631e2-cbf3-418f-b07c-c13259d6c010@linuxfoundation.org>
Date: Mon, 22 Jun 2026 09:30:32 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, shuah <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
From: Shuah Khan <skhan@linuxfoundation.org>
Subject: [GIT PULL] kselftest second update for Linux 7.2-rc1

This is a multi-part message in MIME format.
--------------WQyNfOiuyPkbiKBZbKErIDD4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Linus,

Please pull this kselftest second update for Linux 7.2-rc1.

Fixes ftrace test and kselftest document

-- docs: remove obsolete wiki link from kselftest.rst
-- ftrace: drop invalid top-level local in test_ownership
-- ftrace: Fix trace_marker_raw test on 64K page kernels

diff is attacthed.

thanks,
-- Shuah

----------------------------------------------------------------
The following changes since commit 5f4974231fb3656c15a82faece9f2303b8c18a14:

   kselftest: fix doc for ksft_test_result_report() (2026-05-05 12:39:43 -0600)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-next-7.2-rc1-second

for you to fetch changes up to fbb7ad31ab376c5101b2ac7205fad0344fd2de60:

   docs: kselftest: remove link to obsolete wiki (2026-06-18 17:04:49 -0600)

----------------------------------------------------------------
linux_kselftest-next-7.2-rc1-second

Fixes ftrace test and kselftest document

-- docs: remove obsolete wiki link from kselftest.rst
-- ftrace: drop invalid top-level local in test_ownership
-- ftrace: Fix trace_marker_raw test on 64K page kernels

----------------------------------------------------------------
Brett A C Sheffield (1):
       docs: kselftest: remove link to obsolete wiki

Cao Ruichuang (1):
       selftests/ftrace: Drop invalid top-level local in test_ownership

Tianchen Ding (1):
       selftests/ftrace: Fix trace_marker_raw test on 64K page kernels

  Documentation/dev-tools/kselftest.rst                      |  5 -----
  .../selftests/ftrace/test.d/00basic/test_ownership.tc      |  2 +-
  .../selftests/ftrace/test.d/00basic/trace_marker_raw.tc    | 14 +++++++++++---
  3 files changed, 12 insertions(+), 9 deletions(-)
----------------------------------------------------------------
--------------WQyNfOiuyPkbiKBZbKErIDD4
Content-Type: text/x-patch; charset=UTF-8;
 name="linux_kselftest-next-7.2-rc1-second.diff"
Content-Disposition: attachment;
 filename="linux_kselftest-next-7.2-rc1-second.diff"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2LXRvb2xzL2tzZWxmdGVzdC5yc3QgYi9E
b2N1bWVudGF0aW9uL2Rldi10b29scy9rc2VsZnRlc3QucnN0CmluZGV4IGQ3YmZlMzIwMzM4
Yy4uNjRjMGVjNzQyOGEyIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2Rldi10b29scy9r
c2VsZnRlc3QucnN0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2LXRvb2xzL2tzZWxmdGVzdC5y
c3QKQEAgLTE1LDExICsxNSw2IEBAIGFibGUgdG8gcnVuIHRoYXQgdGVzdCBvbiBhbiBvbGRl
ciBrZXJuZWwuIEhlbmNlLCBpdCBpcyBpbXBvcnRhbnQgdG8ga2VlcAogY29kZSB0aGF0IGNh
biBzdGlsbCB0ZXN0IGFuIG9sZGVyIGtlcm5lbCBhbmQgbWFrZSBzdXJlIGl0IHNraXBzIHRo
ZSB0ZXN0CiBncmFjZWZ1bGx5IG9uIG5ld2VyIHJlbGVhc2VzLgogCi1Zb3UgY2FuIGZpbmQg
YWRkaXRpb25hbCBpbmZvcm1hdGlvbiBvbiBLc2VsZnRlc3QgZnJhbWV3b3JrLCBob3cgdG8K
LXdyaXRlIG5ldyB0ZXN0cyB1c2luZyB0aGUgZnJhbWV3b3JrIG9uIEtzZWxmdGVzdCB3aWtp
OgotCi1odHRwczovL2tzZWxmdGVzdC53aWtpLmtlcm5lbC5vcmcvCi0KIE9uIHNvbWUgc3lz
dGVtcywgaG90LXBsdWcgdGVzdHMgY291bGQgaGFuZyBmb3JldmVyIHdhaXRpbmcgZm9yIGNw
dSBhbmQKIG1lbW9yeSB0byBiZSByZWFkeSB0byBiZSBvZmZsaW5lZC4gQSBzcGVjaWFsIGhv
dC1wbHVnIHRhcmdldCBpcyBjcmVhdGVkCiB0byBydW4gdGhlIGZ1bGwgcmFuZ2Ugb2YgaG90
LXBsdWcgdGVzdHMuIEluIGRlZmF1bHQgbW9kZSwgaG90LXBsdWcgdGVzdHMgcnVuCmRpZmYg
LS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9mdHJhY2UvdGVzdC5kLzAwYmFzaWMv
dGVzdF9vd25lcnNoaXAudGMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9mdHJhY2UvdGVz
dC5kLzAwYmFzaWMvdGVzdF9vd25lcnNoaXAudGMKaW5kZXggZTcxY2MzYWQwYmRmLi42ZDAw
ZDNjMGY0OTMgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Z0cmFjZS90
ZXN0LmQvMDBiYXNpYy90ZXN0X293bmVyc2hpcC50YworKysgYi90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9mdHJhY2UvdGVzdC5kLzAwYmFzaWMvdGVzdF9vd25lcnNoaXAudGMKQEAgLTYs
NyArNiw3IEBACiBvcmlnaW5hbF9ncm91cD1gc3RhdCAtYyAiJWciIC5gCiBvcmlnaW5hbF9v
d25lcj1gc3RhdCAtYyAiJXUiIC5gCiAKLWxvY2FsIG1vdW50X3BvaW50PSQoZ2V0X21vdW50
X3BvaW50KQorbW91bnRfcG9pbnQ9JChnZXRfbW91bnRfcG9pbnQpCiAKIG1vdW50X29wdGlv
bnM9JChnZXRfbW50X29wdGlvbnMgIiRtb3VudF9wb2ludCIpCiAKZGlmZiAtLWdpdCBhL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Z0cmFjZS90ZXN0LmQvMDBiYXNpYy90cmFjZV9tYXJr
ZXJfcmF3LnRjIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZnRyYWNlL3Rlc3QuZC8wMGJh
c2ljL3RyYWNlX21hcmtlcl9yYXcudGMKaW5kZXggOGU5MDVkNGZlNmRkLi5mOTg1ZmYzOTE0
NjMgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Z0cmFjZS90ZXN0LmQv
MDBiYXNpYy90cmFjZV9tYXJrZXJfcmF3LnRjCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2Z0cmFjZS90ZXN0LmQvMDBiYXNpYy90cmFjZV9tYXJrZXJfcmF3LnRjCkBAIC0zNiwx
NSArMzYsMjMgQEAgbWFrZV9zdHIoKSB7CiAKIAlkYXRhPWBwcmludGYgLS0gJ1glLjBzJyAk
KHNlcSAkY250KWAKIAotCXByaW50ZiAiJHt2YWx9JHtkYXRhfSIKKwkjIFJldHVybiBlc2Nh
cGUtc2VxdWVuY2UgdGV4dCAoZS5nLiAiXDAwM1wwMDAuLi4iKTsgdGhlIGNhbGxlcgorCSMg
Y29udmVydHMgdG8gYmluYXJ5LiBTaGVsbCBjb21tYW5kIHN1YnN0aXR1dGlvbiBzdHJpcHMg
TlVMIGJ5dGVzLAorCSMgc28gdGhlIGJpbmFyeSBmb3JtIGNhbm5vdCBzdXJ2aXZlIGJlaW5n
IGNhcHR1cmVkIGludG8gYSB2YXJpYWJsZS4KKwlwcmludGYgJyVzJyAiJHt2YWx9JHtkYXRh
fSIKIH0KIAogd3JpdGVfYnVmZmVyKCkgewogCWlkPSQxCiAJc2l6ZT0kMgogCi0JIyB3cml0
ZSB0aGUgc3RyaW5nIGludG8gdGhlIHJhdyBtYXJrZXIKLQltYWtlX3N0ciAkaWQgJHNpemUg
PiB0cmFjZV9tYXJrZXJfcmF3CisJc3RyPWBtYWtlX3N0ciAkaWQgJHNpemVgCisJbGVuPWBw
cmludGYgIiRzdHIiIHwgd2MgLWNgCisJIyBQaXBlIHRocm91Z2ggZGQgdG8gZW5zdXJlIGEg
c2luZ2xlIGF0b21pYyB3cml0ZSgpIHN5c2NhbGwKKwkjIG9uIGFyY2hpdGVjdHVyZXMgd2l0
aCA2NEsgcGFnZXMsIHdoZXJlIHNoZWxsJ3MgcHJpbnRmIGJ1aWx0aW4KKwkjIHVzZXMgc3Rk
aW8gYnVmZmVyaW5nIHdoaWNoIG1heSBzcGxpdCB0aGUgb3V0cHV0IGludG8gbXVsdGlwbGUK
KwkjIHdyaXRlcy4KKwlwcmludGYgIiRzdHIiIHwgZGQgb2Y9dHJhY2VfbWFya2VyX3JhdyBi
cz0kbGVuIGlmbGFnPWZ1bGxibG9jawogfQogCiAK

--------------WQyNfOiuyPkbiKBZbKErIDD4--
