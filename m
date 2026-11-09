Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794257362;
	b=vsGntcI3BqEi0xpJOHElLPpiBQHMM1dIaek1n7/76QCoC/n7En/7RizALJvA/FMZsPbQ
	 I67cm+g5SwwUAR/gr5Kp+Tf4kgcBbWEejbXc/00mPKMmv09oMjyOldPmYuYaN8kwPmkJm
	 +bcN63Kfz0j0ogd5lCWvTRBct2JR94GM5n3xXu1MxWjly0jRNrKCdNxEgB1mpP/YGQxYt
	 Nr4Y2janKWeZFoSfRrhxQQYtOLWwGl4EuB2Uo3kkGG9FnyixSllO8HJxgJivu0Z9oeLf3
	 iJVMjXbQ7v3rlxrlPtYJaCREj/qOU2dUhXgcj4QZ5Beq9pUrDLkhBUMxQ3hAmdeFbcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794257362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Message-ID:Date:MIME-Version:User-Agent:Content-Language:
	 To:Cc:From:Subject;
	bh=Y7kaHUGjRv+jwP0EBjJfgylMXgrkWfdZdbFnGRU0TlA=;
	b=qVVwfIxcEVVY1S2OsbmhJWQiyzrP8hvIC5wMoCzIQ+TMEF7qtqxL3krJ5MLAOEwLdSYx
	 tUjB6qCZ3a+dNG0Sssac1kk8cZUppjCYZtbp5lNgpdfXqfUOwJ1fh0P8sQc9DtMWrOCWR
	 knXO26/79SA6ybimcu74h36tcRXSs/0Jv2Wpd951blF15IDkpq+u0pfSd360uwn0jqf3q
	 d3AEV+jR1smqBlqwlZ8c90kLr536yZCSppJ/lQL/P8CT8roko9Wyz0Bk3PxzOqIbFryQw
	 46yQMY/+YT+YkFrHp0HBjOdAKHaRkd/J1YDTMoyCPcwmNuaHOE26NMG17Q5R9NMfoFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=CdWQ5Rm8;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94946606A321
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 20:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94946606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=CdWQ5Rm8
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-825b40f8a26so595433a34.1
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 12:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794257359; x=1794862159; darn=vger.kernel.org;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:content-type:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y7kaHUGjRv+jwP0EBjJfgylMXgrkWfdZdbFnGRU0TlA=;
        b=CdWQ5Rm8vw56aCQ1tZpsLfcvuR3FJC+jwSTX+JHQ4fHrVxIxvWlgAmM3No6FB6CHXK
         xTieRc+Gjb4wOJAoiiz8Ag3EAMiC+vnB74tz4tLFHlooDPBvHOdKCNWcVXdwEuRlCNle
         v2h6tFkmefqtD2v03B3QD3JMZUUvZzxUhYFH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794257359; x=1794862159;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:content-type:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y7kaHUGjRv+jwP0EBjJfgylMXgrkWfdZdbFnGRU0TlA=;
        b=D5/ysEheSR8niE2P6ffX10y99lNaK/L3eOTqzAWyX+0gY9dBr/iE4jQpMy+8oMpL0l
         1GuPrw5F4+oecadwHhZ6CHTrXouGkJ2rlhecNrHPeheexPH5Wm3rKOUkTWOBpXeEaPHX
         qxTKfYXxvw3s3OpGTaa0DZUvXlLOZYo9vKV9fOPR6p9HGJ+jN9jCo6To106Ld3xteAyK
         3dp7gNjOKeVcKh7qOsrzcXYjtETRkCkb+NrueZsDkh4HVP36Z9cw5V52SSfZsuBue5Nz
         jxhP0qP7OonUEDCSEQvF3ch6VbdOMWwQtDgETMcoKeAAJtpR56mAjqOEGD9SQbHlmQK3
         HuIw==
