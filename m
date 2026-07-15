Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DF3349CFF
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 22:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784153339; cv=none; b=neN68KIWCoZmg2/AdZGzQMl/jlqcqY3K/ym3V71OI3FRfJ8qZDHgeR/s9WJKaYMIdm8EjVS93bskbLS5XZWjKUV4nCGEf+mIJMDieZuj7ro3z7BYKU6RtDf7R5MByzrv9X03QQ1HoIGyimr/Kqf8Q0+ZRt6ThXls7LRbFw2KteE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784153339; c=relaxed/simple;
	bh=Zr7p7nqU2TkzBrvIUfGwjIEh+5p5uEaus6aNZ1l8aKc=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:Cc:From:Subject; b=unjUSObvQBJJlDqshL4A9nRZkfVAvchUsaekz7xLUuNQHkighlyG6Xw2qhhxTTIlARDGJzKITZT8duFVhGel4Stq3B3qHAgUtragQbwz+JK2AxmLYKYq8eMiO8lfmooAUvydhI01UR6mFX62Qq3s+VQVyZ5HN0pxIXyFvE2AnTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JEVPkUs6; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JEVPkUs6"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-44cc65b0a7fso915847fac.0
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 15:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1784153336; x=1784758136; darn=vger.kernel.org;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:content-type:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P8QhzIyzv9wXERn0JJojIHwATWNnnuUIFmQ5uwOyZyA=;
        b=JEVPkUs6mwMhWvlNaCGW3JgCpBZ3+wXUd7hfng3whphphAzgIap/2SPkG5qsZwCFMG
         PxYVt9hCKOFm+uKpL+D7nmAZNn5CsqD0SQJqgl4ZEL3WDXWhHjv+xNrA/lCQyXe+HJVC
         OAwRYKgvaojN9g+czuAvVhyuyIhPcbBJ7Qsms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784153336; x=1784758136;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:content-type:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P8QhzIyzv9wXERn0JJojIHwATWNnnuUIFmQ5uwOyZyA=;
        b=clYwcBFDIy/jVNiLolFlQcfDEh3Rnb4cRBJD8cfkMde1GXNhMe5nB3xvN9oL0YVO+G
         oABD37rluQa10glLXCuJckecR8hxoF9kuXECGSaGzL4JjvU9+B2kcWoOslayVKaZAxlM
         /gO2cHGtC1qpx2VFLNpxOdz2Clgf84qbtzWRhjZrAq987UrZMStCyoAWaW6fv2pG8I5h
         /orkTMP31VFbiWVPw+cxWaEJNhRvRbhCF5GbUYdvqvMAhG/FF/EF6Qwt5jI1GkTbVevk
         FqcwVi3kXq6fP7wOEvZUb8sZJNHLO1j+9GoXkQMyXNVTAIjwZBMeNukDYHSAn/3uty0k
         btsA==
X-Forwarded-Encrypted: i=1; AHgh+Rp7jgqB0l08wAGVeRjvbuB7mtdt/vHNExMeornnjIl9IvU7hMAtYZSXZfKL4HlDq3HmDO4Efbrge2/WI2a4+Do=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTQK7wFSG8sLbgcNs8KY+hb8pS91o+aUvLSt4dnFwRVDLRTlPj
	7f7mxHvn+nlMX2iryvdRcKQqCIFLr1qool4p0CGMiSUf8ZzBYWVkT8FhR1Yv5S0f4hU=
X-Gm-Gg: AfdE7clvVeATUrCVX/aqghPr/nPrbhxTmzkQLoYMUOYcr7ya6C4+RYmmUWTeAMV2h74
	Jn72St3T12cpUTT+tPTH2547OKrQua6a5OGO7gQg7uaFypRpK3Y1XLoV1F1eE6ExgmoxuI3MVFO
	S1XfQ0r2PU3h6T2bzi2/720skrpJn8GVabePdN6j4n7XxXBg+kGoPM5YVlFfp9ESHxItfz9k8ww
	zm+51a3F46BtgiR4kT0ZnSGzHRWBcykIUW36dDRn8I2SFdgGWU/kODMkxYGnn9cC9pHFGZrJdsU
	GAwTUx2vEYM2t9hxLvrh7uCH12pL3l7JvsmFLufLGitBnXVUdi0ZUNMapBzO/KAcyS6PuVfnBFi
	sogM8HtVctaziV+g6rhSQd7EuZgQ2p+YOP6zdsLlJdq7HWWTiICJ02L3AcMEk5OYF4EsrbuZkO7
	s54tHZ4MeCKig=
