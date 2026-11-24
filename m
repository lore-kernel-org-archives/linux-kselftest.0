Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795490215;
	b=rHCSAebhlLI5OkM6p2vq048KXqDMe69ZDZvPQvTj9JkcLqyAcdJSGlP6WRedZlldlatl
	 SrU6KYXN4yv0E9SZ1eGrYgxw68NV2TCz8Nxzq5BbGldfQKv+YnQ6r0zBReJhZAhDDfKVz
	 lbOA8fuDN8DisfNb2IGlhhyGSWoThkQF6+2MKRJiyHP/nHSormZALZ0GYXh3kjkqzR8zy
	 V4ylJK7hjE5QqlYVGoY0qCVxlgQbgoaUgqffpSBl3zy891MMPXWU5m7D7+0LfEAIYXuQD
	 xXVRqIi8k1SDzG/3mr0RlHcYgK/jUbGI5LON25eDCVvm+RHpRDiwpQoqjP66Am1IvMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795490215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=EKCwUBMZXEgwJsoK8+iw5jP9TfBZ6zy/Sv767cpvROI=;
	b=jpMQft7amBbWMQdiYOHBoAut9PQweb34MCMHSFjRo56lR/VhNg6PPKfY+A8WRuCiEwsn
	 9w1vH3QWMyqwn1BdjaWkkrxlih2N+WbKrzbPtW8+uwVvLFUsE0gfw+GRB6jXx38Ud1eJO
	 UCC1jKp3lr/a615G8bdTKdXzzARCwiDkj6Y7Knu8JFSt8aN5SUxsocUJ90FH4MqnzWneZ
	 Jf3MFyoO+oaaUy5dWFGjBT7l6YDtxATbCJ2ESl19Dub2bIivxtw2tsbMeXbdpZNY9dsDg
	 lWJznuZhxxlCH0l/PC+rrjH9GPCJeIG6J5Wyb0NTzyY0E3502ssy3JNjC5GYQUGKJ4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WFpGA4KB;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23C6606A32C
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 03:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C23C6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WFpGA4KB
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso29372825e9.2
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 19:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795490213; x=1796095013; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EKCwUBMZXEgwJsoK8+iw5jP9TfBZ6zy/Sv767cpvROI=;
        b=WFpGA4KB996Tu7hKVOnRNmXinER0wbZZXQoxSH7+GXHZ8IoVoxqX7VnyceUOGOqCNs
         WkwohfjDJenHbBSN+VDFxM2jVYwJ8IsOMdUJ2yz+783MhZ1kpbN8C2aVQkAx5KJFz/6O
         VoHrdCqbgxoKlKyvZ+U9LVvXgz7LODsr+/gzoTyfTFZ2ObuAaHFNkRR3uThSRrIGEf6T
         kVDFjPQO3n6MC8I6N7LGXTU/ajuZq9bf060LgWVpNeeuXGSKK++WWXIx9uxb5q8duH+A
         qSAZeckM2cwFAL6//k1WNoopWbqqksKVmOE8m2sd0JcbqjW1nI6dj3XaA604/Jvf2A5C
         94+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795490213; x=1796095013;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EKCwUBMZXEgwJsoK8+iw5jP9TfBZ6zy/Sv767cpvROI=;
        b=Ne345kiHYpSDFPDHiQO4iuWbzWzkzv68adaSmkWuru8sMzseFIby4ZB1ms+hAOHkXN
         RM0sIJdI2HMzgUhFCSSQ0JFROfykvNqjeMv7EkhpedmHPY5BK+AjsBEyPR1oYjse6g9d
         7bYHc+rYSUxDTrgbTVWoo1LFyXD+GoZINFkJlVouc9sTrkitYNtSuakD5ezdT219mnpj
         cJE9Pa0Qt/NoRCf5mfpdDHPo0iaJVVJdVp57mJiacuF3lrJ5Iq0NTIOjPvGaUVBRWB0g
         perNfHxicp2H+p4LRT0TUNTsrHDUK3lIcTKC5uokIrA+LF2YGBaz768uYVXCIqFdimsg
         t6Xg==
X-Forwarded-Encrypted: i=1; AL+hErGJ1JZGB8VHcS6lwUdCGfwN6jv3GgtFk8EEBCltF9CVMNSBRCoX8pXbhN+M/NqbyFY1vJf2bp04ylP0tRo3thk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LPOnlF09vseBNjEQSKVno0AbjkCKCQunTWsCeXtIuVmcazvZG
	Gv9d8tHQfT9XWrE0OFlqUvmxsYPfQh5tn2jw/i8URlygSA5IpTu26B1k
