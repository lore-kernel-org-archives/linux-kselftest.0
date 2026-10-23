Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792792041;
	b=RSkn0I+ycZ959iWf7JM1k27F8xiI7oBWt3CyC9hOH7e0I1YrKbCgfzx4rlvIdaRezwl1
	 ek43EfgjAel6zHgYqEI9WK+rBElWoN2WUMTiFoEMUEl87cQm46HJ12brozS/XHj86qNQL
	 QQowoXR2trP7lAjrQaGsmfFv60bDv7HgNTnTfBlbOjIqqv8a7nLl7B+NqLSv5atQOa1H0
	 CAM19CUWZ6vmgGEQX8UfDAGhtOOMH9U3whdgBhdDMa+rlSSg8rOhodc7lOX84JynE+VfG
	 uhOUeR+SwQguVnFq48lYw2W+6gBUkYOaB+Td65eZ7q0lREc6hirJ5DMQXEpchWqWPSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792792041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xPSo9ItcVa4fj2ri5oc6bVUN+cUX/ExSvpmY9Grzytk=;
	b=LNRQTIChJIH6dDEfxeeHBaCWwQYQf7Y9OdniBIjoYsloGaV04ji015AnqRMzybOLDIY+
	 vgSH3m9dfqBCKOJ1gZfkEK7X1RbTMAL5tiF4jAtZtmNrijw08dLkVmNaR1ZZ4AYB/iF7v
	 KWNsPv1x17DvmZFeTl5HbLbPB04jmljlud8DRwTprDYXA27xttmlNA80JUTCz2ePr7rsY
	 DQ1db7vj4sEkcbUwBLj6jUpVB7lqLHL/MZpGrGQCmRhuwdcXPgbF/nqFNKvVKfYTbHg28
	 8lOLmWi4ORfMeyo9nJMcAG5ZZl4nUUF3o3j40ueB6aMRWMjI2aBztYGyPmmLqpV418Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hLDmu77i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE09C606A31A
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 21:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE09C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hLDmu77i
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3acc96a256dso814198a91.3
        for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 14:47:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792792040; cv=none;
        d=google.com; s=arc-20260327;
        b=X7nBUPWOUvIynNI2RBzL1CgZL2cbg+d7+DHs9xmmKoljBP5Z676KaaPhQ+bICTlHGw
         mmsWAitOmH2/orX5Ahk8HaEmpceYvTw3mUt3CvlLZPKV4KOqiDAqXRbsHCZpOTIX44pR
         yZxtXZmi9pftfZkinnvTARS/Q4rHhVMvJcHBdWLGKVIj6qgwFUU1WIIT2Wmq+Bmuq94t
         PnpGM2mTGNZfkk98qyMPFo6ZQL+HHD36KvCnb0E4PMhCY9Wo9AFylHNuIsT/b8gMi19s
         2ogTDpdZWUWu5LwwogIEEzQ4p0CxcZmP5gINbvXlOgzZmPLJGEVoooiBYj9vZX4P+qMK
         uSYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xPSo9ItcVa4fj2ri5oc6bVUN+cUX/ExSvpmY9Grzytk=;
        fh=MXyHhTEamuboUmvmk3ehXx0CftNaqtS1pY+fU1m/xFY=;
        b=KnSOpoWgl+zPQrjbA9dLnNaq1d8PbxEjw5dmN3AFipcSYJ35aqd3YhYjKjlawYYH7I
         /EEJjXsjAApO8aPFWvaYKhxn6e3YFLKnmrawubplU28Cb9rQ5uhkrk/2O1CU75lUTyYH
         919MxmOWNzS1bo+snSngvBSPeyay1fTSaVIoNQd6bjypTpQ137oE40ApB4PywzcosQEn
         KxUZFICedfxNsBEQQAm08Aa/sPz9yWLBUCkViuMw2lVS0PsaqKkRUGs4lQ6j2ob9zr7z
         vTgY0sfPwxwhZHbMg5mFEmQfbk3yO0QjsDOs/P7Yn3sFqZr/JKttqZlnpjHDWiAe9KY1
         0/4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792792040; x=1793396840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xPSo9ItcVa4fj2ri5oc6bVUN+cUX/ExSvpmY9Grzytk=;
        b=hLDmu77ierYiamVgBV5vcAPXLaG8aupRNyDiDX7DkFNKpzAxzPIc63o3dmGM4zJaa9
         4NGe3YwDiymWhnQ/OCBGllsswfzcFZye7tQgoEq0wKR8ICoXlpOSA+BkFePJ+1A4Qtfs
         5B9uWQyifczwR83ZzMfzQhkVojser9lK+7Vg1COy1KYe+paFJC2NeFMJ0Pwj/pPj/iD2
         gXyhQWok5F1Qlv02XKngGqq1rGnm/5QhU+mrMgvZNpLlK+CJNtiedln6Mz0k16xq27uZ
         SIpi3iMCyeGt/gxH2+Gr5wKnY0+0nxLC7O7+qOh1rB8DPqu6rw1b+PmW+IOO7JtIQdHd
         VdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792792040; x=1793396840;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xPSo9ItcVa4fj2ri5oc6bVUN+cUX/ExSvpmY9Grzytk=;
        b=s7p3eMJQbFD0z17VroOUJNHLoCvFw8OU94Gyhd/BZDjmA0C8slOHS21LEwXuPG+oOD
         zT2fM+59xE8WoFBpNhhrxh+YsyeTPzUDMJ7qH9QxyuqU9J+KAC3O3Uq9C8Vr4spzZU6E
         /8fa29MtyTimVZVQN+rGRhdAUNXeesFgwzykLev6wGKFvzVuisSlxDULWx7nAW+pow1/
         KnkzhSt95PWz7zrZuHONt0NWeD0/EaOfziisa3xfHvqKJ7pjHGdheIJf6Lh+1ICpJSxO
         WfpzJiaYPmVuaxpe0qdgrEmvHzKnQOEXfB4ggsErqXqrUmiyIUm6sI10AlH9XOmX+cd2
         SSXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcfYN5i53pojUWyh80MH9Aq+MPIIRm4p5gGppoPsNSQZfdxkrSB9um+W7G7GN+0uAZ4v0c7P338yBmNEQ+/jg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpV9rmpitJ2HZ5q9nx4//9skei9rnQAeDqyb3UOBrjKoG2KCgj
	JgG6hW0ynlwnW+wOyNP/h5e1B0XrukvbZjV/0I2XgZu4muI/Hpd2Rm9Npz4VNnuRmgwXjlkMHBa
	RX441SRGTLD7y0a/2nAbN94TGsiNT79g=