X-Received: by 2002:a05:6870:e256:b0:455:b497:a35 with SMTP id 586e51a60fabf-456559e61a9mr718887fac.14.1784153336546;
        Wed, 15 Jul 2026 15:08:56 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451a7c8fe33sm19309698fac.0.2026.07.15.15.08.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 15:08:55 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------IBoJQvOpKfnKmyJHP8y4IynN"
Message-ID: <372e3107-1133-4d84-b2fe-552a52e3abc5@linuxfoundation.org>
Date: Wed, 15 Jul 2026 16:08:53 -0600
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
Subject: [GIT PULL] kselftest fixes update for Linux 7.2-rc4

This is a multi-part message in MIME format.
--------------IBoJQvOpKfnKmyJHP8y4IynN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Linus,

Please pull the Kselftest fixes update for Linux 7.2-rc1.

Fixes ftrace reading enabled_func test in add_remove_fprobe_module test.
Fixes tracing trigger-hist-poll.tc to use sched_process_exit.

diff is attached.

thanks,
-- Shuah

----------------------------------------------------------------

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-fixes-7.2-rc4

for you to fetch changes up to c5c413534d40eb4c982f1794e62813f926aba747:

   selftests/tracing: Have trigger-hist-poll.tc use sched_process_exit (2026-07-10 10:14:42 -0600)

----------------------------------------------------------------
linux_kselftest-fixes-7.2-rc4

Fixes ftrace reading enabled_func test in add_remove_fprobe_module test.
Fixes tracing trigger-hist-poll.tc to use sched_process_exit.

----------------------------------------------------------------
Steven Rostedt (2):
       selftests/ftrace: Fix reading enabled_functions in add_remove_fprobe_module test
       selftests/tracing: Have trigger-hist-poll.tc use sched_process_exit

  .../test.d/dynevent/add_remove_fprobe_module.tc    | 27 ++++++++++++++--------
  .../ftrace/test.d/trigger/trigger-hist-poll.tc     |  4 ++--
  2 files changed, 20 insertions(+), 11 deletions(-)

----------------------------------------------------------------
--------------IBoJQvOpKfnKmyJHP8y4IynN
Content-Type: text/x-patch; charset=UTF-8;
 name="linux_kselftest-fixes-7.2-rc4.diff"