X-Gm-Gg: AZFdTZe1hiNMqMncUQ+/RmKdJBZUAmsEuacIeybarG4gQz9XLHt+C1LOh0CFS23Edsa
	zCimPs+2ClfGZyRuWMi+El1ohojFd2ok/4WD5P0AWnNUClYc+pq7NyQUibU9TG1AB43bh/Qgr9l
	PU8pvWDEAd5fr4kXBd5RyGlGHCPD6YKQLi0xaJqerjcU+n8kdpEwnVaNjk0o+qbJCL1xm5jNtBI
	eyHpp84Sv9ZwYXw22M8eocxkEsKPZKlddKiRn0J/McaexQwoO0zVc+nfL3OGWBcK+EIomaYJLy/
	WTXDKn5ClXrN32Klx7RCPC2svHh/86W0FjFrXWbEnrWiifIkzoH0z7suKrpAGMJj2dX+ANSxWuC
	bVDDUBYVvDxFK3iQJEbMIwwVJ9rGTrk3br3f8MiF9mNGGFY7qg3Gd1io8ukTDrDMrl1Iz4+dCBd
	56HjznTxNgI25hANDff2NRVTxUPo/18oN5IzgESSp2n1tvqEIAIMiOYVhwq1AjcRFojT0keY7tw
	BTQQnCqMn0BiVDzqYMjwiqBgfHIUjohLjSYUY5nrEeuRUcRwa1njYkbPWggvp3/wHVJbYnDZ+6s
	EtRRdKryUUjS0Eqtt/LQXxLZKiRpEduz1Mf034zUdxQcq3lSRiiK1JNzy3mXabpSiDRz/UQYA9t
	Mlnog8fccmqgoXDTkNdedG+NUr7VUK2Wk1cWjoYY95XqONfXHePs0Lttd5IZpNso0LJro/QksJD
	dwAaFHzyzc2QIbzZxn2XzvFGAaP1LxZ7t1
X-Received: by 2002:a05:600c:1389:b0:4bb:6519:477e with SMTP id 5b1f17b1804b1-4bb88813b35mr273527695e9.17.1795490212815;
        Mon, 23 Nov 2026 19:16:52 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-ad33-0d01-f099-1558-bc26-fd06.310.pool.telefonica.de. [2a02:3100:ad33:d01:f099:1558:bc26:fd06])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm473350865e9.6.2026.11.23.19.16.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 19:16:52 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: bpf@vger.kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Waiman Long <longman@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: [PATCH bpf-next v2] cgroup/rstat: disable preemption in css_rstat_updated()
Date: Tue, 24 Nov 2026 04:16:42 +0100
Message-Id: <20261124031642.40616-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

BPF programs can call css_rstat_updated() with preemption enabled.
The kfunc calls __css_rstat_updated(), which requires preemption to
be disabled while it queues an rstat update. A cgroup iterator can
hit the lockdep assertion on both RT and non-RT kernels. The
cgroup_hierarchical_stats selftest can also hit it on PREEMPT_RT:
spin_lock_irqsave() on trace_cgroup_path_lock leaves preemption and
interrupts enabled there.

Disable preemption in the BPF wrapper after validating the CPU and
before calling __css_rstat_updated().

Fixes: 36df6e3dbd7e ("cgroup: make css_rstat_updated nmi safe")
Reported-by: Jiayuan Chen <jiayuan.chen@linux.dev>
Closes: https://lore.kernel.org/r/20251119111402.153727-1-jiayuan.chen@linux.dev/
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Assisted by an LLM.

v2 places the preemption guard in the kfunc as Alexei requested:
https://lore.kernel.org/r/DN26CP5BB6O7.23ALW6CZUBYSD@gmail.com/
Since 8817005efbdf split out the BPF-only wrapper, v2 does not add
preemption operations to the in-kernel callers discussed when Jiayuan
proposed the earlier kernel-side version in November 2025:
https://lore.kernel.org/r/20251121040655.89584-1-jiayuan.chen@linux.dev/
v1: https://lore.kernel.org/r/20261121082843.44614-1-kmehltretter@gmail.com/

Tested in x86-64 KVM guests with lockdep on bpf-next 9867c61abbd4
(base and v2) and 2bf3351c5f89 (v2). Both tests passed on all 24 boots.

  Boots with an rstat warning               base     v2   rebased v2
  PREEMPT_RT, cgroup_hierarchical_stats      2/2    0/2          0/2
  PREEMPT_RT, iter/cgroup                    2/2    0/2          0/2
  PREEMPT (!RT), cgroup_hierarchical_stats   0/2    0/2          0/2
  PREEMPT (!RT), iter/cgroup                 2/2    0/2          0/2

 kernel/cgroup/rstat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/cgroup/rstat.c b/kernel/cgroup/rstat.c
index de816a43db9f..d72fe721cea0 100644
--- a/kernel/cgroup/rstat.c
+++ b/kernel/cgroup/rstat.c
@@ -131,6 +131,7 @@ __bpf_kfunc void css_rstat_updated(struct cgroup_subsys_state *css, int cpu)
 	if (unlikely(cpu < 0 || cpu >= nr_cpu_ids || !cpu_possible(cpu)))
 		return;
 
+	guard(preempt)();
 	__css_rstat_updated(css, cpu);
 }
 

base-commit: 2bf3351c5f894697e8443eeef5333d4c4ce90cab