X-Forwarded-Encrypted: i=1; AL+hErGk4Sfus3JVQbxQ0ngx+P66splYbk24nU7fYmAvrz9nzsdl5Y5KEAkoJs1/UNH7loYCsa+XjG+hHoBfWHX4VfA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9r+UgnVIo6g6UCuhQK1+clipKpu5Il4aa0HErLiw7RfGmul+l3
	eAcA1ra6SG3FCXac+INYQXu+QLfGuVOihidUGD7/R2v19xuui/sbma5I40UJhTPr5Q0=
X-Gm-Gg: AYBFou0OIe5PunObGg/MtTQYw9zZqoLQWQZputvueMOyOI2e+tqpXaQcsQ02q85yS8C
	Y1/0BpLyM5xnLPY4aqEA3OCXN0N36LDZlh/uQhHgm7YN7YTRp4k7VzQlh7FxmdQOzbSbslhV0vl
	INnTv4S95tsucPyhkt9fH3KELAHTWoAjVtvWhYFgB3H1QioncM9Va8Pe6uFaKUT+uYWtdkTB9qv
	x4MDo3FYCuQA2kShYlNqSRGziIBQO4GqbaDSpsbZOe+bRlmcfx17hOEGR38V/v4D4sU7ZZ9Fxhe
	+lPAYuUrVzuGgRJ2MLx060jiq1NKJXWyl3oFUgs6vKinahjs+UbfGLhxu1KB3eXb33h5e/Gn6ya
	d8e3dR3RyiJMTcAtJW97Iio3XYQuZdCkqYf3wqaA8tjRe/56BWrL4lEeoPvZ8XL8nkO7vavYaFJ
	BRZIZf8jf7wG2Tlmvf6zqnizM5YA2T4dQ1XZV5AZFlT1euJacAnTbLqy1SyiuC+2NbYy6l4MdAy
	WZXJ9EcgJgJda98RhUT98ESDMXqIQupG+/0kQZwrvRvHIqjCpOWsjusr9oqYYO9TLtA8QB++hZr
	bm6c73o3CXuFpqOdFq26vATNU+jOQIcoZ0xI6g==
X-Received: by 2002:a05:6808:2396:b0:4d6:90d4:6bb with SMTP id 5614622812f47-5683cd3d715mr644340b6e.45.1794257359453;
        Mon, 09 Nov 2026 12:49:19 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905735edasm212747b6e.7.2026.11.09.12.49.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 12:49:18 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------0mlP4um0nGm0fZDxaIOQEZuh"
Message-ID: <65ee4aa7-b581-4b60-bdda-e91855499ee2@linuxfoundation.org>
Date: Mon, 9 Nov 2026 13:49:17 -0700
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, shuah <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
From: Shuah Khan <skhan@linuxfoundation.org>
Subject: [GIT PULL] kselftest fixes update for Linux 7.4-rc3

This is a multi-part message in MIME format.
--------------0mlP4um0nGm0fZDxaIOQEZuh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Linus,

Please pull this kselftest fixes update for Linux 7.4-rc3

Fixes run_fat_tests hang, false bashism in kprobe_non_uniq_symbol.tc,
and ftrace invalid test skip.

-- selftests/ftrace: Add missing spaces after ! in probe syntax tests
-- tracing/selftests: Fix false bashism in kprobe_non_uniq_symbol.tc
-- selftests/filesystems: Fix run_fat_tests hang


diff is attached.

thanks,
-- Shuah

----------------------------------------------------------------
The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

   Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-fixes-7.4-rc3

for you to fetch changes up to 36990c8fda77d918b1e52d5d6df3a144b552d86e:

   selftests/ftrace: Add missing spaces after ! in probe syntax tests (2026-11-05 14:18:20 -0700)

----------------------------------------------------------------
linux_kselftest-fixes-7.4-rc3

Fixes run_fat_tests hang, false bashism in kprobe_non_uniq_symbol.tc,
and ftrace invalid test skip.