X-Gm-Gg: AYBFou1x+Rx+Ze4/uEFBjEQxoVVxCaKwASCiJaAeSZRinQOzeJizK4mj4e8l2xl53aI
	AXOeEi7dTfV6R2XAexx2WNCKLL04avMnGjde4XTBaa7HtYYAHxipHtjuXQdjE2B3vIlmwxu/+mu
	b3fY+2jTXWf6QyYgInjirQlzzbCyW6oa+0WTHvOxuWrxJ9qC9y8EB2g2tnnzDK8dcqlipZTUrHF
	R/vm9nK2WC+O1vDz8joOImRvM+Ak2sm479tgyDTcnZEJYsrQXi8LdkERuLCIvrh3rL2EEX+d/HF
	0f/Nh3UcuO8e6e0y59xyEh7rdiZfcBS9wvCwQrypw3TD/1YWF4XkNH5aeT98cH8clLkzqeABXXM
	r8Qkgo6/NmCtD0ETNv60O6q8FtSIY+z4Z5bS3L9IEEY2FwhnS0b8N2JmrqYX6KH/bwIKoKXKJol
	mr4y5yrLEa6TkN+apBDaDeqNMET9XUHTXvAxWa96I=
X-Received: by 2002:a17:90b:17c1:b0:3ac:8af9:4a77 with SMTP id
 98e67ed59e1d1-3adea8952f8mr420926a91.10.1792792040157; Fri, 23 Oct 2026
 14:47:20 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261001072449.1377267-1-adi.sharma@zohomail.in> <1a168cbe0aa.30b7e048183449.4003649852775097641@zohomail.in>
In-Reply-To: <1a168cbe0aa.30b7e048183449.4003649852775097641@zohomail.in>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 23 Oct 2026 14:47:05 -0700
X-Gm-Features: AclHuK9klZKtZiNDzc9m6HVwMpKUt6CjANLrIawUWNF0dNjLjk5PlT3PLx4p-yQ
Message-ID: <CAEf4BzYveiSZg0qg5h=EPiMQacnSXwp=8O+x74FM=89qrHV4=g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 0/2] bpf: Fix bpf_send_signal_task() from
 kernel thread context
To: Aditya Sharma <adi.sharma@zohomail.in>
Cc: bpf <bpf@vger.kernel.org>, andrii <andrii@kernel.org>, ast <ast@kernel.org>, 
	daniel <daniel@iogearbox.net>, eddyz87 <eddyz87@gmail.com>, memxor <memxor@gmail.com>, 
	"martin.lau" <martin.lau@linux.dev>, song <song@kernel.org>, 
	"yonghong.song" <yonghong.song@linux.dev>, jolsa <jolsa@kernel.org>, emil <emil@etsalapatis.com>, 
	"ihor.solodrai" <ihor.solodrai@linux.dev>, kpsingh <kpsingh@kernel.org>, matt <matt@bobrowski.net>, 
	rostedt <rostedt@goodmis.org>, mhiramat <mhiramat@kernel.org>, 
	"mathieu.desnoyers" <mathieu.desnoyers@efficios.com>, shuah <shuah@kernel.org>, 
	puranjay <puranjay@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-trace-kernel <linux-trace-kernel@vger.kernel.org>, 
	linux-kselftest <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 5:46=E2=80=AFAM Aditya Sharma <adi.sharma@zohomail.=
in> wrote:
>
> Hi,
>
>
> Gentle ping on this series.
>
> Andrii - patch 1 now removes the nmi_uaccess_okay() check entirely, as
> suggested on v1. Is this what you had in mind, or should I change
> something?
>

Hi, yes, it looks good to me, sorry it fell off the radar. bpf-next is
closed right now so I can't apply this just yet, but I'll apply one we
can do that

> Thanks,
> Aditya
