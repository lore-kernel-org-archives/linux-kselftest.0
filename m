Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795394838;
	b=ht+0dw9VgylmnLKmyycRRiOtb9+kA/BZluHAo/iLYF+p0qU2FwdZzPmMyPuaXefhn5Zz
	 JooDgsLfqHpDPjUEkIrVvoAoowSd9NEdV+IKL/B4BtMKLYkviEoLGnDnfyWgrgEp24COS
	 aqOBgXXKWk5u58IMHsftSZZK5JDPplcrq0uzpPwjXiJdVxVUwt0Y/tv1VVm9UK+zZju0B
	 u+RqBjmiSohlDEVgwjT4l5kAG6Y3SYG/lF0Y3FVXHMq1B7MIyzt3S1j1mQ+GMtIKBDj+5
	 pGCpg+6Ng9cubyzqR7kxjnuXQ0X0GXuc5Cq5AHUb94StsqIp0feVchdWSTIxkX/a+2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795394838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=p7B3c6D/X11fLUAKKmi13BRTcfCArxOmxqQgFnPzAxg=;
	b=inlRD73C3qDsSNsVFIpXw7YuRi/C5srchAaAo/tEuRk6t7BRPXz5A2Pk9TzckcRKFWcj
	 ZC3Di/4mZ8kVBjF66J+eIT8xngTk7jWz+8mPWg11wCotKAdhiTV+e0MDbVdGlRPsl8Lns
	 oPgvihzfqH8f2nUcjzorxnP4YrfuQiyLnVOrXAepb1cPjUyuHTeCm4rb3l/VqKwIsYHiC
	 9vd9nw5mVZ98eM0lLX/f5SuAaNSahXUbav02vCdgwaYNA5BBXZxjrSsXdAG+QYcja7jfF
	 q9zcTrpMVZu68vmLQoa2e0Qj71w3rEKf+wNH4kb6LjOpF+72q5aHVw1z1nN1z/XmfmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wfmQXoun;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BD3606A320
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 00:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0BD3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wfmQXoun
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b421e8d111so1775672a91.3
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 16:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795394837; x=1795999637; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p7B3c6D/X11fLUAKKmi13BRTcfCArxOmxqQgFnPzAxg=;
        b=wfmQXounwgi2H0Qxd61oGE737FXdx3pXDGCOw5wqSvHmhLwHbMYTvLOPgZ1H4nzjgD
         9xZkG+9qJCwNtxDlgINthLE2KrlkMUMLdkTfkRrxDnHg2/rRF6WcXNrtFZn/qVjya7pj
         GmPnzJlTLY18Bw6jiB9/PWzaufJ/EuY1zR/bDY4BNg5qVHJ4zAEf5u4OYbZwir3oJJ5z
         bWrI5gRmMuSG8UZAQ3EXEX981myLRid+1mc7xa3vIvUo30DDFi2XIQe6l+1+d/QDmIr1
         g8buEHoa1fy3Al0T/O3pbPGiy5AkuwlrIPoraLH1Sm1u/V9h97CJmibvWCcdVsbF+KQD
         Rxiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795394837; x=1795999637;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p7B3c6D/X11fLUAKKmi13BRTcfCArxOmxqQgFnPzAxg=;
        b=IAQ1rrrmxrnjuZNiDXdBMiXt3y8PT5tNOHT1kzTXvnVWQjbw7DNQAPnC8IovFSBP1Q
         ZrT1aVQWswk0Gk+j6bCNKKlli2A36VmIi05bqXubcb3YK5ESrsbCsJuBgFcIWpeWomdk
         uIKaN//DgjB72U8ZCk5RDiubtiPaTCV4zm7TXzrsHX3nF2PuNmRUT79Eqh4hAqy9WXrU
         FptQydLcVYi2W24xj8Owp/q3zUtGUvIDBy4+Hum7zZTc9PV/bF88HsqXHb5l4BoDTmHf
         FeyWyyGEg/TvNw89qyEPnCK5Zvne/nluJND2SUFg9io6x8YhHsDedywyvB40h35gt/VN
         4Akw==