-- selftests/ftrace: Add missing spaces after ! in probe syntax tests
-- tracing/selftests: Fix false bashism in kprobe_non_uniq_symbol.tc
-- selftests/filesystems: Fix run_fat_tests hang

----------------------------------------------------------------
Jaewon Jung (1):
       selftests/ftrace: Add missing spaces after ! in probe syntax tests

Shuah Khan (1):
       selftests/filesystems: Fix run_fat_tests hang

Steven Rostedt (1):
       tracing/selftests: Fix false bashism in kprobe_non_uniq_symbol.tc

  tools/testing/selftests/filesystems/fat/run_fat_tests.sh   | 14 ++++++++++++++
  .../ftrace/test.d/dynevent/fprobe_syntax_errors.tc         |  4 ++--
  .../ftrace/test.d/kprobe/kprobe_non_uniq_symbol.tc         |  2 +-
  .../selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc |  2 +-
  4 files changed, 18 insertions(+), 4 deletions(-)
----------------------------------------------------------------
--------------0mlP4um0nGm0fZDxaIOQEZuh
Content-Type: text/x-patch; charset=UTF-8;
 name="linux_kselftest-fixes-7.4-rc3.diff"
Content-Disposition: attachment; filename="linux_kselftest-fixes-7.4-rc3.diff"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2ZpbGVzeXN0ZW1zL2ZhdC9y
dW5fZmF0X3Rlc3RzLnNoIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZmlsZXN5c3RlbXMv
ZmF0L3J1bl9mYXRfdGVzdHMuc2gKaW5kZXggZDYxMjY0ZDQ3OTVkLi4wNzEyYzhkMjNmZDcg
MTAwNzU1Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2ZpbGVzeXN0ZW1zL2ZhdC9y
dW5fZmF0X3Rlc3RzLnNoCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2ZpbGVzeXN0
ZW1zL2ZhdC9ydW5fZmF0X3Rlc3RzLnNoCkBAIC0xNSw2ICsxNSw4IEBAIEJBU0VfRElSPSIk
KGRpcm5hbWUgJDApIgogVE1QX0RJUj0iJChta3RlbXAgLWQgL3RtcC9mYXRfdGVzdHNfdG1w
LlhYWFhYWCkiCiBJTUdfUEFUSD0iJHtUTVBfRElSfS9mYXQuaW1nIgogTU5UX1BBVEg9IiR7
VE1QX0RJUn0vbW50IgorIyBLc2VsZnRlc3QgZnJhbWV3b3JrIHJlcXVpcmVtZW50IC0gU0tJ
UCBjb2RlIGlzIDQuCitrc2Z0X3NraXA9NAogCiBjbGVhbnVwKCkKIHsKQEAgLTIzLDYgKzI1
LDE3IEBAIGNsZWFudXAoKQogfQogdHJhcCBjbGVhbnVwIFNJR0lOVCBTSUdURVJNIEVYSVQK
IAorY2hlY2tfcHJlcmVxcygpCit7CisgICAgICAgIGxvY2FsIG1zZz0ic2tpcCBhbGwgdGVz
dHM6IgorICAgICAgICBsb2NhbCB1aWQ9JChpZCAtdSkKKworICAgICAgICBpZiBbICR1aWQg
LW5lIDAgXTsgdGhlbgorICAgICAgICAgICAgICAgIGVjaG8gJG1zZyBtdXN0IGJlIHJ1biBh
cyByb290ID4mMgorICAgICAgICAgICAgICAgIGV4aXQgJGtzZnRfc2tpcAorICAgICAgICBm
aQorfQorCiBjcmVhdGVfbG9vcGJhY2soKQogewogICAgIHRvdWNoICIke0lNR19QQVRIfSIK
QEAgLTczLDYgKzg2LDcgQEAgdW5tb3VudF9pbWFnZSgpCiAgICAgc3VkbyB1bW91bnQgIiR7
TU5UX1BBVEh9IiAmPiAvZGV2L251bGwKIH0KIAorY2hlY2tfcHJlcmVxcwogY3JlYXRlX2xv
b3BiYWNrCiBtb3VudF9pbWFnZQogcmVuYW1lX2V4Y2hhbmdlX3Rlc3QKZGlmZiAtLWdpdCBh
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Z0cmFjZS90ZXN0LmQvZHluZXZlbnQvZnByb2Jl
X3N5bnRheF9lcnJvcnMudGMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9mdHJhY2UvdGVz
dC5kL2R5bmV2ZW50L2Zwcm9iZV9zeW50YXhfZXJyb3JzLnRjCmluZGV4IDM4NDIwOTk2ODMy
NS4uNzA3NTE1NzNlOGRlIDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9m
dHJhY2UvdGVzdC5kL2R5bmV2ZW50L2Zwcm9iZV9zeW50YXhfZXJyb3JzLnRjCisrKyBiL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Z0cmFjZS90ZXN0LmQvZHluZXZlbnQvZnByb2JlX3N5
bnRheF9lcnJvcnMudGMKQEAgLTMzLDcgKzMzLDcgQEAgY2hlY2tfZXJyb3IgJ2YgdmZzX3Jl
YWQgXiRzdGFjazEwMDAwJwkjIEJBRF9TVEFDS19OVU0KIAogY2hlY2tfZXJyb3IgJ2YgdmZz
X3JlYWQgXiRhcmcxMDAwMCcJIyBCQURfQVJHX05VTQogCi1pZiAhZ3JlcCAtcSAna2VybmVs
IHJldHVybiBwcm9iZXMgc3VwcG9ydDonIFJFQURNRTsgdGhlbgoraWYgISBncmVwIC1xICdr
ZXJuZWwgcmV0dXJuIHByb2JlcyBzdXBwb3J0OicgUkVBRE1FOyB0aGVuCiBjaGVja19lcnJv
ciAnZiB2ZnNfcmVhZCAkcmV0dmFsIF4kYXJnMScgIyBCQURfVkFSCiBmaQogY2hlY2tfZXJy
b3IgJ2YgdmZzX3JlYWQgXiRub25lX3ZhcicJIyBCQURfVkFSCkBAIC0xMDAsNyArMTAwLDcg
QEAgaWYgZ3JlcCAtcSAiPGFyZ25hbWU+IiBSRUFETUU7IHRoZW4KIGNoZWNrX2Vycm9yICdm
IHZmc19yZWFkIGFyZ3M9XiRhcmcqJwkJIyBCQURfVkFSX0FSR1MKIGNoZWNrX2Vycm9yICdm
IHZmc19yZWFkICswKF4kYXJnKiknCQkjIEJBRF9WQVJfQVJHUwogY2hlY2tfZXJyb3IgJ2Yg
dmZzX3JlYWQgJGFyZyogXiRhcmcqJwkJIyBET1VCTEVfQVJHUwotaWYgIWdyZXAgLXEgJ2tl
cm5lbCByZXR1cm4gcHJvYmVzIHN1cHBvcnQ6JyBSRUFETUU7IHRoZW4KK2lmICEgZ3JlcCAt
cSAna2VybmVsIHJldHVybiBwcm9iZXMgc3VwcG9ydDonIFJFQURNRTsgdGhlbgogY2hlY2tf
ZXJyb3IgJ2YgdmZzX3JlYWQlcmV0dXJuIF4kYXJnKicJCSMgTk9GRU5UUllfQVJHUwogZmkK
IGNoZWNrX2Vycm9yICdmIHZmc19yZWFkIF5ob2dlJwkJCSMgTk9fQlRGQVJHCmRpZmYgLS1n
aXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9mdHJhY2UvdGVzdC5kL2twcm9iZS9rcHJv
YmVfbm9uX3VuaXFfc3ltYm9sLnRjIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZnRyYWNl
L3Rlc3QuZC9rcHJvYmUva3Byb2JlX25vbl91bmlxX3N5bWJvbC50YwppbmRleCAwM2ViOWU3
MGI0MzguLmY4ZTE4ZWE4YzI2OCAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMvZnRyYWNlL3Rlc3QuZC9rcHJvYmUva3Byb2JlX25vbl91bmlxX3N5bWJvbC50YworKysg
Yi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9mdHJhY2UvdGVzdC5kL2twcm9iZS9rcHJvYmVf
bm9uX3VuaXFfc3ltYm9sLnRjCkBAIC02LDcgKzYsNyBAQAogU1lNQk9MPSdpbml0X29uY2Un
CiAKICMgV2Ugc2tpcCB0aGlzIHRlc3Qgb24ga2VybmVsIHdoZXJlIFNZTUJPTCBpcyB1bmlx
dWUgb3IgZG9lcyBub3QgZXhpc3QuCi1pZiBbICIkKGdyZXAgLWMgLUUgIltbOmFsbnVtOl1d
KyB0ICR7U1lNQk9MfSQiIC9wcm9jL2thbGxzeW1zKSIgLWxlICcxJyBdOyB0aGVuCitpZiBb
ICIkKGdyZXAgLWMgLUUgIltbOmFsbnVtOl1dKyB0ICR7U1lNQk9MfVwkIiAvcHJvYy9rYWxs
c3ltcykiIC1sZSAnMScgXTsgdGhlbgogCWV4aXRfdW5zdXBwb3J0ZWQKIGZpCiAKZGlmZiAt
LWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Z0cmFjZS90ZXN0LmQva3Byb2JlL2tw
cm9iZV9zeW50YXhfZXJyb3JzLnRjIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZnRyYWNl
L3Rlc3QuZC9rcHJvYmUva3Byb2JlX3N5bnRheF9lcnJvcnMudGMKaW5kZXggYjBlNmI4MGNj
YjAxLi4wNmVmYTY3ZTAxZmYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2Z0cmFjZS90ZXN0LmQva3Byb2JlL2twcm9iZV9zeW50YXhfZXJyb3JzLnRjCisrKyBiL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Z0cmFjZS90ZXN0LmQva3Byb2JlL2twcm9iZV9zeW50
YXhfZXJyb3JzLnRjCkBAIC0xMDgsNyArMTA4LDcgQEAgaWYgZ3JlcCAtcSAiPGFyZ25hbWU+
IiBSRUFETUU7IHRoZW4KIGNoZWNrX2Vycm9yICdwIHZmc19yZWFkIGFyZ3M9XiRhcmcqJwkJ
IyBCQURfVkFSX0FSR1MKIGNoZWNrX2Vycm9yICdwIHZmc19yZWFkICswKF4kYXJnKiknCQkj
IEJBRF9WQVJfQVJHUwogY2hlY2tfZXJyb3IgJ3AgdmZzX3JlYWQgJGFyZyogXiRhcmcqJwkJ
IyBET1VCTEVfQVJHUwotaWYgIWdyZXAgLXEgJ2tlcm5lbCByZXR1cm4gcHJvYmVzIHN1cHBv
cnQ6JyBSRUFETUU7IHRoZW4KK2lmICEgZ3JlcCAtcSAna2VybmVsIHJldHVybiBwcm9iZXMg
c3VwcG9ydDonIFJFQURNRTsgdGhlbgogY2hlY2tfZXJyb3IgJ3IgdmZzX3JlYWQgXiRhcmcq
JwkJCSMgTk9GRU5UUllfQVJHUwogZmkKIGNoZWNrX2Vycm9yICdwIHZmc19yZWFkKzIwIF4k
YXJnKicJCSMgTk9GRU5UUllfQVJHUwo=

--------------0mlP4um0nGm0fZDxaIOQEZuh--