Content-Disposition: attachment; filename="linux_kselftest-fixes-7.2-rc4.diff"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Z0cmFjZS90ZXN0LmQvZHlu
ZXZlbnQvYWRkX3JlbW92ZV9mcHJvYmVfbW9kdWxlLnRjIGIvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvZnRyYWNlL3Rlc3QuZC9keW5ldmVudC9hZGRfcmVtb3ZlX2Zwcm9iZV9tb2R1bGUu
dGMKaW5kZXggMjkxNTIwNjc3N2I2Li44OTY2MGE5YWRmNDQgMTAwNjQ0Ci0tLSBhL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2Z0cmFjZS90ZXN0LmQvZHluZXZlbnQvYWRkX3JlbW92ZV9m
cHJvYmVfbW9kdWxlLnRjCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Z0cmFjZS90
ZXN0LmQvZHluZXZlbnQvYWRkX3JlbW92ZV9mcHJvYmVfbW9kdWxlLnRjCkBAIC0xNiwyMyAr
MTYsMzIgQEAgZWNobyA+IGR5bmFtaWNfZXZlbnRzCiBGVU5DMT0nZm9vX2JhcionCiBGVU5D
Mj0ndmZzX3JlYWQnCiAKKzo7OiAiU2F2ZSBlbmFibGVkIGZ1bmN0aW9ucyBjb3VudCIgOzoK
K2Vjb3VudD1gY2F0IGVuYWJsZWRfZnVuY3Rpb25zIHwgd2MgLWxgCisKK2NvdW50X2VuYWJs
ZWRfZnVuY3Rpb25zKCkgeworICAgIGNvdW50PWBjYXQgZW5hYmxlZF9mdW5jdGlvbnMgfCB3
YyAtbGAKKyAgICBjb3VudD0kKCgkY291bnQtJGVjb3VudCkpCisgICAgZWNobyAkY291bnQK
K30KKwogOjs6ICJBZGQgYW4gZXZlbnQgb24gdGhlIHRlc3QgbW9kdWxlIiA7OgogZWNobyAi
Zjp0ZXN0MSAkRlVOQzEiID4+IGR5bmFtaWNfZXZlbnRzCiBlY2hvIDEgPiBldmVudHMvZnBy
b2Jlcy90ZXN0MS9lbmFibGUKIAogOjs6ICJFbnN1cmUgaXQgaXMgZW5hYmxlZCIgOzoKLWZ1
bmNzPWBjYXQgZW5hYmxlZF9mdW5jdGlvbnMgfCB3YyAtbGAKK2Z1bmNzPWBjb3VudF9lbmFi
bGVkX2Z1bmN0aW9uc2AKIHRlc3QgJGZ1bmNzIC1uZSAwCiAKIDo7OiAiQ2hlY2sgdGhlIGVu
YWJsZWRfZnVuY3Rpb25zIGlzIGNsZWFyZWQgb24gdW5sb2FkaW5nIiA7Ogogcm1tb2QgdHJh
Y2UtZXZlbnRzLXNhbXBsZQotZnVuY3M9YGNhdCBlbmFibGVkX2Z1bmN0aW9ucyB8IHdjIC1s
YAorZnVuY3M9YGNvdW50X2VuYWJsZWRfZnVuY3Rpb25zYAogdGVzdCAkZnVuY3MgLWVxIDAK
IAogOjs6ICJDaGVjayBpdCBpcyBrZXB0IGNsZWFuIiA7OgogbW9kcHJvYmUgdHJhY2UtZXZl
bnRzLXNhbXBsZQogZWNobyAxID4gZXZlbnRzL2Zwcm9iZXMvdGVzdDEvZW5hYmxlIHx8IGVj
aG8gIk9LIgotZnVuY3M9YGNhdCBlbmFibGVkX2Z1bmN0aW9ucyB8IHdjIC1sYAorZnVuY3M9
YGNvdW50X2VuYWJsZWRfZnVuY3Rpb25zYAogdGVzdCAkZnVuY3MgLWVxIDAKIAogOjs6ICJB
ZGQgYW5vdGhlciBldmVudCBub3Qgb24gdGhlIHRlc3QgbW9kdWxlIiA7OgpAQCAtNDAsMTkg
KzQ5LDE5IEBAIGVjaG8gImY6dGVzdDIgJEZVTkMyIiA+PiBkeW5hbWljX2V2ZW50cwogZWNo
byAxID4gZXZlbnRzL2Zwcm9iZXMvdGVzdDIvZW5hYmxlCiAKIDo7OiAiRW5zdXJlIGl0IGlz
IGVuYWJsZWQiIDs6Ci1vZnVuY3M9YGNhdCBlbmFibGVkX2Z1bmN0aW9ucyB8IHdjIC1sYAor
b2Z1bmNzPWBjb3VudF9lbmFibGVkX2Z1bmN0aW9uc2AKIHRlc3QgJG9mdW5jcyAtbmUgMAog
CiA6OzogIkRpc2FibGUgYW5kIHJlbW92ZSB0aGUgZmlyc3QgZXZlbnQiCiBlY2hvIDAgPiBl
dmVudHMvZnByb2Jlcy90ZXN0MS9lbmFibGUKIGVjaG8gIi06ZnByb2Jlcy90ZXN0MSIgPj4g
ZHluYW1pY19ldmVudHMKLWZ1bmNzPWBjYXQgZW5hYmxlZF9mdW5jdGlvbnMgfCB3YyAtbGAK
K2Z1bmNzPWBjb3VudF9lbmFibGVkX2Z1bmN0aW9uc2AKIHRlc3QgJG9mdW5jcyAtZXEgJGZ1
bmNzCiAKIDo7OiAiRGlzYWJsZSBhbmQgcmVtb3ZlIG90aGVyIGV2ZW50cyIgOzoKIGVjaG8g
MCA+IGV2ZW50cy9mcHJvYmVzL2VuYWJsZQogZWNobyA+IGR5bmFtaWNfZXZlbnRzCi1mdW5j
cz1gY2F0IGVuYWJsZWRfZnVuY3Rpb25zIHwgd2MgLWxgCitmdW5jcz1gY291bnRfZW5hYmxl
ZF9mdW5jdGlvbnNgCiB0ZXN0ICRmdW5jcyAtZXEgMAogCiBybW1vZCB0cmFjZS1ldmVudHMt
c2FtcGxlCkBAIC02MywxMiArNzIsMTIgQEAgZWNobyAiZjp0ZXN0MSAkRlVOQzEiID4+IGR5
bmFtaWNfZXZlbnRzCiBlY2hvIDEgPiBldmVudHMvZnByb2Jlcy90ZXN0MS9lbmFibGUKIGVj
aG8gImY6dGVzdDIgJEZVTkMyIiA+PiBkeW5hbWljX2V2ZW50cwogZWNobyAxID4gZXZlbnRz
L2Zwcm9iZXMvdGVzdDIvZW5hYmxlCi1vZnVuY3M9YGNhdCBlbmFibGVkX2Z1bmN0aW9ucyB8
IHdjIC1sYAorb2Z1bmNzPWBjb3VudF9lbmFibGVkX2Z1bmN0aW9uc2AKIHRlc3QgJG9mdW5j
cyAtbmUgMAogCiA6OzogIlVubG9hZCBtb2R1bGUgKGZ0cmFjZSBlbnRyeSBzaG91bGQgYmUg
cmVtb3ZlZCkiIDs6CiBybW1vZCB0cmFjZS1ldmVudHMtc2FtcGxlCi1mdW5jcz1gY2F0IGVu
YWJsZWRfZnVuY3Rpb25zIHwgd2MgLWxgCitmdW5jcz1gY291bnRfZW5hYmxlZF9mdW5jdGlv
bnNgCiB0ZXN0ICRmdW5jcyAtbmUgMAogdGVzdCAkb2Z1bmNzIC1uZSAkZnVuY3MKIApAQCAt
NzcsNyArODYsNyBAQCBlY2hvIDAgPiBldmVudHMvZnByb2Jlcy90ZXN0Mi9lbmFibGUKIGVj
aG8gIi06ZnByb2Jlcy90ZXN0MiIgPj4gZHluYW1pY19ldmVudHMKIAogOjs6ICJFbnN1cmUg
ZnRyYWNlIGlzIGRpc2FibGVkLiIgOzoKLWZ1bmNzPWBjYXQgZW5hYmxlZF9mdW5jdGlvbnMg
fCB3YyAtbGAKK2Z1bmNzPWBjb3VudF9lbmFibGVkX2Z1bmN0aW9uc2AKIHRlc3QgJGZ1bmNz
IC1lcSAwCiAKIGVjaG8gMCA+IGV2ZW50cy9mcHJvYmVzL2VuYWJsZQpkaWZmIC0tZ2l0IGEv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZnRyYWNlL3Rlc3QuZC90cmlnZ2VyL3RyaWdnZXIt
aGlzdC1wb2xsLnRjIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZnRyYWNlL3Rlc3QuZC90
cmlnZ2VyL3RyaWdnZXItaGlzdC1wb2xsLnRjCmluZGV4IDhkMjc1ZTMyMzhkOS4uMDRlYjg1
NDZmYzA3IDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9mdHJhY2UvdGVz
dC5kL3RyaWdnZXIvdHJpZ2dlci1oaXN0LXBvbGwudGMKKysrIGIvdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvZnRyYWNlL3Rlc3QuZC90cmlnZ2VyL3RyaWdnZXItaGlzdC1wb2xsLnRjCkBA
IC0xLDcgKzEsNyBAQAogIyEvYmluL3NoCiAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wCiAjIGRlc2NyaXB0aW9uOiBldmVudCB0cmlnZ2VyIC0gdGVzdCBwb2xsIHdhaXQg
b24gaGlzdG9ncmFtCi0jIHJlcXVpcmVzOiBzZXRfZXZlbnQgZXZlbnRzL3NjaGVkL3NjaGVk
X3Byb2Nlc3NfZnJlZS90cmlnZ2VyIGV2ZW50cy9zY2hlZC9zY2hlZF9wcm9jZXNzX2ZyZWUv
aGlzdAorIyByZXF1aXJlczogc2V0X2V2ZW50IGV2ZW50cy9zY2hlZC9zY2hlZF9wcm9jZXNz
X2V4aXQvdHJpZ2dlciBldmVudHMvc2NoZWQvc2NoZWRfcHJvY2Vzc19leGl0L2hpc3QKICMg
ZmxhZ3M6IGluc3RhbmNlCiAKIFBPTEw9JHtGVFJBQ0VURVNUX1JPT1R9L3BvbGwKQEAgLTEx
LDcgKzExLDcgQEAgaWYgWyAhIC14ICR7UE9MTH0gXTsgdGhlbgogICBleGl0X3VucmVzb2x2
ZWQKIGZpCiAKLUVWRU5UPWV2ZW50cy9zY2hlZC9zY2hlZF9wcm9jZXNzX2ZyZWUvCitFVkVO
VD1ldmVudHMvc2NoZWQvc2NoZWRfcHJvY2Vzc19leGl0LwogCiAjIENoZWNrIHBvbGwgb3Bz
IGlzIHN1cHBvcnRlZC4gQmVmb3JlIGltcGxlbWVudGluZyBwb2xsIG9uIGhpc3QgZmlsZSwg
aXQKICMgcmV0dXJucyBzb29uIHdpdGggUE9MTElOIHwgUE9MTE9VVCwgYnV0IG5vdCBQT0xM
UFJJLgo=

--------------IBoJQvOpKfnKmyJHP8y4IynN--