X-Forwarded-Encrypted: i=1; AL+hErEzLOZhZqzWEh4LTrTyzc8k5jbQUbCMQ9quabmx6FrJjtZocunuouUsZAN7gKxhwNXn2rDUJgu3bFJFgEDxk9k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RdY94daVO1+pd4Ak7RIghPJ6I1LJS/cy9Yw/Mn50Lm25DTWCp
	C5a2C8bQB9Irmt7wgDpsC+mQHnt577iB4LFPmgNiQUqT1w3WiVfSEKsG
X-Gm-Gg: AZFdTZeE83DjwT1VdpMQWLCjasBTSprdzBY/qEZjmp+o6F/Q47uu5/L/fL7lQcck6pu
	pJ9yefqKEXQs8XlTqrkp0PMPR9wkHHufptX62abDVue5w/IVqjjuoU3KZ9G4E69kjweTTEW0ilt
	A+Rxn9X8dbW+0BqqnrxsDuKVR0/hPl5/12AqhwvK1EIe+qH0trxqXFPWNs5BIVkr0I01AnMcgnW
	NWb7/nLQTGVvfHPSfkXU9IsJEfNk5IOOb+0O0IhYpTA0FoClkUy+PfpQUp5GcUn+QLhG4ihLhoy
	Crn0dRoZtCBAvg0zoe8F03IDm6Ps+6p+iHh9CAF/HQfpvMO9cPllRIGg4hebYsAhppz10dmqAVy
	zej7aozBvPMNsbofhEuaNGTn2srKibEG5umBnw6Y5xeYgxUJnddXmnJMaV7MInRPKZma4koGLCZ
	MZixldz08gW4/R2/wWAfnCz0D2zzTkIHBU0y7pB9PUoWGvrMlZEirG1Uok3eyd9YFmHWDTFNmLy
	xak75M9uauBwxOxPQjs2p/ay7SDIBD6wzqIaFDzO9BAGInc4+TnhdXR6aRXdpqwbKKhV8tVEQej
	3ktZIAZX7lOeTWXszh4Q7qYF9K4ITM/oinesyBvJaVDoPhNx6q7RWF06TQ14pYvYWrpgFIo54GB
	8Gq68EVsawVKZR4bpANUH0GVPE6Pfhthj7A==
X-Received: by 2002:a17:90b:288e:b0:3b3:ec88:72a6 with SMTP id 98e67ed59e1d1-3b41c85284amr8792429a91.3.1795394836739;
        Sun, 22 Nov 2026 16:47:16 -0800 (PST)
Received: from localhost ([153.61.198.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb1b66sm15471631a91.1.2026.11.22.16.47.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 16:47:16 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 00:47:15 +0000
Message-Id: <DN26CP5BB6O7.23ALW6CZUBYSD@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Karl Mehltretter" <kmehltretter@gmail.com>, <bpf@vger.kernel.org>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Shuah Khan" <shuah@kernel.org>, "Tejun Heo"
 <tj@kernel.org>, "Johannes Weiner" <hannes@cmpxchg.org>,
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, "Shakeel Butt"
 <shakeel.butt@linux.dev>, "Waiman Long" <longman@redhat.com>, "Jiayuan
 Chen" <jiayuan.chen@linux.dev>, "Puranjay Mohan" <puranjay@kernel.org>,
 <cgroups@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-rt-devel@lists.linux.dev>
Subject: Re: [PATCH bpf-next] selftests/bpf: Disable preemption around
 css_rstat_updated()
In-Reply-To: <20261121082843.44614-1-kmehltretter@gmail.com>
References: <20261121082843.44614-1-kmehltretter@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sat, Nov 21, 2026 at 12:28 AM Karl Mehltretter <kmehltretter@gmail.com> wrote:
> trace_cgroup_path_lock. On PREEMPT_RT this leaves preemption and
> interrupts enabled. On non-RT it masks interrupts, satisfying the
> assertion.

let's fix the kfunc instead

diff --git a/kernel/cgroup/rstat.c b/kernel/cgroup/rstat.c
index de816a4..d72fe72 100644
--- a/kernel/cgroup/rstat.c
+++ b/kernel/cgroup/rstat.c
@@ -131,6 +131,7 @@ __bpf_kfunc void css_rstat_updated(struct cgroup_subsys_state *css, int cpu)
 	if (unlikely(cpu < 0 || cpu >= nr_cpu_ids || !cpu_possible(cpu)))
 		return;
 
+	guard(preempt)();
 	__css_rstat_updated(css, cpu);
 }
 

pw-bot: cr
